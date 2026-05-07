import SwiftUI

struct DisabledGalleryPage: View {
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

extension DisabledGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.disabled",
        title: "Disabled",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/disabled(_:)",
            "EnvironmentValues/isEnabled"
        ],
        blurb: "Adds a condition that controls whether users can interact with this view. Higher views in the hierarchy override descendants; the resolved state surfaces through the isEnabled environment value.",
        signature: "func disabled(_ disabled: Bool) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-configuration/disabled(_:).md",
        page: { AnyView(DisabledGalleryPage()) }
    )
}

#Preview {
    DisabledGalleryPage()
        .frame(width: 900, height: 700)
}
