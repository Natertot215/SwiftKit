import SwiftUI

struct AnyLayoutGalleryPage: View {
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

extension AnyLayoutGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.anyLayout",
        title: "AnyLayout",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "AnyLayout",
            "HStackLayout",
            "VStackLayout",
            "ZStackLayout",
            "GridLayout",
        ],
        blurb: "A type-erased layout that lets you swap layout containers at runtime without losing subview state. Pair AnyLayout with HStackLayout, VStackLayout, ZStackLayout, or GridLayout to switch arrangements based on Dynamic Type or window size.",
        signature: "@frozen struct AnyLayout",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/custom-layout/anylayout.md",
        page: { AnyView(AnyLayoutGalleryPage()) }
    )
}

#Preview {
    AnyLayoutGalleryPage()
        .frame(width: 900, height: 700)
}
