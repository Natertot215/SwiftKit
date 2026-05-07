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
            ReferenceTile(
                name: "automatedDeviceEnrollmentAddition(isPresented:)",
                signature: "func automatedDeviceEnrollmentAddition(isPresented: Binding<Bool>) -> some View",
                note: "Presents the system Automated Device Enrollment (ADE) flow so an unsupervised device can be added to an MDM solution. The sheet is fully system-driven — there is no developer-supplied UI surface inside it."
            )

            ReferenceTile(
                name: "Required import & entitlement",
                signature: "import DeviceManagement  //  com.apple.developer.devicemanagement.automated-device-enrollment",
                note: "DeviceManagement framework + ADE entitlement. Restricted distribution — Apple gates this entitlement to specific MDM/IT use cases."
            )

            ReferenceTile(
                name: "Use case",
                signature: "MDM-aware admin / kiosk apps",
                note: "Companion to ABM/ASM enrollment. Most consumer apps will never need this; it surfaces here for completeness."
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
