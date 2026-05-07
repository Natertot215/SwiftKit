import SwiftUI

struct NSPopoverPage: View {
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

extension NSPopoverPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.windowsPanelsAndScreens.nsPopover",
        title: "NSPopover",
        folder: "Windows, panels, and screens",
        framework: .appKit,
        absorbedSymbols: [
            "NSPopover",
            "NSPopoverDelegate"
        ],
        blurb: "A transient view anchored to a positioning rectangle on another view, used to present supplemental content without leaving the current context.",
        signature: "class NSPopover : NSResponder",
        availability: "macOS 10.7+",
        docPath: "Documentation/AppKit/windows-panels-and-screens/nspopover.md",
        page: { AnyView(NSPopoverPage()) }
    )
}

#Preview {
    NSPopoverPage()
        .frame(width: 900, height: 700)
}
