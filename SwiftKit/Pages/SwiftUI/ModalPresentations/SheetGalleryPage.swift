import SwiftUI

struct SheetGalleryPage: View {
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

extension SheetGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.sheet",
        title: "Sheet",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/sheet(isPresented:onDismiss:content:)",
            "View/sheet(item:onDismiss:content:)",
            "View/presentationCompactAdaptation(_:)",
            "View/presentationCompactAdaptation(horizontal:vertical:)",
            "PresentationAdaptation",
            "View/presentationSizing(_:)",
            "PresentationSizing",
            "PresentationSizingRoot",
            "PresentationSizingContext",
            "View/presentationDetents(_:)",
            "View/presentationDetents(_:selection:)",
            "View/presentationContentInteraction(_:)",
            "View/presentationDragIndicator(_:)",
            "PresentationDetent",
            "CustomPresentationDetent",
            "PresentationContentInteraction",
            "View/presentationCornerRadius(_:)",
            "View/presentationBackground(_:)",
            "View/presentationBackground(alignment:content:)",
            "View/presentationBackgroundInteraction(_:)",
            "PresentationBackgroundInteraction",
            "EnvironmentValues/isPresented",
            "View/interactiveDismissDisabled(_:)"
        ],
        blurb: "Presents a modal sheet over the current scene. Companion modifiers configure detents, sizing, background, drag indicator, corner radius, and dismissal behavior.",
        signature: "func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/modal-presentations/sheet(ispresented:ondismiss:content:).md",
        page: { AnyView(SheetGalleryPage()) }
    )
}

#Preview {
    SheetGalleryPage()
        .frame(width: 900, height: 700)
}
