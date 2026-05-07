import SwiftUI

struct WindowStyleGalleryPage: View {
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

extension WindowStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.windowStyle",
        title: "WindowStyle",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowStyle",
            "Scene/windowStyle(_:)",
            "View/presentedWindowStyle(_:)",
            "Customizing window styles and state-restoration behavior in macOS"
        ],
        blurb: "A specification for the appearance and interaction of a window. Built-in styles include automatic, hiddenTitleBar, plain, titleBar, and volumetric.",
        signature: "protocol WindowStyle",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/windows/windowstyle.md",
        page: { AnyView(WindowStyleGalleryPage()) }
    )
}

#Preview {
    WindowStyleGalleryPage()
        .frame(width: 900, height: 700)
}
