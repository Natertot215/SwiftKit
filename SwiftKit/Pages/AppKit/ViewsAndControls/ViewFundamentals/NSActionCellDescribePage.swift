import SwiftUI

// Describe-track page for NSActionCell.
// Source: Documentation/AppKit/views-and-controls/nsactioncell.md
// NSActionCell extends NSCell with the target / action machinery used by
// every interactive control in AppKit. It's an abstract intermediate class —
// the concrete cells (NSButtonCell, NSTextFieldCell, NSSliderCell, etc.)
// inherit from it. Like NSCell, NSActionCell has no standalone renderable
// surface; it is drawn by whatever NSControl owns it.

struct NSActionCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSActionCell",
            docPath: "Documentation/AppKit/views-and-controls/nsactioncell.md",
            availability: "macOS 10.0+",
            blurb: """
            An active area inside a control. NSActionCell layers the target / action design \
            pattern on top of NSCell — it displays text or an icon, holds the target object and \
            action selector its containing NSControl invokes, and handles mouse tracking by \
            highlighting its area and sending the action message based on cursor movement. \
            The cell's controlView is whichever NSView most recently rendered it.

            NSActionCell is itself abstract — every concrete interactive cell ships as a subclass: \
            NSButtonCell, NSDatePickerCell, NSFormCell, NSLevelIndicatorCell, NSPathCell, \
            NSSegmentedCell, NSSliderCell, NSStepperCell, and NSTextFieldCell. Modern view-based \
            AppKit code rarely interacts with these directly — most setup happens through \
            convenience initializers on the corresponding NSControl subclass.
            """,
            signatures: [
                "class NSActionCell : NSCell",
                "var target: AnyObject?",
                "var action: Selector?",
                "var tag: Int",
                "var controlView: NSView?",
                "var floatValue: Float",
                "var intValue: Int32",
                "var integerValue: Int",
                "var stringValue: String",
                "func setObjectValue(_ object: Any?)"
            ],
            notes: [
                "Abstract — Apple's documented concrete subclasses are NSButtonCell, NSDatePickerCell, NSFormCell, NSLevelIndicatorCell, NSPathCell, NSSegmentedCell, NSSliderCell, NSStepperCell, NSTextFieldCell.",
                "Inherits the full NSCell API surface (drawing, value coercion, state, controlSize, etc.) and adds target / action / tag / controlView.",
                "stringValue / intValue / integerValue / floatValue all validate any in-flight editing changes before returning, supplementing NSCell's pass-through behavior.",
                "setObjectValue(_:) discards in-flight editing and marks the cell for redisplay if the new value differs.",
                "Like NSCell, NSActionCell has no own renderable surface — it is drawn by its controlView (the owning NSControl) via NSCell.draw(withFrame:in:).",
                "Use the corresponding NSControl subclass (NSButton, NSTextField, NSSlider, etc.) for app-level wiring; NSActionCell is the implementation detail underneath."
            ]
        )
    }
}

#Preview {
    NSActionCellDescribePage()
        .frame(width: 900, height: 700)
}
