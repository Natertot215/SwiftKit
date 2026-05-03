import SwiftUI

// SwiftUI `View/datePickerStyle(_:)` + `DatePickerStyle` reference page.
// Source: Documentation/SwiftUI/view-styles/datepickerstyle(_:).md, datepickerstyle.md
// macOS 10.15+. Documented styles on macOS: .automatic, .compact, .field,
// .graphical, .stepperField. (Wheel exists for iOS — unavailable on macOS.)

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 320

struct DatePickerStylePage: View {
    @State private var date: Date = .now

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
            Text("View/datePickerStyle(_:) + DatePickerStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for date pickers within this view. DatePickerStyle is the protocol the built-in style values conform to.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/datepickerstyle(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DPCard(title: ".automatic", api: ".datePickerStyle(.automatic)") {
            samplePicker.datePickerStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Five DatePickerStyle values supported on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                DPCard(title: ".automatic", api: ".datePickerStyle(.automatic)") {
                    samplePicker.datePickerStyle(.automatic)
                }
                DPCard(title: ".compact", api: ".datePickerStyle(.compact)") {
                    samplePicker.datePickerStyle(.compact)
                }
                DPCard(title: ".field", api: ".datePickerStyle(.field)") {
                    samplePicker.datePickerStyle(.field)
                }
                DPCard(title: ".graphical", api: ".datePickerStyle(.graphical)") {
                    samplePicker.datePickerStyle(.graphical)
                }
                DPCard(title: ".stepperField", api: ".datePickerStyle(.stepperField)") {
                    samplePicker.datePickerStyle(.stepperField)
                }
            }
        }
    }

    private var samplePicker: some View {
        DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("displayedComponents narrows the value")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    DPCard(title: ".date only", api: "displayedComponents: .date") {
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.field)
                    }
                    DPCard(title: ".hourAndMinute only", api: "displayedComponents: .hourAndMinute") {
                        DatePicker("Time", selection: $date, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.field)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Disabled propagates")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    DPCard(title: ".compact + disabled", api: ".disabled(true)") {
                        samplePicker.datePickerStyle(.compact).disabled(true)
                    }
                    DPCard(title: ".graphical + disabled", api: ".disabled(true)") {
                        samplePicker.datePickerStyle(.graphical).disabled(true)
                    }
                }
            }
        }
    }

    private struct DPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [DPNote] = [
        .init(title: ".automatic resolves to .field on macOS.",
              detail: "macOS treats the date field as the canonical compact representation. .compact is iOS-flavored — it pops a calendar in a popover.",
              symbol: "calendar"),
        .init(title: ".graphical is the full month grid.",
              detail: "Useful for booking flows where the entire month is meaningful. Heavyweight; the inline grid takes ~280pt² of layout.",
              symbol: "rectangle.grid.3x2"),
        .init(title: ".stepperField pairs the field with native ↑/↓ steppers.",
              detail: "Mac-native macOS Preferences look. Lets keyboard users nudge the focused component up/down.",
              symbol: "chevron.up.chevron.down"),
        .init(title: ".wheel exists in the protocol but is iOS-only.",
              detail: "On macOS the SDK simply doesn't expose .wheel. Trying to write `.datePickerStyle(.wheel)` won't compile under macOS-only builds.",
              symbol: "iphone"),
        .init(title: "DatePickerStyle protocol — no custom conformers in SwiftKit.",
              detail: "Per project hard constraint, SwiftKit only documents the built-in style values; it does not author new DatePickerStyle conformers.",
              symbol: "lock")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct DPCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    DatePickerStylePage()
        .frame(width: 1200, height: 1100)
}
