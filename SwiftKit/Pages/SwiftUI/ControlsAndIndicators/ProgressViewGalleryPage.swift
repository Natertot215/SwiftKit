import SwiftUI

struct ProgressViewGalleryPage: View {
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

extension ProgressViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.progressView",
        title: "ProgressView",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: ["ProgressView"],
        blurb: "A view that shows progress toward completion of a task. Renders both determinate (percentage) and indeterminate (spinning) progress.",
        signature: "struct ProgressView<Label, CurrentValueLabel> where Label : View, CurrentValueLabel : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/progressview.md",
        page: { AnyView(ProgressViewGalleryPage()) }
    )
}

#Preview {
    ProgressViewGalleryPage()
        .frame(width: 900, height: 700)
}
