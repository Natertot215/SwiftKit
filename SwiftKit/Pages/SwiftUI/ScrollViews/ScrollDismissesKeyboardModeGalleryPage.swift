import SwiftUI

struct ScrollDismissesKeyboardModeGalleryPage: View {
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

extension ScrollDismissesKeyboardModeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollDismissesKeyboardMode",
        title: "ScrollDismissesKeyboardMode",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollDismissesKeyboardMode"
        ],
        blurb: "The ways scrollable content can interact with the software keyboard. Pass to scrollDismissesKeyboard to control whether scrolling dismisses the keyboard immediately, interactively, or never.",
        signature: "struct ScrollDismissesKeyboardMode",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrolldismisseskeyboardmode.md",
        page: { AnyView(ScrollDismissesKeyboardModeGalleryPage()) }
    )
}

#Preview {
    ScrollDismissesKeyboardModeGalleryPage()
        .frame(width: 900, height: 700)
}
