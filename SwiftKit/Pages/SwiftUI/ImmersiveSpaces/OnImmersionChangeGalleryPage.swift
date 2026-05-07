import SwiftUI

struct OnImmersionChangeGalleryPage: View {
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

extension OnImmersionChangeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.immersiveSpaces.onImmersionChange",
        title: "OnImmersionChange",
        folder: "Immersive spaces",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onImmersionChange(initial:_:)",
            "ImmersionChangeContext",
            "swiftui.immersive-spaces.onimmersionchange(initial:_:)",
            "swiftui.immersive-spaces.immersionchangecontext"
        ],
        blurb: "Performs an action when the immersion state of your app changes. The closure receives ImmersionChangeContext values for the previous and new immersion amount.",
        signature: "nonisolated func onImmersionChange(initial: Bool = true, _ action: @escaping (ImmersionChangeContext, ImmersionChangeContext) -> Void) -> some View",
        availability: "visionOS 2.0+",
        docPath: "Documentation/SwiftUI/immersive-spaces/onimmersionchange(initial:_:).md",
        page: { AnyView(OnImmersionChangeGalleryPage()) }
    )
}

#Preview {
    OnImmersionChangeGalleryPage()
        .frame(width: 900, height: 700)
}
