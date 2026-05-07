import SwiftUI

struct SceneBuilderGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ReferenceTile(
                name: "@resultBuilder SceneBuilder",
                signature: "@resultBuilder struct SceneBuilder",
                note: "Powers the trailing closure of an App's body. Treats each statement as a Scene and concatenates them into a composite Scene tree."
            )

            ReferenceTile(
                name: "Compose multiple scenes",
                signature: "@main struct MyApp: App { var body: some Scene { WindowGroup { … }; Settings { … } } }",
                note: "Inside the body you may list a WindowGroup, a Settings scene, a MenuBarExtra, and a DocumentGroup — SceneBuilder folds them all into a single conforming type."
            )

            ReferenceTile(
                name: "Conditional and ForEach support",
                signature: "if condition { WindowGroup { … } } else { MenuBarExtra(\"\") { … } }",
                note: "Like ViewBuilder, SceneBuilder supports if/else, switch, and limited iteration so an app can opt scenes in or out at compile time based on platform or feature flags."
            )

            ReferenceTile(
                name: "Implicitly applied",
                signature: "var body: some Scene { … }  // closure is @SceneBuilder by default",
                note: "You never write @SceneBuilder yourself unless authoring a custom Scene container — Apple applies it automatically to App.body and to Scene-accepting closures."
            )
        }
    }
}

extension SceneBuilderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.sceneBuilder",
        title: "SceneBuilder",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: ["SceneBuilder", "swiftui.scenes.scenebuilder"],
        blurb: "A result builder for composing a collection of scenes into a single composite scene. Used implicitly inside an App's body to combine multiple top-level scenes such as a WindowGroup plus a Settings scene.",
        signature: "@resultBuilder struct SceneBuilder",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scenes/scenebuilder.md",
        page: { AnyView(SceneBuilderGalleryPage()) }
    )
}

#Preview {
    SceneBuilderGalleryPage()
        .frame(width: 900, height: 700)
}
