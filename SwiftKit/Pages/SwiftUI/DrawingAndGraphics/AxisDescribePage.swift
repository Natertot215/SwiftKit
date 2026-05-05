import SwiftUI

// SwiftUI `Axis` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/axis.md
// macOS 10.15+. Enum naming the 2D axes plus an OptionSet for combinations.

struct AxisDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Axis",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/axis.md",
            availability: "macOS 10.15+",
            blurb: """
            The horizontal or vertical dimension in a 2D coordinate system. Axis \
            shows up wherever the framework needs you to pick a direction:

            \u{2022} ScrollView(_:showsIndicators:) takes Axis.Set.
            \u{2022} View/scrollClipDisabled takes Axis.Set.
            \u{2022} View/visualEffect closures receive an Axis when relevant.
            \u{2022} ScrollPosition / ScrollGeometry expose Axis-keyed values.
            \u{2022} HSplitView / VSplitView are the axis-fixed siblings.

            Axis itself has two cases: .horizontal and .vertical. The companion \
            type Axis.Set is an OptionSet that can express "horizontal", \
            "vertical", or "both", which is what most modifiers actually accept \
            so you can say `[.horizontal, .vertical]`.

            CaseIterable / RawRepresentable / CustomStringConvertible / Hashable / \
            Sendable / BitwiseCopyable — heavy conformance package, safe \
            everywhere. The frozen attribute means the cases are stable across \
            OS versions.
            """,
            signatures: [
                "@frozen enum Axis: CaseIterable, RawRepresentable",
                "case horizontal",
                "case vertical",
                "struct Axis.Set: OptionSet",
                "static let horizontal: Axis.Set",
                "static let vertical: Axis.Set"
            ],
            notes: [
                "@frozen enum \u{2014} cases stable across OS versions.",
                "Use Axis.Set ([.horizontal, .vertical]) where modifiers accept combinations.",
                "ScrollView(_:) takes Axis.Set, not Axis \u{2014} `.vertical` is the OptionSet, not the enum.",
                "CaseIterable \u{2014} iterate Axis.allCases to render every case.",
                "Sendable + BitwiseCopyable \u{2014} cheap to pass and store."
            ]
        )
    }
}

#Preview {
    AxisDescribePage().frame(width: 900, height: 700)
}
