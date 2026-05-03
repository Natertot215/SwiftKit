import SwiftUI

// SwiftUI `View/indexViewStyle(_:)` + `IndexViewStyle` page.
// Source: Documentation/SwiftUI/view-styles/indexviewstyle(_:).md, indexviewstyle.md
// iOS 14.0+ / iPadOS 14.0+ / visionOS 1.0+ / watchOS 8.0+ — NOT AVAILABLE ON macOS.
// Page is code-only with explicit unavailability note.

struct IndexViewStylePage: View {
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
            Text("View/indexViewStyle(_:) + IndexViewStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for the index view within the current environment. (Not available on macOS.)")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/indexviewstyle(_:).md · iOS 14.0+ / iPadOS / visionOS / watchOS — NOT macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        IVSCallout(
            title: "Unavailable on macOS",
            detail: "IndexViewStyle is iOS-flavored and applies to TabView's page-style index dots. macOS doesn't ship .tabViewStyle(.page), so the index modifier never reaches a target on Mac.")
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Built-in IndexViewStyle values (iOS reference)")
                .font(.headline)
            IVSCodeBlock(text:
                """
                .page                                 — DefaultIndexViewStyle (iOS)
                .page(backgroundDisplayMode: .always)
                .page(backgroundDisplayMode: .interactive)
                .page(backgroundDisplayMode: .never)
                """)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Typical iOS pairing — TabView .page style")
                .font(.headline)
            IVSCodeBlock(text:
                """
                TabView {
                    PageA(); PageB(); PageC()
                }
                .tabViewStyle(.page)                                  // iOS only
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                """)
            Text("On macOS this code compiles only when targeting iOS / Catalyst. SwiftKit's macOS-only build never resolves the .page modifiers to a renderable view.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private struct IVSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [IVSNote] = [
        .init(title: "macOS doesn't render an index view.",
              detail: "TabView's page-style and the dotted index that goes with it are iOS-flavored. macOS uses NavigationSplitView for paging-like patterns.",
              symbol: "macwindow"),
        .init(title: "backgroundDisplayMode toggles the dots' contrast strip.",
              detail: ".always shows the strip permanently. .interactive only while the user is paging. .never never. macOS-only target = moot.",
              symbol: "circle.bottomhalf.filled"),
        .init(title: "Use NavigationSplitView with a sidebar list for macOS paging.",
              detail: "If you have a discrete set of pages on macOS, the canonical pattern is sidebar selection driving a detail column.",
              symbol: "sidebar.left"),
        .init(title: "Documented here for completeness.",
              detail: "SwiftKit lists every documented View Style API. This one's iOS-only — included so the catalog matches Apple's index, not because macOS uses it.",
              symbol: "info.circle")
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

private struct IVSCallout: View {
    let title: String
    let detail: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
                .foregroundStyle(.orange)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct IVSCodeBlock: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

#Preview {
    IndexViewStylePage()
        .frame(width: 1100, height: 800)
}
