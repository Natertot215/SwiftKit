import SwiftUI

// SwiftUI LazyVGrid, LazyHGrid, GridItem reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/lazyvgrid.md
// macOS 11.0+

private let colors: [Color] = [.red, .orange, .yellow, .green, .teal, .blue, .indigo, .purple, .pink]
private let colorNames = ["Red", "Orange", "Yellow", "Green", "Teal", "Blue", "Indigo", "Purple", "Pink"]

struct LazyGridPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("LazyVGrid / LazyHGrid / GridItem")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Lazy grid containers that create items on demand. GridItem describes each column (LazyVGrid) or row (LazyHGrid).")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/lazyvgrid.md · macOS 11.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) { … }")
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 12)], spacing: 12) {
                        ForEach(Array(zip(colors, colorNames)), id: \.1) { color, name in
                            RoundedRectangle(cornerRadius: 8)
                                .fill(color.opacity(0.35))
                                .frame(height: 60)
                                .overlay(
                                    Text(name)
                                        .font(.caption2).fontWeight(.medium)
                                        .foregroundStyle(color)
                                )
                        }
                    }
                    .padding(8)
                }
                .frame(height: 180)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("GridItem(.fixed)").font(.headline).foregroundStyle(.primary)
                    APICallout("columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))]")
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))
                        ], spacing: 8) {
                            ForEach(0..<9) { i in
                                colorCell(i)
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 140)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("GridItem(.flexible)").font(.headline).foregroundStyle(.primary)
                    APICallout("columns: [GridItem(.flexible()), GridItem(.flexible())]")
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                            ForEach(0..<6) { i in
                                colorCell(i)
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 120)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("LazyHGrid").font(.headline).foregroundStyle(.primary)
                    APICallout("LazyHGrid(rows: [GridItem(.fixed(60))]) { … }")
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.fixed(60))], spacing: 8) {
                            ForEach(Array(zip(colors, colorNames)), id: \.1) { color, name in
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(color.opacity(0.35))
                                    .frame(width: 80)
                                    .overlay(
                                        Text(name).font(.caption2).foregroundStyle(color)
                                    )
                            }
                        }
                        .padding(8)
                    }
                    .frame(height: 80)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("GridItem spacing parameter").font(.headline).foregroundStyle(.primary)
                APICallout("GridItem(.adaptive(minimum: 60), spacing: 4)")
                Text("The spacing parameter on GridItem controls the gap between columns (LazyVGrid) or rows (LazyHGrid). The grid's own spacing parameter controls inter-item gaps on the scroll axis.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label(".adaptive fills as many items as fit at the minimum size — responsive by default.", systemImage: "square.grid.3x3.fill")
                    .font(.callout).foregroundStyle(.secondary)
                Label(".flexible divides space equally among columns; .fixed pins the column width.", systemImage: "slider.horizontal.3")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Lazy grids only render visible cells — use them for large dynamic data sets.", systemImage: "bolt.fill")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func colorCell(_ i: Int) -> some View {
        let color = colors[i % colors.count]
        return RoundedRectangle(cornerRadius: 8)
            .fill(color.opacity(0.3))
            .frame(height: 50)
            .overlay(Text("\(i + 1)").font(.caption).foregroundStyle(color))
    }
}

#Preview {
    LazyGridPage().frame(width: 900, height: 900)
}
