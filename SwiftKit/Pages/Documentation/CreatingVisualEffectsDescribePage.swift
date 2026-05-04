import SwiftUI

struct CreatingVisualEffectsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Creating Visual Effects with SwiftUI",
            docPath: "Documentation/SwiftUI/text-input-and-output/creating-visual-effects-with-swiftui.md",
            availability: "macOS 15.0+",
            blurb: """
            Add scroll effects, rich color treatments, custom transitions, and advanced effects using shaders and a text renderer.

            ## Overview

            This sample code project is associated with WWDC24 session 10151. It demonstrates how to use SwiftUI's visual effect modifiers — visualEffect(_:), layerEffect(_:), and the TextRenderer protocol — to produce rich effects including scroll-linked animations, Metal shader passes, and custom text layout rendering.

            ## Key APIs Covered

            TextAttribute — Custom attributes you can attach to attributed strings to drive TextRenderer behavior.

            textRenderer(_:) — Apply a custom TextRenderer to a view, intercepting SwiftUI's normal text layout pass.

            TextRenderer — Protocol for implementing custom text rendering logic.

            TextProxy — Provides access to the text layout during a custom rendering pass.

            ## See Also

            TextAttribute, textRenderer(_:), TextRenderer, TextProxy — the core APIs this sample exercises.
            """,
            notes: [
                "Full article: Documentation/SwiftUI/text-input-and-output/creating-visual-effects-with-swiftui.md",
                "Associated with WWDC24 session 10151: developer.apple.com/wwdc24/10151/"
            ]
        )
    }
}

#Preview {
    CreatingVisualEffectsDescribePage()
        .frame(width: 900, height: 900)
}
