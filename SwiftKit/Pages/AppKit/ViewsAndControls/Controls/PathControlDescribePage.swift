import SwiftUI

// Article-style describe page for the "Path Control" doc collection.
// Source: Documentation/AppKit/views-and-controls/path-control.md

struct PathControlDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Path Control",
            docPath: "Documentation/AppKit/views-and-controls/path-control.md",
            availability: "macOS",
            blurb: """
            A Path Control displays a file-system path (or any virtual path \
            you supply) as a sequence of breadcrumb-style components, each \
            with an icon and a label. AppKit groups six APIs under this \
            collection — pick the right entry point for what you're doing:

              \u{2022} NSPathControl — the rendered NSControl you embed.
              \u{2022} NSPathControlDelegate — drag-and-drop and pop-up \
            customization hooks.
              \u{2022} NSPathCell — the cell behind NSPathControl; manages a \
            collection of NSPathComponentCell objects.
              \u{2022} NSPathCellDelegate — Open-panel and pop-up menu \
            customization for the popUp style.
              \u{2022} NSPathComponentCell — one segment in the path.
              \u{2022} NSPathControlItem — model object describing a path \
            component (title, image, url) for use with pathItems.

            The renderable surface lives on the NSPathControl page.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/path-control (collection)",
                "View: NSPathControl",
                "Management: NSPathControlDelegate",
                "Cells: NSPathCell, NSPathCellDelegate, NSPathComponentCell, NSPathControlItem"
            ],
            notes: [
                "NSPathControl supports drag-and-drop natively; it registers for filenames + URLs and fires its action when a drop changes the URL.",
                "Three styles: NSPathControl.Style.standard (light blue background, arrow separators), .navigationBar (chevrons, like a small segmented bar), .popUp (looks like NSPopUpButton).",
                "Use pathItems (an array of NSPathControlItem) when the path is virtual — non-file URLs, custom titles, custom images."
            ]
        )
    }
}

#Preview {
    PathControlDescribePage().frame(width: 900, height: 700)
}
