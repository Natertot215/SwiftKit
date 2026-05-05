import SwiftUI

// SwiftUI `View/offset(x:y:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/offset(x:y:).md
// macOS 10.15+. Two-scalar variant.

struct OffsetXYPage: View {
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0

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
            Text("View/offset(x:y:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Offsets a view's rendering by horizontal and vertical scalars. The view's layout slot stays unchanged \u{2014} only the rendered position moves.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/offset(x:y:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".offset(x: 40, y: -40)")
            ZStack {
                Rectangle()
                    .stroke(Color.primary)
                    .frame(width: 160, height: 160)
                Image(systemName: "circle")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .offset(x: 40, y: -40)
            }
            .frame(width: 200, height: 200)
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("The circle renders 40 trailing and 40 above its layout-slot center.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Interactive offset").font(.headline).foregroundStyle(.primary)
                APICallout(".offset(x: \(Int(offsetX)), y: \(Int(offsetY)))")
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("X: \(Int(offsetX))").font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                        Slider(value: $offsetX, in: -60...60, step: 2).frame(width: 160)
                        Text("Y: \(Int(offsetY))").font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                        Slider(value: $offsetY, in: -30...30, step: 2).frame(width: 160)
                    }
                    ZStack {
                        Circle()
                            .strokeBorder(.separator, lineWidth: 1)
                            .frame(width: 22, height: 22)
                        Circle()
                            .fill(.tint)
                            .frame(width: 32, height: 32)
                            .offset(x: offsetX, y: offsetY)
                    }
                    .frame(width: 200, height: 100)
                    .clipped()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
                Text("The thin outline marks the layout slot; the filled circle moves with the offset.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("X-only \u{2014} y defaults to 0").font(.headline).foregroundStyle(.primary)
                APICallout(".offset(x: 24)  // y defaults to 0")
                HStack {
                    Text("Lateral nudge")
                        .padding(6)
                        .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        .offset(x: 24)
                }
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Drag-to-offset pattern").font(.headline).foregroundStyle(.primary)
            APICallout("@State var dragOffset: CGSize = .zero\nView { ... }.offset(dragOffset).gesture(DragGesture()...)")
            Text("offset is the canonical way to bind a DragGesture's translation to a view's rendered position without disturbing surrounding layout.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("offset doesn't change layout. Siblings won't reflow; the layout slot stays the same shape and size as before.", systemImage: "eye")
                .font(.callout).foregroundStyle(.secondary)
            Label("Negative x is leading-ward, negative y is upward (origin is top-leading).", systemImage: "arrow.up.left")
                .font(.callout).foregroundStyle(.secondary)
            Label("If you need the view to actually move within layout (so other views reflow), reach for padding, alignment, or position instead.", systemImage: "rectangle.compress.vertical")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    OffsetXYPage().frame(width: 900, height: 800)
}
