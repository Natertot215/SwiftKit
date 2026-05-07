import SwiftUI

struct LineLayoutGalleryPage: View {
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

extension LineLayoutGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.lineLayout",
        title: "Line Layout",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.truncationmode(_:)",
            "swiftui.text-input-and-output.allowstightening(_:)",
            "swiftui.text-input-and-output.minimumscalefactor(_:)",
            "swiftui.text-input-and-output.linelimit(_:)",
            "swiftui.text-input-and-output.linelimit(_:reservesspace:)",
            "swiftui.text-input-and-output.linespacing(_:)",
            "swiftui.text-input-and-output.multilinetextalignment(_:)",
            "swiftui.text-input-and-output.textalignment",
            "swiftui.text-input-and-output.flipsforrighttoleftlayoutdirection(_:)"
        ],
        blurb: "How text wraps, fits, and aligns within its container — line limits, truncation, tightening, scaling, line spacing, multiline alignment, and right-to-left mirroring.",
        signature: "func lineLimit · func truncationMode · func allowsTightening · func minimumScaleFactor · func lineSpacing · func multilineTextAlignment · enum TextAlignment",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/text-input-and-output/linelimit(_:).md",
        page: { AnyView(LineLayoutGalleryPage()) }
    )
}

#Preview {
    LineLayoutGalleryPage()
        .frame(width: 900, height: 700)
}
