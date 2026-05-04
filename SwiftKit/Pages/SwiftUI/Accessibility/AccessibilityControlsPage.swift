import SwiftUI

// SwiftUI accessibility controls reference page.
// Covers: accessibilityAction, accessibilityActions, accessibilityAdjustableAction,
//         AccessibilityAdjustmentDirection, accessibilityScrollAction,
//         accessibilityZoomAction, AccessibilityZoomGestureAction,
//         accessibilityActivationPoint, accessibilityDirectTouch, AccessibilityDirectTouchOptions,
//         accessibilityDragPoint, accessibilityDropPoint,
//         accessibilityFocused, AccessibilityFocusState,
//         accessibilityRespondsToUserInteraction,
//         AccessibilityActionKind, AccessibilityActionCategory

struct AccessibilityControlsPage: View {
    @State private var stepperValue = 5
    @State private var log: [String] = []
    @AccessibilityFocusState private var isFocused: Bool

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
            Text("Accessibility Controls")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Custom actions, adjustable controls, focus, activation points, and interaction hints.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "accessibilityAction — named custom action") {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "envelope.fill")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    Text("Important message")
                }
                .padding(10)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .accessibilityAction(named: "Archive") {
                    log.append("Archived")
                }
                .accessibilityAction(named: "Reply") {
                    log.append("Reply opened")
                }
                .accessibilityAction(named: "Delete") {
                    log.append("Deleted")
                }

                if !log.isEmpty {
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(log.suffix(3), id: \.self) { entry in
                            Text(entry).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                    Button("Clear") { log = [] }
                }
            }
            APICallout(".accessibilityAction(named: \"Archive\") { … }")
            Text("VoiceOver users can swipe up/down to choose between custom actions. Each accessibilityAction(_:_:) adds one action.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "accessibilityAction overloads") {
                snippet("""
                // Named action with Text label:
                view.accessibilityAction(named: "Archive") { archive() }

                // Named with LocalizedStringKey:
                view.accessibilityAction(named: "archive.action") { … }

                // Using AccessibilityActionKind:
                view.accessibilityAction(.default) { activate() }       // default
                view.accessibilityAction(.escape) { dismiss() }         // escape
                view.accessibilityAction(.delete) { delete() }          // delete
                view.accessibilityAction(.showMenu) { showContextMenu() }

                // Action with intent (App Intents integration):
                view.accessibilityAction(.default, intent: SomeIntent())

                // Action with view label:
                view.accessibilityAction(action: { share() }) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
                """)
            }

            Block(title: "accessibilityActions(_:) + accessibilityActions(category:_:)") {
                snippet("""
                view.accessibilityActions {
                    Button("Archive") { archive() }
                    Button("Reply") { reply() }
                }
                // Grouped variant with AccessibilityActionCategory:
                view.accessibilityActions(category: .edit) {
                    Button("Cut") { cut() }
                    Button("Copy") { copy() }
                }
                // AccessibilityActionCategory: .default, .edit, .add, .delete, …
                """)
                Text("accessibilityActions(category:_:) groups actions under a named category in the VoiceOver actions menu.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityAdjustableAction — increment/decrement") {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Value: \(stepperValue)")
                        Spacer()
                        HStack(spacing: 4) {
                            Button("-") { stepperValue = max(0, stepperValue - 1) }
                            Button("+") { stepperValue = min(20, stepperValue + 1) }
                        }
                    }
                    .padding(10)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("Custom stepper")
                    .accessibilityValue("\(stepperValue)")
                    .accessibilityAdjustableAction { direction in
                        switch direction {
                        case .increment: stepperValue = min(20, stepperValue + 1)
                        case .decrement: stepperValue = max(0, stepperValue - 1)
                        @unknown default: break
                        }
                    }
                }
                APICallout(".accessibilityAdjustableAction { direction in … }")
                Text("Swipe up/down in VoiceOver to trigger increment/decrement. AccessibilityAdjustmentDirection: .increment, .decrement.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityScrollAction — custom scroll") {
                snippet("""
                customScrollView.accessibilityScrollAction { edge in
                    switch edge {
                    case .top:    scrollToTop()
                    case .bottom: scrollToBottom()
                    case .left:   scrollLeft()
                    case .right:  scrollRight()
                    }
                }
                """)
            }

            Block(title: "accessibilityZoomAction + AccessibilityZoomGestureAction") {
                snippet("""
                mapView.accessibilityZoomAction { action in
                    switch action.direction {
                    case .zoomIn:  map.zoomIn(at: action.location)
                    case .zoomOut: map.zoomOut(at: action.location)
                    }
                }
                // AccessibilityZoomGestureAction provides:
                // .direction (.zoomIn / .zoomOut)
                // .location  (CGPoint in view coordinates)
                """)
            }

            Block(title: "accessibilityActivationPoint") {
                snippet("""
                // Default: center of the accessibility frame
                view.accessibilityActivationPoint(.center)
                // or a specific UnitPoint:
                view.accessibilityActivationPoint(UnitPoint(x: 0.8, y: 0.2))
                // isEnabled variant:
                view.accessibilityActivationPoint(.top, isEnabled: isInteractive)
                """)
                Text("Activation point is where VoiceOver \"taps\" to activate the element. Default is center. Adjust for non-centered interactive areas.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityDirectTouch + AccessibilityDirectTouchOptions") {
                snippet("""
                drawingCanvas
                    .accessibilityDirectTouch(
                        true,
                        options: .silencesAccessibilityTechnology
                    )
                // Options:
                // .silencesAccessibilityTechnology — no VoiceOver feedback during touch
                // .requiresActivation — user must first activate, then touch passes through
                """)
                Text("Direct touch passes raw touch events to the view even in VoiceOver mode — essential for drawing, games, and musical instruments.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityDragPoint + accessibilityDropPoint") {
                snippet("""
                draggableView
                    .accessibilityDragPoint(.center, description: "Drag handle")
                    .accessibilityDragPoint(UnitPoint(x: 0, y: 0.5),
                                            description: "Left handle",
                                            isEnabled: hasLeftHandle)
                dropTarget
                    .accessibilityDropPoint(.center, description: "Drop zone")
                """)
                Text("Provide explicit drag/drop points so VoiceOver can guide users through drag-and-drop interactions.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityFocused + AccessibilityFocusState") {
                snippet("""
                @AccessibilityFocusState var isFocused: Bool

                Button("Submit") { submit() }
                    .accessibilityFocused($isFocused)

                // Programmatically move VoiceOver focus:
                isFocused = true

                // Enum-typed AccessibilityFocusState:
                enum Field { case name, email }
                @AccessibilityFocusState var focusedField: Field?
                TextField(…).accessibilityFocused($focusedField, equals: .name)
                """)
                Text("AccessibilityFocusState mirrors FocusState but drives VoiceOver focus rather than keyboard focus.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityRespondsToUserInteraction") {
                snippet("""
                view.accessibilityRespondsToUserInteraction(true)
                // Declares the view accepts user interaction —
                // affects how AT treats it in a group.
                view.accessibilityRespondsToUserInteraction(false, isEnabled: isReadOnly)
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "AccessibilityActionKind constants") {
                snippet("""
                AccessibilityActionKind.default    // primary action
                AccessibilityActionKind.escape     // dismiss / escape
                AccessibilityActionKind.delete     // delete selected
                AccessibilityActionKind.showMenu   // show context menu
                AccessibilityActionKind.magicTap   // two-finger double tap
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("list.bullet", "Every accessibilityAction(named:) call adds one item to VoiceOver's actions rotor. Keep names short — they're read aloud.")
            noteRow("dial.medium", "accessibilityAdjustableAction makes a view behave like a Slider in VoiceOver — swipe up/down adjusts the value.")
            noteRow("hand.draw", "accessibilityDirectTouch(.silencesAccessibilityTechnology) completely silences VoiceOver audio during the interaction. Use it only for genuinely real-time touch surfaces.")
            noteRow("dot.scope", "accessibilityActivationPoint(_:) is specified as a UnitPoint (0,0 = top-left, 1,1 = bottom-right) within the element's accessibility frame.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    AccessibilityControlsPage().frame(width: 1100, height: 900)
}
