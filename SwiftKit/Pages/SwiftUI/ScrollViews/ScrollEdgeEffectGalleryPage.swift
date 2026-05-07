import SwiftUI

struct ScrollEdgeEffectGalleryPage: View {
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

extension ScrollEdgeEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollEdgeEffect",
        title: "ScrollEdgeEffect",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollEdgeEffectStyle",
            "View/scrollEdgeEffectStyle(_:for:)",
            "View/scrollEdgeEffectHidden(_:for:)"
        ],
        blurb: "Configures the macOS 26 scroll-edge pocket — the soft fade and Liquid Glass treatment along a scroll view's edges. Use scrollEdgeEffectStyle to choose a style or scrollEdgeEffectHidden to suppress the effect on specific edges.",
        signature: "struct ScrollEdgeEffectStyle",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrolledgeeffectstyle.md",
        page: { AnyView(ScrollEdgeEffectGalleryPage()) }
    )
}

#Preview {
    ScrollEdgeEffectGalleryPage()
        .frame(width: 900, height: 700)
}
