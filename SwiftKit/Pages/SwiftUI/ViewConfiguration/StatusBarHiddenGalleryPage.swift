import SwiftUI

// SwiftUI `View/statusBarHidden(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/statusbarhidden(_:).md
// iOS / iPadOS / Mac Catalyst / visionOS only. macOS does not expose a status bar
// surface for this modifier, so this page documents code only \u{2014} no live preview.

struct StatusBarHiddenGalleryPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/statusBarHidden(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the visibility of the status bar.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/statusbarhidden(_:).md \u{00b7} iOS / iPadOS / Mac Catalyst / visionOS only")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SBHCodeBlock(
            api: ".statusBarHidden(true)",
            code: """
            struct FullScreenViewer: View {
                var body: some View {
                    VideoPlayer(player: player)
                        .ignoresSafeArea()
                        .statusBarHidden(true)
                }
            }
            """,
            note: "iOS-only. macOS has no status bar surface for this API \u{2014} this page is code-stub only."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SBHVariantRow(title: "Default parameter value") {
                SBHCodeBlock(
                    api: ".statusBarHidden() == .statusBarHidden(true)",
                    code: """
                    Text("Hello")
                        .statusBarHidden()  // hidden defaults to true
                    """
                )
            }

            SBHVariantRow(title: "Toggle with state") {
                SBHCodeBlock(
                    api: ".statusBarHidden(isImmersive)",
                    code: """
                    @State private var isImmersive = false
                    var body: some View {
                        ContentView()
                            .statusBarHidden(isImmersive)
                            .onTapGesture { isImmersive.toggle() }
                    }
                    """
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            SBHCalloutBox(text: "macOS does not render a status bar of this kind. The modifier is platform-specific to iOS / iPadOS / Mac Catalyst / visionOS.")
            SBHCalloutBox(text: "On iPad, the iOS status bar is the thin bar at the screen edge \u{2014} not to be confused with the iPadOS Multitasking Controls or the toolbar.")
            SBHCalloutBox(text: "On visionOS, the status bar concept is replaced with system chrome managed by the OS \u{2014} treat this modifier as a no-op there.")
        }
    }

    private struct SBHNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [SBHNote] = [
        .init(title: "iOS-only platform surface.",
              detail: "Use this when building cross-platform apps that include iOS. On macOS the modifier silently does nothing because the platform has no analogous status bar.",
              symbol: "iphone"),
        .init(title: "Pair with .ignoresSafeArea for true full-screen.",
              detail: "Hiding the status bar alone doesn't reclaim its safe-area inset. Combine with .ignoresSafeArea() for genuinely edge-to-edge content.",
              symbol: "rectangle.fill"),
        .init(title: "Don't use as a primary fullscreen toggle.",
              detail: "On iOS, prefer presentation modes (.fullScreenCover, scene phase, ImmersiveSpace on visionOS) for app-level immersion. .statusBarHidden is a finishing touch.",
              symbol: "rectangle.expand.vertical"),
        .init(title: "Default parameter value is true.",
              detail: ".statusBarHidden() and .statusBarHidden(true) are equivalent. Pass false to make sure the bar shows even if a parent hid it.",
              symbol: "gear"),
        .init(title: "Inherited downward; overridden by descendants.",
              detail: "Apply on a screen-level container; nested views don't normally need to opt back in unless they specifically want the bar visible.",
              symbol: "arrow.down.circle")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct SBHCodeBlock: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

private struct SBHCalloutBox: View {
    let text: String

    var body: some View {
        Label {
            Text(text)
                .font(.callout)
                .foregroundStyle(.primary)
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.tint)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct SBHVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

extension StatusBarHiddenGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.statusBarHidden",
        title: "StatusBarHidden",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/statusBarHidden(_:)"],
        blurb: "Sets the visibility of the status bar. iOS / iPadOS / visionOS only — macOS does not present a system status bar in app windows.",
        signature: "func statusBarHidden(_ hidden: Bool = true) -> some View",
        availability: "iOS 13.0+ (no macOS support)",
        docPath: "Documentation/SwiftUI/view-configuration/statusbarhidden(_:).md",
        page: { AnyView(StatusBarHiddenGalleryPage()) }
    )
}

#Preview {
    StatusBarHiddenGalleryPage()
        .frame(width: 1100, height: 800)
}
