import SwiftUI

// Describe-track page for offerCodeRedemption (StoreKit).
// Source: Documentation/SwiftUI/technology-specific-views/offercoderedemption.md
// iOS 14.0+ only — macOS does not expose an in-app offer code sheet.

struct OfferCodeRedemptionDescribePage: View {
    var body: some View {
        DescribePage(
            title: "offerCodeRedemption (StoreKit)",
            docPath: "Documentation/SwiftUI/technology-specific-views/offercoderedemption.md",
            availability: "iOS 14.0+",
            blurb: """
            .offerCodeRedemption(isPresented:onCompletion:) presents the system sheet for redeeming a \
            StoreKit subscription offer code. When isPresented becomes true, the system displays a \
            full-screen sheet where the user enters an offer code (the alphanumeric code distributed via \
            marketing campaigns or support). The onCompletion closure receives a Result<Void, Error> \
            when the sheet dismisses — .success means the code was redeemed successfully; .failure \
            carries the SKError if redemption failed or was cancelled. This is an iOS-only modifier — \
            macOS handles offer code redemption through the App Store app rather than in-app UI.
            """,
            signatures: [
                ".offerCodeRedemption(isPresented: $show, onCompletion: { result in … })"
            ],
            notes: [
                "iOS 14.0+ only — macOS does not have an in-app offer code redemption sheet.",
                "Requires StoreKit 2 and an active subscription product group with configured offer codes.",
                "The onCompletion closure may receive .failure(SKError.paymentCancelled) if the user dismisses."
            ]
        )
    }
}

#Preview {
    OfferCodeRedemptionDescribePage()
        .frame(width: 900, height: 700)
}
