import SwiftUI

// AppKit Views and Controls / Liquid Glass effects describe page.
// Covers: NSGlassEffectView.Style — nested enum on NSGlassEffectView with two
// cases (.regular and .clear) controlling the appearance of the glass effect.
// Source: Documentation/AppKit/views-and-controls/style-swift.enum.md
//
// Why describe rather than render: Style is a value type (an enum). It only
// produces visible output when assigned to NSGlassEffectView.style. The live
// rendering of both cases is on the parent NSGlassEffectView gallery page; this
// page documents the type itself.

struct NSGlassEffectViewStyleDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSGlassEffectView.Style",
            docPath: "Documentation/AppKit/views-and-controls/style-swift.enum.md",
            availability: "macOS 26.0",
            blurb: """
            A nested enum on NSGlassEffectView that selects which glass-effect \
            appearance the view renders. Two cases:

              \u{2022} .regular — the default glass look, denser material, more \
            opacity, suitable for most floating panels and accessory chrome.
              \u{2022} .clear — a more transparent variant that lets more of \
            the underlying composite show through.

            Style is a value type (RawRepresentable, Hashable, Sendable). \
            Assign to NSGlassEffectView.style to swap the look at runtime; the \
            view re-renders without a layout pass.

            Live rendering of both cases is on the NSGlassEffectView gallery \
            page (toggle the "style" picker).
            """,
            signatures: [
                "enum Style",
                "case regular",
                "case clear",
                "init?(rawValue: Int)",
                "// Conforms to: BitwiseCopyable, Equatable, Hashable, RawRepresentable, Sendable"
            ],
            notes: [
                "Nested enum — the Apple doc URL slug uses 'style-swift.enum'. The fully-qualified Swift name is NSGlassEffectView.Style.",
                "Only meaningful in context — assign to NSGlassEffectView.style. There's nothing visual to demo on the type itself.",
                "macOS 26.0 only. Pair with NSGlassEffectView for the live rendering.",
                "Pick .regular by default; pick .clear when the underlying material should remain visible (e.g., glass over a richly-textured backdrop)."
            ]
        )
    }
}

#Preview {
    NSGlassEffectViewStyleDescribePage()
        .frame(width: 900, height: 700)
}
