import SwiftUI

struct FrameGalleryPage: View {
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

extension FrameGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.layout.frame",
        title: "Frame",
        folder: "Layout",
        framework: .swiftUI,
        absorbedSymbols: [
            "Frame",
            "View/frame(width:height:alignment:)",
            "View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)",
            "View/frame(depth:alignment:)",
            "View/frame(minDepth:idealDepth:maxDepth:alignment:)",
            "View/containerRelativeFrame(_:alignment:)",
            "View/containerRelativeFrame(_:alignment:_:)",
            "View/containerRelativeFrame(_:count:span:spacing:alignment:)",
            "Laying out a simple view",
            "swiftui.layout-adjustments.laying-out-a-simple-view",
            "swiftui.layout-adjustments.frame(depth:alignment:)",
            "swiftui.layout-adjustments.frame(mindepth:idealdepth:maxdepth:alignment:)",
        ],
        blurb: "Constrain a view to a fixed size, a flexible range, or a container-relative size. frame accepts width/height (and depth on visionOS); containerRelativeFrame ties size to the nearest scrollable container.",
        signature: "func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment = .center) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/layout-adjustments/frame(width:height:alignment:).md",
        page: { AnyView(FrameGalleryPage()) }
    )
}

#Preview {
    FrameGalleryPage()
        .frame(width: 900, height: 700)
}
