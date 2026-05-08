import SwiftUI
import AppKit

struct NSDatePickerGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Style variants — live renders

            VariantTile(
                name: "NSDatePicker",
                api: "let picker = NSDatePicker(); picker.datePickerStyle = .textFieldAndStepper",
                height: 64
            ) {
                NSDatePickerRepresentable(style: .textFieldAndStepper, mode: .single)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 4)
            }

            VariantTile(
                name: "NSDatePicker.Style",
                api: "picker.datePickerStyle = .clockAndCalendar  // .textFieldAndStepper | .clockAndCalendar | .textField",
                height: 220
            ) {
                NSDatePickerRepresentable(style: .clockAndCalendar, mode: .single)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VariantTile(
                name: "NSDatePicker.Mode",
                api: "picker.datePickerMode = .range  // .single | .range",
                height: 64
            ) {
                NSDatePickerRepresentable(style: .textFieldAndStepper, mode: .range)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 4)
            }

            // MARK: Reference tiles

            ReferenceTile(
                name: "NSDatePicker.ElementFlags",
                signature: "struct NSDatePicker.ElementFlags : OptionSet",
                note: "Bit-mask specifying which date/time components are visible — .yearMonthDay, .yearMonth, .era, .hourMinute, .hourMinuteSecond, .timeZone. Assign to picker.datePickerElements."
            )

            ReferenceTile(
                name: "NSDatePickerCell",
                signature: "@MainActor class NSDatePickerCell : NSActionCell",
                note: "Implements NSDatePicker's control behavior. NSDatePicker provides cover methods for most NSDatePickerCell APIs. Access directly when embedding in an NSMatrix."
            )

            ReferenceTile(
                name: "NSDatePickerCellDelegate",
                signature: "protocol NSDatePickerCellDelegate : NSObjectProtocol",
                note: "Validates date changes before they commit. Implement datePickerCell(_:validateProposedDateValue:timeInterval:) to reject or clamp out-of-range values."
            )
        }
    }
}

extension NSDatePickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsDatePicker.nsDatePicker",
        title: "NSDatePicker",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSDatePicker", "NSDatePicker.Style", "NSDatePicker.Mode", "NSDatePicker.ElementFlags", "NSDatePickerCell", "NSDatePickerCellDelegate"],
        blurb: "A display of a calendar date with controls for editing the date value.",
        signature: "@MainActor class NSDatePicker : NSControl",
        availability: "macOS 10.4+",
        docPath: "Documentation/AppKit/views-and-controls/nsdatepicker.md",
        page: { AnyView(NSDatePickerGalleryPage()) }
    )
}

// MARK: - NSViewRepresentable bridge

private struct NSDatePickerRepresentable: NSViewRepresentable {
    let style: NSDatePicker.Style
    let mode: NSDatePicker.Mode

    func makeNSView(context: Context) -> NSDatePicker {
        let picker = NSDatePicker()
        picker.datePickerStyle = style
        picker.datePickerMode = mode
        picker.dateValue = Date()
        picker.drawsBackground = false
        return picker
    }

    func updateNSView(_ nsView: NSDatePicker, context: Context) {
        nsView.datePickerStyle = style
        nsView.datePickerMode = mode
    }
}
