import SwiftUI

struct CommandActionsGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
