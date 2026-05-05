import SwiftUI

// SwiftUI `View/safeAreaInset(edge:alignment:spacing:content:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/safeareainset(edge:alignment:spacing:content:).md
// macOS 12.0+. Adds an overlay that adjusts the safe area for nested content.

struct SafeAreaInsetPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/safeAreaInset(edge:alignment:spacing:content:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Adds a fixed view at the specified edge that contributes to the safe area \u{2014} content beneath it gets inset automatically so it doesn't scroll under the overlay.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/safeareainset(edge:alignment:spacing:content:).md \u{00b7} macOS 12.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".safeAreaInset(edge: .bottom, spacing: 0) { … }")
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(0..<10) { i in
                            Text("Row \(i + 1)")
                                .font(.callout).foregroundStyle(.primary)
                                .padding(.horizontal, 12).padding(.vertical, 8)
                            Divider().padding(.leading, 12)
                        }
                    }
                }
                .safeAreaInset(edge: .bottom, spacing: 0) {
                    Text("Bottom bar \u{2014} content insets above")
                        .font(.caption).fontWeight(.medium).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(.regularMaterial)
                }
                .frame(height: 220)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                .clipped()
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Top edge inset").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaInset(edge: .top) { Header() }")
                    Rectangle().fill(.fill.tertiary)
                        .frame(height: 100)
                        .safeAreaInset(edge: .top) {
                            Text("Header strip")
                                .font(.caption).fontWeight(.medium).foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 6)
                                .background(.tint.opacity(0.2))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Trailing edge with spacing").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaInset(edge: .trailing, spacing: 12) { Sidebar() }")
                    Rectangle().fill(.fill.tertiary)
                        .frame(height: 80)
                        .safeAreaInset(edge: .trailing, spacing: 12) {
                            VStack(spacing: 6) {
                                Image(systemName: "star")
                                Image(systemName: "heart")
                                Image(systemName: "bolt")
                            }
                            .font(.callout)
                            .padding(8)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 6))
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Alignment within the edge stripe").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaInset(edge: .bottom, alignment: .trailing) { … }")
                    Text("alignment is HorizontalAlignment for top/bottom, VerticalAlignment for leading/trailing \u{2014} positions the inset view within the stripe.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("All parameters").font(.headline).foregroundStyle(.primary)
                APICallout(".safeAreaInset(\n    edge: .bottom,\n    alignment: .center,\n    spacing: 8,\n    content: { Text(\"Bar\") }\n)")
                Text("edge: VerticalEdge or HorizontalEdge depending on overload. alignment: optional, defaults to .center. spacing: optional CGFloat between the inset and the underlying content.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("safeAreaInset is the right primitive for persistent toolbars/footer bars over scrollable content \u{2014} ScrollView content insets without manual padding math.", systemImage: "arrow.up.and.down.square")
                    .font(.callout).foregroundStyle(.secondary)
                Label("There are two overloads \u{2014} one for VerticalEdge (.top / .bottom) and one for HorizontalEdge (.leading / .trailing).", systemImage: "rectangle.split.2x1")
                    .font(.callout).foregroundStyle(.secondary)
                Label("The inset view sits OUTSIDE the new safe area; it is not affected by the very inset it creates.", systemImage: "info.circle")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    SafeAreaInsetPage().frame(width: 900, height: 1000)
}
