import SwiftUI

struct WorkoutPreviewGalleryPage: View {
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

extension WorkoutPreviewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.workoutPreview",
        title: "WorkoutPreview",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/workoutPreview(_:isPresented:)"
        ],
        blurb: "WorkoutKit modifier that presents a preview of a custom workout the user can choose to start.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/workoutpreview(_:ispresented:).md",
        page: { AnyView(WorkoutPreviewGalleryPage()) }
    )
}

#Preview {
    WorkoutPreviewGalleryPage()
        .frame(width: 900, height: 700)
}
