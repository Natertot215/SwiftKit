import SwiftUI

// SwiftUI submit & command family reference page.
// Covers: onSubmit, submitLabel, submitScope, SubmitTriggers, SubmitLabel,
//         onCommand, onDeleteCommand, onExitCommand, onMoveCommand, MoveCommandDirection,
//         contentShape/ContentShapeKinds
// Source: Documentation/SwiftUI/input-events/

struct SubmitAndCommandPage: View {
    @State private var searchText = ""
    @State private var formText = ""
    @State private var log: [String] = []

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
            Text("onSubmit · submitLabel · onCommand · onMoveCommand")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Handle Return/Enter, delete, escape, arrow navigation, and menu commands.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "onSubmit(of:_:) — fires when Return is pressed") {
            VStack(alignment: .leading, spacing: 10) {
                TextField("Type and press Return", text: $formText)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit { log.append("Submitted: \"\(formText)\"") }
                    .submitLabel(.done)
                if !log.isEmpty {
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(log.suffix(3), id: \.self) { entry in
                            Text(entry).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                    Button("Clear") { log = [] }
                }
            }
            APICallout(".onSubmit { … }.submitLabel(.done)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "SubmitLabel — Return key labels") {
                snippet("""
                TextField(…).submitLabel(.done)       // Done
                TextField(…).submitLabel(.go)         // Go
                TextField(…).submitLabel(.search)     // Search
                TextField(…).submitLabel(.send)       // Send
                TextField(…).submitLabel(.next)       // Next
                TextField(…).submitLabel(.continue)   // Continue
                TextField(…).submitLabel(.join)       // Join
                TextField(…).submitLabel(.return)     // Return (default)
                TextField(…).submitLabel(.route)      // Route
                TextField(…).submitLabel(.newLine)    // new line
                """)
                Text("submitLabel changes the Return key label in the soft keyboard on iOS. On macOS it's cosmetic in the toolbar but still fires onSubmit.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onSubmit(of:_:) — trigger filtering") {
                snippet("""
                VStack {
                    TextField("Name", text: $name)
                    TextField("Search", text: $query)
                        .submitScope()   // does NOT propagate submit up
                }
                .onSubmit(of: .text) { submitForm() }
                // SubmitTriggers: .text, .search
                """)
                Text("SubmitTriggers filters which controls fire the handler. submitScope() prevents a child view's submit from propagating to ancestor handlers.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onCommand(_:perform:) — respond to menu commands") {
                snippet("""
                Text("Paste target")
                    .focusable()
                    .onCommand(#selector(NSText.paste(_:))) {
                        handlePaste()
                    }
                // Works for any selector the responder chain would handle.
                """)
                Text("onCommand lets SwiftUI views join the AppKit responder chain for menu actions — macOS only.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onDeleteCommand(perform:)") {
                snippet("""
                List(items, selection: $selection) { … }
                    .onDeleteCommand { deleteSelected() }
                // Fires on ⌫ / Delete key press (macOS).
                """)
                Text("Wires the Delete key to a custom handler — common for lists and tables with selection.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "onExitCommand(perform:)") {
                snippet("""
                view.onExitCommand { dismiss() }
                // Fires when Escape (⎋) is pressed while this view has focus.
                """)
            }

            Block(title: "onMoveCommand(perform:) + MoveCommandDirection") {
                snippet("""
                view.onMoveCommand { direction in
                    switch direction {
                    case .up:    moveFocus(.up)
                    case .down:  moveFocus(.down)
                    case .left:  moveFocus(.left)
                    case .right: moveFocus(.right)
                    }
                }
                // MoveCommandDirection: .up, .down, .left, .right
                """)
                Text("onMoveCommand captures the arrow-key navigation commands that macOS routes through the responder chain. Requires focus.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "contentShape(_:_:eoFill:) — hit-testing shape") {
                snippet("""
                // contentShape controls what area responds to interactions:
                Image(systemName: "star")
                    .padding(20)
                    .contentShape(Rectangle())        // larger hit area
                // ContentShapeKinds:
                //   .interaction   — taps / clicks (default)
                //   .dragPreview   — drag preview shape
                //   .contextMenuPreview — context menu highlight
                //   .hoverEffect   — hover effect boundary
                //   .focusEffect   — focus ring shape
                //   .accessibility — VoiceOver hit region
                """)
                Text("contentShape is macOS / iOS / visionOS. Each ContentShapeKinds value targets a different interaction layer.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "submitScope() stops propagation") {
                snippet("""
                Form {
                    TextField("Search field", text: $search)
                        .submitScope()   // pressing Return here stays local
                    TextField("Name", text: $name)
                }
                .onSubmit { saveForm() }   // only fires from Name field
                """)
                Text("Without submitScope(), any TextField's Return propagates the onSubmit action up to the nearest handler.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("return", "onSubmit fires when the user presses Return in any TextField or SecureField inside the modified view hierarchy.")
            noteRow("command", "onCommand uses Objective-C selectors — import Foundation and use #selector(…). Common selectors: NSText.copy(_:), paste(_:), cut(_:).")
            noteRow("arrow.up.and.down", "onMoveCommand and onDeleteCommand are macOS-primary. They wire into the NSResponder chain behind the scenes.")
            noteRow("square.dashed", "ContentShapeKinds.dragPreview shapes the visual that appears under the user's finger or cursor during a drag — independent of the actual hit-test area.")
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
    SubmitAndCommandPage().frame(width: 1100, height: 900)
}
