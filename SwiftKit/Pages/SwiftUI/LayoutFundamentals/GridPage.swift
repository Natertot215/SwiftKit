import SwiftUI

// Dense Grid reference page. Consolidates seven previously-separate leaves:
//   • Grid                                                              (struct)
//   • GridRow                                                           (struct)
//   • GridItem                                                          (struct)
//   • View/gridCellColumns(_:)                                          (modifier)
//   • View/gridCellAnchor(_:)                                           (modifier)
//   • View/gridCellUnsizedAxes(_:)                                      (modifier)
//   • View/gridColumnAlignment(_:)                                      (modifier)
//
// Source docs:
//   Documentation/SwiftUI/layout-fundamentals/grid.md
//   Documentation/SwiftUI/layout-fundamentals/gridrow.md
//   Documentation/SwiftUI/layout-fundamentals/griditem.md
//   macOS 13.0+ (Grid/GridRow); macOS 11.0+ (GridItem); macOS 13.0+ (modifiers)

struct GridPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                gridSection
                gridRowSection
                gridItemSection
                gridCellColumnsSection
                gridCellAnchorSection
                gridCellUnsizedAxesSection
                gridColumnAlignmentSection
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
            Text("Grid")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A two-dimensional grid that arranges views in rows and columns, automatically aligning cells across rows. Grid is eager — all cells are created on layout. Use LazyVGrid/LazyHGrid for large data sets.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-fundamentals/grid.md \u{00b7} Grid/GridRow: macOS 13.0+  \u{00b7}  GridItem: macOS 11.0+  \u{00b7}  gridCell* modifiers: macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Grid  \u{00b7}  GridRow  \u{00b7}  GridItem  \u{00b7}  .gridCellColumns(_:)  \u{00b7}  .gridCellAnchor(_:)  \u{00b7}  .gridCellUnsizedAxes(_:)  \u{00b7}  .gridColumnAlignment(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Grid

    private var gridSection: some View {
        PageSection("Grid", subtitle: "struct Grid<Content: View> \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A container that arranges its GridRow children in a two-dimensional grid. Columns are automatically sized to fit their widest cell; rows are sized to the tallest cell. Both horizontal and vertical spacing are configurable.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("Grid(alignment: .center, horizontalSpacing: 12, verticalSpacing: 8) { \u{2026} }")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Three-column table — header row + data rows + full-width divider")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Grid(alignment: .center, horizontalSpacing: 12, verticalSpacing: 8) {
                        GridRow {
                            headerCell("Name")
                            headerCell("Role")
                            headerCell("Status")
                        }
                        Divider().gridCellUnsizedAxes(.horizontal)
                        GridRow {
                            Text("Alice").foregroundStyle(.primary)
                            Text("Designer").foregroundStyle(.secondary)
                            statusBadge("Active", color: .green)
                        }
                        GridRow {
                            Text("Bob").foregroundStyle(.primary)
                            Text("Engineer").foregroundStyle(.secondary)
                            statusBadge("Away", color: .orange)
                        }
                        GridRow {
                            Text("Carol").foregroundStyle(.primary)
                            Text("PM").foregroundStyle(.secondary)
                            statusBadge("Offline", color: .gray)
                        }
                    }
                    .font(.callout)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("Grid { GridRow { headerCell; \u{2026} }; Divider().gridCellUnsizedAxes(.horizontal); GridRow { \u{2026} } }")
                }

                noteRow(
                    title: "Grid determines column count from the widest GridRow.",
                    detail: "Rows with fewer cells are padded. Non-GridRow children (like Divider) span the full width when combined with .gridCellUnsizedAxes(.horizontal).",
                    symbol: "tablecells"
                )
            }
        }
    }

    // MARK: GridRow

    private var gridRowSection: some View {
        PageSection("GridRow", subtitle: "struct GridRow<Content: View> \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Places its children into consecutive columns within a Grid. Each child occupies exactly one cell unless .gridCellColumns(_:) is applied to span multiple columns.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("GridRow { CellA(); CellB(); CellC() }")
                APICallout("GridRow(alignment: .top) { \u{2026} }   // per-row vertical alignment override")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Row with per-row alignment override")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Grid(horizontalSpacing: 12, verticalSpacing: 8) {
                        GridRow(alignment: .top) {
                            Text("Top-aligned\ncell with two lines")
                                .font(.caption)
                                .foregroundStyle(.primary)
                                .padding(6)
                                .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 4))
                            Text("Also top")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .padding(6)
                                .background(.fill.secondary, in: RoundedRectangle(cornerRadius: 4))
                        }
                        GridRow(alignment: .bottom) {
                            Text("Bottom\naligned")
                                .font(.caption)
                                .foregroundStyle(.primary)
                                .padding(6)
                                .background(.tint.opacity(0.12), in: RoundedRectangle(cornerRadius: 4))
                            Text("Also bottom")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .padding(6)
                                .background(.tint.opacity(0.12), in: RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(8)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("GridRow(alignment: .top) { \u{2026} }  //  GridRow(alignment: .bottom) { \u{2026} }")
                }
            }
        }
    }

    // MARK: GridItem

    private var gridItemSection: some View {
        PageSection("GridItem", subtitle: "struct GridItem \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Describes a column (LazyVGrid) or row (LazyHGrid). Three sizing modes: .flexible divides space equally; .fixed pins the size; .adaptive fills as many items as fit at a minimum size.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("GridItem(.flexible())                 // equal share of available space")
                    APICallout("GridItem(.flexible(minimum: 60, maximum: 200))  // bounded flexible")
                    APICallout("GridItem(.fixed(80))                  // exact size")
                    APICallout("GridItem(.adaptive(minimum: 80))      // as many as fit at 80pt min")
                    APICallout("GridItem(.flexible(), spacing: 12)    // inter-item spacing")
                    APICallout("GridItem(.flexible(), alignment: .leading)  // per-column alignment")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".flexible — three equal columns")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                        ForEach(0..<6) { i in colorCell(i) }
                    }
                    APICallout("columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".fixed — three 80pt columns")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    LazyVGrid(columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))], spacing: 8) {
                        ForEach(0..<6) { i in colorCell(i) }
                    }
                    APICallout("columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".adaptive — fills available width")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 8)], spacing: 8) {
                        ForEach(0..<9) { i in colorCell(i) }
                    }
                    APICallout("columns: [GridItem(.adaptive(minimum: 80))]")
                }

                noteRow(
                    title: ".adaptive is the go-to for responsive grids.",
                    detail: "The grid packs as many columns as fit at the minimum width, resizing them equally to fill the container. Resize the window and the column count adjusts automatically.",
                    symbol: "square.grid.3x3.fill"
                )
            }
        }
    }

    // MARK: gridCellColumns

    private var gridCellColumnsSection: some View {
        PageSection("View/gridCellColumns(_:)", subtitle: "func gridCellColumns(_ count: Int) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Makes a cell span the specified number of columns within its GridRow. The cell's column width is the combined width of all spanned columns plus their inter-column spacing.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(".gridCellColumns(2)  // span two columns")

                VStack(alignment: .leading, spacing: 8) {
                    Text("First cell spans 2 columns; remaining cells occupy 1 each")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Grid(horizontalSpacing: 8, verticalSpacing: 8) {
                        GridRow {
                            cell("Spanning A (col 1\u{2013}2)")
                                .gridCellColumns(2)
                            cell("B")
                        }
                        GridRow {
                            cell("C")
                            cell("D")
                            cell("E")
                        }
                    }
                    .padding(8)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("cell(\"A\").gridCellColumns(2)")
                }

                noteRow(
                    title: "gridCellColumns only applies inside a Grid / GridRow.",
                    detail: "It has no effect outside a Grid container. The grid uses the widest row to determine total column count.",
                    symbol: "tablecells"
                )
            }
        }
    }

    // MARK: gridCellAnchor

    private var gridCellAnchorSection: some View {
        PageSection("View/gridCellAnchor(_:)", subtitle: "func gridCellAnchor(_ anchor: UnitPoint) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Overrides the alignment anchor of a single cell. The cell is positioned within its column/row slot according to the UnitPoint. Overrides the Grid's default alignment and the GridRow's per-row alignment for this cell only.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(".gridCellAnchor(.topLeading)   // pin to top-leading corner of the cell slot")
                APICallout(".gridCellAnchor(.center)       // center within cell slot (default)")
                APICallout(".gridCellAnchor(.bottomTrailing)")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Three cells with different anchor points in same-height slots")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                        GridRow {
                            cell("topLeading")
                                .frame(width: 110, height: 60)
                                .gridCellAnchor(.topLeading)
                            cell("center")
                                .frame(width: 110, height: 60)
                                .gridCellAnchor(.center)
                            cell("bottomTrailing")
                                .frame(width: 110, height: 60)
                                .gridCellAnchor(.bottomTrailing)
                        }
                    }
                    .padding(8)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout(".gridCellAnchor(.topLeading / .center / .bottomTrailing)")
                }
            }
        }
    }

    // MARK: gridCellUnsizedAxes

    private var gridCellUnsizedAxesSection: some View {
        PageSection("View/gridCellUnsizedAxes(_:)", subtitle: "func gridCellUnsizedAxes(_ axes: Axis.Set) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Prevents a cell from contributing to column or row sizing on the specified axes. The canonical use is on Divider to let it span the full grid width without influencing column widths.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout("Divider().gridCellUnsizedAxes(.horizontal)  // full-width divider, no column influence")
                APICallout("Divider().gridCellUnsizedAxes(.vertical)    // full-height divider, no row influence")
                APICallout("Divider().gridCellUnsizedAxes([.horizontal, .vertical])")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Full-width divider between header and data rows")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Grid(horizontalSpacing: 12, verticalSpacing: 6) {
                        GridRow {
                            headerCell("Column A")
                            headerCell("Column B")
                        }
                        Divider().gridCellUnsizedAxes(.horizontal)
                        GridRow {
                            Text("Value 1").font(.callout).foregroundStyle(.primary)
                            Text("Value 2").font(.callout).foregroundStyle(.secondary)
                        }
                        GridRow {
                            Text("Value 3").font(.callout).foregroundStyle(.primary)
                            Text("Value 4").font(.callout).foregroundStyle(.secondary)
                        }
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                noteRow(
                    title: "Without gridCellUnsizedAxes, a Divider becomes a column.",
                    detail: "If you place a Divider in a Grid without this modifier, the grid treats it as a regular cell and sizes a column around it, breaking the layout.",
                    symbol: "exclamationmark.triangle"
                )
            }
        }
    }

    // MARK: gridColumnAlignment

    private var gridColumnAlignmentSection: some View {
        PageSection("View/gridColumnAlignment(_:)", subtitle: "func gridColumnAlignment(_ guide: HorizontalAlignment) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets the horizontal alignment for a whole column. Apply to one cell in a column; all cells in that column adopt the alignment. The first application in the column wins if there are conflicting values.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(".gridColumnAlignment(.trailing)  // entire column becomes trailing-aligned")
                APICallout(".gridColumnAlignment(.leading)")

                VStack(alignment: .leading, spacing: 8) {
                    Text("Label column trailing-aligned, value column leading-aligned")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Grid(horizontalSpacing: 16, verticalSpacing: 6) {
                        GridRow {
                            Text("Label")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .gridColumnAlignment(.trailing)
                            Text("Value")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.secondary)
                                .gridColumnAlignment(.leading)
                        }
                        Divider().gridCellUnsizedAxes(.horizontal)
                        GridRow {
                            Text("Width").foregroundStyle(.secondary)
                            Text("1440 px").foregroundStyle(.primary)
                        }
                        GridRow {
                            Text("Height").foregroundStyle(.secondary)
                            Text("900 px").foregroundStyle(.primary)
                        }
                        GridRow {
                            Text("Color space").foregroundStyle(.secondary)
                            Text("Display P3").foregroundStyle(.primary)
                        }
                    }
                    .font(.callout)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    APICallout("labelCell.gridColumnAlignment(.trailing)  //  valueCell.gridColumnAlignment(.leading)")
                }

                noteRow(
                    title: "gridColumnAlignment is column-scoped — apply once per column.",
                    detail: "You don't need to apply it to every cell. One application on any cell in the column sets the alignment for all cells in that column.",
                    symbol: "arrow.left.and.right"
                )
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 14) {
                noteRow(
                    title: "Grid vs LazyVGrid/LazyHGrid.",
                    detail: "Grid aligns columns across all rows automatically and is ideal for small, fixed tables. LazyVGrid/LazyHGrid are better for large or dynamic collections where lazy evaluation matters more than cross-row column alignment.",
                    symbol: "tablecells"
                )
                noteRow(
                    title: "Grid is eager — all cells are created on layout.",
                    detail: "Do not use Grid for large data sets. The column-alignment guarantee requires measuring all cells in each column on first layout. For 100+ items, use LazyVGrid.",
                    symbol: "bolt"
                )
                noteRow(
                    title: "GridItem is shared between Grid modifiers and LazyVGrid/LazyHGrid.",
                    detail: "GridItem describes column/row sizing for the lazy grids, not for Grid itself. Grid infers its column count from its widest GridRow.",
                    symbol: "info.circle"
                )
            }
        }
    }

    // MARK: Helpers

    private func headerCell(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func statusBadge(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.caption2)
            .fontWeight(.medium)
            .padding(.horizontal, 6).padding(.vertical, 2)
            .background(color.opacity(0.2), in: Capsule())
            .foregroundStyle(color)
    }

    private func cell(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .frame(maxWidth: .infinity)
            .padding(6)
            .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 4))
            .foregroundStyle(.secondary)
    }

    private func colorCell(_ i: Int) -> some View {
        let colors: [Color] = [.red, .orange, .yellow, .green, .teal, .blue, .indigo, .purple, .pink]
        return RoundedRectangle(cornerRadius: 8)
            .fill(colors[i % colors.count].opacity(0.3))
            .frame(height: 44)
            .overlay(Text("\(i + 1)").font(.caption).foregroundStyle(colors[i % colors.count]))
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
    GridPage()
        .frame(width: 1000, height: 1200)
}
