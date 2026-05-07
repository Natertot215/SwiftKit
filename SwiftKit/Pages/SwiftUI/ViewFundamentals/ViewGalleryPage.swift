import SwiftUI

struct ViewGalleryPage: View {
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

extension ViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.view",
        title: "View",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: [
            "View",
            "View/body-8kl5o",
            "Declaring a custom view",
            "Configuring views"
        ],
        blurb: "A type that represents part of your app's user interface and provides modifiers that you use to configure views. Conform to View by implementing a body computed property that composes built-in and custom views into a hierarchy.",
        signature: "@MainActor @preconcurrency protocol View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/view.md",
        page: { AnyView(ViewGalleryPage()) }
    )
}

#Preview {
    ViewGalleryPage()
        .frame(width: 900, height: 700)
}
