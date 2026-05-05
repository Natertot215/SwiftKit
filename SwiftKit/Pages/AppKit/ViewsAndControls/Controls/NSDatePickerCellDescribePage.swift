import SwiftUI

// Describe-track page for NSDatePickerCell.
// Source: Documentation/AppKit/views-and-controls/nsdatepickercell.md

struct NSDatePickerCellDescribePage: View {
    var body: some View {
        DescribePage(
            title: "NSDatePickerCell",
            docPath: "Documentation/AppKit/views-and-controls/nsdatepickercell.md",
            availability: "macOS",
            blurb: """
            The NSCell subclass that NSDatePicker uses to render and manage its \
            user interface. NSDatePicker provides cover methods for almost \
            every NSDatePickerCell property — most apps interact with the \
            cell only when embedding date-picker behavior into another \
            cell-based surface (e.g. an NSMatrix).

            Cell-level configuration mirrors the control:

              \u{2022} Appearance — backgroundColor, drawsBackground, textColor, \
            datePickerStyle, datePickerElements.
              \u{2022} Range / mode — datePickerMode (.single, .range), \
            calendar, locale, timeZone.
              \u{2022} Object value — dateValue, timeInterval.
              \u{2022} Selectable range — minDate, maxDate.
              \u{2022} Delegate — NSDatePickerCellDelegate for validation.
            """,
            signatures: [
                "class NSDatePickerCell : NSActionCell",
                "var datePickerStyle: NSDatePicker.Style",
                "var datePickerElements: NSDatePicker.ElementFlags",
                "var datePickerMode: NSDatePicker.Mode",
                "var dateValue: Date",
                "var timeInterval: TimeInterval",
                "var minDate: Date?, maxDate: Date?",
                "weak var delegate: NSDatePickerCellDelegate?"
            ],
            notes: [
                "Inherits NSActionCell — the cell-level equivalent of NSDatePicker inheriting NSControl.",
                "Designated initializers: init(coder:) and init(textCell:). When subclassing, both must be implemented.",
                "The renderable surface lives on the NSDatePicker page — that's where you instantiate the wrapping control."
            ]
        )
    }
}

#Preview {
    NSDatePickerCellDescribePage().frame(width: 900, height: 700)
}
