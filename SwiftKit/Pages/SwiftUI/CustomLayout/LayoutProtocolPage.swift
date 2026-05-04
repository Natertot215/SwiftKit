import SwiftUI

// SwiftUI Layout protocol, LayoutSubviews, LayoutSubview, LayoutProperties,
// ProposedViewSize, ViewSpacing, LayoutValueKey, layoutValue(key:value:) reference page.
// Source: Documentation/SwiftUI/custom-layout/layout.md
// macOS 13.0+

// A simple waterfall (column-based) custom layout demo.
private struct WaterfallLayout: Layout {
    var columns: Int
    var spacing: CGFloat

    struct CacheData {
        var sizes: [CGSize]
    }

    func makeCache(subviews: Subviews) -> CacheData {
        CacheData(sizes: subviews.map { $0.sizeThatFits(.unspecified) })
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) -> CGSize {
        let width = proposal.width ?? 300
        let colWidth = (width - CGFloat(columns - 1) * spacing) / CGFloat(columns)
        var colHeights = Array(repeating: CGFloat(0), count: columns)
        for size in cache.sizes {
            let minCol = colHeights.enumerated().min(by: { $0.element < $1.element })!.offset
            colHeights[minCol] += size.height + spacing
        }
        return CGSize(width: width, height: (colHeights.max() ?? 0))
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout CacheData) {
        let colWidth = (bounds.width - CGFloat(columns - 1) * spacing) / CGFloat(columns)
        var colHeights = Array(repeating: CGFloat(0), count: columns)
        for (i, subview) in subviews.enumerated() {
            let size = cache.sizes[i]
            let minCol = colHeights.enumerated().min(by: { $0.element < $1.element })!.offset
            let x = bounds.minX + CGFloat(minCol) * (colWidth + spacing)
            let y = bounds.minY + colHeights[minCol]
            subview.place(at: CGPoint(x: x, y: y), anchor: .topLeading,
                         proposal: ProposedViewSize(width: colWidth, height: size.height))
            colHeights[minCol] += size.height + spacing
        }
    }
}

struct LayoutProtocolPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("Layout protocol")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Implement the Layout protocol to create a fully custom container that participates in SwiftUI's layout system. Provides sizeThatFits and placeSubviews.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/custom-layout/layout.md · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("struct WaterfallLayout: Layout { func sizeThatFits(…) / placeSubviews(…) }")
                Text("Waterfall (masonry) layout — 3 columns, self-organizing by height")
                    .font(.caption).foregroundStyle(.tertiary)
                WaterfallLayout(columns: 3, spacing: 8) {
                    ForEach(waterfallItems, id: \.label) { item in
                        RoundedRectangle(cornerRadius: 8)
                            .fill(item.color.opacity(0.35))
                            .frame(height: item.height)
                            .overlay(
                                Text(item.label)
                                    .font(.caption2).fontWeight(.medium)
                                    .foregroundStyle(item.color)
                            )
                    }
                }
                .frame(width: 360)
                .padding(8)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("LayoutSubviews / LayoutSubview").font(.headline).foregroundStyle(.primary)
                    APICallout("subviews: Subviews  // Subviews == LayoutSubviews")
                    Text("LayoutSubviews is a RandomAccessCollection of LayoutSubview values. Each LayoutSubview provides sizeThatFits(_:), dimensions(in:), and place(at:anchor:proposal:).")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout("subview.sizeThatFits(.unspecified)  // ideal size")
                    APICallout("subview.place(at: origin, anchor: .topLeading, proposal: size)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ProposedViewSize").font(.headline).foregroundStyle(.primary)
                    APICallout("ProposedViewSize(width: 200, height: 100)")
                    Text("ProposedViewSize wraps optional width/height. Special values: .zero, .infinity, .unspecified (nil for both). Passed to sizeThatFits and place.")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout("ProposedViewSize.zero  //  .infinity  //  .unspecified")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("LayoutProperties").font(.headline).foregroundStyle(.primary)
                    APICallout("static var layoutProperties: LayoutProperties { var p = LayoutProperties(); p.stackOrientation = .vertical; return p }")
                    Text("Optional static property. Declares the layout's stack orientation — used by AnyLayout for transitions and by SwiftUI to optimize spacing calculations.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ViewSpacing").font(.headline).foregroundStyle(.primary)
                    APICallout("subview.spacing.distance(to: nextSpacing, along: .horizontal)")
                    Text("ViewSpacing encapsulates the preferred spacing a subview wants from its neighbors on each edge. Use spacing.distance(to:along:) to get the resolved gap.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("LayoutValueKey — per-subview custom data").font(.headline).foregroundStyle(.primary)
                    APICallout("struct PriorityKey: LayoutValueKey { static let defaultValue: Int = 0 }")
                    APICallout(".layoutValue(key: PriorityKey.self, value: 2)")
                    Text("LayoutValueKey lets callers annotate subviews with custom data accessible inside the Layout implementation via subview[PriorityKey.self].")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Layout.makeCache(subviews:) is optional — override to cache expensive per-subview computations.", systemImage: "memorychip")
                    .font(.callout).foregroundStyle(.secondary)
                Label("sizeThatFits is called multiple times with different proposals — keep it fast and pure.", systemImage: "bolt")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Layout types are value types — no reference cycles, no retained state between calls.", systemImage: "cube")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private let waterfallItems: [(label: String, height: CGFloat, color: Color)] = [
        ("Card A", 60, .red),
        ("Card B", 90, .blue),
        ("Card C", 50, .green),
        ("Card D", 80, .orange),
        ("Card E", 70, .purple),
        ("Card F", 55, .teal),
        ("Card G", 100, .indigo),
        ("Card H", 65, .pink),
        ("Card I", 75, .yellow)
    ]
}

#Preview {
    LayoutProtocolPage().frame(width: 900, height: 900)
}
