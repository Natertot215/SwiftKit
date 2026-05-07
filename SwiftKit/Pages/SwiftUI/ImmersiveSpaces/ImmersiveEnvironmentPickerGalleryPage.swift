import SwiftUI

struct ImmersiveEnvironmentPickerGalleryPage: View {
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

extension ImmersiveEnvironmentPickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.immersiveEnvironmentPicker",
        title: "ImmersiveEnvironmentPicker",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/immersiveEnvironmentPicker(content:)",
            "swiftui.immersive-spaces.immersiveenvironmentpicker(content:)"
        ],
        blurb: "Adds menu items to open immersive spaces from a media player's environment picker. Items are donated to downstream players such as AVPlayerViewController alongside recently used system environments.",
        signature: "nonisolated func immersiveEnvironmentPicker<Content>(@ViewBuilder content: () -> Content) -> some View where Content : View",
        availability: "visionOS 2.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/immersiveenvironmentpicker(content:).md",
        page: { AnyView(ImmersiveEnvironmentPickerGalleryPage()) }
    )
}

#Preview {
    ImmersiveEnvironmentPickerGalleryPage()
        .frame(width: 900, height: 700)
}
