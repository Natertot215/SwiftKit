import SwiftUI

// SwiftUI `ScrollInputKind` describe page.
// Source: Documentation/SwiftUI/scroll-views/scrollinputkind.md
// macOS 15.0+.

struct ScrollInputKindDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ScrollInputKind",
            docPath: "Documentation/SwiftUI/scroll-views/scrollinputkind.md",
            availability: "macOS 15.0+",
            blurb: """
            A struct identifying a kind of input that scrolls a view. You pass \
            a value of this type to scrollInputBehavior(_:for:) to scope a \
            behavior change to one input source.

            Public values:
            \u{2022} handGestureShortcut \u{2014} the watchOS double-tap \
              \u{201C}hand gesture shortcut.\u{201D} On a Watch, scrolling can be \
              driven via crown, touch, or this gesture; this kind targets the \
              gesture in particular.
            \u{2022} look \u{2014} the visionOS look-to-scroll input. Use \
              ScrollInputKind.look to target both axes, or look(axes:) to \
              scope to one.

            Both shipping values target non-macOS platforms. On macOS, the \
            type compiles but no macOS-specific kind is currently exposed, \
            so scrollInputBehavior(_:for:) has no observable macOS effect at \
            present.
            """,
            signatures: [
                "struct ScrollInputKind",
                "static var handGestureShortcut: ScrollInputKind",
                "static var look: ScrollInputKind",
                "static func look(axes: Axis.Set) -> ScrollInputKind"
            ],
            notes: [
                "Conforms to Equatable, Sendable.",
                "look(axes:) is the only generative form \u{2014} the others are static stored values.",
                "Despite the macOS 15+ availability, no macOS-targeted ScrollInputKind has shipped. Future SDKs may add one (e.g. trackpad vs mouse-wheel separation) without changing this type's signature.",
                "Pre-15: not available."
            ]
        )
    }
}

#Preview {
    ScrollInputKindDescribePage().frame(width: 900, height: 700)
}
