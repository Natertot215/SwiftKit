import SwiftUI

// SwiftUI `View/interactionActivityTrackingTag(_:)` reference page.
// Source: Documentation/SwiftUI/view-configuration/interactionactivitytrackingtag(_:).md
// macOS 13.0+. Adds a string tag used for activity tracking. Tags are additive
// down the hierarchy (parent \u{201C}Home\u{201D} + child \u{201C}Feed\u{201D} \u{2192} resolved \u{201C}Home-Feed\u{201D}).

struct InteractionActivityTrackingTagGalleryPage: View {
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
            Text("View/interactionActivityTrackingTag(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets a tag that you use for tracking interactivity.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/interactionactivitytrackingtag(_:).md \u{00b7} macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        IATCodeBlock(
            api: ".interactionActivityTrackingTag(\"MessagesList\")",
            code: """
            List {
                Section("Today") {
                    ForEach(messageStore.today) { message in
                        Text(message.title)
                    }
                }
            }
            .interactionActivityTrackingTag("MessagesList")
            """,
            note: "Apple's example. The tag scopes interaction tracking for downstream MetricKit / signpost reporting."
        )
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            IATVariantRow(title: "Additive composition \u{2014} parent + child build the tag") {
                IATCodeBlock(
                    api: "Resolved tag = \"Home-Feed\"",
                    code: """
                    var body: some View {
                        Home()
                            .interactionActivityTrackingTag("Home")
                    }

                    struct Home: View {
                        var body: some View {
                            List { Text("\u{2026}") }
                                .interactionActivityTrackingTag("Feed")
                        }
                    }
                    """,
                    note: "Tags concatenate top-to-bottom with a hyphen. \"Home\" + \"Feed\" \u{2192} \"Home-Feed\"."
                )
            }

            IATVariantRow(title: "Tag once per logical screen / region") {
                IATCodeBlock(
                    api: ".interactionActivityTrackingTag(\"Settings\")",
                    code: """
                    SettingsView()
                        .interactionActivityTrackingTag("Settings")
                    """
                )
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            IATCalloutBox(text: "There's no read-side or visible UI for this modifier \u{2014} tags surface in OS-level performance traces and instrumentation rather than in your app's UI.")
            IATCalloutBox(text: "Pair with PerformanceMetric / MetricKit to receive interaction-level diagnostics keyed by tag in real-world reports.")
            IATCalloutBox(text: "Tags should be stable strings. Avoid embedding indices, IDs, or user-supplied content \u{2014} they pollute aggregation.")
        }
    }

    private struct IATNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [IATNote] = [
        .init(title: "Tag is a tracking key, not user-visible.",
              detail: "Use it to label regions of your UI for performance / interaction reporting. Nothing about the rendered output changes.",
              symbol: "barcode"),
        .init(title: "Hierarchical \u{2014} parent and child tags compose with a hyphen.",
              detail: "An ancestor's tag is prepended to descendants. Plan a vocabulary that reads cleanly when concatenated (e.g. \"Home-Feed-Cell\").",
              symbol: "arrow.down.circle"),
        .init(title: "Use stable, lowercase-or-PascalCase identifiers.",
              detail: "Treat tags like analytics event names: stable across builds so aggregations remain comparable. Don't include user input.",
              symbol: "textformat"),
        .init(title: "Apply at logical screen boundaries.",
              detail: "Tag the root of a screen / sheet / list. Going finer-grained is fine when justified by what you measure, but adds noise.",
              symbol: "rectangle.stack"),
        .init(title: "No on-screen feedback by design.",
              detail: "If you need to debug whether a tag is set, attach a custom logger that reads the modifier indirectly (e.g. via a wrapper). The modifier itself doesn't expose a binding.",
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

private struct IATCodeBlock: View {
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

private struct IATCalloutBox: View {
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

private struct IATVariantRow<Content: View>: View {
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

extension InteractionActivityTrackingTagGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewConfiguration.interactionActivityTrackingTag",
        title: "InteractionActivityTrackingTag",
        folder: "View configuration",
        framework: .swiftUI,
        absorbedSymbols: ["View/interactionActivityTrackingTag(_:)"],
        blurb: "Sets a tag used for tracking interactivity. Tags compose hierarchically — nested modifiers concatenate top-to-bottom (\"Home-Feed\") so subsystems can identify which surface produced an interaction.",
        signature: "func interactionActivityTrackingTag(_ tag: String) -> some View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/view-configuration/interactionactivitytrackingtag(_:).md",
        page: { AnyView(InteractionActivityTrackingTagGalleryPage()) }
    )
}

#Preview {
    InteractionActivityTrackingTagGalleryPage()
        .frame(width: 1100, height: 800)
}
