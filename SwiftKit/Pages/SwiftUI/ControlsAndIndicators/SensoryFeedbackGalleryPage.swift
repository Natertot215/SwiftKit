import SwiftUI

struct SensoryFeedbackGalleryPage: View {
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

extension SensoryFeedbackGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.sensoryFeedback",
        title: "SensoryFeedback",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: [
            "SensoryFeedback",
            "View/sensoryFeedback(_:trigger:)",
            "View/sensoryFeedback(trigger:_:)",
            "View/sensoryFeedback(_:trigger:condition:)"
        ],
        blurb: "Represents a type of haptic and/or audio feedback that can be played. Companion sensoryFeedback(_:trigger:) modifier overloads play feedback when a trigger value changes.",
        signature: "struct SensoryFeedback",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/sensoryfeedback.md",
        page: { AnyView(SensoryFeedbackGalleryPage()) }
    )
}

#Preview {
    SensoryFeedbackGalleryPage()
        .frame(width: 900, height: 700)
}
