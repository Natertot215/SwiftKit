import SwiftUI

// SwiftUI `GlassEffectTransition` reference page.
// Source: Documentation/SwiftUI/view-styles/glasseffecttransition.md
// macOS 26.0+. Describes changes to apply when a glass effect is added or
// removed. Built-in values: .identity, .matchedGeometry, .materialize.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 180

struct GlassEffectTransitionPage: View {
    @State private var showA: Bool = true
    @State private var showB: Bool = true
    @State private var showC: Bool = true

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
            Text("GlassEffectTransition")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A structure that describes changes to apply when a glass effect is added or removed from the view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/glasseffecttransition.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GETCard(title: ".materialize (default)", api: ".glassEffectTransition(.materialize)") {
            VStack {
                if showA {
                    Text("Now you see me")
                        .padding()
                        .glassEffect()
                        .glassEffectTransition(.materialize)
                }
                Button(showA ? "Hide" : "Show") { withAnimation { showA.toggle() } }
                    .padding(.top, 8)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Three documented type properties: .identity, .matchedGeometry, .materialize.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                GETCard(title: ".identity", api: ".glassEffectTransition(.identity)") {
                    VStack {
                        if showA {
                            Text("Identity")
                                .padding()
                                .glassEffect()
                                .glassEffectTransition(.identity)
                        }
                        Button("Toggle") { withAnimation { showA.toggle() } }
                    }
                }
                GETCard(title: ".matchedGeometry", api: ".glassEffectTransition(.matchedGeometry)") {
                    VStack {
                        if showB {
                            Text("Matched")
                                .padding()
                                .glassEffect()
                                .glassEffectTransition(.matchedGeometry)
                        }
                        Button("Toggle") { withAnimation { showB.toggle() } }
                    }
                }
                GETCard(title: ".materialize", api: ".glassEffectTransition(.materialize)") {
                    VStack {
                        if showC {
                            Text("Materialize")
                                .padding()
                                .glassEffect()
                                .glassEffectTransition(.materialize)
                        }
                        Button("Toggle") { withAnimation { showC.toggle() } }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Live demo — toggle each card to compare the in/out animation")
                .font(.headline)
            Text("All three transitions live above. Each card's button flips visibility inside withAnimation.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct GETNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GETNote] = [
        .init(title: "Three documented values: .identity, .matchedGeometry, .materialize.",
              detail: ".identity is no transition. .matchedGeometry hooks into existing matchedGeometryEffect IDs. .materialize is the canonical Liquid Glass appear/disappear (the default for sibling shapes inside a container).",
              symbol: "rectangle.stack"),
        .init(title: ".matchedGeometry needs a matching identity.",
              detail: "Pair it with .matchedGeometryEffect(id:in:) on the appearing/disappearing view. Without a matching anchor it falls back to .materialize.",
              symbol: "puzzlepiece"),
        .init(title: ".identity skips the Liquid Glass-specific in/out beats.",
              detail: "Use it when you want the standard SwiftUI appear/disappear (opacity fade) without the glass-flavored materialize effect.",
              symbol: "rectangle.dashed"),
        .init(title: ".glassEffectTransition(_:) modifier attaches the value.",
              detail: "Apply on the same view that has .glassEffect(). The transition fires when SwiftUI inserts or removes the view from the hierarchy under withAnimation.",
              symbol: "function"),
        .init(title: "macOS 26.0+ only.",
              detail: "Like the rest of the Liquid Glass family. SwiftKit targets macOS 26 exclusively.",
              symbol: "calendar")
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

private struct GETCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .center)
                .background(
                    LinearGradient(colors: [.cyan.opacity(0.5), .pink.opacity(0.5)],
                                   startPoint: .topLeading, endPoint: .bottomTrailing),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    GlassEffectTransitionPage()
        .frame(width: 1200, height: 1000)
}
