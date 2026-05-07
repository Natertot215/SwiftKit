import SwiftUI

struct NSCursorPage: View {
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

extension NSCursorPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.menusCursorsAndTheDock.nsCursor",
        title: "NSCursor",
        folder: "Menus, cursors, and the Dock",
        framework: .appKit,
        absorbedSymbols: [
            "NSCursor",
            "NSTrackingArea"
        ],
        blurb: "An object that represents the system cursor, with helpers for swapping cursor shapes and managing tracking areas that change the cursor as the pointer moves.",
        signature: "class NSCursor : NSObject",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/menus-cursors-and-the-dock/nscursor.md",
        page: { AnyView(NSCursorPage()) }
    )
}

#Preview {
    NSCursorPage()
        .frame(width: 900, height: 700)
}
