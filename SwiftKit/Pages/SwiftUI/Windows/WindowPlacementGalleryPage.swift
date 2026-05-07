import SwiftUI

struct WindowPlacementGalleryPage: View {
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

extension WindowPlacementGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowPlacement",
        title: "WindowPlacement",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowPlacement",
            "Scene/defaultPosition(_:)",
            "Scene/defaultWindowPlacement(_:)",
            "Scene/windowIdealPlacement(_:)",
            "WindowPlacementContext",
            "WindowLayoutRoot",
            "WindowProxy",
            "DisplayProxy"
        ],
        blurb: "A type and supporting machinery that represent a preferred size and position for a window. Use with defaultWindowPlacement, defaultPosition, and windowIdealPlacement modifiers.",
        signature: "struct WindowPlacement",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowplacement.md",
        page: { AnyView(WindowPlacementGalleryPage()) }
    )
}

#Preview {
    WindowPlacementGalleryPage()
        .frame(width: 900, height: 700)
}
