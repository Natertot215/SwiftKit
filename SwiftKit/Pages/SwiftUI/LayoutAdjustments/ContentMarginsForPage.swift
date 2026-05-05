import SwiftUI

// SwiftUI `View/contentMargins(_:for:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/contentmargins(_:for:).md
// macOS 14.0+. Uniform margin amount applied to a placement.

struct ContentMarginsForPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/contentMargins(_:for:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Configures the content margins for a particular ContentMarginPlacement, applying a uniform amount on all edges.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/contentmargins(_:for:).md \u{00b7} macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".contentMargins(24, for: .scrollContent)")
                Text("A 24-point margin on the scroll content \u{2014} indicators stay flush with the trailing edge.")
                    .font(.callout).foregroundStyle(.secondary)
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<8) { i in
                            Text("Row \(i + 1)")
                                .font(.callout).foregroundStyle(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(8)
                                .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }
                .contentMargins(24, for: .scrollContent)
                .frame(height: 200)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(".scrollContent placement").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins(16, for: .scrollContent)")
                    Text("Insets the scrollable content while leaving scroll indicators at the container edges.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".scrollIndicators placement").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins(8, for: .scrollIndicators)")
                    Text("Pushes the scroll indicators inward without changing where the content sits \u{2014} useful when content runs to the very edge of a chrome-less window.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".automatic placement").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins(20, for: .automatic)")
                    Text("Lets SwiftUI decide which placements receive the margins based on the container.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("CGFloat-only overload").font(.headline).foregroundStyle(.primary)
                APICallout(".contentMargins(.zero, for: .scrollContent)  //  remove margins")
                Text("Use a CGFloat literal \u{2014} EdgeInsets / per-edge values are the contentMargins(_:_:for:) overload.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Applies the same amount to all four edges. For per-edge insets, use the EdgeInsets overload (View/contentMargins(_:_:for:)).", systemImage: "rectangle.dashed")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Pair with .scrollContent to inset content while keeping indicators visually flush with the container.", systemImage: "scroll")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Replaces older patterns of wrapping a ScrollView in .padding \u{2014} this version doesn't shrink the indicator hit area.", systemImage: "arrow.up.and.down")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ContentMarginsForPage().frame(width: 900, height: 800)
}
