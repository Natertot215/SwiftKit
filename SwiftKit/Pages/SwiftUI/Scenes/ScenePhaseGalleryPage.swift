import SwiftUI

struct ScenePhaseGalleryPage: View {
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "Live scenePhase",
                api: "@Environment(\\.scenePhase) private var scenePhase"
            ) {
                VStack(spacing: 8) {
                    Image(systemName: scenePhaseSymbol)
                        .font(.title2)
                        .foregroundStyle(.tint)
                    Text(scenePhaseLabel)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.primary)
                }
            }

            ReferenceTile(
                name: "Cases",
                signature: ".active · .inactive · .background",
                note: ".active is the foreground state. .inactive is on-screen but not receiving events (e.g. behind another window with reduced focus). .background means the scene is not visible at all."
            )

            ReferenceTile(
                name: "Read from the environment",
                signature: "@Environment(\\.scenePhase) private var scenePhase",
                note: "Each Scene reports its own phase. A multi-window app sees the phase for the scene the view belongs to, not a global app state."
            )

            ReferenceTile(
                name: "React with onChange",
                signature: ".onChange(of: scenePhase) { _, newPhase in if newPhase == .background { saveState() } }",
                note: "Pair scenePhase with .onChange to checkpoint state when the scene goes inactive or background — the canonical place to flush unsaved work."
            )

            ReferenceTile(
                name: "App-level handler",
                signature: "@main struct MyApp: App { @Environment(\\.scenePhase) var phase  …  }",
                note: "Reading scenePhase inside App captures the most-recently-active scene's phase. Useful for app-wide lifecycle hooks like background fetch scheduling."
            )
        }
    }

    private var scenePhaseLabel: String {
        switch scenePhase {
        case .active: return ".active"
        case .inactive: return ".inactive"
        case .background: return ".background"
        @unknown default: return "unknown"
        }
    }

    private var scenePhaseSymbol: String {
        switch scenePhase {
        case .active: return "circle.fill"
        case .inactive: return "circle.lefthalf.filled"
        case .background: return "circle"
        @unknown default: return "questionmark.circle"
        }
    }
}

extension ScenePhaseGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scenes.scenePhase",
        title: "ScenePhase",
        folder: "Scenes",
        framework: .swiftUI,
        absorbedSymbols: [
            "ScenePhase",
            "EnvironmentValues/scenePhase",
            "swiftui.scenes.scenephase",
            "swiftui.scenes.scenephase.type"
        ],
        blurb: "An enumeration of the operational state of a scene — active, inactive, or background. Read it from the environment via the scenePhase environment value to react to scene activation changes.",
        signature: "enum ScenePhase",
        availability: "macOS 11.0+",
        docPath: "Documentation/SwiftUI/scenes/scenephase.md",
        page: { AnyView(ScenePhaseGalleryPage()) }
    )
}

#Preview {
    ScenePhaseGalleryPage()
        .frame(width: 900, height: 700)
}
