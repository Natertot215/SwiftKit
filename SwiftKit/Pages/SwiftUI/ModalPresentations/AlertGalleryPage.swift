import SwiftUI

struct AlertGalleryPage: View {
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

extension AlertGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.alert",
        title: "Alert",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "ActionSheet",
            "Alert",
            "AlertScene",
            "DialogSeverity",
            "Scene/dialogIcon(_:)",
            "Scene/dialogSeverity(_:)",
            "Scene/dialogSuppressionToggle(_:isSuppressed:)",
            "Scene/dialogSuppressionToggle(isSuppressed:)",
            "View/alert(_:isPresented:actions:)",
            "View/alert(_:isPresented:actions:message:)",
            "View/alert(_:isPresented:presenting:actions:)",
            "View/alert(_:isPresented:presenting:actions:message:)",
            "View/alert(isPresented:error:actions:)",
            "View/alert(isPresented:error:actions:message:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:actions:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:actions:message:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)",
            "View/confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)",
            "View/dialogIcon(_:)",
            "View/dialogSeverity(_:)",
            "View/dialogSuppressionToggle(_:isSuppressed:)",
            "View/dialogSuppressionToggle(isSuppressed:)",
            "View/dismissalConfirmationDialog(_:shouldPresent:actions:)",
            "View/dismissalConfirmationDialog(_:shouldPresent:actions:message:)"
        ],
        blurb: "The SwiftUI dialog family: alerts with title, message, and actions; confirmation dialogs that replace ActionSheet; dismissal confirmation dialogs for unsaved work; plus dialog icon, severity, and a \u{201C}Don\u{2019}t ask again\u{201D} suppression toggle.",
        signature: "alert \u{00b7} confirmationDialog \u{00b7} dismissalConfirmationDialog \u{00b7} dialogIcon \u{00b7} dialogSeverity \u{00b7} dialogSuppressionToggle",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/modal-presentations/alert(_:ispresented:actions:).md",
        page: { AnyView(AlertGalleryPage()) }
    )
}

#Preview {
    AlertGalleryPage()
        .frame(width: 900, height: 700)
}
