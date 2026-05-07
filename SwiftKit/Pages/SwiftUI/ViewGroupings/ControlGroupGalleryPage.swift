import SwiftUI

struct ControlGroupGalleryPage: View {
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

extension ControlGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewGroupings.controlGroup",
        title: "ControlGroup",
        folder: "View groupings",
        framework: .swiftUI,
        absorbedSymbols: ["ControlGroup"],
        blurb: "A container that displays semantically-related controls in a visually-appropriate manner for the surrounding context — for example, collapsing into a labeled overflow menu when placed in a toolbar.",
        signature: "struct ControlGroup<Content> where Content : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/view-groupings/controlgroup.md",
        page: { AnyView(ControlGroupGalleryPage()) }
    )
}

#Preview {
    ControlGroupGalleryPage()
        .frame(width: 900, height: 700)
}
