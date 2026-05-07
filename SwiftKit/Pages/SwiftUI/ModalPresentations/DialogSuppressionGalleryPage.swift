import SwiftUI

struct DialogSuppressionGalleryPage: View {
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

extension DialogSuppressionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.dialogSuppression",
        title: "DialogSuppression",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/dialogSuppressionToggle(isSuppressed:)",
            "View/dialogSuppressionToggle(_:isSuppressed:)",
            "Scene/dialogSuppressionToggle(isSuppressed:)",
            "Scene/dialogSuppressionToggle(_:isSuppressed:)"
        ],
        blurb: "Adds a “Don't ask again” toggle to a dialog. Bind to a Boolean that the app persists so future presentations can be skipped.",
        signature: "func dialogSuppressionToggle(isSuppressed: Binding<Bool>) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/modal-presentations/dialogsuppressiontoggle(_:issuppressed:).md",
        page: { AnyView(DialogSuppressionGalleryPage()) }
    )
}

#Preview {
    DialogSuppressionGalleryPage()
        .frame(width: 900, height: 700)
}
