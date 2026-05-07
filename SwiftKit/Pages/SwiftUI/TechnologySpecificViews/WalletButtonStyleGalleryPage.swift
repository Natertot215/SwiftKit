import SwiftUI

struct WalletButtonStyleGalleryPage: View {
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

extension WalletButtonStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.walletButtonStyle",
        title: "WalletButtonStyle",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/addOrderToWalletButtonStyle(_:)",
            "View/addPassToWalletButtonStyle(_:)",
            "View/verifyIdentityWithWalletButtonStyle(_:)"
        ],
        blurb: "PassKit button styles for adding orders and passes to Wallet, and for verifying identity with Wallet.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/technology-specific-views/addpasstowalletbuttonstyle(_:).md",
        page: { AnyView(WalletButtonStyleGalleryPage()) }
    )
}

#Preview {
    WalletButtonStyleGalleryPage()
        .frame(width: 900, height: 700)
}
