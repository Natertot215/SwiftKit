import SwiftUI

// SwiftUI `View/containerRelativeFrame(_:count:span:spacing:alignment:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:count:span:spacing:alignment:).md
// macOS 14.0+. Grid-style sizing — divide a container into `count` slots, claim `span` of them.

struct ContainerRelativeFrameGridPage: View {
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
            Text("View/containerRelativeFrame(_:count:span:spacing:alignment:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Sizes a view as a fraction of the nearest container's length: divide the container into `count` equal slots minus the inter-slot spacing, then take `span` adjacent slots. Standard pattern for a horizontal carousel that shows N slides at once.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/containerrelativeframe(_:count:span:spacing:alignment:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".containerRelativeFrame(.horizontal, count: 4, span: 1, spacing: 10)")
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<6) { i in
                        Rectangle()
                            .fill(.tint.opacity(0.25))
                            .aspectRatio(3.0 / 2.0, contentMode: .fit)
                            .containerRelativeFrame(.horizontal, count: 4, span: 1, spacing: 10)
                            .overlay(Text("#\(i + 1)").foregroundStyle(.tint).fontWeight(.semibold))
                    }
                }
            }
            .frame(height: 130)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("Container width is split into 4 columns; each card claims 1 column. Four cards visible at a time.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("span > 1 \u{2014} wide tiles").font(.headline).foregroundStyle(.primary)
                APICallout(".containerRelativeFrame(.horizontal, count: 4, span: 3, spacing: 10)")
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(0..<4) { i in
                            Rectangle()
                                .fill(.tint.opacity(0.25))
                                .aspectRatio(3.0 / 2.0, contentMode: .fit)
                                .containerRelativeFrame(.horizontal, count: 4, span: 3, spacing: 10)
                                .overlay(Text("Wide tile \(i + 1)").foregroundStyle(.tint))
                        }
                    }
                }
                .frame(height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                Text("Each card spans 3 of 4 columns \u{2014} ~75% of container width.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Single-card paged layout").font(.headline).foregroundStyle(.primary)
                APICallout(".containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)")
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<3) { i in
                            Rectangle()
                                .fill(Color.accentColor.opacity(0.18 + Double(i) * 0.18))
                                .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)
                                .overlay(Text("Page \(i + 1)").foregroundStyle(.white).fontWeight(.semibold))
                        }
                    }
                }
                .frame(height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                Text("count=1, span=1 produces a one-page-at-a-time layout equivalent to .containerRelativeFrame(.horizontal).")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Sizing formula").font(.headline).foregroundStyle(.primary)
            APICallout("availableWidth = containerWidth - (spacing * (count - 1))\ncolumnWidth   = availableWidth / count\nitemWidth     = (columnWidth * span) + ((span - 1) * spacing)")
            Text("count divides the container into equal columns minus inter-column spacing; span chooses how many of those columns the wrapped view occupies (and adds the spacing back between spanned columns).")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Pair this modifier with an outer .safeAreaPadding(.horizontal, ...) when you want gutters around the carousel without affecting the slot math.", systemImage: "rectangle.compress.vertical")
                .font(.callout).foregroundStyle(.secondary)
            Label("aspectRatio(_:contentMode:) before containerRelativeFrame keeps the cross-axis controlled by ratio while the main axis follows container math.", systemImage: "rectangle.split.2x2")
                .font(.callout).foregroundStyle(.secondary)
            Label("Same axis-set semantics as the other containerRelativeFrame overloads: pass .horizontal, .vertical, or both.", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContainerRelativeFrameGridPage().frame(width: 900, height: 800)
}
