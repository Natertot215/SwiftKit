import SwiftUI

struct DraggableGalleryPage: View {
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

extension DraggableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.dragAndDrop.dragAndDrop",
        title: "Drag and drop",
        folder: "Drag and drop",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.drag-and-drop.adopting-drag-and-drop-using-swiftui",
            "swiftui.drag-and-drop.draggable(_:)",
            "swiftui.drag-and-drop.dragconfiguration",
            "swiftui.drag-and-drop.dragsession",
            "swiftui.drag-and-drop.dropdelegate",
            "swiftui.drag-and-drop.dropdestination(for:action:istargeted:)",
            "swiftui.drag-and-drop.dropinfo",
            "swiftui.drag-and-drop.dropoperation",
            "swiftui.drag-and-drop.dropproposal",
            "swiftui.drag-and-drop.dropsession",
            "swiftui.drag-and-drop.making-a-view-into-a-drag-source"
        ],
        blurb: "The SwiftUI drag-and-drop API surface — the draggable and dropDestination modifiers plus the supporting types (DragConfiguration, DragSession, DropDelegate, DropInfo, DropOperation, DropProposal, DropSession) that describe sessions, proposals, and resolution behavior.",
        signature: "draggable \u{00b7} dropDestination \u{00b7} DragConfiguration \u{00b7} DragSession \u{00b7} DropDelegate \u{00b7} DropInfo \u{00b7} DropOperation \u{00b7} DropProposal \u{00b7} DropSession",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/drag-and-drop/draggable(_:).md",
        page: { AnyView(DraggableGalleryPage()) }
    )
}

#Preview {
    DraggableGalleryPage()
        .frame(width: 900, height: 700)
}
