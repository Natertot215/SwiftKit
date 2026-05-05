import SwiftUI

// SwiftUI `EmptyVisualEffect` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/emptyvisualeffect.md
// macOS 14.0+. The base VisualEffect to which additional effects are applied.

struct EmptyVisualEffectDescribePage: View {
    var body: some View {
        DescribePage(
            title: "EmptyVisualEffect",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/emptyvisualeffect.md",
            availability: "macOS 14.0+",
            blurb: """
            A starter VisualEffect that does nothing on its own. EmptyVisualEffect is the \
            placeholder value SwiftUI hands you as the first argument of the visualEffect \
            closure; you call modifier methods on it to compose the effect you want.

            Because EmptyVisualEffect leaves the view unchanged, returning it from a \
            visualEffect closure produces no visible effect at all \u{2014} useful as a \
            no-op branch in a conditional.

            Like its parent protocol, EmptyVisualEffect conforms to Animatable and \
            Sendable. It's a frozen-style value type with a single trivial init().
            """,
            signatures: [
                "EmptyVisualEffect()",
                "view.visualEffect { content, _ in content } // returns the placeholder unchanged",
                "view.visualEffect { content, proxy in proxy.size.width > 200 ? content.scaleEffect(1.1) : content }"
            ],
            notes: [
                "Returned by SwiftUI as the first argument of the visualEffect closure.",
                "Conforms to VisualEffect, Animatable, Sendable.",
                "No visible appearance \u{2014} returning it unchanged is a no-op.",
                "Useful as the no-op branch when conditionally applying effects."
            ]
        )
    }
}

#Preview {
    EmptyVisualEffectDescribePage()
        .frame(width: 900, height: 700)
}
