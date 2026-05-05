import SwiftUI

// SwiftUI `View/scenePadding(_:edges:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/scenepadding(_:edges:).md
// macOS 13.0+. Takes a ScenePadding kind plus an Edge.Set.

struct ScenePaddingKindEdgesPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/scenePadding(_:edges:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds a specified kind of scene padding (minimum or navigationBar) to the specified edges, with an amount appropriate for the current scene.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/scenepadding(_:edges:).md \u{00b7} macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".scenePadding(.minimum, edges: .horizontal)")
            Text("Minimum scene padding on horizontal edges.")
                .scenePadding(.minimum, edges: .horizontal)
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("ScenePadding kinds").font(.headline).foregroundStyle(.primary)
                VStack(alignment: .leading, spacing: 8) {
                    APICallout(".scenePadding(.minimum, edges: .all)")
                    Text("Minimum on all edges")
                        .scenePadding(.minimum, edges: .all)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))

                    APICallout(".scenePadding(.navigationBar, edges: .horizontal)  // unavailable on macOS")
                    Label("ScenePadding.navigationBar is marked unavailable on macOS \u{2014} it's a watchOS-targeted kind that aligns watch-face content with the navigation title bar. The signature exists, but compile-time use of it on macOS errors.", systemImage: "exclamationmark.triangle")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Edge subsets").font(.headline).foregroundStyle(.primary)
                APICallout(".scenePadding(.minimum, edges: .top)")
                Text("Minimum on top only")
                    .scenePadding(.minimum, edges: .top)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                    .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Default edges \u{2014} .all").font(.headline).foregroundStyle(.primary)
            APICallout(".scenePadding(.minimum)  // edges defaults to .all")
            Text("Minimum scene padding on all edges")
                .scenePadding(.minimum)
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("ScenePadding.minimum is the smallest scene-appropriate amount; .navigationBar aligns content with the navigation chrome above it.", systemImage: "arrow.up.and.line.horizontal.and.arrow.down")
                .font(.callout).foregroundStyle(.secondary)
            Label("On non-watchOS platforms scene padding falls back to the platform default \u{2014} the .navigationBar variant is most distinctive on watchOS.", systemImage: "applewatch.watchface")
                .font(.callout).foregroundStyle(.secondary)
            Label("If you only need the default scene amount and don't care about the kind, reach for scenePadding(_:) instead.", systemImage: "arrow.left.circle")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ScenePaddingKindEdgesPage().frame(width: 900, height: 700)
}
