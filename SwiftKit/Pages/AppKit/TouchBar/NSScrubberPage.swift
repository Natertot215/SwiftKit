import SwiftUI

struct NSScrubberPage: View {
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

extension NSScrubberPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.touchBar.nsScrubber",
        title: "NSScrubber",
        folder: "Touch Bar",
        framework: .appKit,
        absorbedSymbols: [
            "NSScrubber",
            "NSScrubberDataSource",
            "NSScrubberDelegate",
            "NSScrubberItemView",
            "NSScrubberArrangedView",
            "NSScrubberSelectionStyle",
            "NSScrubberSelectionView",
            "NSScrubberTextItemView",
            "NSScrubberFlowLayout",
            "NSScrubberFlowLayoutDelegate",
            "NSScrubberProportionalLayout",
            "NSScrubberLayoutAttributes",
            "NSScrubberLayout"
        ],
        blurb: "A horizontally scrolling, focus-driven control most commonly used in the Touch Bar to present a sequence of items the user can navigate.",
        signature: "class NSScrubber : NSView",
        availability: "macOS 10.12.2+",
        docPath: "Documentation/AppKit/touch-bar/nsscrubber.md",
        page: { AnyView(NSScrubberPage()) }
    )
}

#Preview {
    NSScrubberPage()
        .frame(width: 900, height: 700)
}
