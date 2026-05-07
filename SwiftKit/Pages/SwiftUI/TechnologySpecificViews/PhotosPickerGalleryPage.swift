import SwiftUI

struct PhotosPickerGalleryPage: View {
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

extension PhotosPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.photosPicker",
        title: "PhotosPicker",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "PhotosPicker",
            "View/photosPicker(isPresented:selection:matching:preferredItemEncoding:)",
            "View/photosPicker(isPresented:selection:matching:preferredItemEncoding:photoLibrary:)",
            "View/photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:)",
            "View/photosPicker(isPresented:selection:maxSelectionCount:selectionBehavior:matching:preferredItemEncoding:photoLibrary:)",
            "View/photosPickerAccessoryVisibility(_:edges:)",
            "View/photosPickerDisabledCapabilities(_:)",
            "View/photosPickerStyle(_:)"
        ],
        blurb: "PhotosUI picker that presents the system Photos library for selecting one or more items. Companion modifiers configure accessory visibility, disabled capabilities, and the picker style.",
        signature: "struct PhotosPicker<Label> : View where Label : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/technology-specific-views/photospicker(ispresented:selection:matching:preferreditemencoding:).md",
        page: { AnyView(PhotosPickerGalleryPage()) }
    )
}

#Preview {
    PhotosPickerGalleryPage()
        .frame(width: 900, height: 700)
}
