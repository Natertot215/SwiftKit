import SwiftUI

struct NSAlertPage: View {
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

extension NSAlertPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.windowsPanelsAndScreens.nsAlert",
        title: "NSAlert",
        folder: "Windows, panels, and screens",
        framework: .appKit,
        absorbedSymbols: [
            "NSAlert",
            "NSAlertDelegate"
        ],
        blurb: "A modal notification window for warning, informing, or confirming a destructive action with the user, with configurable buttons, icon, and accessory view.",
        signature: "class NSAlert : NSObject",
        availability: "macOS 10.3+",
        docPath: "Documentation/AppKit/windows-panels-and-screens/nsalert.md",
        page: { AnyView(NSAlertPage()) }
    )
}

#Preview {
    NSAlertPage()
        .frame(width: 900, height: 700)
}
