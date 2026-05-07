import SwiftUI

struct VSplitViewGalleryPage: View {
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

extension VSplitViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.vSplitView",
        title: "VSplitView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "VSplitView"
        ],
        blurb: "A layout container that arranges its children in a vertical line and lets the user resize them with dividers placed between them. macOS-specific.",
        signature: "struct VSplitView<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/navigation/vsplitview.md",
        page: { AnyView(VSplitViewGalleryPage()) }
    )
}

#Preview {
    VSplitViewGalleryPage()
        .frame(width: 900, height: 700)
}
