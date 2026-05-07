import SwiftUI

struct OnCameraCaptureEventGalleryPage: View {
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

extension OnCameraCaptureEventGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.onCameraCaptureEvent",
        title: "OnCameraCaptureEvent",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onCameraCaptureEvent(isEnabled:action:)",
            "View/onCameraCaptureEvent(isEnabled:primaryAction:secondaryAction:)"
        ],
        blurb: "Receives hardware camera-capture button events on devices that surface them — primary and secondary action overloads cover single- and dual-button hardware.",
        signature: "func onCameraCaptureEvent(isEnabled: Bool = true, action: @escaping (AVCaptureEvent) -> Void) -> some View",
        availability: "iOS 17.2+",
        docPath: "Documentation/SwiftUI/input-events/oncameracaptureevent(isenabled:action:).md",
        page: { AnyView(OnCameraCaptureEventGalleryPage()) }
    )
}

#Preview {
    OnCameraCaptureEventGalleryPage()
        .frame(width: 900, height: 700)
}
