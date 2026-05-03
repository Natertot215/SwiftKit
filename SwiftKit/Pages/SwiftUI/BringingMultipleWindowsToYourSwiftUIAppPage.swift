import SwiftUI

// SwiftUI sample-code stub: \u{201C}Bringing multiple windows to your SwiftUI app\u{201D}.
// Source: Documentation/SwiftUI/windows/bringing-multiple-windows-to-your-swiftui-app.md
// Apple WWDC22 sample (session 10061). macOS 13+ / Xcode 14.2+.

struct BringingMultipleWindowsToYourSwiftUIAppPage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultBlock
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Bringing multiple windows to your SwiftUI app")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple sample-code project (WWDC22 session 10061). Compose rich views by reacting to state changes and customize scene presentation across iPadOS and macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/bringing-multiple-windows-to-your-swiftui-app.md \u{00b7} macOS 13.0+ / Xcode 14.2+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    @ViewBuilder
    private var defaultBlock: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This is an Apple sample-code project rather than a primitive. The sample shows how to build a multi-window SwiftUI app from the ground up using WindowGroup, openWindow, and state-driven scene presentation.")
                .font(.callout)
                .foregroundStyle(.primary)
            Link("Read the article on developer.apple.com",
                 destination: URL(string: "https://developer.apple.com/documentation/swiftui/bringing-multiple-windows-to-your-swiftui-app")!)
            Link("WWDC22 \u{2022} Session 10061",
                 destination: URL(string: "https://developer.apple.com/wwdc22/10061/")!)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TopicBlock(
                title: "Use WindowGroup for the primary scene",
                detail: "WindowGroup lets the app open multiple instances of the same template; each window has its own @State storage. The macOS Window menu and File \u{203a} New are wired automatically.",
                relatedPage: "WindowGroup"
            )

            TopicBlock(
                title: "Open windows programmatically with openWindow",
                detail: "Read @Environment(\\.openWindow) and call openWindow(id:) or openWindow(value:). Reusing the same value brings the existing window forward instead of creating a duplicate.",
                relatedPage: "EnvironmentValues/openWindow"
            )

            TopicBlock(
                title: "Customize scene chrome with windowStyle and windowToolbarStyle",
                detail: "Compose .windowStyle(_:) for the chrome envelope and .windowToolbarStyle(_:) for the toolbar look. SwiftKit itself uses .unified(showsTitle: false).",
                relatedPage: "WindowStyle / WindowToolbarStyle"
            )

            TopicBlock(
                title: "Gate openWindow on supportsMultipleWindows",
                detail: "Read @Environment(\\.supportsMultipleWindows) and disable the call site when false. Avoids silent runtime errors on platforms or configurations that don't allow multiple windows.",
                relatedPage: "EnvironmentValues/supportsMultipleWindows"
            )
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Sample-code project \u{2014} the actual code lives in the linked downloadable Xcode project.",
                "Article anchors WWDC22's introduction of the openWindow / dismissWindow pattern.",
                "Each cited API has its own dedicated page in this gallery's Windows folder.",
                "iPadOS multi-window requires UIApplicationSupportsMultipleScenes in Info.plist.",
                "macOS SwiftUI lifecycle apps get multi-window support automatically."
            ])
        }
    }

    // MARK: Notes

    private struct ANote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ANote] = [
        .init(title: "Reference, not a primitive.",
              detail: "Treat this page as a contents listing for the multi-window pattern. The actual APIs (WindowGroup, openWindow, supportsMultipleWindows, etc.) each have their own dedicated SwiftKit pages.",
              symbol: "book.closed"),
        .init(title: "Cross-reference inside SwiftKit.",
              detail: "See WindowGroupPage, OpenWindowPage, DismissWindowPage, SupportsMultipleWindowsPage, WindowStylePage, WindowToolbarStylePage. Every API the article touches is documented as its own primitive in this gallery.",
              symbol: "link"),
        .init(title: "Companion to the macOS-specific article.",
              detail: "For macOS 15+ chrome and state-restoration techniques, see CustomizingWindowStylesAndStateRestorationBehaviorInMacOSPage. That article handles macOS-only refinements that build on the multi-window foundation introduced here.",
              symbol: "macwindow"),
        .init(title: "WWDC22, session 10061.",
              detail: "The WWDC presentation walks through the sample interactively. SwiftKit's per-API pages are the static reference; the WWDC video adds context for why these APIs exist as a family.",
              symbol: "play.rectangle")
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

// MARK: - Page-local helpers

private struct TopicBlock: View {
    let title: String
    let detail: String
    let relatedPage: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(spacing: 6) {
                Image(systemName: "arrow.right")
                    .foregroundStyle(.tertiary)
                Text("See: \(relatedPage)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)
            }
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

private struct BehaviorList: View {
    let items: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items, id: \.self) { item in
                Label {
                    Text(item)
                        .font(.callout)
                        .foregroundStyle(.primary)
                } icon: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.tint)
                }
            }
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

#Preview {
    BringingMultipleWindowsToYourSwiftUIAppPage()
        .frame(width: 1100, height: 800)
}
