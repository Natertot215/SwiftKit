import SwiftUI

// Apple sample-code reference — "Building rich SwiftUI text experiences".
// This is an article + downloadable sample, not a single API; render it
// as a curated list of the APIs the article actually uses.

struct BuildingRichSwiftUITextExperiencesGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "Article overview",
                signature: "// Apple developer article + sample",
                note: "Apple's guide to building a formatted-text editor in SwiftUI using TextEditor with an AttributedString binding, plus an AttributedTextFormattingDefinition that constrains which attributes the editor exposes."
            )

            ReferenceTile(
                name: "TextEditor(text:) with AttributedString",
                signature: "init(text: Binding<AttributedString>)",
                note: "The macOS 15+ initializer that lets TextEditor edit an AttributedString rather than a plain String. Surface is what the article builds around."
            )

            ReferenceTile(
                name: "attributedTextFormattingDefinition(_:)",
                signature: "func attributedTextFormattingDefinition<D: AttributedTextFormattingDefinition>(_:) -> some View",
                note: "Applies an AttributedTextFormattingDefinition to descendant editable text views. The definition's scope and value constraints determine which attributes the system formatting UI exposes."
            )

            ReferenceTile(
                name: "AttributeScopes.SwiftUIAttributes",
                signature: "struct AttributeScopes.SwiftUIAttributes : AttributeScope",
                note: "The default attribute scope used by SwiftUI's text editing surface. Covers foreground color, background color, font, kerning, baseline offset, and the inline formatting attributes (bold, italic, underline, strikethrough)."
            )

            ReferenceTile(
                name: "textInputFormattingControlVisibility(_:for:)",
                signature: "func textInputFormattingControlVisibility(_ visibility: Visibility, for placement: TextInputFormattingControlPlacement) -> some View",
                note: "Hides system-provided formatting controls when you're authoring custom UI. Supplied alongside the formatting-definition surface so apps can choose system UI, custom UI, or both."
            )

            ReferenceTile(
                name: "AttributedTextSelection",
                signature: "struct AttributedTextSelection",
                note: "Selection state for an attributed-text editor. Lets you read or set the active selection range and apply attribute updates programmatically."
            )

            ReferenceTile(
                name: "Availability",
                signature: "// macOS 15.0+ (initial) · macOS 26.0+ (formatting definitions)",
                note: "TextEditor with AttributedString shipped in macOS 15. The AttributedTextFormattingDefinition / AttributedTextValueConstraint protocols arrived in macOS 26."
            )

            ReferenceTile(
                name: "Source",
                signature: "Documentation/SwiftUI/text-input-and-output/building-rich-swiftui-text-experiences.md",
                note: "Local mirror of the Apple article. The downloadable sample is referenced from there."
            )
        }
    }
}

extension BuildingRichSwiftUITextExperiencesGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.buildingRichSwiftUITextExperiences",
        title: "Building rich SwiftUI text experiences",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: ["swiftui.text-input-and-output.building-rich-swiftui-text-experiences"],
        blurb: "Apple sample-code reference: build an editor for formatted text using SwiftUI text editor views and attributed strings.",
        signature: nil,
        availability: nil,
        docPath: "Documentation/SwiftUI/text-input-and-output/building-rich-swiftui-text-experiences.md",
        page: { AnyView(BuildingRichSwiftUITextExperiencesGalleryPage()) }
    )
}

#Preview {
    BuildingRichSwiftUITextExperiencesGalleryPage()
        .frame(width: 900, height: 700)
}
