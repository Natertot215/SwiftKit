import SwiftUI

// SwiftUI MatchedGeometry / MatchedTransition bundle.
// Covers:
//   Namespace                                                 — property wrapper
//   View/matchedGeometryEffect(id:in:properties:anchor:isSource:)
//   MatchedGeometryProperties                                 — option set
//   View/matchedTransitionSource(id:in:)                      — macOS 26+
//   View/matchedTransitionSource(id:in:configuration:)        — macOS 26+
//   MatchedTransitionSourceConfiguration                      — protocol
//   EmptyMatchedTransitionSourceConfiguration                 — default conformance
// Source: Documentation/SwiftUI/animations/matchedgeometryeffect*.md

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 200

struct MatchedGeometryPage: View {
    @Namespace private var heroNamespace
    @Namespace private var gridNamespace

    @State private var heroExpanded = false
    @State private var selectedCard: Int? = nil

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
            Text("matchedGeometryEffect / Namespace")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Synchronizes the geometry (position, size, or both) of two views across an animation, creating a hero-style morph. The @Namespace property wrapper provides the shared namespace.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/matchedgeometryeffect.md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".matchedGeometryEffect(id: \"hero\", in: ns)") {
            VStack(spacing: 16) {
                if !heroExpanded {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.tint)
                            .matchedGeometryEffect(id: "hero", in: heroNamespace)
                            .frame(width: 60, height: 60)
                        Text("Tap to expand")
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .padding(.horizontal)
                } else {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(.tint)
                        .matchedGeometryEffect(id: "hero", in: heroNamespace)
                        .frame(width: 300, height: 120)
                }
                Button(heroExpanded ? "Collapse" : "Expand") {
                    withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
                        heroExpanded.toggle()
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "MatchedGeometryProperties \u{2014} control which geometry is matched") {
                DemoFrame(api: ".matchedGeometryEffect(id: id, in: ns, properties: .frame)") {
                    VStack(spacing: 8) {
                        HStack(spacing: 16) {
                            ForEach([(".position", "arrow.up.left.and.arrow.down.right"),
                                     (".size", "arrow.left.and.right"),
                                     (".frame", "rectangle.dashed")], id: \.0) { item in
                                VStack(spacing: 4) {
                                    Image(systemName: item.1)
                                        .foregroundStyle(.tint)
                                    Text(item.0)
                                        .font(.caption)
                                        .fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(8)
                                .background(.tint.opacity(0.1), in: RoundedRectangle(cornerRadius: 6))
                            }
                        }
                        Text(".frame = .position + .size (default). Use .position to sync location only, .size to sync dimensions only.")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "isSource: false \u{2014} destination-only") {
                DemoFrame(api: ".matchedGeometryEffect(id: id, in: ns, isSource: false)") {
                    VStack(spacing: 8) {
                        Text("isSource: false marks a view as the geometry destination only. It receives the matched frame from the source but doesn't contribute its own geometry to the namespace. Use this when a view appears only in the destination layout.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "matchedTransitionSource (macOS 26+) \u{2014} NavigationLink hero") {
                DemoFrame(api: ".matchedTransitionSource(id: id, in: ns) + .navigationTransition(.zoom(sourceID:))") {
                    VStack(spacing: 8) {
                        Text("matchedTransitionSource pairs with .navigationTransition(.zoom(sourceID:in:)) to create hero-zoom transitions on NavigationStack pushes. macOS 26+.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "@Namespace \u{2014} the property wrapper that creates the ID space") {
                DemoFrame(api: "@Namespace private var ns") {
                    VStack(spacing: 8) {
                        Text("@Namespace creates a Namespace.ID value scoped to the view. Pass ns into matchedGeometryEffect(in:) to link views within the same namespace. Different namespace values produce independent hero animations.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    private struct NoteItem {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NoteItem] = [
        .init(title: "Exactly one view per ID must be the source (isSource: true).",
              detail: "If two views share the same ID and both are sources, the behavior is undefined. One view defines the geometry; the other(s) follow it.",
              symbol: "exclamationmark.triangle"),
        .init(title: "The matched views must be in the same view hierarchy simultaneously.",
              detail: "matchedGeometryEffect works by reading the source's frame and animating the destination to it. Both views must be rendered (even if invisible) at the same time during the animation.",
              symbol: "rectangle.on.rectangle"),
        .init(title: "Use withAnimation to drive the geometry change.",
              detail: "matchedGeometryEffect is purely declarative. The animation happens when the @State driving the layout change is mutated inside withAnimation { }.",
              symbol: "play.fill"),
        .init(title: "matchedTransitionSource is a macOS 26+ replacement for navigation hero transitions.",
              detail: "It integrates with .navigationTransition(.zoom) to create a zoom effect as a destination view appears on NavigationStack push. MatchedTransitionSourceConfiguration lets you customize the source appearance.",
              symbol: "arrow.up.right")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
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

#Preview {
    MatchedGeometryPage()
        .frame(width: 1100, height: 900)
}
