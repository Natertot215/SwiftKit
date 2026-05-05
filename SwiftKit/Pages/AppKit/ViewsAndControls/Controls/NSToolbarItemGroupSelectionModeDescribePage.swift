import SwiftUI

// AppKit Views and Controls / Controls describe page.
// Covers: NSToolbarItemGroup.SelectionMode — nested enum that decides how
// a toolbar item group tracks subitem selection.
// Source: Documentation/AppKit/views-and-controls/selectionmode-swift.enum.md
//
// File-name note: collapse the period (NSToolbarItemGroupSelectionMode)
// to keep the Swift type name well-formed; the displayName / apiSignature /
// registry-key keep the period.

struct NSToolbarItemGroupSelectionModeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSToolbarItemGroup.SelectionMode",
            docPath: "Documentation/AppKit/views-and-controls/selectionmode-swift.enum.md",
            availability: "macOS 10.15",
            blurb: """
            A nested enum on NSToolbarItemGroup that decides how the group \
            tracks selection across its subitems:

              \u{2022} .momentary — subitems fire their action and release; \
            no persistent selection state. Use for action clusters \
            ("Cut/Copy/Paste").
              \u{2022} .selectOne — exactly one subitem is selected at a \
            time, like radio buttons. Use for mode pickers (a tab bar, an \
            alignment choice). selectedIndex always points at the active \
            subitem.
              \u{2022} .selectAny — multiple subitems may be selected \
            independently, like checkboxes. Use for orthogonal toggles \
            (Bold + Italic + Underline).

            Set on the group: group.selectionMode = .selectOne. With \
            .selectOne / .selectAny, AppKit drives selection state — query \
            via isSelected(at:) and mutate via setSelected(_:at:) or \
            selectedIndex.
            """,
            signatures: [
                "enum SelectionMode : Int  // nested in NSToolbarItemGroup",
                "case momentary",
                "case selectAny",
                "case selectOne",
                "// Conforms to: BitwiseCopyable, Equatable, Hashable, RawRepresentable, Sendable"
            ],
            notes: [
                "Nested enum, not a renderable view — only meaningful when assigned to NSToolbarItemGroup.selectionMode.",
                ".momentary is the default for plain action clusters. Switch to .selectOne for tab-bar-style toolbar pickers (Mail, Finder), .selectAny for independent toggles.",
                "Pair with NSToolbarItemGroup.controlRepresentation: .selectOne + .expanded gives the visible-radio-row look; .selectOne + .collapsed gives a single popdown that displays the active label."
            ]
        )
    }
}

#Preview {
    NSToolbarItemGroupSelectionModeDescribePage()
        .frame(width: 900, height: 700)
}
