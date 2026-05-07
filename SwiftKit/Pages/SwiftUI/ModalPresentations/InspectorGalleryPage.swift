import SwiftUI

struct InspectorGalleryPage: View {
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

extension InspectorGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.inspector",
        title: "Inspector",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/inspector(isPresented:content:)",
            "View/inspectorColumnWidth(_:)",
            "View/inspectorColumnWidth(min:ideal:max:)"
        ],
        blurb: "Presents a trailing inspector pane alongside the main content. Width is configurable as a fixed value or a min/ideal/max range.",
        signature: "func inspector<Content>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View where Content : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/inspectors/inspector(ispresented:content:).md",
        page: { AnyView(InspectorGalleryPage()) }
    )
}

#Preview {
    InspectorGalleryPage()
        .frame(width: 900, height: 700)
}
