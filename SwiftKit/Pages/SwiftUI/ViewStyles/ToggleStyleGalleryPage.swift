import SwiftUI

struct ToggleStyleGalleryPage: View {
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

extension ToggleStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.toggleStyle",
        title: "ToggleStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "ToggleStyle",
            "View/toggleStyle(_:)",
            "ToggleStyleConfiguration"
        ],
        blurb: "The appearance and behavior of a toggle. Apply with View/toggleStyle(_:); customize with a type conforming to ToggleStyle whose makeBody receives a ToggleStyleConfiguration.",
        signature: "@MainActor @preconcurrency protocol ToggleStyle",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-styles/togglestyle.md",
        page: { AnyView(ToggleStyleGalleryPage()) }
    )
}

#Preview {
    ToggleStyleGalleryPage()
        .frame(width: 900, height: 700)
}
