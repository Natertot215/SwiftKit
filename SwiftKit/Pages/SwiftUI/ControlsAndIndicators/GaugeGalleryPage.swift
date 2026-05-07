import SwiftUI

struct GaugeGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension GaugeGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.gauge",
        title: "Gauge",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Gauge"],
        blurb: "A view that shows a current value within a range, like a fuel gauge. Configure with bounds, marked values, and labels.",
        signature: "struct Gauge<Label, CurrentValueLabel, BoundsLabel, MarkedValueLabels> where Label : View, CurrentValueLabel : View, BoundsLabel : View, MarkedValueLabels : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/gauge.md",
        page: { AnyView(GaugeGalleryPage()) }
    )
}

#Preview {
    GaugeGalleryPage()
        .frame(width: 900, height: 700)
}
