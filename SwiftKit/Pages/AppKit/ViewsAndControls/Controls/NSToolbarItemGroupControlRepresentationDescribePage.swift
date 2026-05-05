import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSToolbarItemGroup.ControlRepresentation — nested enum that
// decides whether a toolbar item group renders as a row of buttons or
// collapses into a single popdown.
// Source: Documentation/AppKit/views-and-controls/controlrepresentation-swift.enum.md
//
// File-name note: collapse the period (NSToolbarItemGroupControlRepresentation)
// to keep the Swift type name well-formed; the displayName / apiSignature /
// registry-key keep the period.

struct NSToolbarItemGroupControlRepresentationDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSToolbarItemGroup.ControlRepresentation",
            docPath: "Documentation/AppKit/views-and-controls/controlrepresentation-swift.enum.md",
            availability: "macOS 10.15",
            blurb: """
            A nested enum on NSToolbarItemGroup that decides how the system \
            renders the group:

              \u{2022} .automatic — let AppKit choose between expanded and \
            collapsed based on available toolbar space and the system's \
            sizing heuristics. Default.
              \u{2022} .expanded — render every subitem as a separate visible \
            button in the toolbar. Best for small clusters (2\u{2013}3 items) \
            where direct access matters.
              \u{2022} .collapsed — render a single button that opens a \
            popover/menu containing the subitems. Best when the group has \
            many items, or when window width is tight.

            Set on the group: \
            group.controlRepresentation = .automatic. AppKit re-evaluates \
            the chosen representation when the toolbar resizes or when the \
            user customizes it.
            """,
            signatures: [
                "enum ControlRepresentation : Int  // nested in NSToolbarItemGroup",
                "case automatic",
                "case collapsed",
                "case expanded",
                "// Conforms to: BitwiseCopyable, Equatable, Hashable, RawRepresentable, Sendable"
            ],
            notes: [
                "Nested enum, not a renderable view — only meaningful when assigned to NSToolbarItemGroup.controlRepresentation.",
                ".automatic is the right default for most clusters; only force .expanded or .collapsed when you have a specific reason to lock the rendering.",
                "AppKit re-evaluates the layout on toolbar resize when set to .automatic — don't snapshot the current rendering and assume it's stable."
            ]
        )
    }
}

#Preview {
    NSToolbarItemGroupControlRepresentationDescribePage()
        .frame(width: 900, height: 700)
}
