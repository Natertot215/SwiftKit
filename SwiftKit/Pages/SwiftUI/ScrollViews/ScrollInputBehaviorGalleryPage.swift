import SwiftUI

struct ScrollInputBehaviorGalleryPage: View {
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

extension ScrollInputBehaviorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollInputBehavior",
        title: "ScrollInputBehavior",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScrollInputBehavior",
            "ScrollInputKind",
            "View/scrollInputBehavior(_:for:)"
        ],
        blurb: "Enables or disables scrolling for a specific input kind (such as touch, Digital Crown, or double-tap) without disabling scrolling overall. Pair ScrollInputBehavior with ScrollInputKind to scope the policy.",
        signature: "struct ScrollInputBehavior",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollinputbehavior.md",
        page: { AnyView(ScrollInputBehaviorGalleryPage()) }
    )
}

#Preview {
    ScrollInputBehaviorGalleryPage()
        .frame(width: 900, height: 700)
}
