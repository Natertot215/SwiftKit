import SwiftUI

struct WindowVisibilityToggleGalleryPage: View {
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

extension WindowVisibilityToggleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowVisibilityToggle",
        title: "WindowVisibilityToggle",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowVisibilityToggle"
        ],
        blurb: "A specialized button for toggling the visibility of a window. Most commonly used in the main menu to show or hide a Window or UtilityWindow.",
        signature: "struct WindowVisibilityToggle<Label> where Label : View",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/windows/windowvisibilitytoggle.md",
        page: { AnyView(WindowVisibilityToggleGalleryPage()) }
    )
}

#Preview {
    WindowVisibilityToggleGalleryPage()
        .frame(width: 900, height: 700)
}
