import SwiftUI

struct RemoteDeviceIdentifierGalleryPage: View {
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

extension RemoteDeviceIdentifierGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.remoteDeviceIdentifier",
        title: "RemoteDeviceIdentifier",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "RemoteDeviceIdentifier",
            "swiftui.immersive-spaces.remotedeviceidentifier"
        ],
        blurb: "An opaque type that identifies a remote device displaying scene content in a RemoteImmersiveSpace. Read it from the remoteDeviceIdentifier environment property; can seed an ARKitSession.",
        signature: "struct RemoteDeviceIdentifier",
        availability: "macOS 26.0+, visionOS 26.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/remotedeviceidentifier.md",
        page: { AnyView(RemoteDeviceIdentifierGalleryPage()) }
    )
}

#Preview {
    RemoteDeviceIdentifierGalleryPage()
        .frame(width: 900, height: 700)
}
