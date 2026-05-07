import SwiftUI

struct AccessibilityTextContentTypeGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Demos

            VariantTile(
                name: ".plain (default)",
                api: ".accessibilityTextContentType(.plain)"
            ) {
                Text("The fox jumps over the lazy dog.")
                    .font(.callout)
                    .accessibilityTextContentType(.plain)
            }

            VariantTile(
                name: ".sourceCode",
                api: ".accessibilityTextContentType(.sourceCode)"
            ) {
                Text("let x = foo.bar()")
                    .font(.system(.callout, design: .monospaced))
                    .accessibilityTextContentType(.sourceCode)
            }

            VariantTile(
                name: ".console",
                api: ".accessibilityTextContentType(.console)"
            ) {
                Text("$ xcodebuild build")
                    .font(.system(.callout, design: .monospaced))
                    .accessibilityTextContentType(.console)
            }

            VariantTile(
                name: ".fileSystem",
                api: ".accessibilityTextContentType(.fileSystem)"
            ) {
                Text("/Users/nathan/projects/")
                    .font(.system(.callout, design: .monospaced))
                    .accessibilityTextContentType(.fileSystem)
            }

            VariantTile(
                name: ".messaging",
                api: ".accessibilityTextContentType(.messaging)"
            ) {
                Text("Hey — running 5 min late!")
                    .font(.callout)
                    .accessibilityTextContentType(.messaging)
            }

            VariantTile(
                name: ".narrative",
                api: ".accessibilityTextContentType(.narrative)"
            ) {
                Text("Once upon a time…")
                    .font(.callout)
                    .accessibilityTextContentType(.narrative)
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityTextContentType",
                signature: "struct AccessibilityTextContentType  // .plain, .sourceCode, .console, .fileSystem, .messaging, .narrative, .spreadsheet, .wordProcessing",
                note: "Hints at the structure of the text. VoiceOver tunes pronunciation, punctuation handling, and pause cadence per type."
            )

            ReferenceTile(
                name: "Why it matters",
                signature: "Source code is read literally; narrative is read as prose.",
                note: "Without the hint, VoiceOver pauses at every punctuation mark inside source code. With `.sourceCode`, it preserves the syntactic flow of the language."
            )
        }
    }
}

extension AccessibilityTextContentTypeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityTextContentType",
        title: "AccessibilityTextContentType",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityTextContentType(_:)",
            "AccessibilityTextContentType",
            "swiftui.accessible-descriptions.accessibilitytextcontenttype(_:)",
            "swiftui.accessible-descriptions.accessibilitytextcontenttype"
        ],
        blurb: "Tags the kind of textual content shown by a view — narrative prose, source code, console output, file path, or messaging — so VoiceOver tunes its reading style.",
        signature: "func accessibilityTextContentType(_ value: AccessibilityTextContentType) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-descriptions/accessibilitytextcontenttype(_:).md",
        page: { AnyView(AccessibilityTextContentTypeGalleryPage()) }
    )
}

#Preview {
    AccessibilityTextContentTypeGalleryPage()
        .frame(width: 900, height: 700)
}
