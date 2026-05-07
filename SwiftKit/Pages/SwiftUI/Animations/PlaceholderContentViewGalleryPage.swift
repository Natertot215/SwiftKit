import SwiftUI

// PlaceholderContentView — synthesized SwiftUI internal type with no public
// initializers. Reference-only page; document the protocol shape and the
// related "redacted placeholder" affordance most apps actually want.

struct PlaceholderContentViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: What you usually want — redacted placeholders

            VariantTile(
                name: ".redacted(reason: .placeholder)",
                api: ".redacted(reason: .placeholder)"
            ) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Title placeholder")
                        .font(.headline)
                    Text("Subtitle placeholder line")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .redacted(reason: .placeholder)
            }

            VariantTile(
                name: ".unredacted()",
                api: ".unredacted()"
            ) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Real title")
                        .font(.headline)
                        .unredacted()
                    Text("Subtitle placeholder line")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .redacted(reason: .placeholder)
            }

            // MARK: Reference

            ReferenceTile(
                name: "PlaceholderContentView",
                signature: "struct PlaceholderContentView<Value>",
                note: "Synthesized internal type used by SwiftUI when constructing inline modifier, transition, or redaction helpers. Has no public initializers — you don't construct it directly. Conforms to View."
            )

            ReferenceTile(
                name: ".redacted(reason:)",
                signature: "func redacted(reason: RedactionReasons) -> some View",
                note: "Adds a redaction reason to the environment so descendants render placeholder content. The companion environment value @Environment(\\.redactionReasons) lets a view detect the reason set on it."
            )

            ReferenceTile(
                name: "RedactionReasons",
                signature: "struct RedactionReasons : OptionSet",
                note: "Members include .placeholder, .privacy, .invalidated. Use .placeholder while loading, .privacy for sensitive content, .invalidated for stale Widget timelines."
            )

            ReferenceTile(
                name: ".unredacted()",
                signature: "func unredacted() -> some View",
                note: "Removes redaction reasons from this view's environment so a particular subview shows real content even when an ancestor is redacted."
            )
        }
    }
}

extension PlaceholderContentViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.placeholderContentView",
        title: "PlaceholderContentView",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["PlaceholderContentView"],
        blurb: "A placeholder used to construct an inline modifier, transition, or other helper type. SwiftUI synthesizes this type on your behalf — you don't construct it directly.",
        signature: "struct PlaceholderContentView<Value>",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/placeholdercontentview.md",
        page: { AnyView(PlaceholderContentViewGalleryPage()) }
    )
}

#Preview {
    PlaceholderContentViewGalleryPage()
        .frame(width: 900, height: 700)
}
