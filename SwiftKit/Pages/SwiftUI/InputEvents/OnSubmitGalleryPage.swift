import SwiftUI

struct OnSubmitGalleryPage: View {
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

extension OnSubmitGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.onSubmit",
        title: "OnSubmit",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onSubmit(of:_:)",
            "View/submitScope(_:)",
            "View/submitLabel(_:)",
            "SubmitTriggers",
            "SubmitLabel"
        ],
        blurb: "Adds an action to perform when the user submits a value — pressing Return in a TextField, completing a search, or any other submission trigger. submitScope blocks bubbling; submitLabel customizes the on-screen submit affordance.",
        signature: "func onSubmit(of triggers: SubmitTriggers = .text, _ action: @escaping () -> Void) -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/input-events/onsubmit(of:_:).md",
        page: { AnyView(OnSubmitGalleryPage()) }
    )
}

#Preview {
    OnSubmitGalleryPage()
        .frame(width: 900, height: 700)
}
