import SwiftUI

// Describe-track page for NSPathControlItem.
// Source: Documentation/AppKit/views-and-controls/nspathcontrolitem.md

struct NSPathControlItemDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSPathControlItem",
            docPath: "Documentation/AppKit/views-and-controls/nspathcontrolitem.md",
            availability: "macOS 10.10+",
            blurb: """
            A model object that describes one component in an NSPathControl. \
            Unlike NSPathComponentCell, NSPathControlItem is not a cell — it \
            doesn't draw anything itself. Instead, populate \
            NSPathControl.pathItems with an array of these objects to display \
            a virtual path (URLs that aren't files, custom titles, custom \
            images).

            Properties:

              \u{2022} title — visible label (plain string).
              \u{2022} attributedTitle — visible label with rich attributes.
              \u{2022} image — leading icon.
              \u{2022} url — URL that the item represents (any scheme).
            """,
            signatures: [
                "class NSPathControlItem : NSObject",
                "var title: String",
                "var attributedTitle: NSAttributedString",
                "var image: NSImage?",
                "var url: URL?"
            ],
            notes: [
                "Use NSPathControl.pathItems = [...] to set a virtual path. Use NSPathControl.url = ... when the path IS a file system URL — that path automatically generates NSPathControlItem instances.",
                "NSPathControl.clickedPathItem returns the item the user clicked when the action fires. This is the modern equivalent of NSPathCell.clickedPathComponentCell.",
                "Setting either title or attributedTitle updates the other; they are two views of the same underlying string."
            ]
        )
    }
}

#Preview {
    NSPathControlItemDescribePage().frame(width: 900, height: 700)
}
