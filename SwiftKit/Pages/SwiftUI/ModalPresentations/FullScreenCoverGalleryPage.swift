import SwiftUI

struct FullScreenCoverGalleryPage: View {
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

extension FullScreenCoverGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.fullScreenCover",
        title: "FullScreenCover",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/fullScreenCover(isPresented:onDismiss:content:)",
            "View/fullScreenCover(item:onDismiss:content:)"
        ],
        blurb: "Presents a modal that covers as much of the screen as possible. iOS-leaning surface; on macOS the system maps it to a sheet-style presentation.",
        signature: "func fullScreenCover<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/modal-presentations/fullscreencover(ispresented:ondismiss:content:).md",
        page: { AnyView(FullScreenCoverGalleryPage()) }
    )
}

#Preview {
    FullScreenCoverGalleryPage()
        .frame(width: 900, height: 700)
}
