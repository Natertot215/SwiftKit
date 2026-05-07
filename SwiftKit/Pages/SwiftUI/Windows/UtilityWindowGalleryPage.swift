import SwiftUI

struct UtilityWindowGalleryPage: View {
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

extension UtilityWindowGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.utilityWindow",
        title: "UtilityWindow",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "UtilityWindow"
        ],
        blurb: "A specialized window scene for tool palettes or inspector windows. Floats above main scenes, hides when inactive, and is dismissible with the Escape key.",
        signature: "struct UtilityWindow<Content> where Content : View",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/utilitywindow.md",
        page: { AnyView(UtilityWindowGalleryPage()) }
    )
}

#Preview {
    UtilityWindowGalleryPage()
        .frame(width: 900, height: 700)
}
