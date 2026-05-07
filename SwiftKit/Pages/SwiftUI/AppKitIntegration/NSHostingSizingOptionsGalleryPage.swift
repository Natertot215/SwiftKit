import SwiftUI

struct NSHostingSizingOptionsGalleryPage: View {
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

extension NSHostingSizingOptionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsHostingSizingOptions",
        title: "NSHostingSizingOptions",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: ["NSHostingSizingOptions"],
        blurb: "Options for how hosting views and controllers reflect their content's size into Auto Layout constraints. OptionSet covering intrinsicContentSize, minSize, maxSize, and the standard combinations.",
        signature: "struct NSHostingSizingOptions",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingsizingoptions.md",
        page: { AnyView(NSHostingSizingOptionsGalleryPage()) }
    )
}

#Preview {
    NSHostingSizingOptionsGalleryPage()
        .frame(width: 900, height: 700)
}
