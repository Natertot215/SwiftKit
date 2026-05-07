import SwiftUI

struct NSSavePanelPage: View {
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

extension NSSavePanelPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.windowsPanelsAndScreens.nsSavePanel",
        title: "NSSavePanel",
        folder: "Windows, panels, and screens",
        framework: .appKit,
        absorbedSymbols: [
            "NSSavePanel",
            "NSOpenPanel",
            "NSOpenSavePanelDelegate"
        ],
        blurb: "The standard system panels for saving and opening files, including the open variant and shared delegate hooks for filtering, validation, and accessory views.",
        signature: "class NSSavePanel : NSPanel",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/windows-panels-and-screens/nssavepanel.md",
        page: { AnyView(NSSavePanelPage()) }
    )
}

#Preview {
    NSSavePanelPage()
        .frame(width: 900, height: 700)
}
