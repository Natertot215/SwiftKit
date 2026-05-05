import SwiftUI

// SwiftUI `SafeAreaRegions` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/safearearegions.md
// macOS 11.0+. OptionSet selector for ignoresSafeArea.

struct SafeAreaRegionsDescribePage: View {
    var body: some View {
        DescribePage(
            title: "SafeAreaRegions",
            docPath: "Documentation/SwiftUI/layout-adjustments/safearearegions.md",
            availability: "macOS 11.0+",
            blurb: """
            An OptionSet that names safe-area regions. Pass values to View/ignoresSafeArea(_:edges:) \
            to control which kind of safe area a view should extend into.

            Static cases:
            \u{2022} .container \u{2014} the safe area enforced by the containing scene (window chrome, \
              titles, sidebars, navigation, tab bars). The default for most ignoresSafeArea calls.
            \u{2022} .keyboard \u{2014} the safe area defined by the software keyboard. iOS/iPadOS-only \
              behavior \u{2014} on macOS the option resolves but has no effect.
            \u{2022} .all \u{2014} every safe-area region. Useful with full-bleed gradients/backgrounds.

            Combine via array literal: .ignoresSafeArea([.container, .keyboard], edges: .bottom).
            """,
            signatures: [
                "@frozen struct SafeAreaRegions: OptionSet",
                "static let container: SafeAreaRegions",
                "static let keyboard: SafeAreaRegions",
                "static let all: SafeAreaRegions",
                ".ignoresSafeArea(.container, edges: .all)"
            ],
            notes: [
                "Conforms to OptionSet, SetAlgebra, ExpressibleByArrayLiteral, RawRepresentable, Sendable.",
                "On macOS, .keyboard is a no-op \u{2014} keep it in cross-platform code if you also target iOS.",
                ".container covers everything except the keyboard \u{2014} prefer it over .all when you don't want to ignore the keyboard region on iOS."
            ]
        )
    }
}

#Preview {
    SafeAreaRegionsDescribePage().frame(width: 900, height: 700)
}
