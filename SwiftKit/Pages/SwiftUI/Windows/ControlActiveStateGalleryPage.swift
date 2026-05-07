import SwiftUI

struct ControlActiveStateGalleryPage: View {
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

extension ControlActiveStateGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.windows.controlActiveState",
        title: "ControlActiveState",
        folder: "Windows",
        framework: .swiftUI,
        absorbedSymbols: [
            "ControlActiveState"
        ],
        blurb: "The active appearance expected of controls in a window. Deprecated in macOS 26 — use EnvironmentValues.appearsActive instead.",
        signature: "enum ControlActiveState",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/windows/controlactivestate.md",
        page: { AnyView(ControlActiveStateGalleryPage()) }
    )
}

#Preview {
    ControlActiveStateGalleryPage()
        .frame(width: 900, height: 700)
}
