import SwiftUI

struct PreparingViewsForLocalizationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Preparing Views for Localization",
            docPath: "Documentation/SwiftUI/text-input-and-output/preparing-views-for-localization.md",
            availability: "macOS 11.0+",
            blurb: """
            Specify hints and add strings to localize your SwiftUI views.

            ## Overview

            Localize SwiftUI views so users experience your app in their own native language, region, and culture. Xcode parses SwiftUI views for strings to localize when exporting a localization catalog. You can add hints so that Xcode generates correct, hinted strings to localize for your app.

            For information about string catalogs, see localizing-and-varying-text-with-a-string-catalog.

            ## Add Comments to Text Views

            To ease the translation process, provide hints to translators that share how and where your app displays the strings of a Text view. To add a hint, use the optional comment parameter to the text view initializer Text/init(_:tableName:bundle:comment:):

            ```swift
            Text("Explore",
                 comment: "The title of the tab bar item that navigates to the Explore screen.")
            ```

            Xcode includes the comment string along with the string in your localization catalog.

            ## Provide Additional Information with Text Views

            You can localize many SwiftUI views that have a string label by providing a string that SwiftUI interprets as a LocalizedStringKey. The system uses the key to retrieve a localized value from your string catalog at runtime, or uses the string directly if it can't find the key in the catalog:

            ```swift
            Label("Message", image: "msgSymbol")
            ```

            If you additionally want to provide a comment for localization, you can use an explicit Text view instead:

            ```swift
            Label {
                Text("Message",
                     comment: "A label that displays 'Message' and a corresponding image.")
            } icon: {
                Image("msgSymbol")
            }
            ```

            Many SwiftUI controls have view builder initializers that enable you to follow this pattern.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/text-input-and-output/preparing-views-for-localization.md",
                "Related APIs: LocalizedStringKey, locale, typesettingLanguage(_:isEnabled:), TypesettingLanguage."
            ]
        )
    }
}

#Preview {
    PreparingViewsForLocalizationDescribePage()
        .frame(width: 900, height: 900)
}
