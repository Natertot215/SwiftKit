import SwiftUI

struct BreakthroughEffectGalleryPage: View {
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

extension BreakthroughEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.breakthroughEffect",
        title: "BreakthroughEffect",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["BreakthroughEffect"],
        blurb: "Configures how strongly a view breaks through a surrounding immersive scene's passthrough dimming. Cases — .automatic, .none, .subtle, .prominent — give visionOS apps a graded handle on how visible content remains under SurroundingsEffect.",
        signature: "struct BreakthroughEffect",
        availability: "visionOS 26.0+",
        docPath: "Documentation/SwiftUI/view-configuration/breakthrougheffect.md",
        page: { AnyView(BreakthroughEffectGalleryPage()) }
    )
}

#Preview {
    BreakthroughEffectGalleryPage()
        .frame(width: 900, height: 700)
}
