import SwiftUI

struct SafeAreaGalleryPage: View {
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

extension SafeAreaGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.safeArea",
        title: "SafeArea",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "SafeArea",
            "View/ignoresSafeArea(_:edges:)",
            "View/safeAreaInset(edge:alignment:spacing:content:)",
            "View/safeAreaPadding(_:)",
            "View/safeAreaPadding(_:_:)",
            "SafeAreaRegions",
        ],
        blurb: "Read, extend into, or attach views to the system-defined safe area. ignoresSafeArea pushes content under bars and titlebars; safeAreaInset reserves a strip alongside the regular safe area for floating content.",
        signature: "func ignoresSafeArea(_ regions: SafeAreaRegions = .all, edges: Edge.Set = .all) -> some View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/layout-adjustments/safearearegions.md",
        page: { AnyView(SafeAreaGalleryPage()) }
    )
}

#Preview {
    SafeAreaGalleryPage()
        .frame(width: 900, height: 700)
}
