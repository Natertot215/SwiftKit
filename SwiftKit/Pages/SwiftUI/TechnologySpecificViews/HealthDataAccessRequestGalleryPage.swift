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
            ReferenceTile(
                name: "healthDataAccessRequest(store:readTypes:trigger:completion:)",
                signature: "func healthDataAccessRequest(store: HKHealthStore, readTypes: Set<HKObjectType>, trigger: some Equatable, completion: @escaping (Result<Bool, any Error>) -> Void) -> some View",
                note: "Requests authorization to read the supplied HKObjectTypes when the trigger value changes. SwiftUI wrapper around HKHealthStore.requestAuthorization(toShare:read:)."
            )

            ReferenceTile(
                name: "healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:)",
                signature: "func healthDataAccessRequest(store: HKHealthStore, shareTypes: Set<HKSampleType>, readTypes: Set<HKObjectType>?, trigger: some Equatable, completion: @escaping (Result<Bool, any Error>) -> Void) -> some View",
                note: "Combined read + write request. Pass nil for readTypes if you only need write access."
            )

            ReferenceTile(
                name: "healthDataAccessRequest(store:objectType:predicate:trigger:completion:)",
                signature: "func healthDataAccessRequest(store: HKHealthStore, objectType: HKObjectType, predicate: NSPredicate?, trigger: some Equatable, completion: @escaping (Result<Bool, any Error>) -> Void) -> some View",
                note: "Predicate-scoped variant for relevance-based authorization (HealthKit returns only objects matching the predicate the user has authorized)."
            )

            ReferenceTile(
                name: "Required import & entitlement",
                signature: "import HealthKit  //  com.apple.developer.healthkit  +  NSHealthShareUsageDescription / NSHealthUpdateUsageDescription",
                note: "HealthKit entitlement plus Info.plist usage strings are mandatory. macOS support is limited — many sample types are iOS/watchOS only."
            )

            ReferenceTile(
                name: "Trigger pattern",
                signature: "@State var requestAccess = false  →  toggle to fire",
                note: "The modifier compares trigger values for inequality. Toggle a Bool, increment an Int, or use any Equatable. The closure runs once per change."
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
