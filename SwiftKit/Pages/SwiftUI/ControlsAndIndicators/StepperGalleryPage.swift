import SwiftUI

struct StepperGalleryPage: View {
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

extension StepperGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.stepper",
        title: "Stepper",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["Stepper"],
        blurb: "A control that performs increment and decrement actions over a value, often constrained to a bounded range with a fixed step.",
        signature: "struct Stepper<Label> where Label : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/stepper.md",
        page: { AnyView(StepperGalleryPage()) }
    )
}

#Preview {
    StepperGalleryPage()
        .frame(width: 900, height: 700)
}
