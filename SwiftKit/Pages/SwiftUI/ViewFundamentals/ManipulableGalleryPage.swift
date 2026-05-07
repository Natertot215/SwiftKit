import SwiftUI

// Dense SwiftUI Manipulable gallery — consolidates the entire family:
//   Manipulable                                 (protocol Manipulable)
//   ManipulableModifier                         (.manipulable() and friends)
//   ManipulableTransformBindingModifier         (.manipulable(transform:))
//   ManipulableResponderModifier                (.onManipulationPhaseChange / Value)
//   plus reference notes on related modifiers (geometry, gesture, gestureState).
//
// visionOS-only API surface — every demo is documented as a code-snippet only,
// since the modifiers are unavailable at runtime on macOS.
//
// Source docs:
//   Documentation/SwiftUI/view-fundamentals/manipulable.md
//   Documentation/SwiftUI/view-fundamentals/manipulablemodifier.md
//   Documentation/SwiftUI/view-fundamentals/manipulabletransformbindingmodifier.md
//   Documentation/SwiftUI/view-fundamentals/manipulablerespondermodifier.md

struct ManipulableGalleryPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                protocolSection
                manipulableModifierSection
                transformBindingSection
                responderSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Manipulable")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A namespace for manipulable-related types and view modifiers used to drive 3D manipulation gestures. Member structures expose the modifier shapes that compose into a manipulation interaction.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("visionOS only \u{2014} no live demo on macOS.", systemImage: "visionpro")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/view-fundamentals/  \u{00b7}  visionOS 26.0")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Manipulable  \u{00b7}  ManipulableModifier  \u{00b7}  ManipulableTransformBindingModifier  \u{00b7}  ManipulableResponderModifier  \u{00b7}  ManipulationGeometryModifier  \u{00b7}  ManipulationGestureModifier  \u{00b7}  ManipulationUsingGestureStateModifier")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Manipulable protocol
    // (Absorbed from former ManipulableProtocolPage.)

    private var protocolSection: some View {
        PageSection("protocol Manipulable",
                    subtitle: "The conformance that powers the modifier family.") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Conformers describe how a custom 3D type participates in manipulation. Apple's Model3D conforms automatically; custom volumetric types conform when they replace those primitives wholesale.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VOSnippet(
                    api: "protocol Manipulable",
                    code: """
                    // visionOS only
                    protocol Manipulable {
                        associatedtype ManipulationBody: Manipulable
                        var manipulationBody: ManipulationBody { get }
                    }
                    """,
                    note: "Requirement is the manipulationBody — a description of the manipulation surface."
                )

                VOBlock(title: "Built-in conformer — Model3D") {
                    VOSnippet(
                        api: "Model3D: Manipulable",
                        code: """
                        Model3D(named: "TeaPot")
                            .manipulable() // works because Model3D : Manipulable
                        """,
                        note: "Model3D conforms out of the box. The .manipulable() modifier requires this conformance."
                    )
                }

                VOBlock(title: "Custom conformer") {
                    VOSnippet(
                        api: "Custom Manipulable type",
                        code: """
                        struct MyVolumetricObject: Manipulable, View {
                            var manipulationBody: some Manipulable {
                                BoundingBoxManipulation(\u{2026})
                            }
                            var body: some View { \u{2026} }
                        }
                        """,
                        note: "Conform when you have a custom 3D representation that should expose a manipulation surface."
                    )
                }
            }
        }
    }

    // MARK: ManipulableModifier
    // (Absorbed from former ManipulableModifierPage.)

    private var manipulableModifierSection: some View {
        PageSection(".manipulable() — ManipulableModifier",
                    subtitle: "Adds direct manipulation gestures to a Manipulable view.") {
            VStack(alignment: .leading, spacing: 16) {
                VOSnippet(
                    api: ".manipulable()",
                    code: """
                    // visionOS only
                    Model3D(named: "TeaPot")
                        .manipulable()
                    """,
                    note: "Adds direct manipulation (pinch + drag, two-handed rotate/scale) to a view in a volumetric scene."
                )

                VOBlock(title: "Constrain operations") {
                    VOSnippet(
                        api: ".manipulable(operations: .translation)",
                        code: """
                        Model3D(named: "TeaPot")
                            .manipulable(operations: .translation)
                        """,
                        note: "Restrict the modifier to a subset of operations \u{2014} translation, rotation, scale, or any combination."
                    )
                }

                VOBlock(title: "Inertia and coordinate space") {
                    VOSnippet(
                        api: ".manipulable(operations:inertia:coordinateSpace:)",
                        code: """
                        Model3D(named: "TeaPot")
                            .manipulable(
                                operations: .all,
                                inertia: .gentle,
                                coordinateSpace: .immersiveSpace
                            )
                        """,
                        note: "Inertia controls release behavior. Coordinate space sets the frame the manipulation happens in."
                    )
                }

                VOBlock(title: "Lifecycle hook") {
                    VOSnippet(
                        api: ".onManipulationEvent { phase in \u{2026} }",
                        code: """
                        Model3D(named: "TeaPot")
                            .manipulable()
                            .onManipulationEvent { phase in
                                switch phase {
                                case .began:   audio.startManipulating()
                                case .changed: haptic.tick()
                                case .ended:   audio.stopManipulating()
                                }
                            }
                        """,
                        note: "Pair with manipulation event modifiers to drive audio, haptics, or analytics."
                    )
                }
            }
        }
    }

    // MARK: ManipulableTransformBindingModifier
    // (Absorbed from former ManipulableTransformBindingModifierPage.)

    private var transformBindingSection: some View {
        PageSection(".manipulable(transform:) — ManipulableTransformBindingModifier",
                    subtitle: "Two-way binding between manipulable transform and @State.") {
            VStack(alignment: .leading, spacing: 16) {
                VOSnippet(
                    api: ".manipulable(transform: $transform)",
                    code: """
                    @State private var transform: AffineTransform3D = .identity

                    var body: some View {
                        Model3D(named: "TeaPot")
                            .manipulable(transform: $transform)
                    }
                    """,
                    note: "Bind the manipulable view's transform back to your view's @State so you can read or persist it."
                )

                VOBlock(title: "Persist position across launches") {
                    VOSnippet(
                        api: "@SceneStorage encoded transform",
                        code: """
                        @SceneStorage("teapot.transform") private var transformData: Data = Data()
                        @State private var transform: AffineTransform3D = .identity

                        var body: some View {
                            Model3D(named: "TeaPot")
                                .manipulable(transform: $transform)
                                .onChange(of: transform) { _, new in
                                    transformData = encode(new)
                                }
                        }
                        """,
                        note: "Watch the transform via .onChange and persist via @SceneStorage / @AppStorage."
                    )
                }

                VOBlock(title: "Reset to identity") {
                    VOSnippet(
                        api: "Reset by writing .identity",
                        code: """
                        Button("Reset") {
                            withAnimation { transform = .identity }
                        }
                        """,
                        note: "Animate writes to the bound transform for smooth resets."
                    )
                }

                VOBlock(title: "Read components") {
                    VOSnippet(
                        api: "AffineTransform3D exposes translation, rotation, scale",
                        code: """
                        Text("x: \\(transform.translation.x, specifier: \"%.2f\")")
                        Text("scale: \\(transform.scale.x, specifier: \"%.2f\")")
                        """,
                        note: "Decompose the bound AffineTransform3D into its components for inspection or display."
                    )
                }
            }
        }
    }

    // MARK: ManipulableResponderModifier
    // (Absorbed from former ManipulableResponderModifierPage.)

    private var responderSection: some View {
        PageSection(".onManipulationPhaseChange / .onManipulationValueChange — ManipulableResponderModifier",
                    subtitle: "React to lifecycle phases or live transform changes.") {
            VStack(alignment: .leading, spacing: 16) {
                VOSnippet(
                    api: ".onManipulationPhaseChange { phase in \u{2026} }",
                    code: """
                    Model3D(named: "TeaPot")
                        .manipulable()
                        .onManipulationPhaseChange { phase in
                            switch phase {
                            case .began:   model.beginManipulation()
                            case .changed: model.updateManipulation()
                            case .ended:   model.endManipulation()
                            }
                        }
                    """,
                    note: "Hook lifecycle events on a manipulable view to drive audio, haptics, or analytics."
                )

                VOBlock(title: "React to live value changes") {
                    VOSnippet(
                        api: ".onManipulationValueChange { transform in \u{2026} }",
                        code: """
                        Model3D(named: "TeaPot")
                            .manipulable()
                            .onManipulationValueChange { transform in
                                audio.pitch = Float(transform.scale.x)
                            }
                        """,
                        note: "Stream the live transform out of the manipulation \u{2014} useful for procedurally driven feedback."
                    )
                }

                VOBlock(title: "Coordinate phase + event together") {
                    VOSnippet(
                        api: "Combine .onManipulationEvent and .onManipulationPhaseChange",
                        code: """
                        Model3D(named: "TeaPot")
                            .manipulable()
                            .onManipulationEvent { event in handleEvent(event) }
                            .onManipulationPhaseChange { phase in handlePhase(phase) }
                        """,
                        note: "The two responders complement each other \u{2014} event for discrete moments, phase change for state transitions."
                    )
                }
            }
        }
    }

    // MARK: Notes

    private struct ManipulableNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ManipulableNote] = [
        .init(title: "visionOS-only API surface.",
              detail: "The Manipulable family ships for visionOS. SwiftKit (macOS 26) renders the documentation; the modifiers are not available at runtime on macOS.",
              symbol: "visionpro"),
        .init(title: "Designed for volumetric scenes.",
              detail: "Use inside a volumetric WindowGroup, an ImmersiveSpace, or any container that renders 3D content. The modifier is a no-op outside a 3D context.",
              symbol: "cube.transparent"),
        .init(title: "Two-way transform binding.",
              detail: "Drive the transform from your code by writing the @State; read user-driven changes by observing it. The @State is the source of truth — use .onChange or @SceneStorage to persist.",
              symbol: "arrow.left.arrow.right"),
        .init(title: "Lifecycle vs. value streams.",
              detail: "Phase responders fire at began/changed/ended; value responders stream the live transform. Pick the granularity that matches your feedback loop.",
              symbol: "waveform.path"),
        .init(title: "Inertia, snap, and bounds via the same API.",
              detail: "Configure release physics, snap targets, and the coordinate space the manipulation occurs in via the modifier's parameters \u{2014} no separate gesture wiring required.",
              symbol: "speedometer"),
        .init(title: "Apple's primitives conform automatically.",
              detail: "Model3D conforms to Manipulable out of the box. Custom types only need to conform when they replace those primitives wholesale.",
              symbol: "puzzlepiece.extension")
    ]

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(notes, id: \.title) { note in
                    VStack(alignment: .leading, spacing: 4) {
                        Label(note.title, systemImage: note.symbol)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(note.detail)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .padding(.leading, 24)
                    }
                }
            }
        }
    }
}

// MARK: - Page-local helpers

private struct VOSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct VOBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

extension ManipulableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.manipulable",
        title: "Manipulable",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: [
            "Manipulable",
            "ManipulableModifier",
            "ManipulableResponderModifier",
            "ManipulableTransformBindingModifier",
            "ManipulationGeometryModifier",
            "ManipulationGestureModifier",
            "ManipulationUsingGestureStateModifier"
        ],
        blurb: "A namespace for manipulable-related types and view modifiers used to drive 3D manipulation gestures. Member structures expose the modifier shapes that compose into a manipulation interaction.",
        signature: "enum Manipulable",
        availability: "visionOS 26.0",
        docPath: "Documentation/SwiftUI/view-fundamentals/manipulable.md",
        page: { AnyView(ManipulableGalleryPage()) }
    )
}

#Preview {
    ManipulableGalleryPage()
        .frame(width: 1100, height: 1400)
}
