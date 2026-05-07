import SwiftUI

struct SurroundingsEffectGalleryPage: View {
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

extension SurroundingsEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.surroundingsEffect",
        title: "SurroundingsEffect",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: [
            "SurroundingsEffect",
            "View/preferredSurroundingsEffect(_:)"
        ],
        blurb: "An effect (.dark, .semiDark, .ultraDark, .systemDark, plus colorMultiply / dim) the system can apply to passthrough video in immersive scenes. Apply it via preferredSurroundingsEffect(_:); pass nil to clear a descendant's preference.",
        signature: "struct SurroundingsEffect",
        availability: "macOS 26.0+, visionOS 1.0+",
        docPath: "Documentation/SwiftUI/view-configuration/surroundingseffect.md",
        page: { AnyView(SurroundingsEffectGalleryPage()) }
    )
}

#Preview {
    SurroundingsEffectGalleryPage()
        .frame(width: 900, height: 700)
}
