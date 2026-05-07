import SwiftUI

struct PopoverGalleryPage: View {
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

extension PopoverGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.popover",
        title: "Popover",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/popover(isPresented:attachmentAnchor:arrowEdge:content:)",
            "View/popover(item:attachmentAnchor:arrowEdge:content:)",
            "PopoverAttachmentAnchor"
        ],
        blurb: "Presents a popover anchored to a source view. Configure attachment anchor and arrow edge to control direction and origin.",
        signature: "func popover<Content>(isPresented: Binding<Bool>, attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds), arrowEdge: Edge? = nil, @ViewBuilder content: @escaping () -> Content) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/popovers/popover(ispresented:attachmentanchor:arrowedge:content:).md",
        page: { AnyView(PopoverGalleryPage()) }
    )
}

#Preview {
    PopoverGalleryPage()
        .frame(width: 900, height: 700)
}
