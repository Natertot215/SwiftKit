import SwiftUI

struct WindowSizingGalleryPage: View {
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

extension WindowSizingGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowSizing",
        title: "WindowSizing",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "Scene/defaultSize(_:)",
            "Scene/defaultSize(width:height:)",
            "Scene/defaultSize(width:height:depth:)",
            "Scene/defaultSize(_:in:)",
            "Scene/defaultSize(width:height:depth:in:)",
            "Scene/windowResizability(_:)",
            "WindowResizability",
            "Scene/windowIdealSize(_:)",
            "WindowIdealSize"
        ],
        blurb: "Scene modifiers and value types that govern window sizing — default launch size, resizability strategy, and the size used during zoom.",
        signature: "struct WindowResizability",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/windows/windowresizability.md",
        page: { AnyView(WindowSizingGalleryPage()) }
    )
}

#Preview {
    WindowSizingGalleryPage()
        .frame(width: 900, height: 700)
}
