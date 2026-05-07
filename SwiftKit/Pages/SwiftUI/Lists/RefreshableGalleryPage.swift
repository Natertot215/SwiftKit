import SwiftUI

struct RefreshableGalleryPage: View {
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

extension RefreshableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.refreshable",
        title: "Refreshable",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/refreshable(action:)",
            "RefreshAction"
        ],
        blurb: "Adds an asynchronous handler that updates the data the view displays when a person initiates a request, such as by pulling to refresh. RefreshAction is the environment-stored action surfaced inside refreshable scopes.",
        signature: "func refreshable(action: @escaping @Sendable () async -> Void) -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/lists/refreshable(action:).md",
        page: { AnyView(RefreshableGalleryPage()) }
    )
}

#Preview {
    RefreshableGalleryPage()
        .frame(width: 900, height: 700)
}
