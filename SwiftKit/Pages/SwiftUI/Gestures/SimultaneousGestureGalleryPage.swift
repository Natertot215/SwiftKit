import SwiftUI

struct SimultaneousGestureGalleryPage: View {
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

extension SimultaneousGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.simultaneousGesture",
        title: "SimultaneousGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "SimultaneousGesture",
            "View/simultaneousGesture(_:including:)",
            "View/simultaneousGesture(_:isEnabled:)",
            "View/simultaneousGesture(_:name:isEnabled:)"
        ],
        blurb: "A container that evaluates two child gestures at the same time, with neither preceding the other. The simultaneousGesture(_:) modifier attaches a gesture that runs alongside any gesture already on the view.",
        signature: "@frozen struct SimultaneousGesture<First, Second> where First : Gesture, Second : Gesture",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/gestures/simultaneousgesture.md",
        page: { AnyView(SimultaneousGestureGalleryPage()) }
    )
}

#Preview {
    SimultaneousGestureGalleryPage()
        .frame(width: 900, height: 700)
}
