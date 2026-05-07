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
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
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
