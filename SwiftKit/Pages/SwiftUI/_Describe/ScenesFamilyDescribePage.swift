import SwiftUI

struct ScenesFamilyDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Scene-Level APIs",
            docPath: "Documentation/SwiftUI/scenes/",
            availability: "macOS 11.0+",
            blurb: """
            These types and modifiers operate at the App.body or Scene scope — one level above any individual view. Scene, SceneBuilder, and Settings define the structural blocks of a SwiftUI app. ScenePhase and openSettings / OpenSettingsAction are environment values read by scene-resident views. MenuBarExtra / MenuBarExtraStyle attach a persistent menu-bar item or window to the app. commands(content:) wires a Commands-conforming value into the menu bar from a WindowGroup. None can be instantiated or demonstrated inside a child View. WKNotificationScene is watchOS-only. For a working SettingsLink demo (the one renderable scene-adjacent view), see the SettingsLink gallery page.
            """,
            signatures: [
                "Scene { … }",
                "Settings { … }",
                "SceneBuilder",
                "ScenePhase — .active, .inactive, .background",
                "MenuBarExtra(\"Title\", systemImage: \"…\") { … }",
                "MenuBarExtraStyle — .automatic, .menu, .window",
                "OpenSettingsAction / openSettings",
                "Scene.commands(content:)",
                "WKNotificationScene — watchOS only"
            ],
            notes: [
                "Place Settings { … } and MenuBarExtra directly inside @main App.body, not inside a view.",
                "@Environment(\\.scenePhase) var phase reads ScenePhase from any view inside a scene.",
                "WKNotificationScene is watchOS 7.0+ only — no macOS equivalent."
            ]
        )
    }
}

#Preview {
    ScenesFamilyDescribePage()
        .frame(width: 900, height: 700)
}
