import SwiftUI

struct ViewDimensionsGalleryPage: View {
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

extension ViewDimensionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.viewDimensions",
        title: "ViewDimensions",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "ViewDimensions",
            "ViewDimensions3D",
            "Inspecting view layout",
            "swiftui.layout-adjustments.inspecting-view-layout",
            "swiftui.layout-adjustments.viewdimensions",
            "swiftui.layout-adjustments.viewdimensions3d",
        ],
        blurb: "A view's measured size and alignment-guide values, exposed inside alignmentGuide(_:computeValue:) closures. ViewDimensions3D adds a depth axis for spatial layouts.",
        signature: "struct ViewDimensions",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/viewdimensions.md",
        page: { AnyView(ViewDimensionsGalleryPage()) }
    )
}

#Preview {
    ViewDimensionsGalleryPage()
        .frame(width: 900, height: 700)
}
