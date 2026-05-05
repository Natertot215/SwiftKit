import SwiftUI

// Describe-track page for NSControl.
// Source: Documentation/AppKit/views-and-controls/nscontrol.md
// NSControl is the abstract superclass of every interactive AppKit control —
// per Apple's docs: "The NSControl class is abstract and must be subclassed
// to be used." Concrete subclasses are NSButton, NSTextField, NSSlider,
// NSStepper, NSColorWell, NSDatePicker, NSPathControl, NSSegmentedControl,
// NSPopUpButton, NSComboBox, NSImageView, etc. The class itself produces no
// rendering, so the renderable demo for any specific control lives on its
// own page; NSControl's role here is to document the shared behavior every
// subclass inherits (target / action, enabled / highlighted, sendAction).

struct NSControlDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSControl",
            docPath: "Documentation/AppKit/views-and-controls/nscontrol.md",
            availability: "macOS 10.0+",
            blurb: """
            The abstract superclass for every interactive AppKit control — the layer that adds the \
            target / action design pattern, enabled / highlighted state, and shared cell-driven \
            rendering on top of NSView. NSControl itself is not instantiable in any meaningful way; \
            Apple's documentation states explicitly that "the NSControl class is abstract and must \
            be subclassed to be used." Every concrete macOS control descends from it.

            Concrete subclasses include NSButton, NSTextField, NSSecureTextField, NSSlider, \
            NSStepper, NSPopUpButton, NSComboBox, NSColorWell, NSDatePicker, NSPathControl, \
            NSSegmentedControl, NSImageView, NSLevelIndicator, NSScroller, NSBrowser, NSMatrix, \
            NSRuleEditor, NSTableView, and NSSwitch. Each ships its own renderable surface and \
            delivers user interaction back through the target / action machinery NSControl defines.
            """,
            signatures: [
                "class NSControl : NSView",
                "var target: AnyObject?",
                "var action: Selector?",
                "var isEnabled: Bool",
                "var isHighlighted: Bool",
                "var doubleValue: Double",
                "var integerValue: Int",
                "var stringValue: String",
                "var objectValue: Any?",
                "var cell: NSCell?",
                "var controlSize: NSControl.ControlSize",
                "func sendAction(_ action: Selector?, to target: Any?) -> Bool",
                "func performClick(_ sender: Any?)",
                "func sizeToFit()"
            ],
            notes: [
                "Abstract — Apple's docs require subclassing rather than direct instantiation. SwiftKit pages for the concrete subclasses (NSButton, NSTextField, NSSlider, …) host the renderable demos.",
                "Target / action: assign target and action to wire interaction to a handler. The action selector typically takes a single sender argument: @objc func handle(_ sender: Any).",
                "Cell-based controls dispatch most rendering and value handling to an NSCell instance — see NSCell and NSActionCell.",
                "controlSize cases: .mini, .small, .regular, .large — most subclasses honor this for HIG-compliant sizing.",
                "Text-editing subclasses (NSTextField, NSMatrix) emit controlTextDidBeginEditing / controlTextDidChange / controlTextDidEndEditing notifications via the NSControlTextEditingDelegate protocol.",
                "NSControl conforms to NSAnimatablePropertyContainer, so animator() applies to enabled / highlighted / cell-driven properties on every concrete subclass."
            ]
        )
    }
}

#Preview {
    NSControlDescribePage()
        .frame(width: 900, height: 700)
}
