import SwiftUI

// SwiftUI `View/safeAreaPadding(_:_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/safeareapadding(_:_:).md
// macOS 14.0+. Edge.Set + optional CGFloat amount.

struct SafeAreaPaddingEdgesPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/safeAreaPadding(_:_:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Adds an equal amount of safe-area padding to specific edges \u{2014} content inside is placed as if the safe area were larger by that much on the chosen edges.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/safeareapadding(_:_:).md \u{00b7} macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".safeAreaPadding(.horizontal, 24)")
                Text("Horizontal-only safe-area padding \u{2014} the ScrollView still spans full width; rows are inset on leading and trailing.")
                    .font(.callout).foregroundStyle(.secondary)
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<5) { i in
                            Text("Row \(i + 1)")
                                .font(.callout).foregroundStyle(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(8)
                                .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                        }
                    }
                }
                .safeAreaPadding(.horizontal, 24)
                .frame(height: 180)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(".vertical / single edge").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(.vertical, 16)")
                    APICallout(".safeAreaPadding(.top, 24)")
                    APICallout(".safeAreaPadding(.bottom, 32)")
                    Text("Single-axis or single-edge safe-area inset \u{2014} useful for adding breathing room above scroll content without wrapping in safeAreaInset.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Combined Edge.Set").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaPadding([.top, .leading], 16)")
                    Text("Edge.Set is an OptionSet \u{2014} array literal syntax combines edges; .horizontal = [.leading, .trailing], .vertical = [.top, .bottom], .all = all four.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Defaults \u{2014} no length").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(.horizontal)  //  platform default amount")
                    Text("Pass nil (or omit the amount) to use the platform-default safe-area padding \u{2014} matches what View/padding(.horizontal) would supply.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("vs. View/padding").font(.headline).foregroundStyle(.primary)
                APICallout(".padding(.horizontal, 24)  // shrinks frame")
                APICallout(".safeAreaPadding(.horizontal, 24)  // shrinks safe area, frame intact")
                Text("safeAreaPadding leaves the outer frame alone \u{2014} ScrollViews can still extend beneath, but content positions itself inside the inset safe area.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Edge.Set: .top / .bottom / .leading / .trailing / .horizontal / .vertical / .all.", systemImage: "rectangle.split.2x1")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Honors layout direction \u{2014} .leading / .trailing flip in right-to-left locales.", systemImage: "arrow.left.arrow.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("For an EdgeInsets variant with per-edge amounts in one call, use safeAreaPadding(_:) (EdgeInsets overload).", systemImage: "rectangle.dashed")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SafeAreaPaddingEdgesPage().frame(width: 900, height: 900)
}
