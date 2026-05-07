import SwiftUI

struct MonospacedGalleryPage: View {
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

extension MonospacedGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.monospaced",
        title: "Monospaced",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.monospaced(_:)",
            "swiftui.text-input-and-output.monospaceddigit()"
        ],
        blurb: "Modifies the fonts of all child views to use the fixed-width variant of the current font; companion modifier swaps in fixed-width digits while leaving other characters proportional.",
        signature: "func monospaced(_ isActive: Bool = true) -> some View · func monospacedDigit() -> some View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/monospaced(_:).md",
        page: { AnyView(MonospacedGalleryPage()) }
    )
}

#Preview {
    MonospacedGalleryPage()
        .frame(width: 900, height: 700)
}
