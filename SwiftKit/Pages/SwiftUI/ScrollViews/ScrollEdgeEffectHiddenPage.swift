import SwiftUI

// SwiftUI `View/scrollEdgeEffectHidden(_:for:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrolledgeeffecthidden(_:for:).md
// macOS 26.0+.

struct ScrollEdgeEffectHiddenPage: View {
    @State private var hidden: Bool = true

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
            Text("View/scrollEdgeEffectHidden(_:for:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Hides the scroll edge effect entirely for the targeted edges. Use when adjacent surfaces (toolbar, inspector, sidebar) already provide a hard visual boundary and the edge effect would compete with it.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrolledgeeffecthidden(_:for:).md \u{00b7} macOS 26.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                APICallout(".scrollEdgeEffectHidden(\(hidden ? "true" : "false"), for: .all)")
                Spacer()
                Toggle("Hide edge effect", isOn: $hidden).toggleStyle(.switch)
            }

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<40) { i in
                        Text("Row \(i)").font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.leading, 12)
                    }
                }
            }
            .frame(height: 220)
            .scrollEdgeEffectHidden(hidden, for: .all)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Per-edge hiding").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollEdgeEffectHidden(true, for: .top)")
                APICallout(".scrollEdgeEffectHidden(true, for: [.top, .bottom])")
                APICallout(".scrollEdgeEffectHidden()                            // hides all by default")
                Text("Default values: hidden = true, edges = .all. Writing .scrollEdgeEffectHidden() with no arguments is the same as passing (true, .all).")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Hide vs style").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollEdgeEffectStyle(.hard, for: .top)        // crisp visible cut")
                APICallout(".scrollEdgeEffectHidden(true, for: .top)        // no effect at all")
                Text(".scrollEdgeEffectHidden suppresses the effect entirely. .scrollEdgeEffectStyle(.hard) keeps the effect but makes it crisp \u{2014} they answer different questions.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Inspector / Sidebar pattern").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView { … }
    .safeAreaBar(edge: .trailing) { Inspector() }
    .scrollEdgeEffectHidden(true, for: .trailing)
""")
                Text("When a safeAreaBar already provides a hard visual boundary, hide the edge effect on that side to avoid a doubled fade.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Boolean toggle, not a transition").font(.headline).foregroundStyle(.primary)
            APICallout("// Bool flips visibility at the modifier; no animation curve")
            Text("This is a layout-time visibility flip \u{2014} not animated by SwiftUI. Wrap the boolean in withAnimation if you want the effect to fade in or out.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("macOS 26+ only.", "Like the rest of the scrollEdgeEffect family, this debuted with the macOS 26 design language.", "exclamationmark.circle"),
        ("Default args = (true, .all).", "Calling .scrollEdgeEffectHidden() with no arguments is the most ergonomic way to remove every edge effect at once.", "scope"),
        ("Pair with hard cuts.", "On surfaces that abut a glass-style sidebar or inspector, hiding the matching edge often looks better than even a hard style.", "rectangle.split.3x1")
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
    ScrollEdgeEffectHiddenPage().frame(width: 1100, height: 1100)
}
