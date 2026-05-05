import SwiftUI

// SwiftUI `ScrollDismissesKeyboardMode` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrolldismisseskeyboardmode.md
// macOS 13.0+ (the modifier itself, scrollDismissesKeyboard(_:), is iOS-only).

struct ScrollDismissesKeyboardModeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollDismissesKeyboardMode",
            docPath: "Documentation/SwiftUI/scroll-views/scrolldismisseskeyboardmode.md",
            availability: "macOS 13.0+ (type only)",
            blurb: """
            A struct describing how scrollable content interacts with the \
            software keyboard. Pass values of this type to \
            View/scrollDismissesKeyboard(_:) to control whether scrolling \
            should dismiss the on-screen keyboard while text input is active.

            Four cases:
            \u{2022} automatic \u{2014} platform default; on iOS this typically dismisses interactively.
            \u{2022} immediately \u{2014} the keyboard dismisses as soon as scrolling starts.
            \u{2022} interactively \u{2014} the keyboard tracks the scroll gesture, dismissing when it crosses the keyboard's frame.
            \u{2022} never \u{2014} scrolling never dismisses the keyboard.

            On macOS 26 the type is part of the API surface but the matching \
            scrollDismissesKeyboard(_:) modifier targets iOS / iPadOS / \
            watchOS / visionOS where a software keyboard exists. The macOS \
            window-keyboard model uses the system menu / first-responder \
            chain instead.
            """,
            signatures: [
                "struct ScrollDismissesKeyboardMode",
                "static var automatic: ScrollDismissesKeyboardMode",
                "static var immediately: ScrollDismissesKeyboardMode",
                "static var interactively: ScrollDismissesKeyboardMode",
                "static var never: ScrollDismissesKeyboardMode",
                "// usage (iOS/iPadOS/watchOS/visionOS):",
                ".scrollDismissesKeyboard(.interactively)"
            ],
            notes: [
                "Conforms to Equatable, Hashable, Sendable, Copyable.",
                "The type is documented at macOS 13.0+; the .scrollDismissesKeyboard modifier itself is mobile-platform only \u{2014} on macOS the keyboard concept doesn't apply the same way.",
                ".interactively is the iOS Mail / Messages feel \u{2014} keyboard pulled down by drag tracking.",
                ".immediately is heavier-handed and best for large feeds where any drag means \u{201C}done typing.\u{201D}",
                "Pre-13: not available."
            ]
        )
    }
}

#Preview {
    ScrollDismissesKeyboardModeDescribePage().frame(width: 900, height: 700)
}
