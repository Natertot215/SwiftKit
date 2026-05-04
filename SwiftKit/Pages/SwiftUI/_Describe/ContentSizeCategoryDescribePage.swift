import SwiftUI

// Describe-track page for ContentSizeCategory (deprecated).
// Source: Documentation/SwiftUI/text-input-and-output/contentsizecategory.md
// macOS 10.15+; deprecated in macOS 14.0 / iOS 17.0.

struct ContentSizeCategoryDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ContentSizeCategory (Deprecated)",
            docPath: "Documentation/SwiftUI/text-input-and-output/contentsizecategory.md",
            availability: "macOS 10.15+ (deprecated in macOS 14.0)",
            blurb: """
            ContentSizeCategory was SwiftUI's original way to read the Dynamic Type size preference. It \
            exposes the user's chosen text size as one of thirteen enum cases from .extraSmall through \
            .accessibilityExtraExtraExtraLarge. Accessing it via @Environment(\\.sizeCategory) was \
            deprecated in macOS 14.0 / iOS 17.0. The replacement is @Environment(\\.dynamicTypeSize) \
            which returns a DynamicTypeSize enum with the same semantic range but a cleaner API and \
            explicit .isAccessibilitySize property. ContentSizeCategory remains in the SDK for source \
            compatibility.
            """,
            signatures: [
                "@Environment(\\.sizeCategory) var sizeCategory: ContentSizeCategory — deprecated",
                "ContentSizeCategory.large — default system size",
                "ContentSizeCategory.accessibilityExtraExtraExtraLarge — largest"
            ],
            notes: [
                "Replace @Environment(\\.sizeCategory) with @Environment(\\.dynamicTypeSize) in new code.",
                "DynamicTypeSize.isAccessibilitySize is true for the five largest accessibility sizes.",
                "ContentSizeCategory is kept for Objective-C / UIKit bridge compatibility."
            ]
        )
    }
}

#Preview {
    ContentSizeCategoryDescribePage()
        .frame(width: 900, height: 700)
}
