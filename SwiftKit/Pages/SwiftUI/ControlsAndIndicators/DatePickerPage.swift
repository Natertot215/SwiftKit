import SwiftUI

// SwiftUI `DatePicker` reference page.
// Covers: basic date binding, date range, displayedComponents, and styles.
// macOS 10.15+

struct DatePickerPage: View {
    @State private var selectedDate = Date()
    @State private var startDate = Date()
    @State private var endDate = Date().addingTimeInterval(86400 * 7)

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
            Text("DatePicker")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control for selecting an absolute date. On macOS renders as a compact date/time field or a graphical calendar picker.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/datepicker.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DPCard(api: "DatePicker(\"Date\", selection: $date)") {
            DatePicker("Date", selection: $selectedDate)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            DPVariant(title: ".automatic style (default)") {
                DPCard(api: ".datePickerStyle(.automatic)") {
                    DatePicker("Date", selection: $selectedDate).datePickerStyle(.automatic)
                }
            }

            DPVariant(title: ".compact style — single line, popover picker") {
                DPCard(api: ".datePickerStyle(.compact)") {
                    DatePicker("Date", selection: $selectedDate).datePickerStyle(.compact)
                }
            }

            DPVariant(title: ".graphical style — full calendar view") {
                DPCard(api: ".datePickerStyle(.graphical)", height: 380) {
                    DatePicker("Date", selection: $selectedDate).datePickerStyle(.graphical)
                }
            }

            DPVariant(title: ".field style — editable text fields") {
                DPCard(api: ".datePickerStyle(.field)") {
                    DatePicker("Date", selection: $selectedDate).datePickerStyle(.field)
                }
            }

            DPVariant(title: "displayedComponents: .date only") {
                DPCard(api: "DatePicker(…, displayedComponents: .date)") {
                    DatePicker("Date only", selection: $selectedDate, displayedComponents: .date)
                }
            }

            DPVariant(title: "displayedComponents: .hourAndMinute only") {
                DPCard(api: "DatePicker(…, displayedComponents: .hourAndMinute)") {
                    DatePicker("Time only", selection: $selectedDate, displayedComponents: .hourAndMinute)
                }
            }

            DPVariant(title: "Date range constraint — in: (closed range)") {
                DPCard(api: "DatePicker(…, in: Date()...) // from today onward") {
                    DatePicker("From today", selection: $selectedDate, in: Date()...)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            DPVariant(title: "Disabled") {
                DPCard(api: "DatePicker(…).disabled(true)") {
                    DatePicker("Date", selection: $selectedDate).disabled(true)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowDP(symbol: "calendar", title: ".graphical renders an inline month calendar.",
                      detail: "Best for dedicated date-selection screens. .compact is preferred in forms and preferences — it shows a small date field that expands to a popover calendar on click.")
            NoteRowDP(symbol: "clock", title: "Combine .date + .hourAndMinute for a full timestamp.",
                      detail: "DatePickerComponents is an OptionSet: .init([.date, .hourAndMinute]) shows both. Default is [.date, .hourAndMinute].")
            NoteRowDP(symbol: "arrow.left.and.right", title: "Use PartialRangeFrom / PartialRangeThrough for open-ended ranges.",
                      detail: "in: Date()... means 'from now until any future date'. in: ...Date() means 'any past date until now'. Use ClosedRange for both endpoints.")
        }
    }
}

private struct DPCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let h = height {
                    content().frame(width: 340, height: h)
                } else {
                    content().frame(width: 340, alignment: .leading)
                }
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct DPVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowDP: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

#Preview {
    DatePickerPage().frame(width: 800, height: 1100)
}
