import SwiftUI

// Describe-track page for NSPathComponentCell.
// Source: Documentation/AppKit/views-and-controls/nspathcomponentcell.md

struct NSPathComponentCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSPathComponentCell",
            docPath: "Documentation/AppKit/views-and-controls/nspathcomponentcell.md",
            availability: "macOS 10.5+",
            blurb: """
            One segment in a path. NSPathCell manages an array of \
            NSPathComponentCell objects (in concert with NSPathControl) to \
            render a complete path. Each component cell carries:

              \u{2022} title — the visible label, inherited from NSTextFieldCell.
              \u{2022} image — the leading icon (typically the file's icon).
              \u{2022} url — the URL this component represents.

            Direct instantiation is rare. NSPathCell creates these cells \
            automatically when you set its url property. Manipulate them \
            directly only when you build a path display from non-file URLs \
            (and even then, NSPathControlItem + NSPathControl.pathItems is \
            usually a cleaner seam).
            """,
            signatures: [
                "class NSPathComponentCell : NSTextFieldCell",
                "var image: NSImage?",
                "var url: URL?"
            ],
            notes: [
                "Inherits NSTextFieldCell — the title property comes from the parent class.",
                "When NSPathCell.clickedPathComponentCell is set during an action, the value is one of these cells; use it to determine which segment was clicked.",
                "The renderable surface is on the NSPathControl page — that's where these cells are created and shown."
            ]
        )
    }
}

#Preview {
    NSPathComponentCellDescribePage().frame(width: 900, height: 700)
}
