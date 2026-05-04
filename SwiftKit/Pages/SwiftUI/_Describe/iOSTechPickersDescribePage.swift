import SwiftUI

// Describe-track page for iOS-Only Technology Pickers & Framework Views.
// Source: Documentation/SwiftUI/technology-specific-views/
// iOS 14.0+. All listed modifiers are iOS-specific — they compile on macOS
// but produce no visible effect or throw a runtime assertion.

struct iOSTechPickersDescribePage: View {
    var body: some View {
        DescribePage(
            title: "iOS-Only Technology Pickers & Framework Views",
            docPath: "Documentation/SwiftUI/technology-specific-views/",
            availability: "iOS 14.0+",
            blurb: """
            This page collects SwiftUI view modifiers that wrap iOS-specific frameworks and hardware \
            features unavailable on macOS 26.

            Screen Time / Family Controls: familyActivityPicker presents the Screen Time activity selector \
            (requires FamilyControls entitlement).

            App Store & MDM: appStoreOverlay promotes a related app inside your app; \
            automatedDeviceEnrollmentAddition presents the MDM enrollment flow.

            Contacts: contactAccessPicker grants per-contact access (iOS 18+); contactAccessButtonStyle \
            and contactAccessButtonCaption style the granted-access button.

            Continuity Camera: continuityDevicePicker surfaces nearby iPhone cameras for Continuity Camera capture.

            Journaling: journalingSuggestionsPicker presents the Journaling Suggestions sheet \
            (JournalingSuggestions framework, iOS 17.2+).

            MapKit: lookAroundViewer embeds a Street View-style Look Around scene; mapFeatureSelection* \
            modifiers style feature selection in a Map.

            StoreKit: manageSubscriptionsSheet and transactionPicker present StoreKit-managed UI; \
            transactionTask runs a background task for unfinished StoreKit transactions.

            Wallet & Apple Pay: payLaterViewAction, payLaterViewDisplayStyle, addOrderToWalletButtonStyle, \
            addPassToWalletButtonStyle, and verifyIdentityWithWalletButtonStyle style Apple Pay Later and \
            Wallet pass buttons.

            Live Activities: activityBackgroundTint and activitySystemActionForegroundColor style Lock \
            Screen Live Activity widgets.

            Game Controller: handlesGameControllerEvents(matching:) opts a view in to game controller input. \
            All are iOS-only.
            """,
            signatures: [
                ".familyActivityPicker(isPresented: $show, selection: $selection) — Screen Time",
                ".familyActivityPicker(headerText:footerText:isPresented:selection:) — with header/footer",
                ".appStoreOverlay(isPresented: $show, configuration: config) — App Store app promo",
                ".automatedDeviceEnrollmentAddition(isPresented: $show) — MDM enrollment",
                ".contactAccessPicker(isPresented: $show, completionHandler: { _ in }) — Contacts",
                ".contactAccessButtonStyle(.large) / .contactAccessButtonCaption(\"…\") — style",
                ".continuityDevicePicker(isPresented: $show, onDidConnect: { _ in }) — Continuity Camera",
                ".journalingSuggestionsPicker(isPresented: $show, onCompletion: { _ in }) — Journaling",
                ".lookAroundViewer(isPresented: $show, scene: scene, …) — MapKit Look Around",
                ".mapFeatureSelectionContent(content:) / .mapFeatureSelectionAccessory(_:) / .mapFeatureSelectionDisabled(_:) — MapKit",
                ".manageSubscriptionsSheet(isPresented: $show) — StoreKit subscriptions",
                ".manageSubscriptionsSheet(isPresented: $show, subscriptionGroupID: \"…\")",
                ".transactionPicker(isPresented: $show, selection: $tx) — StoreKit transaction",
                ".transactionTask(_:action:) — StoreKit background transaction",
                ".payLaterViewAction(.order) / .payLaterViewDisplayStyle(.checkout) — Apple Pay Later",
                ".addOrderToWalletButtonStyle(.automatic) / .addPassToWalletButtonStyle(.automatic) — Wallet",
                ".verifyIdentityWithWalletButtonStyle(.automatic) — Wallet identity",
                ".activityBackgroundTint(color) / .activitySystemActionForegroundColor(color) — Live Activities",
                ".handlesGameControllerEvents(matching: .gamepad) — Game Controller"
            ],
            notes: [
                "All listed modifiers compile on macOS but have no visible effect or throw a runtime assertion.",
                "FamilyActivityPicker requires the com.apple.developer.family-controls entitlement — not available on macOS.",
                "MapKit modifiers (lookAroundViewer, mapFeatureSelection*) require iOS 16+ / visionOS 1+."
            ]
        )
    }
}

#Preview {
    iOSTechPickersDescribePage()
        .frame(width: 900, height: 700)
}
