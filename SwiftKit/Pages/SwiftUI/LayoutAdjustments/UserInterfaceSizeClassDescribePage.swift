import SwiftUI

// SwiftUI `UserInterfaceSizeClass` describe page.
// Source: Documentation/SwiftUI/layout-adjustments/userinterfacesizeclass.md
// macOS 10.15+. Enum — visual size class of the available area.

struct UserInterfaceSizeClassDescribePage: View {
    var body: some View {
        DescribePage(
            title: "UserInterfaceSizeClass",
            docPath: "Documentation/SwiftUI/layout-adjustments/userinterfacesizeclass.md",
            availability: "macOS 10.15+",
            blurb: """
            An enum that indicates the visual size class available to a view, on each axis. Read \
            via @Environment(\\.horizontalSizeClass) or @Environment(\\.verticalSizeClass).

            Cases:
            \u{2022} .compact \u{2014} a constrained dimension. iPhone in portrait, narrow split \
              views, Slide Over scenarios on iPad.
            \u{2022} .regular \u{2014} a roomy dimension. iPad full-screen, Mac windows, iPhone \
              landscape on larger devices for the horizontal axis.

            On macOS the values resolve as follows: horizontalSizeClass and verticalSizeClass are \
            both .regular for any normal-sized window. The size class is mostly an iOS construct \
            \u{2014} on Mac it's exposed for cross-platform code that branches on size class \
            (e.g., NavigationStack vs NavigationSplitView selection).
            """,
            signatures: [
                "enum UserInterfaceSizeClass",
                "case compact",
                "case regular",
                "@Environment(\\.horizontalSizeClass) var hSizeClass",
                "@Environment(\\.verticalSizeClass) var vSizeClass"
            ],
            notes: [
                "Conforms to Equatable, Hashable, CaseIterable, Sendable.",
                "On macOS both axes report .regular for normal-sized windows; truly cramped windows behave the same \u{2014} unlike iPad, macOS doesn't switch to .compact at narrow widths.",
                "For platform-conditional layout, prefer reading size class over hardcoding device checks \u{2014} cross-platform code stays clean.",
                "Read with the optional unwrap pattern: `if hSizeClass == .compact { ... }` \u{2014} the environment value type is `UserInterfaceSizeClass?`."
            ]
        )
    }
}

#Preview {
    UserInterfaceSizeClassDescribePage().frame(width: 900, height: 700)
}
