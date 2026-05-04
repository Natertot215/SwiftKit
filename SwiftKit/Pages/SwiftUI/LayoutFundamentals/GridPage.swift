import SwiftUI

// SwiftUI Grid, GridRow reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/grid.md
// macOS 13.0+

struct GridPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("Grid / GridRow")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("A container that arranges child views in a two-dimensional grid of rows and columns, automatically aligning cells across rows.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/grid.md · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("Grid { GridRow { … } }")
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
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("gridCellColumns — span multiple columns").font(.headline).foregroundStyle(.primary)
                    APICallout(".gridCellColumns(2)")
                    Grid(horizontalSpacing: 8, verticalSpacing: 8) {
                        GridRow {
                            cell("A").gridCellColumns(2)
                            cell("B")
                        }
                        GridRow {
                            cell("C")
                            cell("D")
                            cell("E")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("gridCellAnchor — per-cell alignment").font(.headline).foregroundStyle(.primary)
                    APICallout(".gridCellAnchor(.topLeading)")
                    Grid(horizontalSpacing: 12, verticalSpacing: 12) {
                        GridRow {
                            cell("topLeading").gridCellAnchor(.topLeading)
                                .frame(width: 100, height: 60)
                            cell("center").gridCellAnchor(.center)
                                .frame(width: 100, height: 60)
                            cell("bottomTrailing").gridCellAnchor(.bottomTrailing)
                                .frame(width: 100, height: 60)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("gridColumnAlignment — align a whole column").font(.headline).foregroundStyle(.primary)
                    APICallout(".gridColumnAlignment(.trailing)")
                    Grid(horizontalSpacing: 16, verticalSpacing: 6) {
                        GridRow {
                            Text("Label").gridColumnAlignment(.trailing).foregroundStyle(.secondary)
                            Text("Value").gridColumnAlignment(.leading).foregroundStyle(.primary)
                        }
                        GridRow {
                            Text("Width")
                            Text("1440 px")
                        }
                        GridRow {
                            Text("Height")
                            Text("900 px")
                        }
                    }
                    .font(.callout)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("gridCellUnsizedAxes — allow a view to not size the column/row").font(.callout).foregroundStyle(.secondary)
                APICallout("Divider().gridCellUnsizedAxes(.horizontal)")
                Text("Dividers passed gridCellUnsizedAxes(.horizontal) span the full grid width without contributing to column sizing — used as full-width row dividers inside Grid.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Grid aligns columns across all rows automatically — unlike LazyVGrid.", systemImage: "tablecells")
                    .font(.callout).foregroundStyle(.secondary)
                Label("GridRow children map 1:1 to columns. The grid infers the column count from the widest GridRow.", systemImage: "square.grid.3x3")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Use Grid for fixed small grids; LazyVGrid for large or dynamic data.", systemImage: "bolt")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func headerCell(_ text: String) -> some View {
        Text(text)
            .font(.caption).fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func statusBadge(_ text: String, color: Color) -> some View {
        Text(text)
            .font(.caption2).fontWeight(.medium)
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
}

#Preview {
    GridPage().frame(width: 900, height: 800)
}
