import SwiftUI
import HealthKit

// SwiftUI HealthKit modifiers reference page.
// Covers: healthDataAccessRequest (3 overloads)
// Source: Documentation/SwiftUI/technology-specific-views/

struct HealthKitPage: View {
    // HealthKit requires the com.apple.developer.healthkit entitlement.
    // Live demo is a code snippet — the modifier itself cannot be exercised
    // without a provisioned entitlement at compile time.

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("HealthKit SwiftUI Modifiers")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("healthDataAccessRequest — request HealthKit authorization from a SwiftUI view.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 13.0+ · HealthKit entitlement required")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:)") {
            snippet("""
            @State private var trigger = false

            var body: some View {
                Button("Request HealthKit Access") { trigger.toggle() }
                    .healthDataAccessRequest(
                        store: HKHealthStore(),
                        shareTypes: [HKQuantityType(.stepCount)],
                        readTypes: [HKQuantityType(.stepCount),
                                    HKQuantityType(.heartRate)],
                        trigger: trigger
                    ) { result in
                        switch result {
                        case .success(let granted): handleAuth(granted)
                        case .failure(let error):   showError(error)
                        }
                    }
            }
            """)
            APICallout(".healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:)")
            Text("Apply healthDataAccessRequest to any view in the hierarchy. Toggle trigger to present the authorization sheet. Requires the HealthKit entitlement.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "healthDataAccessRequest — three overloads") {
                snippet("""
                let store = HKHealthStore()

                // 1. Share + Read:
                view.healthDataAccessRequest(
                    store: store,
                    shareTypes: [HKQuantityType(.stepCount)],
                    readTypes: [HKQuantityType(.heartRate)],
                    trigger: $trigger
                ) { result in handleResult(result) }

                // 2. Object type + predicate (for clinical types):
                view.healthDataAccessRequest(
                    store: store,
                    objectType: HKClinicalType(.allergyRecord),
                    predicate: HKQuery.predicateForObjects(from: source),
                    trigger: $trigger
                ) { result in handleResult(result) }

                // 3. Read-only (no share types):
                view.healthDataAccessRequest(
                    store: store,
                    readTypes: [HKQuantityType(.bodyMass)],
                    trigger: $trigger
                ) { result in handleResult(result) }
                """)
                Text("All three overloads present the system HealthKit authorization dialog and call completion when the user responds.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "HKSampleType constants — common types") {
                snippet("""
                // Quantity types:
                HKQuantityType(.stepCount)
                HKQuantityType(.heartRate)
                HKQuantityType(.bodyMass)
                HKQuantityType(.activeEnergyBurned)
                HKQuantityType(.distanceWalkingRunning)
                HKQuantityType(.oxygenSaturation)
                HKQuantityType(.bloodPressureSystolic)

                // Category types:
                HKCategoryType(.sleepAnalysis)
                HKCategoryType(.mindfulSession)

                // Clinical types:
                HKClinicalType(.allergyRecord)
                HKClinicalType(.medicationRecord)
                """)
            }

            Block(title: "Checking authorization status") {
                snippet("""
                let store = HKHealthStore()

                // Check current status before requesting:
                let status = store.authorizationStatus(for: HKQuantityType(.stepCount))
                switch status {
                case .notDetermined:  requestAccess()
                case .sharingAuthorized: readData()
                case .sharingDenied:  showDeniedUI()
                @unknown default: break
                }

                // Check if HealthKit is available:
                guard HKHealthStore.isHealthDataAvailable() else { return }
                """)
                Text("Always check HKHealthStore.isHealthDataAvailable() first — HealthKit is not available on all macOS Macs (only those with Apple silicon running HealthKit-enabled builds, or via iPhone mirroring on macOS).")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("heart.fill", "healthDataAccessRequest is the SwiftUI-native way to request HealthKit authorization. The older HKHealthStore.requestAuthorization(toShare:read:completion:) is AppKit/callback-based.")
            noteRow("lock.fill", "HealthKit requires the com.apple.developer.healthkit entitlement and NSHealthShareUsageDescription / NSHealthUpdateUsageDescription in Info.plist.")
            noteRow("iphone", "On macOS, HealthKit data is available via iPhone mirroring (macOS 15+, Apple silicon). HKHealthStore.isHealthDataAvailable() returns true only in that context.")
            noteRow("trigger", "The trigger parameter is any Equatable value. Toggling a Bool is the most common pattern. The sheet presents each time the value changes (not just on first change).")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    HealthKitPage().frame(width: 1100, height: 800)
}
