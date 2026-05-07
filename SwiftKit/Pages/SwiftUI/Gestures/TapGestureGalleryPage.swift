import SwiftUI

struct TapGestureGalleryPage: View {
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

extension TapGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.tapGesture",
        title: "TapGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "TapGesture",
            "View/onTapGesture(count:perform:)",
            "View/onTapGesture(count:coordinateSpace:perform:)"
        ],
        blurb: "A gesture that recognizes one or more taps. Use the onTapGesture(...) modifier for the common single-action case, or attach a TapGesture instance via gesture(_:) for richer state handling.",
        signature: "struct TapGesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/tapgesture.md",
        page: { AnyView(TapGestureGalleryPage()) }
    )
}

#Preview {
    TapGestureGalleryPage()
        .frame(width: 900, height: 700)
}
