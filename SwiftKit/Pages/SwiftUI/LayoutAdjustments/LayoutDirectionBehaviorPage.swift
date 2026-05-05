import SwiftUI

// SwiftUI `View/layoutDirectionBehavior(_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/layoutdirectionbehavior(_:).md
// macOS 14.0+. Controls whether a view mirrors in right-to-left layout direction.

struct LayoutDirectionBehaviorPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("View/layoutDirectionBehavior(_:)")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Controls whether a view mirrors its contents horizontally when the surrounding layout direction changes \u{2014} typically used with shapes and chrome that should/shouldn't flip in right-to-left locales.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/layoutdirectionbehavior(_:).md \u{00b7} macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout(".layoutDirectionBehavior(.mirrors)")
                Text("In an RTL context, a .mirrors view flips its horizontal contents \u{2014} a leading arrow becomes a trailing arrow visually. Demonstrated below in two HStacks set to .rightToLeft.")
                    .font(.callout).foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("LTR layout (default):").font(.caption).foregroundStyle(.secondary)
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.left")
                            Text("Back")
                            Spacer()
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }
                        .padding(8)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    }
                    HStack {
                        Text(".mirrors in RTL:").font(.caption).foregroundStyle(.secondary)
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.left")
                            Text("Back")
                            Spacer()
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }
                        .padding(8)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .layoutDirectionBehavior(.mirrors)
                        .environment(\.layoutDirection, .rightToLeft)
                    }
                    HStack {
                        Text(".fixed in RTL:").font(.caption).foregroundStyle(.secondary)
                        HStack(spacing: 6) {
                            Image(systemName: "arrow.left")
                            Text("Back")
                            Spacer()
                            Text("Next")
                            Image(systemName: "arrow.right")
                        }
                        .padding(8)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                        .layoutDirectionBehavior(.fixed)
                        .environment(\.layoutDirection, .rightToLeft)
                    }
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(".mirrors").font(.headline).foregroundStyle(.primary)
                    APICallout(".layoutDirectionBehavior(.mirrors)")
                    Text("Mirrors content horizontally when the layout direction is right-to-left. Use for visually directional chrome (chevrons, slide affordances) that should flip with locale.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".fixed").font(.headline).foregroundStyle(.primary)
                    APICallout(".layoutDirectionBehavior(.fixed)")
                    Text("Pins horizontal layout to its natural direction regardless of the surrounding locale. Use for content that's intrinsically directional (logos, text in a specific script, video timelines).")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".mirrors(in:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".layoutDirectionBehavior(.mirrors(in: .rightToLeft))")
                    Text("Mirrors only when the layout direction matches the supplied LayoutDirection \u{2014} the parameterized form lets you opt in to mirroring conditionally.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Shape conformance").font(.headline).foregroundStyle(.primary)
                APICallout("Rectangle().layoutDirectionBehavior(.fixed)  //  applies to Shape too")
                Text("LayoutDirectionBehavior is also a Shape property \u{2014} useful for asymmetric custom paths that should never flip with locale.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Default behavior (no modifier) is automatic \u{2014} most SwiftUI views handle RTL correctly without manual intervention.", systemImage: "arrow.left.arrow.right")
                    .font(.callout).foregroundStyle(.secondary)
                Label("To override the layout direction itself for a subtree, use .environment(\\.layoutDirection, .rightToLeft) \u{2014} different concern from layoutDirectionBehavior.", systemImage: "globe")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Reach for .fixed sparingly \u{2014} the framework's default mirroring is correct for most UI; .fixed is for the rare case where mirroring would harm meaning.", systemImage: "exclamationmark.triangle")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    LayoutDirectionBehaviorPage().frame(width: 900, height: 900)
}
