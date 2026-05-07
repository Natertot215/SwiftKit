import SwiftUI

struct HSplitViewGalleryPage: View {
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

extension HSplitViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.hSplitView",
        title: "HSplitView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "HSplitView"
        ],
        blurb: "A layout container that arranges its children in a horizontal line and lets the user resize them with dividers placed between them. macOS-specific.",
        signature: "struct HSplitView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/hsplitview.md",
        page: { AnyView(HSplitViewGalleryPage()) }
    )
}

#Preview {
    HSplitViewGalleryPage()
        .frame(width: 900, height: 700)
}
