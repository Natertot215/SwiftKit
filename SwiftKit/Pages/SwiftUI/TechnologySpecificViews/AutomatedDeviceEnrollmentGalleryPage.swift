import SwiftUI

struct AutomatedDeviceEnrollmentGalleryPage: View {
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

extension AutomatedDeviceEnrollmentGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.automatedDeviceEnrollment",
        title: "AutomatedDeviceEnrollment",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/automatedDeviceEnrollmentAddition(isPresented:)"
        ],
        blurb: "DeviceManagement modifier that presents an Automated Device Enrollment UI to add a device to an MDM solution.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/automateddeviceenrollmentaddition(ispresented:).md",
        page: { AnyView(AutomatedDeviceEnrollmentGalleryPage()) }
    )
}

#Preview {
    AutomatedDeviceEnrollmentGalleryPage()
        .frame(width: 900, height: 700)
}
