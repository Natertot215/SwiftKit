import SwiftUI

// SwiftUI `View/contentMargins(_:_:for:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/contentmargins(_:_:for:).md
// macOS 14.0+. Edge.Set + amount + placement.

struct ContentMarginsEdgesForPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/contentMargins(_:_:for:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Configures content margins for a particular ContentMarginPlacement, restricted to the edges in an Edge.Set.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/contentmargins(_:_:for:).md \u{00b7} macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".contentMargins(.horizontal, 24, for: .scrollContent)")
                Text("Horizontal-only margin \u{2014} content sits 24pt in from leading and trailing, top and bottom unchanged.")
                    .font(.callout).foregroundStyle(.secondary)
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<6) { i in
                            Text("Row \(i + 1)")
                                .font(.callout).foregroundStyle(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(8)
                                .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }
                .contentMargins(.horizontal, 24, for: .scrollContent)
                .frame(height: 200)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(".vertical only").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins(.vertical, 16, for: .scrollContent)")
                    Text("Top + bottom margins, leaving leading/trailing flush with the container edge.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Single edge").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins(.top, 32, for: .scrollContent)")
                    Text("Useful for keeping the first row clear of overlapping toolbar chrome.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Combined Edge.Set").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins([.top, .bottom], 12, for: .scrollIndicators)")
                    Text("Edge.Set is an OptionSet \u{2014} array literal syntax combines edges.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Different placements").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins(.horizontal, 24, for: .scrollContent)\n.contentMargins(.horizontal,  4, for: .scrollIndicators)")
                    Text("Stack two calls to inset content and indicators by different amounts on the same edges.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Optional length parameter").font(.headline).foregroundStyle(.primary)
                APICallout(".contentMargins(.horizontal, nil, for: .scrollContent)  //  platform default")
                Text("Pass nil to use the system-default amount for the platform on those edges.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Edge.Set: .top / .bottom / .leading / .trailing / .horizontal / .vertical / .all.", systemImage: "rectangle.split.2x1")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Honors layout direction \u{2014} .leading / .trailing flip in right-to-left locales.", systemImage: "arrow.left.arrow.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Multiple contentMargins calls with different placements stack \u{2014} they don't override each other.", systemImage: "square.stack")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ContentMarginsEdgesForPage().frame(width: 900, height: 900)
}
