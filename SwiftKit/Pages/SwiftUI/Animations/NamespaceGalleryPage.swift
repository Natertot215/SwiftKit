import SwiftUI

struct NamespaceGalleryPage: View {
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

extension NamespaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.namespace",
        title: "Namespace",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["Namespace"],
        blurb: "A dynamic property type that allows access to a namespace defined by the persistent identity of the object containing the property. Used to scope matched-geometry and matched-transition identifiers within a view.",
        signature: "@frozen @propertyWrapper struct Namespace",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/animations/namespace.md",
        page: { AnyView(NamespaceGalleryPage()) }
    )
}

#Preview {
    NamespaceGalleryPage()
        .frame(width: 900, height: 700)
}
