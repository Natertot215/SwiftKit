import SwiftUI

// SwiftUI `View/offset(_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/offset(_:).md
// macOS 10.15+. CGSize variant.

struct OffsetSizePage: View {
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
            Text("View/offset(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Offsets a view's rendering by the horizontal and vertical amounts in a CGSize. The view's layout slot is unaffected \u{2014} only the rendered bitmap moves; siblings stay where they are.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/offset(_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".offset(CGSize(width: 30, height: -10))")
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(.separator, lineWidth: 1, antialiased: true)
                    .frame(width: 160, height: 50)
                    .overlay(Text("Layout slot").font(.caption).foregroundStyle(.tertiary))
                RoundedRectangle(cornerRadius: 6)
                    .fill(.tint.opacity(0.35))
                    .frame(width: 160, height: 50)
                    .offset(CGSize(width: 30, height: -10))
                    .overlay(
                        Text("Rendered offset")
                            .font(.caption).foregroundStyle(.white).fontWeight(.semibold)
                            .offset(CGSize(width: 30, height: -10))
                    )
            }
            .frame(height: 80)
            .padding(8)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("The strokes mark the original layout slot; the filled rectangle is the offset rendering.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Stored CGSize").font(.headline).foregroundStyle(.primary)
                APICallout("let nudge = CGSize(width: 12, height: -6)\n.offset(nudge)")
                Text("Common pattern: store the offset in @State and animate to a new value with withAnimation.")
                    .font(.callout).foregroundStyle(.secondary)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Negative width / height").font(.headline).foregroundStyle(.primary)
                APICallout(".offset(CGSize(width: -20, height: 0))")
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(.tint.opacity(0.3))
                        .frame(width: 80, height: 30)
                        .offset(CGSize(width: -20, height: 0))
                        .overlay(Text("\u{2190} 20").font(.caption).foregroundStyle(.tint))
                    Rectangle()
                        .fill(.green.opacity(0.25))
                        .frame(width: 80, height: 30)
                        .overlay(Text("Sibling unmoved").font(.caption).foregroundStyle(.green))
                }
                .padding(8)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                Text("The left rectangle's rendering shifts -20 horizontally; the right sibling does not reflow.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Difference vs offset(x:y:)").font(.headline).foregroundStyle(.primary)
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 6) {
                GridRow {
                    Text("modifier").font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                    Text("input").font(.caption).fontWeight(.semibold).foregroundStyle(.secondary)
                }
                Divider().gridCellUnsizedAxes(.horizontal)
                GridRow {
                    APICallout(".offset(_:)")
                    Text("CGSize value \u{2014} use when you have a stored size or are computing one.").font(.caption).foregroundStyle(.secondary)
                }
                GridRow {
                    APICallout(".offset(x:y:)")
                    Text("Inline scalars \u{2014} convenient when authoring without a stored value.").font(.caption).foregroundStyle(.secondary)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("offset is purely visual \u{2014} sibling layout doesn't reflow when you offset a view.", systemImage: "eye")
                .font(.callout).foregroundStyle(.secondary)
            Label("Combine offset with .animation or withAnimation for the standard slide-in / slide-out motion.", systemImage: "wand.and.stars")
                .font(.callout).foregroundStyle(.secondary)
            Label("If you need to ACTUALLY move a view inside its parent's layout (so siblings reflow), reach for padding or the parent's alignment instead.", systemImage: "rectangle.compress.vertical")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    OffsetSizePage().frame(width: 900, height: 800)
}
