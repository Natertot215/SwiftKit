import SwiftUI

struct InvalidatableContentGalleryPage: View {
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

extension InvalidatableContentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.invalidatableContent",
        title: "InvalidatableContent",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/invalidatableContent(_:)"],
        blurb: "Marks a view's content as potentially out-of-date. When RedactionReasons.invalidated is present in the environment, the marked view changes appearance — used by interactive widgets between user input and the next timeline update.",
        signature: "func invalidatableContent(_ invalidatable: Bool = true) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/view-configuration/invalidatablecontent(_:).md",
        page: { AnyView(InvalidatableContentGalleryPage()) }
    )
}

#Preview {
    InvalidatableContentGalleryPage()
        .frame(width: 900, height: 700)
}
