import SwiftUI

// SwiftUI Gesture protocol, AnyGesture, SimultaneousGesture, ExclusiveGesture, SequenceGesture,
// gesture(_:) / simultaneousGesture(_:) / highPriorityGesture(_:) modifiers,
// GestureMask, View/gesture(_:isEnabled:) etc. reference page.
// macOS 10.15+

struct GestureCompositionPage: View {
    @State private var exclusiveTaps = 0
    @State private var exclusiveDouble = 0
    @State private var simTapCount = 0
    @State private var simDragActive = false
    @GestureState private var dragOffset: CGSize = .zero

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("Gesture Composition")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("SimultaneousGesture, ExclusiveGesture, SequenceGesture, AnyGesture, and the gesture modifier family for composing and attaching gesture recognizers.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/gestures/ · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("ExclusiveGesture — only one fires").font(.headline).foregroundStyle(.primary)
                    APICallout("ExclusiveGesture(TapGesture(count: 2), TapGesture())")
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.tint.opacity(0.15))
                        .frame(height: 70)
                        .overlay(
                            VStack(spacing: 4) {
                                Text("Tap (1×) or Double-tap (2×) — only one fires")
                                    .font(.caption).foregroundStyle(.tint)
                                Text("Single: \(exclusiveTaps)  Double: \(exclusiveDouble)")
                                    .font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                        )
                        .gesture(
                            ExclusiveGesture(
                                TapGesture(count: 2).onEnded { exclusiveDouble += 1 },
                                TapGesture().onEnded { exclusiveTaps += 1 }
                            )
                        )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("SimultaneousGesture — both can fire").font(.headline).foregroundStyle(.primary)
                    APICallout(".simultaneousGesture(TapGesture()) on a DragGesture view")
                    RoundedRectangle(cornerRadius: 10)
                        .fill(simDragActive ? .green.opacity(0.4) : .green.opacity(0.15))
                        .frame(height: 70)
                        .overlay(
                            VStack(spacing: 4) {
                                Text("Drag and tap simultaneously")
                                    .font(.caption).foregroundStyle(.green)
                                Text("Taps while dragging: \(simTapCount)")
                                    .font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                            }
                        )
                        .gesture(
                            DragGesture()
                                .updating($dragOffset) { v, s, _ in s = v.translation }
                                .onChanged { _ in simDragActive = true }
                                .onEnded { _ in simDragActive = false }
                        )
                        .simultaneousGesture(TapGesture().onEnded { simTapCount += 1 })
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("SequenceGesture — second fires after first completes").font(.headline).foregroundStyle(.primary)
                    APICallout("SequenceGesture(LongPressGesture(), DragGesture())")
                    Text("SequenceGesture activates the second gesture only after the first completes. Classic use: long-press to activate, then drag to reorder.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("AnyGesture — type erasure").font(.headline).foregroundStyle(.primary)
                    APICallout("let g: AnyGesture<DragGesture.Value> = AnyGesture(DragGesture())")
                    Text("AnyGesture erases the concrete gesture type for storage or switching at runtime.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("gesture modifier family").font(.headline).foregroundStyle(.primary)
                    APICallout(".gesture(_:including:)  // GestureMask controls which subviews can interfere")
                    APICallout(".gesture(_:isEnabled:)  // conditionally enable")
                    APICallout(".gesture(_:name:isEnabled:)  // named for debugging")
                    APICallout(".simultaneousGesture(_:including:)")
                    APICallout(".simultaneousGesture(_:isEnabled:)")
                    APICallout(".highPriorityGesture(_:including:)  // wins over child gestures")
                    APICallout(".highPriorityGesture(_:isEnabled:)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("GestureMask").font(.headline).foregroundStyle(.primary)
                    APICallout("GestureMask.none  //  .gesture  //  .subviews  //  .all")
                    Text(".none disables all gesture recognition. .gesture prevents this view's gesture from blocking child gestures. .subviews prevents child gestures from interfering. .all allows all.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Gesture protocol").font(.headline).foregroundStyle(.primary)
                    APICallout("protocol Gesture { associatedtype Value; func body … }")
                    Text("All gesture types conform to Gesture. Use .onEnded(_:), .onChanged(_:), .updating(_:body:), .map(_:), and .sequenced(before:) to transform gesture values.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("allowsWindowActivationEvents(_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".allowsWindowActivationEvents(true)")
                    Text("Allows the view to receive click events that would otherwise only bring the window to the front without forwarding to the view. macOS 14.0+.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("WindowDragGesture").font(.headline).foregroundStyle(.primary)
                    APICallout(".gesture(WindowDragGesture())")
                    Text("Enables dragging the whole window when the user drags this view. Useful for custom titlebars. macOS 13.0+.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("highPriorityGesture takes precedence over child view gestures — use sparingly.", systemImage: "arrow.up.circle")
                    .font(.callout).foregroundStyle(.secondary)
                Label("gesture(_:including:) with .subviews prevents children from stealing the gesture.", systemImage: "square.3.layers.3d")
                    .font(.callout).foregroundStyle(.secondary)
                Label("SequenceGesture's Value is a enum(.first, .second) that encodes which stage succeeded.", systemImage: "list.number")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    GestureCompositionPage().frame(width: 900, height: 1000)
}
