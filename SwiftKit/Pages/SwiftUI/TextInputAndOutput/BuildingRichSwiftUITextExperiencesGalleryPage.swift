import SwiftUI

struct BuildingRichSwiftUITextExperiencesGalleryPage: View {
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

extension BuildingRichSwiftUITextExperiencesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.buildingRichSwiftUITextExperiences",
        title: "Building rich SwiftUI text experiences",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.building-rich-swiftui-text-experiences"],
        blurb: "Apple sample-code reference: build an editor for formatted text using SwiftUI text editor views and attributed strings.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/text-input-and-output/building-rich-swiftui-text-experiences.md",
        page: { AnyView(BuildingRichSwiftUITextExperiencesGalleryPage()) }
    )
}

#Preview {
    BuildingRichSwiftUITextExperiencesGalleryPage()
        .frame(width: 900, height: 700)
}
