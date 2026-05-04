import SwiftUI

// SwiftUI DragGesture, GestureState, GestureStateGesture reference page.
// Source: Documentation/SwiftUI/gestures/draggesture.md
// macOS 10.15+

struct DragGesturePage: View {
    @State private var position: CGSize = .zero
    @GestureState private var dragOffset: CGSize = .zero
    @State private var isDragging = false
    @State private var lastPosition: CGPoint = .zero

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("DragGesture / GestureState")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Recognizes a drag motion. GestureState automatically resets to its initial value when the gesture ends — ideal for transient drag offset state.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/gestures/draggesture.md · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 12) {
                APICallout("@GestureState private var offset: CGSize = .zero\n.gesture(DragGesture().updating($offset) { v, s, _ in s = v.translation })")
                Text("Drag the circle:")
                    .font(.caption).foregroundStyle(.tertiary)

                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.background.secondary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .strokeBorder(.separator, lineWidth: 1)
                        )

                    Circle()
                        .fill(.tint.opacity(isDragging ? 0.9 : 0.5))
                        .frame(width: 48, height: 48)
                        .offset(
                            x: position.width + dragOffset.width,
                            y: position.height + dragOffset.height
                        )
                        .gesture(
                            DragGesture()
                                .updating($dragOffset) { value, state, _ in
                                    state = value.translation
                                    isDragging = true
                                }
                                .onEnded { value in
                                    position.width += value.translation.width
                                    position.height += value.translation.height
                                    isDragging = false
                                }
                        )
                        .animation(.spring(response: 0.3), value: isDragging)
                }
                .frame(height: 200)

                Text("Offset: (\(Int(position.width + dragOffset.width)), \(Int(position.height + dragOffset.height)))")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)

                Button("Reset") { position = .zero }
                    .font(.caption)
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DragGesture with minimumDistance").font(.headline).foregroundStyle(.primary)
                    APICallout("DragGesture(minimumDistance: 20)")
                    Text("The gesture only activates after the pointer moves at least 20pt from the start. Default is 10pt. Set to 0 for immediate recognition.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("DragGesture.Value properties").font(.headline).foregroundStyle(.primary)
                    APICallout("""
value.startLocation   // CGPoint — where drag began
value.location        // CGPoint — current pointer position
value.translation     // CGSize — offset from startLocation
value.velocity        // CGSize — points/second (macOS 13.0+)
value.predictedEndLocation  // extrapolated final position
""")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("GestureState / GestureStateGesture").font(.headline).foregroundStyle(.primary)
                    APICallout("@GestureState var isDragging: Bool = false\n.gesture(drag.updating($isDragging) { _, state, _ in state = true })")
                    Text("GestureState is always reset to its default value when the gesture ends or is cancelled — no onEnded cleanup needed. GestureStateGesture is the opaque type returned by .updating(_:body:).")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("DragGesture.Value — velocity-based snap").font(.headline).foregroundStyle(.primary)
                APICallout(".onEnded { v in if v.velocity.width > 300 { snapRight() } }")
                Text("velocity is a CGSize in points/second. Use it in onEnded to detect flick gestures and snap to the next page or dismiss a drawer.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("GestureState automatically resets — use it for transient per-gesture state. @State is for permanent state that survives gesture end.", systemImage: "arrow.counterclockwise")
                    .font(.callout).foregroundStyle(.secondary)
                Label("DragGesture on macOS responds to both trackpad and mouse drag.", systemImage: "trackpad")
                    .font(.callout).foregroundStyle(.secondary)
                Label("The coordinateSpace parameter (default .local) lets you get translation relative to a named coordinate space.", systemImage: "map")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    DragGesturePage().frame(width: 900, height: 900)
}
