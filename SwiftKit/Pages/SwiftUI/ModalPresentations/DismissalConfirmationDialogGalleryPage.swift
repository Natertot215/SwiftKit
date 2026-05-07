import SwiftUI

struct DismissalConfirmationDialogGalleryPage: View {
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

extension DismissalConfirmationDialogGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.dismissalConfirmationDialog",
        title: "DismissalConfirmationDialog",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/dismissalConfirmationDialog(_:shouldPresent:actions:)",
            "View/dismissalConfirmationDialog(_:shouldPresent:actions:message:)"
        ],
        blurb: "Presents a confirmation dialog when the user attempts to dismiss a presentation while there is unsaved or in-flight work. macOS 15+ surface.",
        signature: "func dismissalConfirmationDialog<A>(_ titleKey: LocalizedStringKey, shouldPresent: Bool, @ViewBuilder actions: () -> A) -> some View where A : View",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/modal-presentations/dismissalconfirmationdialog(_:shouldpresent:actions:).md",
        page: { AnyView(DismissalConfirmationDialogGalleryPage()) }
    )
}

#Preview {
    DismissalConfirmationDialogGalleryPage()
        .frame(width: 900, height: 700)
}
