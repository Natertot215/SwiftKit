import SwiftUI

struct BuildingRichSwiftUITextExperiencesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Building Rich SwiftUI Text Experiences",
            docPath: "Documentation/SwiftUI/text-input-and-output/building-rich-swiftui-text-experiences.md",
            availability: "macOS 12.0+",
            blurb: """
            Build an editor for formatted text using SwiftUI text editor views and attributed strings.

            ## Overview

            This sample code project is associated with WWDC25 session 280. You can follow along with the code written in the session, learning how to upgrade TextEditor to rich text, build custom controls, and constrain the formatting options the editor provides.

            After the code-along, you can learn more about how to persist rich text using SwiftData, and how to export rich text documents using the Transferable protocol.

            ## Configure the Sample Code Project

            To configure the sample code project, do the following in Xcode:

            1. Open the sample with the latest version of Xcode.
            2. Set the developer team to let Xcode automatically manage the provisioning profile.

            ## See Also

            TextField, textFieldStyle(_:), SecureField, TextEditor — the primitives this article builds on.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/text-input-and-output/building-rich-swiftui-text-experiences.md",
                "Associated with WWDC25 session 280: developer.apple.com/wwdc25/280/"
            ]
        )
    }
}

#Preview {
    BuildingRichSwiftUITextExperiencesDescribePage()
        .frame(width: 900, height: 900)
}
