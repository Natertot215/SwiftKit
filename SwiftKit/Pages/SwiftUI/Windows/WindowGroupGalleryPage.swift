import SwiftUI

struct WindowGroupGalleryPage: View {
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

extension WindowGroupGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowGroup",
        title: "WindowGroup",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowGroup",
            "Bringing multiple windows to your SwiftUI app"
        ],
        blurb: "A scene that presents a group of identically structured windows. The hierarchy declared as the group's content serves as a template for each window the app creates.",
        signature: "struct WindowGroup<Content> where Content : View",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/windows/windowgroup.md",
        page: { AnyView(WindowGroupGalleryPage()) }
    )
}

#Preview {
    WindowGroupGalleryPage()
        .frame(width: 900, height: 700)
}
