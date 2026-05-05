import SwiftUI

// SwiftUI `View/containerRelativeFrame(_:alignment:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:).md
// macOS 14.0+. Sizes a view to the nearest container in the given axes.

struct ContainerRelativeFrameAxesPage: View {
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
            Text("View/containerRelativeFrame(_:alignment:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Positions this view inside an invisible frame whose size is relative to the nearest container \u{2014} the window, a NavigationSplitView column, a TabView tab, or a scroll view. The size is the container's size minus its safe-area insets.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:alignment:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".containerRelativeFrame([.horizontal, .vertical])")
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<3) { i in
                        Rectangle()
                            .fill(Color.accentColor.opacity(Double(i + 1) * 0.18 + 0.18))
                            .containerRelativeFrame([.horizontal, .vertical])
                            .overlay(Text("Page \(i + 1)").foregroundStyle(.white).fontWeight(.semibold))
                    }
                }
            }
            .frame(height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("Each rectangle fills the ScrollView's full container size on both axes \u{2014} a paged layout pattern.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Horizontal-only").font(.headline).foregroundStyle(.primary)
                APICallout(".containerRelativeFrame(.horizontal)")
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<3) { i in
                            Rectangle()
                                .fill(.tint.opacity(0.25))
                                .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                .containerRelativeFrame(.horizontal)
                                .overlay(Text("Slide \(i + 1)").foregroundStyle(.tint))
                        }
                    }
                }
                .frame(height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                Text("Width tracks the container; height comes from .aspectRatio.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("alignment parameter").font(.headline).foregroundStyle(.primary)
                APICallout(".containerRelativeFrame(.horizontal, alignment: .leading)")
                Text("alignment positions the wrapped child INSIDE the container-sized frame \u{2014} useful when the child is smaller than the proposed container dimensions.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Defaults").font(.headline).foregroundStyle(.primary)
            APICallout(".containerRelativeFrame(.horizontal)  // alignment defaults to .center")
            Text("Alignment defaults to .center \u{2014} the modifier centers the wrapped child within the resolved container frame.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("'Container' = the nearest enclosing scrollable view, NavigationSplitView column, TabView tab, NavigationStack, or the window/screen.", systemImage: "rectangle.3.group")
                .font(.callout).foregroundStyle(.secondary)
            Label("The reported size subtracts safe-area insets, so it matches the visible content area, not the raw window dimensions.", systemImage: "rectangle.inset.filled")
                .font(.callout).foregroundStyle(.secondary)
            Label("Reach for the closure overload (containerRelativeFrame(_:alignment:_:)) when you need a derived size; reach for the count/span overload for grid-style sizing.", systemImage: "function")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContainerRelativeFrameAxesPage().frame(width: 900, height: 800)
}
