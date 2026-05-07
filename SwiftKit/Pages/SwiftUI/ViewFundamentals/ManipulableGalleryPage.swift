import SwiftUI

struct ManipulableGalleryPage: View {
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

extension ManipulableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.manipulable",
        title: "Manipulable",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: [
            "Manipulable",
            "ManipulableModifier",
            "ManipulableResponderModifier",
            "ManipulableTransformBindingModifier",
            "ManipulationGeometryModifier",
            "ManipulationGestureModifier",
            "ManipulationUsingGestureStateModifier"
        ],
        blurb: "A namespace for manipulable-related types and view modifiers used to drive 3D manipulation gestures. Member structures expose the modifier shapes that compose into a manipulation interaction.",
        signature: "enum Manipulable",
        availability: "visionOS 26.0",
        docPath: "Documentation/SwiftUI/view-fundamentals/manipulable.md",
        page: { AnyView(ManipulableGalleryPage()) }
    )
}

#Preview {
    ManipulableGalleryPage()
        .frame(width: 900, height: 700)
}
