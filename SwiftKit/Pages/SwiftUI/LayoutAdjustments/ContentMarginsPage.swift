import SwiftUI

// SwiftUI contentMargins, containerRelativeFrame, Edge/EdgeInsets,
// LayoutDirection, LayoutDirectionBehavior, UserInterfaceSizeClass reference page.
// macOS 13.0+

struct ContentMarginsPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("contentMargins / containerRelativeFrame / Edge")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Modifiers that set content margins, size relative to container geometry, and control layout direction behavior.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/ · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("contentMargins(_:for:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".contentMargins(24, for: .scrollContent)")
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(["Alpha", "Beta", "Gamma", "Delta"], id: \.self) { item in
                                Text(item)
                                    .font(.callout).foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(8)
                                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                            }
                        }
                    }
                    .contentMargins(24, for: .scrollContent)
                    .frame(height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                    Text("24pt margin insets the scroll content from all edges")
                        .font(.caption).foregroundStyle(.tertiary)
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("containerRelativeFrame(_:alignment:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".containerRelativeFrame(.horizontal)")
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(["Card A", "Card B", "Card C"], id: \.self) { card in
                                Text(card)
                                    .frame(maxWidth: .infinity)
                                    .containerRelativeFrame(.horizontal, count: 2, span: 1, spacing: 12)
                                    .padding()
                                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 10))
                                    .foregroundStyle(.tint)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 80)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Edge / EdgeInsets").font(.headline).foregroundStyle(.primary)
                    APICallout("Edge.top  //  Edge.bottom  //  Edge.leading  //  Edge.trailing")
                    Text("Edge is a four-case enum. EdgeInsets wraps top/leading/bottom/trailing CGFloat values. HorizontalEdge and VerticalEdge are two-case subsets.")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout("EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("LayoutDirection / LayoutDirectionBehavior").font(.headline).foregroundStyle(.primary)
                    APICallout("@Environment(\\.layoutDirection) var dir")
                    Text("LayoutDirection: .leftToRight / .rightToLeft — reflects system locale. LayoutDirectionBehavior controls whether a modifier mirrors: .mirrors, .fixed.")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout(".layoutDirectionBehavior(.mirrors)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ContentMarginPlacement").font(.headline).foregroundStyle(.primary)
                    APICallout(".scrollContent  //  .scrollIndicators  //  .automatic")
                    Text("Selects which part of a scroll container receives the margins — the content, the indicators, or let SwiftUI decide.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("UserInterfaceSizeClass").font(.headline).foregroundStyle(.primary)
                    APICallout("@Environment(\\.horizontalSizeClass) var hsc  // .compact or .regular")
                    Text("UserInterfaceSizeClass: .compact / .regular. On macOS, horizontalSizeClass is always .regular. On iOS, it changes with split view.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("containerRelativeFrame count:span: grid usage").font(.headline).foregroundStyle(.primary)
                APICallout(".containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 8)")
                Text("count specifies the number of columns; span is how many this view occupies. Equivalent to a CSS grid fraction.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("contentMargins applies to the scroll container's content area, not the outer frame.", systemImage: "arrow.up.backward.and.arrow.down.forward")
                    .font(.callout).foregroundStyle(.secondary)
                Label("HorizontalEdge: .leading / .trailing. VerticalEdge: .top / .bottom.", systemImage: "square.split.2x1")
                    .font(.callout).foregroundStyle(.secondary)
                Label("UserInterfaceSizeClass is always .regular on macOS — use it for cross-platform conditional layout.", systemImage: "macbook.and.iphone")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ContentMarginsPage().frame(width: 900, height: 900)
}
