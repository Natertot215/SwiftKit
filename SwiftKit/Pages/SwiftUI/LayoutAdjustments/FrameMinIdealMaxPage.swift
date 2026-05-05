import SwiftUI

// SwiftUI `View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)` page.
// Source: Documentation/SwiftUI/layout-adjustments/frame(minwidth:idealwidth:maxwidth:minheight:idealheight:maxheight:alignment:).md
// macOS 10.15+. Flexible frame with min/ideal/max constraints.

struct FrameMinIdealMaxPage: View {
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
            Text("View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Positions a view within an invisible frame whose size is constrained by min, ideal, and max bounds. Any parameter may be nil \u{2014} the unconstrained dimensions follow the wrapped view's natural sizing.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/frame(minwidth:idealwidth:maxwidth:minheight:idealheight:maxheight:alignment:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".frame(maxWidth: .infinity, minHeight: 40)")
            Rectangle()
                .fill(Color.accentColor.opacity(0.2))
                .frame(maxWidth: .infinity, minHeight: 40)
                .overlay(Text("maxWidth: .infinity").font(.caption).foregroundStyle(Color.accentColor))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("min/max bounded text").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(minWidth: 80, maxWidth: 300)")
                Text("Constrained text that stays within an 80-300 width window")
                    .frame(minWidth: 80, maxWidth: 300)
                    .padding(8)
                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Fill horizontal, fixed height").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(maxWidth: .infinity, alignment: .leading)")
                Text("Leading-aligned content fills horizontal space")
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 8))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Both axes flexible").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(maxWidth: .infinity, maxHeight: 120)")
                Rectangle()
                    .fill(.tint.opacity(0.15))
                    .frame(maxWidth: .infinity, maxHeight: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("idealWidth + fixedSize").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(idealWidth: 240).fixedSize(horizontal: true, vertical: false)")
                Text("When idealWidth is paired with fixedSize() horizontally, SwiftUI uses the ideal value as the proposal regardless of the parent's offer.")
                    .frame(idealWidth: 240)
                    .fixedSize(horizontal: true, vertical: false)
                    .padding(8)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Single-bound shorthand").font(.headline).foregroundStyle(.primary)
            APICallout(".frame(maxHeight: .infinity)  // expand vertically; width natural")
            Rectangle()
                .fill(.fill.tertiary)
                .frame(width: 240, height: 80)
                .overlay(Text("Used inside a vertically-greedy container").font(.caption).foregroundStyle(.secondary))
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Pass .infinity to maxWidth/maxHeight to consume all offered space \u{2014} the canonical 'fill the available area' pattern.", systemImage: "arrow.left.and.right")
                .font(.callout).foregroundStyle(.secondary)
            Label("idealWidth/idealHeight only matter when the wrapper that places this view asks for the ideal size \u{2014} typically via fixedSize().", systemImage: "lightbulb")
                .font(.callout).foregroundStyle(.secondary)
            Label("All six size parameters are optional \u{2014} omit the ones you don't constrain. Alignment positions the wrapped view inside whatever resolved frame you produced.", systemImage: "rectangle.dashed")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    FrameMinIdealMaxPage().frame(width: 900, height: 800)
}
