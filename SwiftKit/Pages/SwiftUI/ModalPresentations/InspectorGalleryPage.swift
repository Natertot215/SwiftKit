import SwiftUI

// SwiftUI `View/inspector(isPresented:content:)` reference page.
// Source: Documentation/SwiftUI/inspectors/inspector(ispresented:content:).md
// macOS 14.0+. Inserts a trailing-column inspector at the applied position.

private let demoFrameWidth: CGFloat = 720

struct InspectorGalleryPage: View {
    @State private var isShowing = true

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/inspector(isPresented:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Inserts an inspector at the applied position in the view hierarchy. On macOS, presents as a trailing column attached to the parent view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/inspectors/inspector(ispresented:content:).md \u{00b7} macOS 14.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".inspector(isPresented: $isShowing) { TextTraitsInspectorView() }",
                 height: 280) {
            HStack(spacing: 0) {
                EditorMockup()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.background.tertiary)
            }
            .inspector(isPresented: $isShowing) {
                TextTraitsInspector()
                    .inspectorColumnWidth(min: 180, ideal: 220, max: 320)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Toggle the inspector column") {
                HStack(spacing: 12) {
                    Button(isShowing ? "Hide inspector" : "Show inspector") {
                        isShowing.toggle()
                    }
                    Text("isShowing = \(String(describing: isShowing))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
                .padding(12)
                .frame(width: demoFrameWidth, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
                APICallout("Bind to @State; flip from a toolbar button or menu command.")
            }

            VariantBlock(title: "Compose with .inspectorColumnWidth") {
                Text("""
                EditorView()
                    .inspector(isPresented: $isShowing) {
                        TextTraitsInspector()
                            .inspectorColumnWidth(225)        // fixed
                            // or:
                            .inspectorColumnWidth(min: 150, ideal: 225, max: 400)
                    }
                """)
                .font(.caption)
                .fontDesign(.monospaced)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Adaptive presentation") {
                Text("On macOS the inspector is always a trailing column. On iPadOS it can adapt to a sheet in horizontally-compact size classes — apply .presentationCompactAdaptation to the inspector content if you want to pin a specific adaptation.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "State restoration") {
                Text("Per Apple: trailing-column inspectors have their presentation state restored by the framework. The user's last open/closed choice survives launches automatically.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct InspNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [InspNote] = [
        .init(title: "Inserts at the applied position.",
              detail: "Apply on the editor / canvas root view. The inspector column attaches to that subtree's trailing edge — similar to how NavigationSplitView places a sidebar.",
              symbol: "sidebar.right"),
        .init(title: "Width control via .inspectorColumnWidth(_:) / (min:ideal:max:).",
              detail: "Only some platforms enable flexible widths. macOS supports both fixed and flexible; iPadOS may ignore unsupported widths.",
              symbol: "ruler"),
        .init(title: "InspectorCommands adds default keyboard shortcuts.",
              detail: "Add `.commands { InspectorCommands() }` to the App's Scene to get a default Show/Hide Inspector menu item with the system shortcut (⌥⌘0).",
              symbol: "command"),
        .init(title: "Combine with .interactiveDismissDisabled.",
              detail: "On macOS, users can collapse the inspector by dragging its leading divider. Apply `.interactiveDismissDisabled()` to the inspector content if collapse must be programmatic-only.",
              symbol: "lock.shield"),
        .init(title: "Apple's recommended use: secondary editor controls.",
              detail: "Inspectors are for tools that act on the main view (text traits, layer properties). Primary navigation belongs in the sidebar; tools belong in the inspector.",
              symbol: "slider.horizontal.3")
    ]

    @ViewBuilder
    private var notesContent: some View {
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

private struct EditorMockup: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Editor area")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("This stands in for the main content of an editor. The inspector lives to the right.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(24)
    }
}

private struct TextTraitsInspector: View {
    @State private var bold = true
    @State private var italic = false
    @State private var size: Double = 14

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Text Traits")
                .font(.headline)
                .foregroundStyle(.primary)
            Toggle("Bold", isOn: $bold)
            Toggle("Italic", isOn: $italic)
            HStack {
                Text("Size")
                Slider(value: $size, in: 10...32)
                Text("\(Int(size))").monospacedDigit()
            }
            Spacer()
        }
        .padding(16)
        .background(.background)
    }
}

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let height {
                    content().frame(width: demoFrameWidth, height: height)
                } else {
                    content().frame(width: demoFrameWidth, alignment: .leading)
                }
            }
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
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

extension InspectorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.inspector",
        title: "Inspector",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/inspector(isPresented:content:)",
            "View/inspectorColumnWidth(_:)",
            "View/inspectorColumnWidth(min:ideal:max:)"
        ],
        blurb: "Presents a trailing inspector pane alongside the main content. Width is configurable as a fixed value or a min/ideal/max range.",
        signature: "func inspector<Content>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View where Content : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/inspectors/inspector(ispresented:content:).md",
        page: { AnyView(InspectorGalleryPage()) }
    )
}

#Preview {
    InspectorGalleryPage()
        .frame(width: 1100, height: 800)
}
