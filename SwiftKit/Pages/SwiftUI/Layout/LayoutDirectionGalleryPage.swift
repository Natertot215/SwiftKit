import SwiftUI

struct LayoutDirectionGalleryPage: View {
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

extension LayoutDirectionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.layoutDirection",
        title: "LayoutDirection",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "LayoutDirection",
            "LayoutDirectionBehavior",
            "View/layoutDirectionBehavior(_:)",
            "swiftui.layout-adjustments.layoutdirection",
            "swiftui.layout-adjustments.layoutdirectionbehavior",
            "swiftui.layout-adjustments.layoutdirectionbehavior(_:)",
        ],
        blurb: "The direction of the user's preferred reading order — leftToRight or rightToLeft — and the per-view behavior modifier that opts into mirroring or fixed orientation under right-to-left languages.",
        signature: "@frozen enum LayoutDirection : Hashable, CaseIterable, Sendable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/layoutdirection.md",
        page: { AnyView(LayoutDirectionGalleryPage()) }
    )
}

#Preview {
    LayoutDirectionGalleryPage()
        .frame(width: 900, height: 700)
}
