import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSDatePicker (class, inherits NSControl) — a calendar-date control
// with text, stepper, and clock-and-calendar styles plus per-element flags.
// Source: Documentation/AppKit/views-and-controls/nsdatepicker.md
//
// Renderable demo: an NSViewRepresentable hosts an NSDatePicker bound to a
// SwiftUI @State Date. Pickers drive datePickerStyle and datePickerElements
// so the textual/graphical/clock variants render side-by-side.

// MARK: - Bridge

private struct NSDatePickerDemo: NSViewRepresentable {
    @Binding var date: Date
    var style: NSDatePicker.Style
    var elements: NSDatePicker.ElementFlags

    func makeNSView(context: Context) -> NSDatePicker {
        let picker = NSDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.target = context.coordinator
        picker.action = #selector(Coordinator.dateChanged(_:))
        return picker
    }

    func updateNSView(_ nsView: NSDatePicker, context: Context) {
        context.coordinator.parent = self
        nsView.datePickerStyle = style
        nsView.datePickerElements = elements
        if nsView.dateValue != date {
            nsView.dateValue = date
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(parent: self) }

    final class Coordinator: NSObject {
        var parent: NSDatePickerDemo
        init(parent: NSDatePickerDemo) { self.parent = parent }
        @objc func dateChanged(_ sender: NSDatePicker) {
            parent.date = sender.dateValue
        }
    }
}

// MARK: - Page

struct NSDatePickerPage: View {
    @State private var date = Date()
    @State private var style: NSDatePicker.Style = .textFieldAndStepper
    @State private var includeYMD = true
    @State private var includeHM = true
    @State private var includeTZ = false

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSDatePicker")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A display of a calendar date with controls for editing the date value.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nsdatepicker.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var elements: NSDatePicker.ElementFlags {
        var flags: NSDatePicker.ElementFlags = []
        if includeYMD { flags.insert(.yearMonthDay) }
        if includeHM { flags.insert(.hourMinute) }
        if includeTZ { flags.insert(.timeZone) }
        return flags
    }

    private var defaultDemo: some View {
        Block(title: "NSDatePicker bound to a SwiftUI Date") {
            VStack(alignment: .leading, spacing: 12) {
                NSDatePickerDemo(
                    date: $date,
                    style: style,
                    elements: elements
                )
                .frame(width: style == .clockAndCalendar ? 220 : 220, height: style == .clockAndCalendar ? 154 : 24)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("datePickerStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text("textFieldAndStepper").tag(NSDatePicker.Style.textFieldAndStepper)
                        Text("clockAndCalendar").tag(NSDatePicker.Style.clockAndCalendar)
                        Text("textField").tag(NSDatePicker.Style.textField)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 360)
                }

                Toggle(".yearMonthDay", isOn: $includeYMD).controlSize(.small)
                Toggle(".hourMinute", isOn: $includeHM).controlSize(.small)
                Toggle(".timeZone", isOn: $includeTZ).controlSize(.small)

                APICallout("let p = NSDatePicker(); p.datePickerStyle = .textFieldAndStepper")
                APICallout("p.datePickerElements = [.yearMonthDay, .hourMinute]")
                APICallout("p.dateValue = Date()")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "NSDatePicker.Style — three rendering modes") {
                snippet("""
                .textFieldAndStepper       // text + up/down stepper
                .clockAndCalendar          // graphical wall-clock + month grid
                .textField                 // text only, no chrome
                """)
                Text("Other styles documented historically (clockAndCalendarKeyEditing) are equivalent to .clockAndCalendar in macOS 26.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "NSDatePicker.ElementFlags — what's editable") {
                snippet("""
                let flags: NSDatePicker.ElementFlags = [
                    .yearMonthDay, .yearMonth, .era,    // date components
                    .hourMinute, .hourMinuteSecond,     // time components
                    .timeZone
                ]
                p.datePickerElements = flags
                """)
                Text("Pass an option set — only the requested fields render in textField styles, only the requested kinds appear in clockAndCalendar.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Calendar / locale / time zone") {
                snippet("""
                p.calendar = Calendar(identifier: .gregorian)
                p.locale = Locale(identifier: "en_US_POSIX")
                p.timeZone = TimeZone(identifier: "America/Los_Angeles")
                """)
            }

            Block(title: "Range mode") {
                snippet("""
                p.datePickerMode = .range          // single | range
                p.dateValue = startDate
                p.timeInterval = 3600 * 24 * 7     // 7-day span
                """)
                Text("In .range mode dateValue is the start and timeInterval is the duration in seconds. The clock-and-calendar style draws a translucent selection band over the chosen interval.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Bezel and background") {
                snippet("""
                p.isBezeled = true
                p.isBordered = false
                p.drawsBackground = true
                p.backgroundColor = .controlBackgroundColor
                p.textColor = .labelColor
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Selectable range") {
                snippet("""
                p.minDate = Calendar.current.date(byAdding: .year, value: -10, to: Date())
                p.maxDate = Date()
                """)
                Text("nil minDate / maxDate means \"unbounded.\" The picker clamps user input to the range and highlights out-of-range values as invalid.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Calendar overlay") {
                snippet("""
                p.presentsCalendarOverlay = true   // text styles only
                """)
                Text("In .textField / .textFieldAndStepper styles, true makes the picker present a small floating calendar when focused.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Validation via NSDatePickerCellDelegate") {
                snippet("""
                func datePickerCell(_ cell: NSDatePickerCell,
                                    validateProposedDateValue d: AutoreleasingUnsafeMutablePointer<NSDate>,
                                    timeInterval: UnsafeMutablePointer<TimeInterval>?) {
                    // mutate d.pointee / timeInterval?.pointee to clamp or snap
                }
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("calendar", "datePickerStyle and datePickerElements compose: text styles render only the requested elements, graphical style draws all selected elements in clock + calendar form.")
            noteRow("globe", "Always set calendar / locale / timeZone explicitly when the value crosses serialization boundaries — the picker defaults to system locale.")
            noteRow("checkmark.shield", "Validate via NSDatePickerCellDelegate.datePickerCell(_:validateProposedDateValue:timeInterval:) — mutate the inout pointers to clamp or snap.")
            noteRow("link", "See Also: NSDatePickerCell, NSDatePickerCellDelegate.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    NSDatePickerPage().frame(width: 1100, height: 900)
}
