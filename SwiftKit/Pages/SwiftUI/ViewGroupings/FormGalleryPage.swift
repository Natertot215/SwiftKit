import SwiftUI

struct FormGalleryPage: View {
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

extension FormGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.form",
        title: "Form",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: ["Form"],
        blurb: "A container for grouping controls used for data entry, such as in settings or inspectors. SwiftUI applies platform-appropriate styling to its contained controls — on macOS, an aligned vertical stack.",
        signature: "struct Form<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-groupings/form.md",
        page: { AnyView(FormGalleryPage()) }
    )
}

#Preview {
    FormGalleryPage()
        .frame(width: 900, height: 700)
}
