import SwiftUI

// Article-style describe page for the "Date Picker" doc collection.
// Source: Documentation/AppKit/views-and-controls/date-picker.md

struct DatePickerDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Date Picker",
            docPath: "Documentation/AppKit/views-and-controls/date-picker.md",
            availability: "macOS",
            blurb: """
            A Date Picker displays a calendar date and time and provides the \
            controls users need to edit the value. AppKit groups three APIs \
            under this collection: NSDatePicker (the rendered NSControl you \
            embed), NSDatePickerCell (the cell that does the drawing), and \
            NSDatePickerCellDelegate (validation hook for proposed values).

            Pick the right entry point:

              \u{2022} NSDatePicker — embed in a window or a SwiftUI hierarchy \
            via NSViewRepresentable. Configure datePickerStyle (textual / \
            graphical / clock-and-calendar / textual-with-stepper) and \
            datePickerElements (year-month-day, hour-minute, era, time-zone).
              \u{2022} NSDatePickerCell — instantiate when you need the cell \
            outside of NSDatePicker (e.g. an NSMatrix entry).
              \u{2022} NSDatePickerCellDelegate — implement to validate proposed \
            dates before they commit (clamp to a fiscal range, snap to the \
            nearest 15 minutes, etc.).

            The renderable surface lives on the NSDatePicker page.
            """,
            signatures: [
                "Documentation/AppKit/views-and-controls/date-picker (collection)",
                "View: NSDatePicker",
                "Cells: NSDatePickerCell, NSDatePickerCellDelegate"
            ],
            notes: [
                "Pair NSDatePicker with .calendar, .locale, and .timeZone to control how the value is rendered. minDate / maxDate clamp the selectable range.",
                "datePickerMode = .range turns the picker into a span editor: dateValue is the start; timeInterval is the duration in seconds.",
                "SwiftUI's DatePicker is a separate API in the SwiftUI framework — different documentation page, different feature set."
            ]
        )
    }
}

#Preview {
    DatePickerDescribePage().frame(width: 900, height: 700)
}
