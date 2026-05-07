import SwiftUI

struct OpenWindowGalleryPage: View {
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

extension OpenWindowGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.openWindow",
        title: "OpenWindow",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "OpenWindowAction",
            "EnvironmentValues/openWindow",
            "PushWindowAction",
            "EnvironmentValues/supportsMultipleWindows"
        ],
        blurb: "An environment action that programmatically opens a window from a WindowGroup or Window scene by id, value, or both. PushWindowAction is the iPad-multitasking variant.",
        signature: "struct OpenWindowAction",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/windows/openwindowaction.md",
        page: { AnyView(OpenWindowGalleryPage()) }
    )
}

#Preview {
    OpenWindowGalleryPage()
        .frame(width: 900, height: 700)
}
