import SwiftUI

struct ContainerValuesGalleryPage: View {
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

extension ContainerValuesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.containerValues",
        title: "ContainerValues",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: [
            "ContainerValues",
            "ContainerValueKey",
            "View/containerValue(_:_:)"
        ],
        blurb: "A collection of values associated with a view that a custom container can read from its subviews. Declared via the @Entry macro on a ContainerValues extension and set with the containerValue(_:_:) modifier.",
        signature: "struct ContainerValues",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/view-groupings/containervalues.md",
        page: { AnyView(ContainerValuesGalleryPage()) }
    )
}

#Preview {
    ContainerValuesGalleryPage()
        .frame(width: 900, height: 700)
}
