import SwiftUI

// SwiftUI `View/scrollEdgeEffectStyle(_:for:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrolledgeeffectstyle(_:for:).md
// macOS 26.0+.

struct ScrollEdgeEffectStylePage: View {
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
            Text("View/scrollEdgeEffectStyle(_:for:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Configures the scroll edge effect style for scroll views in this hierarchy. The edge effect is the soft fade/feather at the edges of a scroll view; this modifier swaps it between automatic, soft, and hard variants per edge set.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrolledgeeffectstyle(_:for:).md \u{00b7} macOS 26.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 16) {
            edgeEffectVariant(label: "automatic", api: ".scrollEdgeEffectStyle(.automatic, for: .all)", style: .automatic)
            edgeEffectVariant(label: "soft", api: ".scrollEdgeEffectStyle(.soft, for: .all)", style: .soft)
            edgeEffectVariant(label: "hard", api: ".scrollEdgeEffectStyle(.hard, for: .all)", style: .hard)
        }
    }

    private func edgeEffectVariant(label: String, api: String, style: ScrollEdgeEffectStyle) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Text(label).font(.caption).fontDesign(.monospaced).fontWeight(.semibold).foregroundStyle(.tint)
                APICallout(api)
            }
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<25) { i in
                        Text("Row \(i)").font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.leading, 12)
                    }
                }
            }
            .frame(height: 140)
            .scrollEdgeEffectStyle(style, for: .all)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Edge.Set targeting").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollEdgeEffectStyle(.hard, for: .top)")
                APICallout(".scrollEdgeEffectStyle(.soft, for: [.top, .bottom])")
                APICallout(".scrollEdgeEffectStyle(.hard, for: .all)")
                Text("The for: parameter is an Edge.Set, so you can apply different styles to different edges \u{2014} hard top, soft bottom, etc.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Pair with safeAreaBar").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView { … }
    .safeAreaBar(edge: .trailing) { Inspector() }
    .scrollEdgeEffectStyle(.hard, for: .trailing)
""")
                Text("safeAreaBar extends the scroll edge effect into the bar's inset area. Pair the two when you want a crisp transition between content and a sidebar / inspector.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Style values").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollEdgeEffectStyle.automatic")
                APICallout("ScrollEdgeEffectStyle.soft")
                APICallout("ScrollEdgeEffectStyle.hard")
                Text("automatic — platform default. soft — gentle fade. hard — crisp cut, no fade.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Optional style").font(.headline).foregroundStyle(.primary)
            APICallout("func scrollEdgeEffectStyle(_ style: ScrollEdgeEffectStyle?, for edges: Edge.Set) -> some View")
            Text("Pass nil to revert to inherited / system default. The signature is ScrollEdgeEffectStyle? \u{2014} useful when conditionally overriding only some edges.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("macOS 26+ only.", "This API debuted with the macOS 26 design refresh and isn't available on earlier targets.", "exclamationmark.circle"),
        (".all is the common case.", "Most scroll views look right with a single style across all four edges; reach for per-edge variants when there's an adjacent surface that demands a hard cut.", "square.dashed"),
        ("Doesn't change scroll behavior.", "This is purely visual \u{2014} bounce, scroll indicators, and content offset are unaffected.", "paintbrush")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

#Preview {
    ScrollEdgeEffectStylePage().frame(width: 1100, height: 1100)
}
