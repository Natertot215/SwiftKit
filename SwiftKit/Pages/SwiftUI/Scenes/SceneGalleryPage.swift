import SwiftUI

struct SceneGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "protocol Scene",
                signature: "@MainActor @preconcurrency protocol Scene",
                note: "Top-level container declared inside an App's body. Implement the body computed property and return a composition of built-in scenes — WindowGroup, Window, Settings, MenuBarExtra, DocumentGroup."
            )

            ReferenceTile(
                name: "Built-in conformers",
                signature: "WindowGroup · Window · Settings · MenuBarExtra · DocumentGroup",
                note: "Apple ships these as the canonical Scene types. WindowGroup is the primary surface for document-style apps; Window for singletons; Settings for the preferences pane; MenuBarExtra for status-bar apps."
            )

            ReferenceTile(
                name: "Composition via @SceneBuilder",
                signature: "var body: some Scene { WindowGroup { ContentView() }; Settings { SettingsView() } }",
                note: "An App's body is composed by @SceneBuilder — concatenate scenes by listing them. Each becomes an independently managed window or surface."
            )

            ReferenceTile(
                name: "Scene modifier surface",
                signature: ".commands(_:) · .defaultSize(_:) · .windowStyle(_:) · .windowResizability(_:) · .handlesExternalEvents(matching:)",
                note: "Scenes carry their own modifier family — separate from View modifiers — that customize launch behavior, sizing, toolbar style, and OS integrations."
            )

            ReferenceTile(
                name: "Scene phase",
                signature: "@Environment(\\.scenePhase) private var scenePhase  // .active / .inactive / .background",
                note: "Read scenePhase from the environment inside any view to react to scene activation transitions. Each Scene reports its own phase independently."
            )
        }
    }
}

extension SceneGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.scene",
        title: "Scene",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: ["Scene", "swiftui.scenes.scene"],
        blurb: "A part of an app's user interface with a life cycle managed by the system. Scenes are the top-level containers that an App's body composes — WindowGroup, Window, Settings, MenuBarExtra, and DocumentGroup all conform to Scene.",
        signature: "@MainActor @preconcurrency protocol Scene",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scenes/scene.md",
        page: { AnyView(SceneGalleryPage()) }
    )
}

#Preview {
    SceneGalleryPage()
        .frame(width: 900, height: 700)
}
