import SwiftUI

// SwiftUI `View/safeAreaBar(edge:alignment:spacing:content:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/safeareabar(edge:alignment:spacing:content:).md
// macOS 26.0+. Bar variant of safeAreaInset that pins to a horizontal edge and
// extends scroll edge effects into the bar's inset.

struct SafeAreaBarPage: View {
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
            Text("View/safeAreaBar(edge:alignment:spacing:content:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Anchors a custom bar to a horizontal edge of the modified view, insetting the safe area for it and extending any scroll edge effects into the bar's region. The bar variant of safeAreaInset on a horizontal axis.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/safeareabar(edge:alignment:spacing:content:).md \u{00b7} macOS 26.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".safeAreaBar(edge: .trailing, alignment: .center, spacing: 0) { Inspector() }")
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
            .safeAreaBar(edge: .trailing, alignment: .center, spacing: 0) {
                inspectorBar
            }
            .frame(height: 240)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    private var inspectorBar: some View {
        VStack(alignment: .leading, spacing: 6) {
            Label("Inspector", systemImage: "sidebar.right")
                .font(.caption).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Pinned bar")
                .font(.caption2).foregroundStyle(.secondary)
            Divider()
            Text("trailing edge")
                .font(.caption2).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
        .padding(8)
        .frame(width: 110)
        .background(.thinMaterial)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Leading edge").font(.headline).foregroundStyle(.primary)
                APICallout(".safeAreaBar(edge: .leading) { Sidebar() }")
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
                .safeAreaBar(edge: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Label("Sidebar", systemImage: "sidebar.left").font(.caption).fontWeight(.semibold)
                        Text("leading bar").font(.caption2).foregroundStyle(.secondary)
                    }
                    .padding(8)
                    .frame(width: 110)
                    .background(.thinMaterial)
                }
                .frame(height: 160)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Vertical alignment").font(.headline).foregroundStyle(.primary)
                APICallout(".safeAreaBar(edge: .trailing, alignment: .top) { … }")
                APICallout(".safeAreaBar(edge: .trailing, alignment: .center) { … }")
                APICallout(".safeAreaBar(edge: .trailing, alignment: .bottom) { … }")
                Text("alignment positions the bar's content vertically when the bar is shorter than its container. Default is .center.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Spacing").font(.headline).foregroundStyle(.primary)
                APICallout(".safeAreaBar(edge: .trailing, spacing: nil)   // platform default")
                APICallout(".safeAreaBar(edge: .trailing, spacing: 0)     // flush")
                APICallout(".safeAreaBar(edge: .trailing, spacing: 16)    // explicit gap")
                Text("spacing is the gap between the bar and the modified view. Pass nil for the system default, 0 for flush attachment, or an explicit value.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("HorizontalEdge only").font(.headline).foregroundStyle(.primary)
            APICallout("// edge: HorizontalEdge   .leading | .trailing")
            Text("safeAreaBar takes HorizontalEdge \u{2014} the bar attaches to the leading or trailing side. For top/bottom bars, use safeAreaInset(edge: .top|.bottom).")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Bar, not just inset.", "Unlike safeAreaInset, this modifier explicitly extends the scroll edge effect into the bar region \u{2014} so the scroll content fades into the bar instead of stopping at the inset edge.", "rectangle.split.3x1"),
        ("Side bars, not bottom bars.", "edge is HorizontalEdge \u{2014} only .leading and .trailing. Use safeAreaInset(edge: .bottom) for a bottom bar.", "arrow.left.and.right"),
        ("macOS 26+ only.", "Brand-new API tied to the macOS 26 sidebar / inspector visual language. No equivalent on earlier targets \u{2014} use safeAreaInset there.", "exclamationmark.circle"),
        ("Pair with scrollEdgeEffect modifiers.", "Combine .safeAreaBar with .scrollEdgeEffectStyle(.hard, for: edge) or .scrollEdgeEffectHidden(true, for: edge) to coordinate the visual boundary between bar and content.", "paintbrush")
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
    SafeAreaBarPage().frame(width: 1100, height: 1200)
}
