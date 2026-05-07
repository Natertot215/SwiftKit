import SwiftUI

struct PullDownButtonGalleryPage: View {
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

extension PullDownButtonGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.menusAndCommands.pullDownButton",
        title: "PullDownButton",
        folder: "Menus and commands",
        framework: .swiftUI,
        absorbedSymbols: [
            "PullDownButton"
        ],
        blurb: "A typealias for the legacy pull-down button presentation. See MenuButton and ContextMenu for the modern equivalents.",
        signature: "typealias PullDownButton",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/menus-and-commands/pulldownbutton.md",
        page: { AnyView(PullDownButtonGalleryPage()) }
    )
}

#Preview {
    PullDownButtonGalleryPage()
        .frame(width: 900, height: 700)
}
