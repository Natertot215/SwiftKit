import SwiftUI

// Dense DatePicker reference page. Consolidates three previously-separate
// leaves into a single screen:
//   • DatePicker                                                          (struct)
//   • DatePickerStyle                                                     (protocol)
//   • View/datePickerStyle(_:)
//
// Source docs:
//   Documentation/SwiftUI/controls-and-indicators/datepicker.md
//   Documentation/SwiftUI/view-styles/datepickerstyle.md
//   Documentation/SwiftUI/view-styles/datepickerstyle(_:).md
//
// Mirrors TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. The DatePickerStyle Reference subsection is
// placed ABOVE the demo subsections per the describe-track placement rule.
// All demos compose Apple primitives directly — no custom wrapper views.

struct DatePickerGalleryPage: View {
    @State private var selectedDate: Date = .now
    @State private var compactDate: Date = .now
    @State private var graphicalDate: Date = .now
    @State private var fieldDate: Date = .now
    @State private var stepperDate: Date = .now
    @State private var rangeDate: Date = .now
    @State private var pastDate: Date = .now
    @State private var weekDate: Date = .now
    @State private var dateOnly: Date = .now
    @State private var timeOnly: Date = .now

    private var startOfNextMonth: Date {
        let cal = Calendar.current
        return cal.date(byAdding: .month, value: 1, to: .now) ?? .now
    }

    private var startOfWeek: Date { .now }
    private var endOfWeek: Date {
        Calendar.current.date(byAdding: .day, value: 7, to: .now) ?? .now
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                datePickerStyleReferenceSection
                datePickerComponentsReferenceSection
                defaultDatePickerSection
                datePickerStyleGallerySection
                displayedComponentsSection
                rangeConstraintsSection
                datePickerStatesSection
                higNotesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("DatePicker")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control for selecting an absolute date. This page covers DatePicker itself plus its style protocol and modifier (DatePickerStyle, .datePickerStyle(_:)) and the DatePickerComponents OptionSet that narrows what the picker edits.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/datepicker.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("DatePicker  \u{00b7}  DatePickerStyle  \u{00b7}  DatePickerComponents  \u{00b7}  .datePickerStyle(\u{2026})  \u{00b7}  displayedComponents:  \u{00b7}  in: range")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (DatePickerStyle protocol)

    private var datePickerStyleReferenceSection: some View {
        PageSection("Reference \u{2014} DatePickerStyle protocol", subtitle: "protocol DatePickerStyle \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that specifies the appearance and interaction of all date pickers within a view hierarchy. DatePickerStyle is a marker protocol with no public requirements; SwiftUI ships private types that conform to it, and you adopt them via the static literals (.compact, .graphical, .field, .stepperField, .wheel, .automatic).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
@MainActor protocol DatePickerStyle {
    // No required members are exposed publicly. SwiftUI ships
    // private conforming types you adopt via the static literals
    // (.compact, .graphical, .field, .stepperField, .wheel,
    // .automatic).
}

// Apply via:
// View/datePickerStyle(_:)   -- inherits down the view tree
"""
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Built-in conformers on macOS")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "DefaultDatePickerStyle \u{2014} the platform default. On macOS resolves to .field. macOS 10.15+.")
                    referenceRow(".compact", "CompactDatePickerStyle \u{2014} single-line label that expands to a popover calendar. macOS 10.15+.")
                    referenceRow(".graphical", "GraphicalDatePickerStyle \u{2014} inline month-grid calendar with optional time controls. macOS 10.15+.")
                    referenceRow(".field", "FieldDatePickerStyle \u{2014} editable text fields per component. macOS 10.15+.")
                    referenceRow(".stepperField", "StepperFieldDatePickerStyle \u{2014} field plus native \u{2191}/\u{2193} stepper. macOS-native. macOS 10.15+.")
                    referenceRow(".wheel", "WheelDatePickerStyle \u{2014} iOS-style spinning wheels. iOS-only; unavailable on macOS.")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "DatePickerStyle has no public surface to implement.",
                        detail: "It's a marker protocol \u{2014} the conforming types are private to SwiftUI. SwiftKit does NOT author custom conformers per project hard constraint; the catalog documents the built-in literals only.",
                        symbol: "lock"
                    )
                    noteRow(
                        title: "Apply via .datePickerStyle(_:); inherits down the view tree.",
                        detail: "An inner .datePickerStyle(\u{2026}) wins for its own subtree. Apply once on a container and every DatePicker beneath picks it up.",
                        symbol: "arrow.down"
                    )
                    noteRow(
                        title: ".automatic resolves per-platform.",
                        detail: "On macOS .automatic resolves to .field; on iOS it resolves to .compact. The same code shipped to both platforms produces different output \u{2014} verify on the target platform.",
                        symbol: "circle.lefthalf.filled"
                    )
                }
            }
        }
    }

    // MARK: Reference (DatePickerComponents)

    private var datePickerComponentsReferenceSection: some View {
        PageSection("Reference \u{2014} DatePickerComponents", subtitle: "struct DatePickerComponents : OptionSet \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("OptionSet that narrows the parts of a Date the picker edits. Pass via the displayedComponents: parameter on DatePicker. Default is [.date, .hourAndMinute].")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Static values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".date", "Day, month, and year. The picker hides time controls when this is the only component.")
                    referenceRow(".hourAndMinute", "Hour and minute only. The picker hides date controls when this is the only component.")
                    referenceRow("[.date, .hourAndMinute]", "Default \u{2014} both shown. Combine with array literal for an OptionSet.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct DatePickerComponents: OptionSet, Sendable {")
                    APICallout("    let rawValue: UInt")
                    APICallout("    static let date: DatePickerComponents")
                    APICallout("    static let hourAndMinute: DatePickerComponents")
                    APICallout("}")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "DatePickerComponents is an OptionSet, not an enum.",
                        detail: "Use array literal [.date, .hourAndMinute] to combine, or pass a single value directly. You cannot pass a tuple or comma list.",
                        symbol: "rectangle.stack"
                    )
                    noteRow(
                        title: "Component selection narrows what the user CAN edit, not the value type.",
                        detail: "The bound Date still carries a complete moment in time; passing displayedComponents: .date just hides the hour/minute UI. The hour/minute portion of the bound Date is whatever it was at construction.",
                        symbol: "clock"
                    )
                }
            }
        }
    }

    // MARK: Default DatePicker

    private var defaultDatePickerSection: some View {
        PageSection("Default DatePicker", subtitle: "DatePicker(\"Label\", selection: $date) \u{00b7} system-default style + components") {
            VStack(alignment: .leading, spacing: 12) {
                DatePicker("Date", selection: $selectedDate)
                Text("selection = \(selectedDate.formatted(.dateTime.year().month().day().hour().minute()))")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                APICallout("DatePicker(\"Date\", selection: $selectedDate)")
            }
        }
    }

    // MARK: DatePickerStyle gallery

    private var datePickerStyleGallerySection: some View {
        PageSection("DatePickerStyle gallery \u{2014} built-in styles", subtitle: "View/datePickerStyle(_:) \u{00b7} every macOS-supported style applied to identical pickers") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Five DatePickerStyle values render natively on macOS. .wheel exists in the protocol but is iOS-only \u{2014} the macOS SDK does not render it as a wheel.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".automatic", api: ".datePickerStyle(.automatic) \u{00b7} macOS resolves to .field") {
                    DatePicker("Date", selection: $selectedDate)
                        .datePickerStyle(.automatic)
                }

                styleSpecimen(title: ".compact", api: ".datePickerStyle(.compact) \u{00b7} popover calendar") {
                    DatePicker("Date", selection: $compactDate)
                        .datePickerStyle(.compact)
                }

                styleSpecimen(title: ".graphical", api: ".datePickerStyle(.graphical) \u{00b7} inline month-grid", height: 360) {
                    DatePicker("Date", selection: $graphicalDate)
                        .datePickerStyle(.graphical)
                }

                styleSpecimen(title: ".field", api: ".datePickerStyle(.field) \u{00b7} editable text fields") {
                    DatePicker("Date", selection: $fieldDate)
                        .datePickerStyle(.field)
                }

                styleSpecimen(title: ".stepperField", api: ".datePickerStyle(.stepperField) \u{00b7} field + native \u{2191}/\u{2193}") {
                    DatePicker("Date", selection: $stepperDate)
                        .datePickerStyle(.stepperField)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(".wheel \u{2014} iOS-only")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    Text("Spinning-wheel date picker. SwiftUI exposes the literal but the macOS SDK does not render it as a wheel \u{2014} use .compact or .graphical for native macOS feel.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(".datePickerStyle(.wheel)  // iOS-only renderer")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".automatic resolves to .field on macOS.",
                        detail: "macOS treats the date field as the canonical compact representation. .compact is iOS-flavored \u{2014} it pops a calendar in a popover and reads as a single-line button.",
                        symbol: "calendar"
                    )
                    noteRow(
                        title: ".graphical is the full month grid.",
                        detail: "Useful for booking flows where the entire month is meaningful. Heavyweight; the inline grid takes ~280pt\u{00b2} of layout. Reserve for dedicated date-selection screens.",
                        symbol: "rectangle.grid.3x2"
                    )
                    noteRow(
                        title: ".stepperField pairs the field with native \u{2191}/\u{2193} steppers.",
                        detail: "Mac-native macOS Preferences look. Lets keyboard users nudge the focused component up/down without typing.",
                        symbol: "chevron.up.chevron.down"
                    )
                    noteRow(
                        title: ".compact is for dense forms.",
                        detail: "Single-line button that pops a calendar in a popover on click. Ideal in inspector panes or sidebar forms where vertical space matters.",
                        symbol: "rectangle.compress.vertical"
                    )
                    noteRow(
                        title: ".wheel exists in the protocol but is iOS-only.",
                        detail: "On macOS the SDK doesn't render it as a wheel. Reach for .compact or .graphical instead.",
                        symbol: "iphone"
                    )
                }
            }
        }
    }

    @ViewBuilder
    private func styleSpecimen<Content: View>(title: String, api: String, height: CGFloat? = nil, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Group {
                if let height {
                    content().frame(maxWidth: .infinity, minHeight: height, alignment: .topLeading)
                } else {
                    content().frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
            APICallout(api)
        }
    }

    // MARK: displayedComponents

    private var displayedComponentsSection: some View {
        PageSection("displayedComponents narrowing", subtitle: "DatePicker(\u{2026}, displayedComponents:) \u{00b7} OptionSet of .date / .hourAndMinute") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Pass a DatePickerComponents value (or array literal) as the displayedComponents: argument to hide the date or time half of the picker UI.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: "displayedComponents: .date", api: "DatePicker(\"Day\", selection: $d, displayedComponents: .date)") {
                    DatePicker("Day", selection: $dateOnly, displayedComponents: .date)
                        .datePickerStyle(.field)
                }
                styleSpecimen(title: "displayedComponents: .hourAndMinute", api: "DatePicker(\"Time\", selection: $t, displayedComponents: .hourAndMinute)") {
                    DatePicker("Time", selection: $timeOnly, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.field)
                }
                styleSpecimen(title: "displayedComponents: [.date, .hourAndMinute] (default)", api: "DatePicker(\"When\", selection: $when, displayedComponents: [.date, .hourAndMinute])") {
                    DatePicker("When", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.field)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Default displayedComponents is [.date, .hourAndMinute].",
                        detail: "Omit the parameter and you get both. Pass exactly one to narrow the editable surface.",
                        symbol: "checkmark.circle"
                    )
                    noteRow(
                        title: "OptionSet means array-literal combination.",
                        detail: "Use [.date, .hourAndMinute] to combine; you cannot write .date | .hourAndMinute the way you might in C-style flags.",
                        symbol: "rectangle.stack"
                    )
                }
            }
        }
    }

    // MARK: Range constraints

    private var rangeConstraintsSection: some View {
        PageSection("Range constraints \u{2014} in:", subtitle: "ClosedRange / PartialRangeFrom / PartialRangeThrough of Date") {
            VStack(alignment: .leading, spacing: 20) {
                Text("DatePicker accepts an in: range to clamp selection. Three range shapes are supported \u{2014} closed, partial-from, partial-through.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: "in: PartialRangeFrom \u{2014} from now onward", api: "DatePicker(\"Future\", selection: $d, in: Date()...)") {
                    DatePicker("Future", selection: $rangeDate, in: Date()...)
                        .datePickerStyle(.compact)
                }
                styleSpecimen(title: "in: PartialRangeThrough \u{2014} up to now", api: "DatePicker(\"Past\", selection: $d, in: ...Date())") {
                    DatePicker("Past", selection: $pastDate, in: ...Date())
                        .datePickerStyle(.compact)
                }
                styleSpecimen(title: "in: ClosedRange \u{2014} this week", api: "DatePicker(\"Within\", selection: $d, in: start...end)") {
                    DatePicker("Within", selection: $weekDate, in: startOfWeek...endOfWeek)
                        .datePickerStyle(.graphical)
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("DatePicker(_:selection:in:displayedComponents:)")
                    APICallout("DatePicker(_:selection:in:displayedComponents:) where Range is PartialRangeFrom<Date>")
                    APICallout("DatePicker(_:selection:in:displayedComponents:) where Range is PartialRangeThrough<Date>")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Use PartialRangeFrom / PartialRangeThrough for open-ended ranges.",
                        detail: "in: Date()... means \u{201C}from now until any future date.\u{201D} in: ...Date() means \u{201C}any past date until now.\u{201D} ClosedRange covers both endpoints.",
                        symbol: "arrow.left.and.right"
                    )
                    noteRow(
                        title: "Range applies to .graphical, .compact, and .field.",
                        detail: "All three styles refuse selection outside the range. .graphical visually disables out-of-range cells; .compact / .field clamp the field's accepted input.",
                        symbol: "calendar.badge.exclamationmark"
                    )
                }
            }
        }
    }

    // MARK: DatePicker states

    private var datePickerStatesSection: some View {
        PageSection("DatePicker states", subtitle: ".disabled(true) \u{00b7} propagates across every DatePickerStyle") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The .disabled(true) modifier propagates through the view tree and dims any DatePicker beneath it, regardless of style.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".compact + .disabled(true)", api: ".datePickerStyle(.compact).disabled(true)") {
                    DatePicker("Date", selection: $selectedDate)
                        .datePickerStyle(.compact)
                        .disabled(true)
                }
                styleSpecimen(title: ".field + .disabled(true)", api: ".datePickerStyle(.field).disabled(true)") {
                    DatePicker("Date", selection: $selectedDate)
                        .datePickerStyle(.field)
                        .disabled(true)
                }
                styleSpecimen(title: ".graphical + .disabled(true)", api: ".datePickerStyle(.graphical).disabled(true)", height: 320) {
                    DatePicker("Date", selection: $selectedDate)
                        .datePickerStyle(.graphical)
                        .disabled(true)
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on DatePicker, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: ".graphical is for dedicated date-selection screens.",
                    detail: "Reserve the inline month grid for booking flows, scheduling, or any context where the user wants to see a whole month at a glance.",
                    symbol: "rectangle.grid.3x2"
                )
                noteRow(
                    title: ".compact for forms; .field for native macOS Preferences.",
                    detail: ".compact reads as a single-line button that pops a popover \u{2014} ideal for dense forms. .field is the standard macOS-flavored editable triplet of fields, the default of .automatic on macOS.",
                    symbol: "list.bullet.rectangle"
                )
                noteRow(
                    title: "displayedComponents narrows the editable surface.",
                    detail: "OptionSet of .date / .hourAndMinute. Default is both; pass exactly one to hide the other half. The bound Date still carries a complete moment in time.",
                    symbol: "clock"
                )
                noteRow(
                    title: "Range semantics: PartialRangeFrom / PartialRangeThrough / ClosedRange.",
                    detail: "in: Date()... future-only; in: ...Date() past-only; in: start...end exact bounds. The DatePicker enforces the range across all macOS styles.",
                    symbol: "arrow.left.and.right"
                )
                noteRow(
                    title: ".wheel and pickers that look like iOS belong on iOS.",
                    detail: ".wheel is in the protocol but does not render natively on macOS. Reach for .compact or .graphical for the native macOS feel.",
                    symbol: "iphone"
                )
            }
        }
    }

    // MARK: Helpers

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 220, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

extension DatePickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.datePicker",
        title: "DatePicker",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["DatePicker"],
        blurb: "A control for selecting an absolute date, optionally including a time. Bind to a Date instance and configure displayed components.",
        signature: "struct DatePicker<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/datepicker.md",
        page: { AnyView(DatePickerGalleryPage()) }
    )
}

#Preview {
    DatePickerGalleryPage()
        .frame(width: 1100, height: 1100)
}
