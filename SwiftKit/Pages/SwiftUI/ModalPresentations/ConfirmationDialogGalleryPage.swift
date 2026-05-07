import SwiftUI

struct ConfirmationDialogGalleryPage: View {
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

extension ConfirmationDialogGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.confirmationDialog",
        title: "ConfirmationDialog",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/confirmationDialog(_:isPresented:titleVisibility:actions:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:actions:message:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)",
            "ActionSheet"
        ],
        blurb: "Presents a confirmation dialog. Replaces the deprecated ActionSheet with a buttons-and-message API that adapts to platform conventions.",
        signature: "func confirmationDialog<A>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A) -> some View where A : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/modal-presentations/confirmationdialog(_:ispresented:titlevisibility:actions:).md",
        page: { AnyView(ConfirmationDialogGalleryPage()) }
    )
}

#Preview {
    ConfirmationDialogGalleryPage()
        .frame(width: 900, height: 700)
}
