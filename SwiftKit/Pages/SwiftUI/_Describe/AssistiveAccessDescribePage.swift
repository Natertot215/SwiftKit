import SwiftUI

// Describe-track page for Assistive Access.
// Source: Documentation/SwiftUI/accessible-appearance/assistiveaccess.md
// macOS 15.0+ (compiles; always false on macOS — primary use case is iPhone/Apple Watch).

struct AssistiveAccessDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Assistive Access",
            docPath: "Documentation/SwiftUI/accessible-appearance/assistiveaccess.md",
            availability: "macOS 15.0+",
            blurb: """
            Assistive Access is a simplified iOS / watchOS 10+ mode designed for people with cognitive \
            disabilities. It replaces the standard UI with enlarged buttons, minimal text, and a focused \
            set of apps. SwiftUI exposes it through \\.isAssistiveAccessEnabled — an environment Bool \
            that is true when the device is in Assistive Access mode. Reading it allows your app to adapt \
            its layout (larger tap targets, simplified chrome) to better serve Assistive Access users \
            without being fully replaced. While AccessibilityAssistiveAccess is documented as macOS 15.0+ \
            in the SDK, its primary use case is iPhone and Apple Watch. On macOS, Assistive Access mode \
            does not exist as a system feature; the environment value always returns false.
            """,
            signatures: [
                "AccessibilityAssistiveAccess — namespace for Assistive Access APIs",
                "\\.isAssistiveAccessEnabled — environment Bool"
            ],
            notes: [
                "Assistive Access is enabled in Settings > Accessibility > Assistive Access on iPhone/Apple Watch.",
                "\\.isAssistiveAccessEnabled is false on macOS — the environment value compiles but is never true.",
                "Design guidance: in Assistive Access mode, prefer single large buttons over dense grids."
            ]
        )
    }
}

#Preview {
    AssistiveAccessDescribePage()
        .frame(width: 900, height: 700)
}
