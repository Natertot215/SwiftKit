import SwiftUI

struct OnAppearGalleryPage: View {
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

extension OnAppearGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.onAppear",
        title: "OnAppear",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["View/onAppear(perform:)"],
        blurb: "Adds an action to perform before this view appears. The action closure completes before the first rendered frame appears.",
        signature: "nonisolated func onAppear(perform action: (() -> Void)? = nil) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/onappear(perform:).md",
        page: { AnyView(OnAppearGalleryPage()) }
    )
}

#Preview {
    OnAppearGalleryPage()
        .frame(width: 900, height: 700)
}
