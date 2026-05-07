import SwiftUI

struct TipViewGalleryPage: View {
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

extension TipViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.tipView",
        title: "TipView",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "TipView",
            "View/tipBackground(_:)",
            "View/tipCornerRadius(_:antialiased:)",
            "View/tipImageSize(_:)",
            "View/tipViewStyle(_:)",
            "View/tipImageStyle(_:)",
            "View/tipImageStyle(_:_:)",
            "View/tipImageStyle(_:_:_:)"
        ],
        blurb: "TipKit TipView for inline contextual tips. Companion modifiers configure background, corner radius, image size, view style, and image style.",
        signature: "struct TipView<ActionLabel> : View",
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/tipviewstyle(_:).md",
        page: { AnyView(TipViewGalleryPage()) }
    )
}

#Preview {
    TipViewGalleryPage()
        .frame(width: 900, height: 700)
}
