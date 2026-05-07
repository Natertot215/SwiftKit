import SwiftUI

struct ViewBuilderGalleryPage: View {
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

extension ViewBuilderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.viewBuilder",
        title: "ViewBuilder",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["ViewBuilder"],
        blurb: "A custom parameter attribute that constructs views from closures. Apply @ViewBuilder to a child view-producing closure parameter so callers can return multiple child views in a single block.",
        signature: "@resultBuilder struct ViewBuilder",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/viewbuilder.md",
        page: { AnyView(ViewBuilderGalleryPage()) }
    )
}

#Preview {
    ViewBuilderGalleryPage()
        .frame(width: 900, height: 700)
}
