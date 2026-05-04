import SwiftUI

struct ApplyingCustomFontsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Applying Custom Fonts to Text",
            docPath: "Documentation/SwiftUI/text-input-and-output/applying-custom-fonts-to-text.md",
            availability: "macOS 11.0+",
            blurb: """
            Add and use a font in your app that scales with Dynamic Type.

            ## Overview

            SwiftUI supports styling text views using the built-in fonts, and uses a system font by default. Rather than using a system-provided font, you can use custom fonts by including the font files in your Xcode project. To use a custom font, add the font file that contains your licensed font to your app, and then apply the font to a text view or set it as a default font within a container view. SwiftUI's adaptive text display scales the font automatically using Dynamic Type.

            Dynamic Type allows users to choose the size of textual content displayed onscreen. It helps users who need larger text for better readability and accommodates those who can read smaller text, allowing more information to appear onscreen.

            ## Add the Font Files to the Project

            To add the font files to your Xcode project: drag your fonts from a Finder window into your project, select the font or folder with the fonts, and verify that the files show their target membership checked for your app's targets.

            ## Identify the Font Files to Include in the App Bundle

            For macOS app targets, use the ATSApplicationFontsPath key in your target's Info.plist file, and provide the name of the folder that holds the fonts as the value for that key.

            For iOS, watchOS, tvOS, or Mac Catalyst targets, add the UIAppFonts key to your app's Info.plist file and provide an array of strings containing the relative paths to the added font files.

            ## Apply a Font Supporting Dynamic Sizing

            Use the Font.custom(_:size:) method to retrieve an instance of your font and apply it to a text view with the .font(_:) modifier. When retrieving the font, match the name of the font with the font's PostScript name (find it in Font Book > Font Info tab).

            ```swift
            Text("Hello, world!")
                .font(Font.custom("MyFont", size: 18))
            ```

            Use the relativeTo parameter to specify a text style to scale with other than the default of body:

            ```swift
            Text("Hello, world!")
                .font(Font.custom("MyFont", size: 32, relativeTo: .title))
            ```

            SwiftUI doesn't synthesize bold or italic styling for fonts. If the font supports weighted or italic variants, customize typography using the Font.weight(_:) or Font.italic() modifiers.

            ## Scale Padding Using Scaled Metric

            The @ScaledMetric property wrapper provides a scaled value that changes automatically with accessibility settings. Use it to scale the spacing between or around text to improve the visual design:

            ```swift
            struct ContentView: View {
                @ScaledMetric(relativeTo: .body) var scaledPadding: CGFloat = 10

                var body: some View {
                    Text("The quick brown fox jumps over the lazy dog.")
                        .font(Font.custom("MyFont", size: 18))
                        .padding(scaledPadding)
                        .border(Color.blue)
                }
            }
            ```
            """,
            notes: [
                "Full article: Documentation/SwiftUI/text-input-and-output/applying-custom-fonts-to-text.md",
                "macOS uses ATSApplicationFontsPath in Info.plist; iOS/tvOS use UIAppFonts."
            ]
        )
    }
}

#Preview {
    ApplyingCustomFontsDescribePage()
        .frame(width: 900, height: 900)
}
