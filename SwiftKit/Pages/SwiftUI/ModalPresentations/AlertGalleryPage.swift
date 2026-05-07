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
            "View/alert(_:isPresented:actions:)",
            "View/alert(_:isPresented:actions:message:)",
            "View/alert(_:isPresented:presenting:actions:)",
            "View/alert(_:isPresented:presenting:actions:message:)",
            "View/alert(isPresented:error:actions:)",
            "View/alert(isPresented:error:actions:message:)",
            "View/dialogIcon(_:)",
            "Scene/dialogIcon(_:)",
            "View/dialogSeverity(_:)",
            "Scene/dialogSeverity(_:)",
            "DialogSeverity",
            "AlertScene",
            "Alert"
        ],
        blurb: "Presents a system alert with title, message, action buttons, optional dialog icon, and optional severity. Bind to a Boolean, an item, or a LocalizedError.",
        signature: "func alert<A>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where A : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/modal-presentations/alert(_:ispresented:actions:).md",
        page: { AnyView(AlertGalleryPage()) }
    )
}

#Preview {
    AlertGalleryPage()
        .frame(width: 900, height: 700)
}
