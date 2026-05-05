import SwiftUI

// SwiftUI `MaterialActiveAppearance` describe page (the value type, not the modifier).
// Source: Documentation/SwiftUI/drawing-and-graphics/materialactiveappearance.md
// macOS 15.0+. Three-case value passed to .materialActiveAppearance(_:) and .containerBackground.

struct MaterialActiveAppearanceDescribePage: View {
    var body: some View {
        DescribePage(
            title: "MaterialActiveAppearance",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/materialactiveappearance.md",
            availability: "macOS 15.0+",
            blurb: """
            A value type describing how materials should behave when their containing window \
            transitions between active and inactive. Three cases:

            • .automatic — the default. Window-container and bar materials dim when the \
            window deactivates; other materials always look active.
            • .active — always render the bright/active variant, regardless of window state.
            • .inactive — always render the dimmed/inactive variant.

            MaterialActiveAppearance is consumed by the View/materialActiveAppearance(_:) \
            modifier and by Material's chained .materialActiveAppearance(_:) method when \
            building a value for .containerBackground(_:for:). It has no own visible \
            appearance — see View/materialActiveAppearance(_:) for live demos.
            """,
            signatures: [
                "MaterialActiveAppearance.automatic",
                "MaterialActiveAppearance.active",
                "MaterialActiveAppearance.inactive",
                ".materialActiveAppearance(.active)",
                ".containerBackground(Material.regular.materialActiveAppearance(.active), for: .window)"
            ],
            notes: [
                "Value type with three cases — .automatic, .active, .inactive.",
                "Used by View/materialActiveAppearance(_:) and Material's chained .materialActiveAppearance(_:) builder.",
                "macOS 15+ only — earlier OSes only expose the default (window-tracking) behavior."
            ]
        )
    }
}

#Preview { MaterialActiveAppearanceDescribePage().frame(width: 900, height: 700) }
