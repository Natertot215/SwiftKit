import SwiftUI

struct ViewModifierGalleryPage: View {
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

extension ViewModifierGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.viewModifier",
        title: "ViewModifier",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: [
            "ViewModifier",
            "View/modifier(_:)",
            "Reducing view modifier maintenance",
            "EmptyModifier",
            "ModifiedContent",
            "EnvironmentalModifier"
        ],
        blurb: "A modifier that you apply to a view or another view modifier, producing a different version of the original value. Bundle reusable modifier groups behind a ViewModifier conformance and apply them with the modifier(_:) method.",
        signature: "@MainActor @preconcurrency protocol ViewModifier",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/viewmodifier.md",
        page: { AnyView(ViewModifierGalleryPage()) }
    )
}

#Preview {
    ViewModifierGalleryPage()
        .frame(width: 900, height: 700)
}
