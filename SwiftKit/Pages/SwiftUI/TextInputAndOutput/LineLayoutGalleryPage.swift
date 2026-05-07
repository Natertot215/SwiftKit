import SwiftUI

// Line layout — wrapping, fitting, alignment, mirroring.
// Each tile shows the same long string with one modifier applied so the delta
// is easy to read.

private let sample = "The quick brown fox jumps over the lazy dog and continues running into the night."
private let shortSample = "The quick brown fox jumps over the lazy dog."

struct LineLayoutGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: lineLimit

            VariantTile(
                name: ".lineLimit(1)",
                api: ".lineLimit(1)"
            ) {
                Text(sample)
                    .lineLimit(1)
                    .frame(width: 180)
            }

            VariantTile(
                name: ".lineLimit(2)",
                api: ".lineLimit(2)"
            ) {
                Text(sample)
                    .lineLimit(2)
                    .frame(width: 180)
            }

            VariantTile(
                name: ".lineLimit(2, reservesSpace: true)",
                api: ".lineLimit(2, reservesSpace: true)"
            ) {
                Text("Single line.")
                    .lineLimit(2, reservesSpace: true)
                    .frame(width: 180)
                    .background(.background.secondary)
            }

            // MARK: truncationMode

            VariantTile(
                name: ".truncationMode(.head)",
                api: ".truncationMode(.head)"
            ) {
                Text(sample)
                    .lineLimit(1)
                    .truncationMode(.head)
                    .frame(width: 180)
            }

            VariantTile(
                name: ".truncationMode(.middle)",
                api: ".truncationMode(.middle)"
            ) {
                Text(sample)
                    .lineLimit(1)
                    .truncationMode(.middle)
                    .frame(width: 180)
            }

            VariantTile(
                name: ".truncationMode(.tail)",
                api: ".truncationMode(.tail)"
            ) {
                Text(sample)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(width: 180)
            }

            // MARK: tightening / scaling

            VariantTile(
                name: ".allowsTightening(true)",
                api: ".allowsTightening(true)"
            ) {
                Text(shortSample)
                    .lineLimit(1)
                    .allowsTightening(true)
                    .frame(width: 160)
            }

            VariantTile(
                name: ".minimumScaleFactor(0.5)",
                api: ".minimumScaleFactor(0.5)"
            ) {
                Text(shortSample)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(width: 160)
            }

            // MARK: spacing & alignment

            VariantTile(
                name: ".lineSpacing(8)",
                api: ".lineSpacing(8)"
            ) {
                Text(sample)
                    .lineSpacing(8)
                    .frame(width: 180)
            }

            VariantTile(
                name: ".multilineTextAlignment(.leading)",
                api: ".multilineTextAlignment(.leading)"
            ) {
                Text(sample)
                    .multilineTextAlignment(.leading)
                    .frame(width: 180)
            }

            VariantTile(
                name: ".multilineTextAlignment(.center)",
                api: ".multilineTextAlignment(.center)"
            ) {
                Text(sample)
                    .multilineTextAlignment(.center)
                    .frame(width: 180)
            }

            VariantTile(
                name: ".multilineTextAlignment(.trailing)",
                api: ".multilineTextAlignment(.trailing)"
            ) {
                Text(sample)
                    .multilineTextAlignment(.trailing)
                    .frame(width: 180)
            }

            // MARK: layout direction

            VariantTile(
                name: ".flipsForRightToLeftLayoutDirection(true)",
                api: ".flipsForRightToLeftLayoutDirection(true)"
            ) {
                HStack(spacing: 12) {
                    Image(systemName: "arrow.right")
                        .flipsForRightToLeftLayoutDirection(true)
                        .environment(\.layoutDirection, .rightToLeft)
                    Text("RTL flipped")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "TextAlignment",
                signature: "enum TextAlignment { case leading, center, trailing }",
                note: "The argument to .multilineTextAlignment(_:). Single-line Text aligns within its frame via .frame(maxWidth:alignment:); multi-line wrapping uses TextAlignment."
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
