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
            "View/matchedGeometryEffect(id:in:properties:anchor:isSource:)",
            "MatchedGeometryProperties"
        ],
        blurb: "Defines a group of views with synchronized geometry using an identifier and namespace. SwiftUI tweens position, size, and other matched properties between source and destination views.",
        signature: "func matchedGeometryEffect<ID>(id: ID, in: Namespace.ID, properties: MatchedGeometryProperties = .frame, anchor: UnitPoint = .center, isSource: Bool = true) -> some View where ID : Hashable",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/animations/matchedgeometryeffect(id:in:properties:anchor:issource:).md",
        page: { AnyView(MatchedGeometryEffectGalleryPage()) }
    )
}

#Preview {
    MatchedGeometryEffectGalleryPage()
        .frame(width: 900, height: 700)
}
