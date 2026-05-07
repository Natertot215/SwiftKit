import SwiftUI

struct LabelsVisibilityGalleryPage: View {
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

extension LabelsVisibilityGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.labelsVisibility",
        title: "LabelsVisibility",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/labelsVisibility(_:)",
            "View/labelsHidden()",
            "EnvironmentValues/labelsVisibility"
        ],
        blurb: "Controls the visibility of labels for controls inside a view. Use labelsVisibility(_:) to override the default presentation, or labelsHidden() for the convenience boolean form; descendants read the resolved Visibility from the environment.",
        signature: "func labelsVisibility(_ visibility: Visibility) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-configuration/labelsvisibility(_:).md",
        page: { AnyView(LabelsVisibilityGalleryPage()) }
    )
}

#Preview {
    LabelsVisibilityGalleryPage()
        .frame(width: 900, height: 700)
}
