import SwiftUI

// SwiftUI `View/safeAreaPadding(_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/safeareapadding(_:).md
// macOS 14.0+. EdgeInsets variant — adds padding to the safe area on each edge.

struct SafeAreaPaddingPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/safeAreaPadding(_:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Adds the supplied EdgeInsets to the safe area, so descendant views' safe-area-aware layouts inset by that additional amount.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/safeareapadding(_:).md \u{00b7} macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".safeAreaPadding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))")
                Text("Adds 24pt of leading safe-area padding \u{2014} a ScrollView inside this view will start its content 24pt further from the leading edge.")
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
                .safeAreaPadding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                .frame(height: 180)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Asymmetric vertical").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))")
                    Text("Insets the safe area heavier at the bottom \u{2014} useful when overlay chrome takes more space at the bottom edge.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("All-edge padding").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))")
                    Text("Equivalent to inset on every edge \u{2014} use .safeAreaPadding(8) (the CGFloat overload from .safeAreaPadding(_:_:)) for the same effect with a single literal.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("vs. View/padding").font(.headline).foregroundStyle(.primary)
                APICallout(".padding(20)  // outer frame inset")
                APICallout(".safeAreaPadding(20)  // safe area inset, layout-aware")
                Text("padding shrinks the view's frame; safeAreaPadding leaves the frame alone but tells descendants their safe area is smaller \u{2014} so a ScrollView still scrolls full-width while content stays inset.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("EdgeInsets are added to whatever safe area the system already provides \u{2014} they don't replace it.", systemImage: "plus.rectangle")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Honors layout direction \u{2014} EdgeInsets.leading and .trailing flip in right-to-left locales.", systemImage: "arrow.left.arrow.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("For per-edge insets via Edge.Set + amount, use the View/safeAreaPadding(_:_:) overload.", systemImage: "rectangle.split.2x1")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SafeAreaPaddingPage().frame(width: 900, height: 800)
}
