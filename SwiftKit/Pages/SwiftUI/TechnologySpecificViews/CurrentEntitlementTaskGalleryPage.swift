import SwiftUI

struct CurrentEntitlementTaskGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "currentEntitlementTask(for:priority:action:)",
                signature: "func currentEntitlementTask(for productID: Product.ID, priority: TaskPriority = .userInitiated, action: @escaping (EntitlementTaskState<VerificationResult<Transaction>?>) async -> Void) -> some View",
                note: "Runs an async task tied to view lifetime that streams the user's current entitlement for a given product ID. The state value is .loading, .success(value), or .failure(error)."
            )

            ReferenceTile(
                name: "Required import",
                signature: "import StoreKit",
                note: "Wraps Transaction.currentEntitlement(for:) in a SwiftUI-friendly task. Same data, lifecycle managed by the modifier."
            )

            ReferenceTile(
                name: "Pattern",
                signature: ".currentEntitlementTask(for: \"premium.monthly\") { state in … }",
                note: "Use to gate UI on subscription status without manually managing AsyncSequence loops. The task is automatically cancelled when the view disappears and re-runs when the productID changes."
            )

            ReferenceTile(
                name: "EntitlementTaskState",
                signature: "enum EntitlementTaskState<Value> { case loading; case success(Value); case failure(Error) }",
                note: "Inspect the case to decide whether to show a placeholder, the entitled UI, or an error fallback."
            )
        }
    }
}

extension CurrentEntitlementTaskGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.currentEntitlementTask",
        title: "CurrentEntitlementTask",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/currentEntitlementTask(for:priority:action:)"
        ],
        blurb: "StoreKit modifier that runs a task observing the user's current entitlement for a given product identifier.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/currententitlementtask(for:priority:action:).md",
        page: { AnyView(CurrentEntitlementTaskGalleryPage()) }
    )
}

#Preview {
    CurrentEntitlementTaskGalleryPage()
        .frame(width: 900, height: 700)
}
