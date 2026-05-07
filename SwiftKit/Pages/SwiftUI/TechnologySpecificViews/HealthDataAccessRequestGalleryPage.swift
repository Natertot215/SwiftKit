import SwiftUI

struct HealthDataAccessRequestGalleryPage: View {
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

extension HealthDataAccessRequestGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.healthDataAccessRequest",
        title: "HealthDataAccessRequest",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/healthDataAccessRequest(store:objectType:predicate:trigger:completion:)",
            "View/healthDataAccessRequest(store:readTypes:trigger:completion:)",
            "View/healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:)"
        ],
        blurb: "HealthKit modifier that requests user authorization to read or share specific health data types from a given HKHealthStore.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/healthdataaccessrequest(store:readtypes:trigger:completion:).md",
        page: { AnyView(HealthDataAccessRequestGalleryPage()) }
    )
}

#Preview {
    HealthDataAccessRequestGalleryPage()
        .frame(width: 900, height: 700)
}
