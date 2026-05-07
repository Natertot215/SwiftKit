import SwiftUI

struct NSHostingSceneRepresentationGalleryPage: View {
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

extension NSHostingSceneRepresentationGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.appKitIntegration.nsHostingSceneRepresentation",
        title: "NSHostingSceneRepresentation",
        folder: "AppKit integration",
        framework: .swiftUI,
        absorbedSymbols: ["NSHostingSceneRepresentation"],
        blurb: "An AppKit type that hosts and can present SwiftUI scenes. Use with NSApplication.addSceneRepresentation to surface SwiftUI scenes (Settings, WindowGroup) from an AppKit-lifecycle app.",
        signature: "class NSHostingSceneRepresentation<Content> where Content : Scene",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/appkit-integration/nshostingscenerepresentation.md",
        page: { AnyView(NSHostingSceneRepresentationGalleryPage()) }
    )
}

#Preview {
    NSHostingSceneRepresentationGalleryPage()
        .frame(width: 900, height: 700)
}
