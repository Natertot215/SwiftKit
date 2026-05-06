import SwiftUI

// Dense LazyGrid reference page. Consolidates three previously-separate leaves:
//   • LazyVGrid                                                         (struct)
//   • LazyHGrid                                                         (struct)
//   • GridItem (in lazy context)                                        (struct)
//
// Source docs:
//   Documentation/SwiftUI/layout-fundamentals/lazyvgrid.md
//   Documentation/SwiftUI/layout-fundamentals/lazyhgrid.md
//   Documentation/SwiftUI/layout-fundamentals/griditem.md
//   macOS 11.0+

private let gridColors: [Color] = [.red, .orange, .yellow, .green, .teal, .blue, .indigo, .purple, .pink]
private let gridColorNames = ["Red", "Orange", "Yellow", "Green", "Teal", "Blue", "Indigo", "Purple", "Pink"]

struct LazyGridPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                lazyVGridSection
                lazyHGridSection
                gridItemInContextSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Lazy Grids")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("LazyVGrid and LazyHGrid arrange items in a grid and create cells on demand as they scroll into view. GridItem describes each column (LazyVGrid) or row (LazyHGrid) — size, spacing, and alignment.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-fundamentals/lazyvgrid.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("LazyVGrid  \u{00b7}  LazyHGrid  \u{00b7}  GridItem")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: LazyVGrid

    private var lazyVGridSection: some View {
        PageSection("LazyVGrid", subtitle: "struct LazyVGrid<Content: View> \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A grid that grows vertically, creating cells as they scroll into the visible area. Columns are described by an array of GridItem values. Requires a vertical ScrollView.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) { ForEach(\u{2026}) }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Adaptive columns — fills available width")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 10)], spacing: 10) {
                            ForEach(Array(zip(gridColors, gridColorNames)), id: \.1) { color, name in
                                colorTile(color: color, name: name)
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 180)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("columns: [GridItem(.adaptive(minimum: 80), spacing: 10)]")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Three flexible columns")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                            ForEach(0..<9) { i in colorCell(i) }
                        }
                        .padding(8)
                    }
                    .frame(height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Three fixed 80pt columns")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))], spacing: 8) {
                            ForEach(0..<9) { i in colorCell(i) }
                        }
                        .padding(8)
                    }
                    .frame(height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]")
                }

                noteRow(
                    title: "LazyVGrid measures visible cells only.",
                    detail: "Cells outside the scroll viewport are not created. This makes LazyVGrid suitable for data sets of hundreds or thousands of items where an eager Grid would be too expensive.",
                    symbol: "bolt.fill"
                )
            }
        }
    }

    // MARK: LazyHGrid

    private var lazyHGridSection: some View {
        PageSection("LazyHGrid", subtitle: "struct LazyHGrid<Content: View> \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A grid that grows horizontally. Rows are described by an array of GridItem values. Requires a horizontal ScrollView. The rows parameter plays the same role as the columns parameter in LazyVGrid.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("LazyHGrid(rows: [GridItem(.fixed(60))]) { ForEach(\u{2026}) }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Single fixed-height row — horizontal scrolling")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.fixed(60))], spacing: 8) {
                            ForEach(Array(zip(gridColors, gridColorNames)), id: \.1) { color, name in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(color.opacity(0.35))
                                    .frame(width: 80)
                                    .overlay(Text(name).font(.caption2).foregroundStyle(color))
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 80)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("rows: [GridItem(.fixed(60))]")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Two adaptive rows — horizontal scrolling grid")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 60))], spacing: 8) {
                            ForEach(Array(zip(gridColors, gridColorNames)), id: \.1) { color, name in
                                colorTile(color: color, name: name)
                                    .frame(width: 72)
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("rows: [GridItem(.adaptive(minimum: 60))]")
                }

                noteRow(
                    title: "LazyHGrid mirrors LazyVGrid — swap rows for columns.",
                    detail: "All GridItem sizing modes (.flexible, .fixed, .adaptive) work identically. The scroll direction is the only structural difference.",
                    symbol: "arrow.left.and.right"
                )
            }
        }
    }

    // MARK: GridItem in context

    private var gridItemInContextSection: some View {
        PageSection("GridItem — sizing reference", subtitle: "struct GridItem \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("GridItem describes one column (LazyVGrid) or one row (LazyHGrid). Its Size enum provides three modes. The spacing parameter controls inter-item gaps on the cross axis.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("GridItem(.flexible())                  // equal share of space")
                    APICallout("GridItem(.flexible(minimum: 60, maximum: 200))  // bounded flexible")
                    APICallout("GridItem(.fixed(120))                  // exact 120pt")
                    APICallout("GridItem(.adaptive(minimum: 80))       // as many as fit \u{2265}80pt")
                    APICallout("GridItem(.adaptive(minimum: 80, maximum: 160))  // bounded adaptive")
                    APICallout("GridItem(.flexible(), spacing: 12)     // 12pt inter-item gap on cross axis")
                    APICallout("GridItem(.flexible(), alignment: .topLeading)  // per-column alignment")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("spacing parameter — GridItem controls cross-axis spacing")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("GridItem.spacing sets the gap between columns (LazyVGrid) or rows (LazyHGrid). The grid's own spacing parameter sets gaps along the scroll axis.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout("LazyVGrid(columns: [GridItem(.adaptive(minimum: 60), spacing: 4)], spacing: 16) { \u{2026} }")
                    Text("Result: 4pt between columns, 16pt between rows.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 14) {
                noteRow(
                    title: ".adaptive is best for responsive photo grids and card layouts.",
                    detail: "The grid fills as many columns as possible at the minimum width, resizing them to fill the container. No manual column-count calculation needed.",
                    symbol: "square.grid.3x3.fill"
                )
                noteRow(
                    title: "Lazy grids vs Grid — choose based on size and column alignment needs.",
                    detail: "Grid aligns columns automatically across rows. LazyVGrid/LazyHGrid do NOT — cells in the same column are independently sized. Use Grid for small tables; lazy grids for large collections.",
                    symbol: "tablecells"
                )
                noteRow(
                    title: ".flexible divides space equally; .fixed pins; .adaptive fills.",
                    detail: "Prefer .adaptive for unknown or dynamic item counts. Prefer .flexible for dashboards with a known number of equal-width panels. Use .fixed sparingly — it doesn't adapt to window size changes.",
                    symbol: "slider.horizontal.3"
                )
            }
        }
    }

    // MARK: Helpers

    private func colorTile(color: Color, name: String) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(color.opacity(0.35))
            .frame(height: 60)
            .overlay(
                Text(name)
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundStyle(color)
            )
    }

    private func colorCell(_ i: Int) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(gridColors[i % gridColors.count].opacity(0.3))
            .frame(height: 44)
            .overlay(Text("\(i + 1)").font(.caption).foregroundStyle(gridColors[i % gridColors.count]))
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

#Preview {
    LazyGridPage()
        .frame(width: 1000, height: 1100)
}
