import SwiftUI

// Describe-track page for NSDatePickerCellDelegate.
// Source: Documentation/AppKit/views-and-controls/nsdatepickercelldelegate.md

struct NSDatePickerCellDelegateDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSDatePickerCellDelegate",
            docPath: "Documentation/AppKit/views-and-controls/nsdatepickercelldelegate.md",
            availability: "macOS",
            blurb: """
            A single-method protocol that lets you validate a proposed date \
            value before NSDatePickerCell commits it. The delegate receives \
            the proposed date (as an inout NSDate pointer) and, in range \
            mode, the proposed timeInterval (in seconds, also inout) — mutate \
            either to clamp to a fiscal range, snap to the nearest 15 \
            minutes, or otherwise adjust the value.

            Assign your delegate to the cell's delegate property; if you only \
            have an NSDatePicker, route through picker.cell as NSDatePickerCell.
            """,
            signatures: [
                "protocol NSDatePickerCellDelegate : NSObjectProtocol",
                "func datePickerCell(_ cell: NSDatePickerCell, validateProposedDateValue date: AutoreleasingUnsafeMutablePointer<NSDate>, timeInterval: UnsafeMutablePointer<TimeInterval>?)"
            ],
            notes: [
                "The pointers are in/out: read the proposed value, write the corrected value back. For read-only validation, return without mutating — the proposed value commits as-is.",
                "In .range mode timeInterval points to a non-nil TimeInterval. In .single mode the pointer is nil.",
                "Round-tripping is destructive — mutating date in this method permanently overwrites the cell's date value before any controlTextDidChange notification fires."
            ]
        )
    }
}

#Preview {
    NSDatePickerCellDelegateDescribePage().frame(width: 900, height: 700)
}
