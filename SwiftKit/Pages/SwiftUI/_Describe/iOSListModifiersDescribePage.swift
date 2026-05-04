import SwiftUI

// Describe-track page for iOS / visionOS List Modifiers.
// Source: Documentation/SwiftUI/lists/
// iOS 15.0+ / visionOS 1.0+. These modifiers are unavailable on macOS —
// they compile without error but produce no visible effect.

struct iOSListModifiersDescribePage: View {
    var body: some View {
        DescribePage(
            title: "iOS / visionOS List Modifiers",
            docPath: "Documentation/SwiftUI/lists/",
            availability: "iOS 15.0+ / visionOS 1.0+",
            blurb: """
            These list modifiers are unavailable on macOS. listRowSpacing(_:) controls the gap between \
            adjacent rows within a section — iOS/iPadOS 15.0+ only; on macOS the system controls row \
            spacing. listSectionSpacing(_:) sets the gap between sections, accepting either a CGFloat or a \
            semantic ListSectionSpacing value (.default, .compact) — iOS/iPadOS 17.0+. \
            listSectionMargins(_:_:) adjusts per-section leading and trailing margins on iOS/visionOS 17.0+ \
            (often used to extend content edge-to-edge or add insets). listRowHoverEffect(_:) applies a \
            visionOS-style pointer/eye hover highlight to individual rows; listRowHoverEffectDisabled(_:) \
            opts a row out. All compile on macOS without error but produce no visible effect — macOS list \
            layout is controlled by the AppKit table column system underneath.
            """,
            signatures: [
                ".listRowSpacing(8) — iOS 15.0+: inter-row gap",
                ".listSectionSpacing(16) — iOS 17.0+: inter-section gap",
                ".listSectionSpacing(.compact) — ListSectionSpacing semantic value",
                ".listSectionMargins(.horizontal, 0) — iOS 17.0+: per-axis section margin",
                ".listRowHoverEffect(.highlight) — visionOS row highlight on hover",
                ".listRowHoverEffectDisabled(true) — visionOS: opt row out of hover"
            ],
            notes: [
                "macOS List row and section spacing is not user-configurable from SwiftUI; use NSTableView row sizing if needed.",
                "listRowHoverEffect and listRowHoverEffectDisabled require visionOS 1.0+.",
                "ListSectionSpacing semantic values: .default and .compact — introduced iOS 17 / visionOS 1."
            ]
        )
    }
}

#Preview {
    iOSListModifiersDescribePage()
        .frame(width: 900, height: 700)
}
