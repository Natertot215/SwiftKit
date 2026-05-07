import SwiftUI

struct MatchedGeometryEffectGalleryPage: View {
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

extension MatchedGeometryEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.matchedGeometryEffect",
        title: "MatchedGeometryEffect",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "EmptyMatchedTransitionSourceConfiguration",
            "MatchedGeometryProperties",
            "MatchedTransitionSourceConfiguration",
            "Namespace",
            "View/matchedGeometryEffect(id:in:properties:anchor:isSource:)",
            "View/matchedTransitionSource(id:in:)",
            "View/matchedTransitionSource(id:in:configuration:)"
        ],
        blurb: "Synchronizes geometry across views: matchedGeometryEffect tweens position and size between source and destination, while matchedTransitionSource pairs with navigationTransition(.zoom:) for hero-style nav effects. Both rely on a Namespace.ID — declared via the @Namespace property wrapper — to scope their identifiers.",
        signature: "matchedGeometryEffect · matchedTransitionSource · MatchedTransitionSourceConfiguration · Namespace",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/animations/matchedgeometryeffect(id:in:properties:anchor:issource:).md",
        page: { AnyView(MatchedGeometryEffectGalleryPage()) }
    )
}

#Preview {
    MatchedGeometryEffectGalleryPage()
        .frame(width: 900, height: 700)
}
