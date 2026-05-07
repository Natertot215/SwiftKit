import SwiftUI

struct ContinuityDevicePickerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "continuityDevicePicker(isPresented:onDidConnect:)",
                signature: "func continuityDevicePicker(isPresented: Binding<Bool>, onDidConnect: @escaping (AVContinuityDevice?) -> Void) -> some View",
                note: "Presents the Continuity Camera / Continuity Microphone device picker. The closure receives an AVContinuityDevice when the user pairs an iPhone or iPad as an external camera/microphone, or nil if cancelled."
            )

            ReferenceTile(
                name: "Required import",
                signature: "import AVKit",
                note: "AVContinuityDevice and the picker live in AVKit. The hardware path also requires AVCaptureSession-level configuration to actually use the device once connected."
            )

            ReferenceTile(
                name: "Use case",
                signature: "macOS apps that capture iPhone video/audio",
                note: "Streaming, broadcasting, video conferencing, and AR creation tools that want to leverage the user's iPhone as a higher-quality camera while running on Mac."
            )

            ReferenceTile(
                name: "Platform availability",
                signature: "macOS 14.0+ \u{00b7} iPadOS 17+",
                note: "Continuity Camera requires both devices on a recent OS, signed into the same Apple ID, with Wi-Fi and Bluetooth on."
            )
        }
    }
}

extension ContinuityDevicePickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.continuityDevicePicker",
        title: "ContinuityDevicePicker",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/continuityDevicePicker(isPresented:onDidConnect:)"
        ],
        blurb: "AVKit Continuity Device Picker that lets users connect a nearby iPhone or iPad as an external camera/microphone.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/continuitydevicepicker(ispresented:ondidconnect:).md",
        page: { AnyView(ContinuityDevicePickerGalleryPage()) }
    )
}

#Preview {
    ContinuityDevicePickerGalleryPage()
        .frame(width: 900, height: 700)
}
