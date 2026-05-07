import SwiftUI

struct LayoutPriorityGalleryPage: View {
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

extension LayoutPriorityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.layoutPriority",
        title: "LayoutPriority",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/layoutPriority(_:)",
            "swiftui.layout-adjustments.layoutpriority(_:)",
        ],
        blurb: "Set the priority by which a parent layout apportions space to a child. A higher layoutPriority lets a view claim more of the proposed size when siblings compete for room.",
        signature: "func layoutPriority(_ value: Double) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/layoutpriority(_:).md",
        page: { AnyView(LayoutPriorityGalleryPage()) }
    )
}

#Preview {
    LayoutPriorityGalleryPage()
        .frame(width: 900, height: 700)
}
