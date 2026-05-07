import SwiftUI

struct SignInWithAppleButtonStyleGalleryPage: View {
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

extension SignInWithAppleButtonStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.signInWithAppleButtonStyle",
        title: "SignInWithAppleButtonStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: ["View/signInWithAppleButtonStyle(_:)"],
        blurb: "Sets the style used for displaying the Sign in with Apple control via SignInWithAppleButton.Style.",
        signature: "func signInWithAppleButtonStyle(_ style: SignInWithAppleButton.Style) -> some View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/view-styles/signinwithapplebuttonstyle(_:).md",
        page: { AnyView(SignInWithAppleButtonStyleGalleryPage()) }
    )
}

#Preview {
    SignInWithAppleButtonStyleGalleryPage()
        .frame(width: 900, height: 700)
}
