import SwiftUI

// SwiftUI `View/frame(width:height:alignment:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/frame(width:height:alignment:).md
// macOS 10.15+. Fixed-size invisible frame.

struct FrameFixedPage: View {
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
            Text("View/frame(width:height:alignment:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Positions this view within an invisible frame with the specified size. Either dimension may be omitted (nil) \u{2014} the wrapped view keeps its natural sizing on that axis.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/frame(width:height:alignment:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".frame(width: 200, height: 60, alignment: .center)")
            Text("Hello world")
                .frame(width: 200, height: 60, alignment: .center)
                .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("alignment values").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(width: 160, height: 50, alignment: .topLeading)")
                HStack(spacing: 12) {
                    ForEach([
                        (Alignment.topLeading, "topLeading"),
                        (.center, "center"),
                        (.bottomTrailing, "bottomTrailing")
                    ], id: \.1) { alignment, label in
                        VStack(spacing: 4) {
                            Text("Hello")
                                .frame(width: 120, height: 50, alignment: alignment)
                                .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                            Text(label).font(.caption2).foregroundStyle(.tertiary)
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Width-only").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(width: 200)  // height stays natural")
                Text("Wrapped text keeps its content-driven height.")
                    .frame(width: 200)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Height-only").font(.headline).foregroundStyle(.primary)
                APICallout(".frame(height: 80)  // width stays natural")
                Text("Tall slot, natural width")
                    .frame(height: 80)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Shape filling the frame").font(.headline).foregroundStyle(.primary)
                APICallout("Ellipse().fill(.tint).frame(width: 240, height: 80)")
                Ellipse()
                    .fill(.tint)
                    .frame(width: 240, height: 80)
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Both nil \u{2014} a no-op frame").font(.headline).foregroundStyle(.primary)
            APICallout(".frame()  // both dimensions nil; alignment ignored")
            Text("With both width and height nil, the modifier passes through; the wrapped view keeps the parent's full proposal.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("frame() wraps the child but does not clip \u{2014} a child can draw outside if it ignores the proposal.", systemImage: "square.dashed")
                .font(.callout).foregroundStyle(.secondary)
            Label("Alignment positions the child INSIDE the resulting frame; if frame size matches child size, alignment has no visible effect.", systemImage: "align.horizontal.center")
                .font(.callout).foregroundStyle(.secondary)
            Label("Shapes (Circle, Rectangle, Ellipse) always fill their proposed size, so a frame fixes their visible bounds.", systemImage: "circle.dashed")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    FrameFixedPage().frame(width: 900, height: 800)
}
