import SwiftUI

struct TagGalleryPage: View {
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

extension TagGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.tag",
        title: "Tag",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["View/tag(_:includeOptional:)"],
        blurb: "Sets the unique tag value of this view. Used to differentiate selectable views — for example, the values of a Picker or the tabs of a TabView.",
        signature: "nonisolated func tag<V>(_ tag: V, includeOptional: Bool = true) -> some View where V : Hashable",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/tag(_:includeoptional:).md",
        page: { AnyView(TagGalleryPage()) }
    )
}

#Preview {
    TagGalleryPage()
        .frame(width: 900, height: 700)
}
