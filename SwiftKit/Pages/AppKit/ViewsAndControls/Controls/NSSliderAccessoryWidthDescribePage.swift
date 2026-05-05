import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSSliderAccessory.Width — nested value type controlling how
// much horizontal space a slider accessory occupies in its slot.
// Source: Documentation/AppKit/views-and-controls/width.md

struct NSSliderAccessoryWidthDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSSliderAccessory.Width",
            docPath: "Documentation/AppKit/views-and-controls/width.md",
            availability: "macOS 10.12.2 \u{00b7} iOS 13.0+",
            blurb: """
            Sizes the slot that a slider accessory occupies. \
            NSSliderAccessory.Width is a RawRepresentable Hashable struct \
            with two predefined values and a raw initializer for custom \
            point widths.

            Predefined values:

              \u{2022} .default — a compact, square-ish slot for small \
            iconography (the tortoise/hare style).
              \u{2022} .wide — a roomier slot for larger artwork or text.

            For custom sizes, init(_ rawValue: CGFloat) lets you specify \
            a literal width. The accessory's image is then centered and \
            scaled inside that slot.
            """,
            signatures: [
                "struct NSSliderAccessory.Width : RawRepresentable, Hashable, Sendable",
                "static let `default`: NSSliderAccessory.Width",
                "static let wide: NSSliderAccessory.Width",
                "init(_ rawValue: CGFloat)",
                "init(rawValue: CGFloat)"
            ],
            notes: [
                "Type, not a view — only meaningful when configuring a slider accessory's slot.",
                "Use .default for icon-sized affordances and .wide for larger images.",
                "Custom raw values let you fit specific artwork dimensions."
            ]
        )
    }
}

#Preview {
    NSSliderAccessoryWidthDescribePage()
        .frame(width: 900, height: 700)
}
