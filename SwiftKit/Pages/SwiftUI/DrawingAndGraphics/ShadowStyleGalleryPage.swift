import SwiftUI

struct ShadowStyleGalleryPage: View {
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

extension ShadowStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.shadowStyle",
        title: "ShadowStyle",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["ShadowStyle", "View/shadow(color:radius:x:y:)"],
        blurb: "A style used when rendering shadows — paired with the shadow modifier to add drop and inner shadows to views with configurable color, radius, and offset.",
        signature: "struct ShadowStyle",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/shadowstyle.md",
        page: { AnyView(ShadowStyleGalleryPage()) }
    )
}

#Preview {
    ShadowStyleGalleryPage()
        .frame(width: 900, height: 700)
}
