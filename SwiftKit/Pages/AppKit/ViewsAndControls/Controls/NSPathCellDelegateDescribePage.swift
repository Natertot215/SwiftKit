import SwiftUI

// Describe-track page for NSPathCellDelegate.
// Source: Documentation/AppKit/views-and-controls/nspathcelldelegate.md

struct NSPathCellDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSPathCellDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nspathcelldelegate.md",
            availability: "macOS",
            blurb: """
            Two methods that let an NSPathCell delegate customize the .popUp \
            style's two surfaces:

              \u{2022} pathCell(_:willDisplay:) — fires just before the cell \
            shows an NSOpenPanel (when the user picks "Choose…" from the \
            pop-up menu). Mutate the panel's allowedContentTypes, prompt, \
            directoryURL, etc.
              \u{2022} pathCell(_:willPopUp:) — fires just before the pop-up \
            NSMenu appears. Add custom items, hide unwanted ones, change \
            titles.

            Both methods are pop-up-style only — they have no effect when \
            pathStyle is .standard.
            """,
            signatures: [
                "protocol NSPathCellDelegate : NSObjectProtocol",
                "func pathCell(_ pathCell: NSPathCell, willDisplay openPanel: NSOpenPanel)",
                "func pathCell(_ pathCell: NSPathCell, willPopUp menu: NSMenu)"
            ],
            notes: [
                "Set the delegate via NSPathCell.delegate. NSPathControlDelegate provides equivalent control-level hooks (pathControl(_:willDisplay:) / pathControl(_:willPopUp:)) — implement whichever lives at your seam.",
                "The default open panel is configured from the cell's allowedTypes; implementing pathCell(_:willDisplay:) lets you augment that configuration without replacing it.",
                "When the menu is about to pop up, every NSPathComponentCell is already represented as an NSMenuItem. Mutate state on those items in willPopUp."
            ]
        )
    }
}

#Preview {
    NSPathCellDelegateDescribePage().frame(width: 900, height: 700)
}
