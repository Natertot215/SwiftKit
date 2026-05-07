import SwiftUI

struct PersistentSystemOverlaysGalleryPage: View {
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

extension PersistentSystemOverlaysGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.persistentSystemOverlays",
        title: "PersistentSystemOverlays",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/persistentSystemOverlays(_:)"],
        blurb: "Sets the preferred visibility of non-transient system overlays — Home indicator, SharePlay indicator, Multitasking Controls, Picture in Picture, and on macOS WindowGroup chrome. The system honors the preference when it can.",
        signature: "func persistentSystemOverlays(_ visibility: Visibility) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/view-configuration/persistentsystemoverlays(_:).md",
        page: { AnyView(PersistentSystemOverlaysGalleryPage()) }
    )
}

#Preview {
    PersistentSystemOverlaysGalleryPage()
        .frame(width: 900, height: 700)
}
