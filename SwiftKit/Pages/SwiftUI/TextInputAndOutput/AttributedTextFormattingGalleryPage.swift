import SwiftUI

// AttributedTextFormatting — namespace + protocol surface introduced in
// macOS 26. Used to constrain how AttributedString renders in TextEditor /
// Text. SwiftKit treats this as reference-only; conformers belong in app code.

struct AttributedTextFormattingGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "AttributedTextFormatting",
                signature: "enum AttributedTextFormatting",
                note: "A namespace for types related to attributed text formatting definitions. Hosts AnyDefinition, AttributeContainerProxy, DefinitionBuilder, EmptyDefinition, Transferable, TupleDefinition, and ValueConstraint as nested types."
            )

            ReferenceTile(
                name: "AttributedTextFormattingDefinition",
                signature: "protocol AttributedTextFormattingDefinition<Scope>",
                note: "Defines how text can be styled in a view. Pairs an attribute scope (typically AttributeScopes.SwiftUIAttributes) with one or more value constraints. Apply via .attributedTextFormattingDefinition(_:)."
            )

            ReferenceTile(
                name: "AttributedTextValueConstraint",
                signature: "protocol AttributedTextValueConstraint : Hashable, Sendable, AttributedTextFormattingDefinition",
                note: "Constrains the value an attribute can take inside an editable AttributedString. Implement constrain(_:) to clamp, fix, or reject values — for example, force contact-annotated runs to render purple."
            )

            ReferenceTile(
                name: "DefinitionBuilder",
                signature: "@resultBuilder struct AttributedTextFormatting.DefinitionBuilder",
                note: "Result builder used in the body of a custom AttributedTextFormattingDefinition. Concatenates multiple AttributedTextValueConstraints into a single TupleDefinition."
            )

            ReferenceTile(
                name: "EmptyDefinition",
                signature: "struct AttributedTextFormatting.EmptyDefinition",
                note: "The do-nothing definition. Use as a placeholder until you author real constraints."
            )

            ReferenceTile(
                name: "TupleDefinition",
                signature: "struct AttributedTextFormatting.TupleDefinition",
                note: "Result of combining multiple constraints via DefinitionBuilder. You don't construct this directly — the result builder produces it."
            )

            ReferenceTile(
                name: "AttributeContainerProxy",
                signature: "struct AttributedTextFormatting.AttributeContainerProxy",
                note: "Read/write proxy onto an AttributeContainer scoped to the formatting definition's scope. Passed to AttributedTextValueConstraint.constrain(_:)."
            )

            ReferenceTile(
                name: "Availability",
                signature: "// macOS 26.0+",
                note: "Introduced in macOS 26 alongside SwiftUI's expanded attributed-text editing surface (TextEditor with AttributedString backing).",
                badge: "macOS 26"
            )
        }
    }
}

extension AttributedTextFormattingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.attributedTextFormatting",
        title: "AttributedTextFormatting",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.attributedtextformatting",
            "swiftui.text-input-and-output.attributedtextformattingdefinition",
            "swiftui.text-input-and-output.attributedtextvalueconstraint"
        ],
        blurb: "A namespace for types related to attributed text formatting definitions, plus the AttributedTextFormattingDefinition protocol and the AttributedTextValueConstraint protocol.",
        signature: "enum AttributedTextFormatting · protocol AttributedTextFormattingDefinition · protocol AttributedTextValueConstraint",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/attributedtextformatting.md",
        page: { AnyView(AttributedTextFormattingGalleryPage()) }
    )
}

#Preview {
    AttributedTextFormattingGalleryPage()
        .frame(width: 900, height: 700)
}
