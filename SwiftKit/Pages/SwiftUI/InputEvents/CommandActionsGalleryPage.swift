import SwiftUI

struct CommandActionsGalleryPage: View {
    @State private var lastDirection: String = "—"
    @State private var deleteCount: Int = 0
    @State private var exitCount: Int = 0
    @State private var pageIndex: Int = 0
    @FocusState private var isFocused: Bool

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".onMoveCommand",
                api: ".onMoveCommand { direction in … }"
            ) {
                VStack(spacing: 8) {
                    Text(isFocused ? "Focused — try arrow keys" : "Click to focus")
                        .font(.callout)
                        .foregroundStyle(isFocused ? .primary : .secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(isFocused ? AnyShapeStyle(Color.accentColor) : AnyShapeStyle(.separator), lineWidth: 1)
                        )
                        .focusable()
                        .focused($isFocused)
                        .onMoveCommand { direction in
                            switch direction {
                            case .up:    lastDirection = ".up"
                            case .down:  lastDirection = ".down"
                            case .left:  lastDirection = ".left"
                            case .right: lastDirection = ".right"
                            @unknown default: lastDirection = "?"
                            }
                        }
                    Text("direction: \(lastDirection)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: ".onDeleteCommand",
                api: ".onDeleteCommand { deleteCount += 1 }"
            ) {
                VStack(spacing: 8) {
                    Text("Focus, then press ⌫")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .focusable()
                        .onDeleteCommand { deleteCount += 1 }
                    Text("delete events: \(deleteCount)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: ".onExitCommand",
                api: ".onExitCommand { exitCount += 1 }"
            ) {
                VStack(spacing: 8) {
                    Text("Focus, then press ⎋")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .focusable()
                        .onExitCommand { exitCount += 1 }
                    Text("exit events: \(exitCount)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "View.onPlayPauseCommand(perform:)",
                signature: "func onPlayPauseCommand(perform action: (() -> Void)?) -> some View",
                note: "Routes media-key Play/Pause events to the action. Pass nil to disable handling. Pair with focus to scope which view receives the command."
            )

            ReferenceTile(
                name: "View.onCommand(_:perform:)",
                signature: "func onCommand(_ selector: Selector, perform action: (() -> Void)?) -> some View",
                note: "Hooks SwiftUI views into the AppKit responder chain by Objective-C selector — e.g. NSText.copy(_:), .paste(_:), .selectAll(_:). Use to bridge menu actions into a SwiftUI view."
            )

            ReferenceTile(
                name: "View.pageCommand(value:in:step:)",
                signature: "func pageCommand<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1) -> some View where V : Strideable",
                note: "Binds Digital Crown / paged scroll input to a value within a range. visionOS-leaning, surfaced cross-platform for SDK parity."
            )

            ReferenceTile(
                name: "MoveCommandDirection",
                signature: "enum MoveCommandDirection : Hashable, Sendable  ·  .up  ·  .down  ·  .left  ·  .right",
                note: "The direction passed to onMoveCommand's closure. Wired to arrow keys and Game Controller D-pad input on the focused view."
            )
        }
    }
}

extension CommandActionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.commandActions",
        title: "CommandActions",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onMoveCommand(perform:)",
            "View/onDeleteCommand(perform:)",
            "View/pageCommand(value:in:step:)",
            "View/onExitCommand(perform:)",
            "View/onPlayPauseCommand(perform:)",
            "View/onCommand(_:perform:)",
            "MoveCommandDirection"
        ],
        blurb: "High-level command handlers — onMoveCommand for arrow-key navigation, onDeleteCommand for delete intents, onExitCommand for Escape, onPlayPauseCommand for media keys, plus onCommand for arbitrary AppKit selectors and pageCommand for paged Digital Crown / scroll input.",
        signature: "func onMoveCommand(perform action: ((MoveCommandDirection) -> Void)?) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/input-events/onmovecommand(perform:).md",
        page: { AnyView(CommandActionsGalleryPage()) }
    )
}

#Preview {
    CommandActionsGalleryPage()
        .frame(width: 900, height: 700)
}
