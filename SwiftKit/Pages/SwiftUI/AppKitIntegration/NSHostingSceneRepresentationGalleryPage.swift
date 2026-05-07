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
            ReferenceTile(
                name: "NSHostingSceneRepresentation",
                signature: "class NSHostingSceneRepresentation<Content> where Content : Scene",
                note: "AppKit-side host that owns and presents a SwiftUI Scene tree. Use from an AppKit-lifecycle app (NSApplicationDelegate-based) to surface SwiftUI scenes — Settings, WindowGroup — without converting the entire app shell."
            )

            ReferenceTile(
                name: "Initializer",
                signature: "init(rootScene: Content)",
                note: "Construct with the SwiftUI Scene to host. The resulting NSHostingSceneRepresentation is the bridge object — register it with NSApplication so it participates in scene management."
            )

            ReferenceTile(
                name: "Add to NSApplication",
                signature: "NSApplication.shared.addSceneRepresentation(_:)",
                note: "Hand the representation to NSApplication so the system tracks its lifecycle. Settings scenes, in particular, integrate with the standard ⌘, shortcut once registered."
            )

            ReferenceTile(
                name: "When to reach for it",
                signature: "AppKit-lifecycle apps that want SwiftUI scenes",
                note: "An app already built around AppKit and NSApplicationMain that wants to add a SwiftUI Settings scene or document group without porting the whole app to the SwiftUI App protocol."
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
