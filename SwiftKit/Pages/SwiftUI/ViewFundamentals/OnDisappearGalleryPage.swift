import SwiftUI

struct OnDisappearGalleryPage: View {
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

extension OnDisappearGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.onDisappear",
        title: "OnDisappear",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["View/onDisappear(perform:)"],
        blurb: "Adds an action to perform after this view disappears. The action runs once the view is no longer present in the interface.",
        signature: "nonisolated func onDisappear(perform action: (() -> Void)? = nil) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/ondisappear(perform:).md",
        page: { AnyView(OnDisappearGalleryPage()) }
    )
}

#Preview {
    OnDisappearGalleryPage()
        .frame(width: 900, height: 700)
}
