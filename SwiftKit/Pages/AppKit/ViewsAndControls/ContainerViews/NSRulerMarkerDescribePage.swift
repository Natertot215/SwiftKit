import SwiftUI

// Describe-track page for NSRulerMarker.
// Source: Documentation/AppKit/views-and-controls/nsrulermarker.md
// NSRulerMarker is a model-style object — a symbol drawn on an NSRulerView at
// a given marker location. Examples are tab-stop markers and margin / indent
// markers in NSTextView. The marker exists only inside a ruler view's
// markers array; rendering it standalone makes no sense (it has no scroll
// view to live inside). Documenting via Describe.

struct NSRulerMarkerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSRulerMarker",
            docPath: "Documentation/AppKit/views-and-controls/nsrulermarker.md",
            availability: "macOS",
            blurb: """
            A symbol on a ruler view, indicating a location for the graphics \
            element it represents in the client of the ruler view. Apple's \
            example: the representation of a margin or tab setting, or the \
            edges of a graphic on the page.

            NSRulerMarker is a model-style helper that lives inside an \
            NSRulerView's markers array. The marker carries an image (drawn at \
            an imageOrigin offset from the marker's location), a markerLocation \
            (the position along the ruler in the ruler's measurement units), \
            isMovable / isRemovable flags that govern whether the user can \
            drag the marker or drop it off the ruler, and an optional \
            representedObject that ties the marker back to a model object in \
            the client view (a tab stop, a paragraph indent, a graphic edge).

            You don't render markers in isolation — they only make sense inside \
            an NSRulerView, which lives inside an NSScrollView. The Gallery \
            demo for that integration is on the NSRulerView page.
            """,
            signatures: [
                "class NSRulerMarker",
                "init(rulerView: NSRulerView, markerLocation: CGFloat, image: NSImage, imageOrigin: NSPoint)",
                "init(coder: NSCoder)",
                "var ruler: NSRulerView? { get }",
                "var image: NSImage",
                "var imageOrigin: NSPoint",
                "var imageRectInRuler: NSRect { get }",
                "var thicknessRequiredInRuler: CGFloat { get }",
                "var isMovable: Bool",
                "var isRemovable: Bool",
                "var markerLocation: CGFloat",
                "var representedObject: NSCoding?",
                "func draw(_ rect: NSRect)",
                "var isDragging: Bool { get }",
                "func trackMouse(with event: NSEvent, adding: Bool) -> Bool"
            ],
            notes: [
                "Inherits NSObject (not NSView). The marker doesn't render itself in isolation — NSRulerView calls draw(_:) on each marker during its drawMarkers(in:) pass.",
                "init(rulerView:markerLocation:image:imageOrigin:) is the designated initializer. Set isMovable / isRemovable after init to control user drag and drop.",
                "markerLocation is in the ruler's measurement units — match it to the NSRulerView.measurementUnits the marker lives on.",
                "imageOrigin is the offset of the marker's image from markerLocation; thicknessRequiredInRuler reports how much ruler thickness the image consumes.",
                "isMovable controls whether the user can drag the marker to a new location; isRemovable controls whether dragging it off the ruler removes it.",
                "representedObject ties the marker to a model — for tab stops in NSTextView, this is the NSTextTab; for graphic edges, the model object whose location the marker reflects.",
                "Pair with NSRulerMarkerClientViewDelegation methods on the client view (NSTextView, custom doc views) to translate ruler-space locations into document-space coordinates."
            ]
        )
    }
}

#Preview {
    NSRulerMarkerDescribePage()
        .frame(width: 900, height: 700)
}
