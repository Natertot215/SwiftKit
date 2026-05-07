import SwiftUI

// SystemFormatStyle — namespace for cross-platform system format styles.
// Pair with TimeDataSource to render live, automatically-updating values.

struct SystemFormatStyleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Live, system-managed time text

            VariantTile(
                name: "Text(Date(), style: .time)",
                api: "Text(Date(), style: .time)"
            ) {
                Text(Date(), style: .time)
                    .font(.body)
                    .monospacedDigit()
            }

            VariantTile(
                name: "Text(Date(), style: .relative)",
                api: "Text(Date().addingTimeInterval(-90), style: .relative)"
            ) {
                Text(Date().addingTimeInterval(-90), style: .relative)
                    .font(.body)
            }

            // MARK: Reference

            ReferenceTile(
                name: "SystemFormatStyle",
                signature: "enum SystemFormatStyle",
                note: "A namespace for format styles that implement designs used across Apple's platforms. Has no values of its own — host for the nested types below."
            )

            ReferenceTile(
                name: "SystemFormatStyle.Stopwatch",
                signature: "struct SystemFormatStyle.Stopwatch",
                note: "Formats elapsed time in the system stopwatch convention. Used by Widgets, watchOS Complications, and Live Activities."
            )

            ReferenceTile(
                name: "SystemFormatStyle.Timer",
                signature: "struct SystemFormatStyle.Timer",
                note: "Formats remaining time in the system timer convention."
            )

            ReferenceTile(
                name: "SystemFormatStyle.DateOffset",
                signature: "struct SystemFormatStyle.DateOffset",
                note: "Formats the offset between two dates using a system convention."
            )

            ReferenceTile(
                name: "SystemFormatStyle.DateReference",
                signature: "struct SystemFormatStyle.DateReference",
                note: "Formats a date relative to a reference date using a system convention."
            )

            ReferenceTile(
                name: "TimeDataSource",
                signature: "struct TimeDataSource<Value>",
                note: "Supplies Text with live, automatically updating values. Used in Widgets, Live Activities, watchOS Complications, and regular apps. Built-in: `.currentDate`."
            )

            ReferenceTile(
                name: "TimeDataSource.dateRange(endingAt:)",
                signature: "static func dateRange(endingAt: Date) -> TimeDataSource<ClosedRange<Date>>",
                note: "A live data source whose value is a date range ending at the supplied date. Use with date-range format styles to render countdowns and other auto-updating intervals."
            )
        }
    }
}

extension SystemFormatStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.textInputAndOutput.systemFormatStyle",
        title: "SystemFormatStyle",
        folder: "Text input and output",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.text-input-and-output.systemformatstyle",
            "swiftui.text-input-and-output.timedatasource"
        ],
        blurb: "A namespace for format styles that implement designs used across Apple's platforms, plus the TimeDataSource that supplies live, automatically updating values to Text.",
        signature: "enum SystemFormatStyle · struct TimeDataSource<Value>",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/text-input-and-output/systemformatstyle.md",
        page: { AnyView(SystemFormatStyleGalleryPage()) }
    )
}

#Preview {
    SystemFormatStyleGalleryPage()
        .frame(width: 900, height: 700)
}
