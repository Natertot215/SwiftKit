import SwiftUI

// Describe-track page for NSPathControlDelegate.
// Source: Documentation/AppKit/views-and-controls/nspathcontroldelegate.md

struct NSPathControlDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSPathControlDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nspathcontroldelegate.md",
            availability: "macOS",
            blurb: """
            Optional methods that an NSPathControl delegate implements to \
            customize drag-and-drop and pop-up menu behavior. The protocol \
            covers two concerns:

              \u{2022} Dragging — pathControl(_:shouldDrag:with:), \
            pathControl(_:validateDrop:), pathControl(_:acceptDrop:). The \
            shouldDrag method gates outgoing drags from a component cell; the \
            validate / accept pair runs the standard NSDraggingDestination \
            negotiation when a user drags onto the control.
              \u{2022} Pop-up customization — pathControl(_:willDisplay:) and \
            pathControl(_:willPopUp:) let you mutate the open panel \
            (NSOpenPanel) and the pop-up menu (NSMenu) respectively before \
            they show.

            Assign the delegate to NSPathControl.delegate. Implementing a \
            method is opt-in — the default behavior runs when the method is \
            absent.
            """,
            signatures: [
                "protocol NSPathControlDelegate : NSObjectProtocol",
                "func pathControl(_ pathControl: NSPathControl, shouldDrag pathComponentCell: NSPathComponentCell, with pasteboard: NSPasteboard) -> Bool",
                "func pathControl(_ pathControl: NSPathControl, validateDrop info: NSDraggingInfo) -> NSDragOperation",
                "func pathControl(_ pathControl: NSPathControl, acceptDrop info: NSDraggingInfo) -> Bool",
                "func pathControl(_ pathControl: NSPathControl, willDisplay openPanel: NSOpenPanel)",
                "func pathControl(_ pathControl: NSPathControl, willPopUp menu: NSMenu)"
            ],
            notes: [
                "Drag methods only fire when the control's isEditable is true (or when an outgoing drag is attempted from a selectable component cell).",
                "willDisplay and willPopUp run for the .popUp style only — the open panel appears when the user selects \"Choose…\" in the menu.",
                "The doc lists pathControl(_:shouldDrag:with:) twice (Dragging Support + Instance Methods). It's the same method — declared once, listed in two index sections."
            ]
        )
    }
}

#Preview {
    NSPathControlDelegateDescribePage().frame(width: 900, height: 700)
}
