import SwiftUI

// SwiftUI `Alignment` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/alignment.md
// macOS 10.15+. Value type — combined HorizontalAlignment + VerticalAlignment.

struct AlignmentDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Alignment",
            docPath: "Documentation/SwiftUI/layout-adjustments/alignment.md",
            availability: "macOS 10.15+",
            blurb: """
            A 2D alignment value, formed from one HorizontalAlignment and one VerticalAlignment. \
            Use Alignment values with ZStack, frame(_:_:alignment:), and overlay/background \
            placement.

            Built-in static values map every combination of horizontal × vertical:
            \u{2022} .topLeading, .top, .topTrailing
            \u{2022} .leading, .center, .trailing
            \u{2022} .bottomLeading, .bottom, .bottomTrailing

            Construct a custom Alignment by passing a HorizontalAlignment and VerticalAlignment \
            to the initializer; both can be custom AlignmentID-backed values.
            """,
            signatures: [
                "struct Alignment { let horizontal: HorizontalAlignment; let vertical: VerticalAlignment }",
                "Alignment(horizontal: .leading, vertical: .top)",
                "static let center: Alignment  //  .topLeading  .top  .topTrailing  .leading  .trailing  .bottomLeading  .bottom  .bottomTrailing",
                "ZStack(alignment: .topTrailing) { ... }",
                ".frame(maxWidth: .infinity, alignment: .leading)"
            ],
            notes: [
                "Conforms to Equatable, Sendable.",
                "Anchor variants (.leadingFirstTextBaseline, .leadingLastTextBaseline, etc.) align horizontally to one edge and vertically to a text baseline.",
                "Custom AlignmentID values participate by passing them to Alignment(horizontal:vertical:)."
            ]
        )
    }
}

#Preview {
    AlignmentDescribePage().frame(width: 900, height: 700)
}
