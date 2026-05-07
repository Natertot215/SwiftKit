import SwiftUI

struct SliderGalleryPage: View {
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

extension SliderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.slider",
        title: "Slider",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Slider"],
        blurb: "A control for selecting a value from a bounded linear range. The thumb moves along a track between minimum and maximum values, updating the bound value continuously.",
        signature: "struct Slider<Label, ValueLabel> where Label : View, ValueLabel : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/slider.md",
        page: { AnyView(SliderGalleryPage()) }
    )
}

#Preview {
    SliderGalleryPage()
        .frame(width: 900, height: 700)
}
