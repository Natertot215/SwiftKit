import SwiftUI

// SwiftUI TapGesture, onTapGesture, LongPressGesture, onLongPressGesture reference page.
// Source: Documentation/SwiftUI/gestures/tapgesture.md
// macOS 10.15+

struct TapGesturePage: View {
    @State private var tapCount = 0
    @State private var doubleTapCount = 0
    @State private var isLongPressing = false
    @State private var longPressCount = 0
    @State private var lastTapLocation: CGPoint = .zero

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("TapGesture / LongPressGesture / onTapGesture")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Discrete tap recognition with configurable tap count. LongPressGesture fires after a minimum duration hold.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/gestures/tapgesture.md · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("onTapGesture(count:perform:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".onTapGesture { tapCount += 1 }")
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.tint.opacity(0.2))
                        .frame(height: 80)
                        .overlay(
                            VStack(spacing: 4) {
                                Text("Tap me")
                                    .font(.callout).fontWeight(.medium).foregroundStyle(.tint)
                                Text("Single taps: \(tapCount)")
                                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                        )
                        .onTapGesture { tapCount += 1 }

                    APICallout(".onTapGesture(count: 2) { doubleTapCount += 1 }")
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green.opacity(0.2))
                        .frame(height: 60)
                        .overlay(
                            VStack(spacing: 4) {
                                Text("Double-tap me")
                                    .font(.callout).fontWeight(.medium).foregroundStyle(.green)
                                Text("Double taps: \(doubleTapCount)")
                                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                        )
                        .onTapGesture(count: 2) { doubleTapCount += 1 }
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("onTapGesture(count:coordinateSpace:perform:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".onTapGesture(count: 1, coordinateSpace: .local) { location in … }")
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.purple.opacity(0.15))
                        .frame(height: 100)
                        .overlay(
                            VStack(spacing: 4) {
                                Text("Tap anywhere — logs coordinates")
                                    .font(.callout).foregroundStyle(.purple)
                                if lastTapLocation != .zero {
                                    Text("Tapped at (\(Int(lastTapLocation.x)), \(Int(lastTapLocation.y)))")
                                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                                }
                            }
                        )
                        .onTapGesture(count: 1, coordinateSpace: .local) { location in
                            lastTapLocation = location
                        }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("LongPressGesture — minimumDuration + maximumDistance").font(.headline).foregroundStyle(.primary)
                    APICallout("LongPressGesture(minimumDuration: 0.5, maximumDistance: 10)")
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isLongPressing ? .orange.opacity(0.5) : .orange.opacity(0.15))
                        .frame(height: 80)
                        .overlay(
                            VStack(spacing: 4) {
                                Text(isLongPressing ? "Held!" : "Hold me")
                                    .font(.callout).fontWeight(.medium).foregroundStyle(.orange)
                                Text("Long presses: \(longPressCount)")
                                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                        )
                        .onLongPressGesture(minimumDuration: 0.5, maximumDistance: 10) {
                            longPressCount += 1
                        } onPressingChanged: { pressing in
                            withAnimation(.easeInOut(duration: 0.15)) {
                                isLongPressing = pressing
                            }
                        }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("TapGesture as value type").font(.headline).foregroundStyle(.primary)
                    APICallout("TapGesture(count: 3).onEnded { … }")
                    Text("TapGesture is a value type conforming to Gesture. Use .gesture(TapGesture(count:)) to compose it with other gestures.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("count parameter — multiple tap recognizers").font(.headline).foregroundStyle(.primary)
                APICallout(".onTapGesture(count: 3) { tripleTap() }")
                Text("Stack multiple onTapGesture modifiers — SwiftUI dispatches to the highest count that succeeds. A triple-tap will not also fire single/double tap if you apply all three.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("onTapGesture is a shorthand for .gesture(TapGesture(count:).onEnded { … }).", systemImage: "cursorarrow")
                    .font(.callout).foregroundStyle(.secondary)
                Label("LongPressGesture.onPressingChanged fires with true when the finger goes down, false when it lifts or cancels.", systemImage: "hand.point.up.left")
                    .font(.callout).foregroundStyle(.secondary)
                Label("coordinateSpace: .global returns position in the window coordinate system; .local is relative to the modified view.", systemImage: "map")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    TapGesturePage().frame(width: 900, height: 900)
}
