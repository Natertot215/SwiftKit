import SwiftUI

// SwiftUI `View/scenePadding(_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/scenepadding(_:).md
// macOS 12.0+. Edge.Set only — uses the platform-default scene padding amount.

struct ScenePaddingEdgesPage: View {
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
            Text("View/scenePadding(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds padding to the specified edges using an amount appropriate for the current scene. On macOS this matches the recommended window-content margin.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/scenepadding(_:).md \u{00b7} macOS 12.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".scenePadding(.horizontal)")
            Text("Scene padding aligns content with scene metrics.")
                .scenePadding(.horizontal)
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach([
                (".scenePadding(.all)", Edge.Set.all),
                (".scenePadding(.horizontal)", .horizontal),
                (".scenePadding(.vertical)", .vertical),
                (".scenePadding(.top)", .top),
                (".scenePadding(.leading)", .leading)
            ], id: \.0) { label, edges in
                VStack(alignment: .leading, spacing: 4) {
                    APICallout(label)
                    Text("Content")
                        .scenePadding(edges)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))
                }
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Default \u{2014} all edges").font(.headline).foregroundStyle(.primary)
            APICallout(".scenePadding()  // edges parameter defaults to .all")
            Text("All-edge scene padding")
                .scenePadding()
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("On macOS, scenePadding produces the recommended spacing around the root view of a window \u{2014} use it as the outermost padding for window content.", systemImage: "macwindow")
                .font(.callout).foregroundStyle(.secondary)
            Label("On non-macOS platforms scenePadding(_:) generally resolves to the same default amount as padding(_:_:) with no length.", systemImage: "rectangle.compress.vertical")
                .font(.callout).foregroundStyle(.secondary)
            Label("For axis-specific kinds of scene padding (minimum vs navigationBar) reach for scenePadding(_:edges:) instead.", systemImage: "arrow.right.circle")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ScenePaddingEdgesPage().frame(width: 900, height: 700)
}
