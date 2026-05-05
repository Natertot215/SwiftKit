import SwiftUI

// SwiftUI `BlendMode` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/blendmode.md
// macOS 10.15+. Modes for compositing a view with overlapping content.

struct BlendModeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "BlendMode",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/blendmode.md",
            availability: "macOS 10.15+",
            blurb: """
            Enum of compositing modes consumed by View/blendMode(_:). Each mode tells \
            the renderer how the source view's pixels combine with whatever is already \
            drawn beneath them.

            The modes are grouped by intent: darkening (.darken, .multiply, .colorBurn, \
            .plusDarker), lightening (.lighten, .screen, .colorDodge, .plusLighter), \
            contrast (.overlay, .softLight, .hardLight), inversion (.difference, \
            .exclusion), color-component swaps (.hue, .saturation, .color, .luminosity), \
            and Porter-Duff alpha modes (.sourceAtop, .destinationOver, .destinationOut). \
            .normal is the default \u{2014} ordinary source-over compositing.

            BlendMode is a value type (Hashable, Sendable). The visible behavior comes \
            from passing it to View/blendMode(_:) \u{2014} see that page for live demos.
            """,
            signatures: [
                "view.blendMode(.multiply)",
                ".normal, .darken, .lighten, .screen, .multiply, .overlay, ...",
                ".sourceAtop, .destinationOver, .destinationOut // Porter-Duff",
                ".hue, .saturation, .color, .luminosity // component swaps"
            ],
            notes: [
                "Default is .normal (source-over).",
                "Hashable / Sendable value type \u{2014} safe to switch on or store in @State.",
                "Pair with .compositingGroup() to confine the blend's scope to a subtree.",
                ".plusDarker / .plusLighter are macOS-specific additive modes.",
                "Porter-Duff modes are alpha-based, useful for masking and clipping tricks."
            ]
        )
    }
}

#Preview {
    BlendModeDescribePage()
        .frame(width: 900, height: 700)
}
