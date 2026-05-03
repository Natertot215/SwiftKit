import SwiftUI

// SwiftUI `WindowIdealSize` + `Scene/windowIdealSize(_:)` reference page.
// Sources:
//   Documentation/SwiftUI/windows/windowidealsize.md
//   Documentation/SwiftUI/windows/windowidealsize(_:).md
// macOS 15.0+. Three values: .automatic, .fitToContent, .maximum.
// Controls window size when the user zooms (green button).

struct WindowIdealSizePage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("WindowIdealSize")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Determines the size a window adopts on zoom (the green traffic-light button).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/windows/windowidealsize.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        WindowSnippet(
            api: ".windowIdealSize(.automatic)",
            code: """
            WindowGroup {
                ContentView()
            }
            .windowIdealSize(.automatic)
            """,
            note: "Default \u{2014} window zooms to its maximum size or the display, whichever is smaller. Equivalent to .maximum."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system default behavior") {
                WindowSnippet(
                    api: ".windowIdealSize(.automatic)",
                    code: """
                    WindowGroup { ContentView() }
                        .windowIdealSize(.automatic)
                    """,
                    note: "Same effect as .maximum on macOS 15."
                )
            }

            VariantBlock(title: ".fitToContent \u{2014} zoom to the content's ideal size") {
                WindowSnippet(
                    api: ".windowIdealSize(.fitToContent)",
                    code: """
                    WindowGroup {
                        ContentView()
                            .frame(idealWidth: 800, idealHeight: 600)
                    }
                    .windowIdealSize(.fitToContent)
                    """,
                    note: "Zoom snaps the window to the content's idealWidth / idealHeight rather than the screen bounds."
                )
            }

            VariantBlock(title: ".maximum \u{2014} zoom to the largest available size") {
                WindowSnippet(
                    api: ".windowIdealSize(.maximum)",
                    code: """
                    WindowGroup { ContentView() }
                        .windowIdealSize(.maximum)
                    """,
                    note: "Equivalent to the historical macOS green-button behavior \u{2014} go as large as possible within the display's visible area."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            BehaviorList(items: [
                "Affects the green zoom button only \u{2014} doesn't change the window's initial size (use .defaultSize for that).",
                "Option-clicking the green button performs a zoom rather than entering full screen.",
                ".fitToContent requires the content view to declare ideal dimensions via .frame(idealWidth: \u{2026}, idealHeight: \u{2026}).",
                "If you need fully custom zoom geometry, use .windowIdealPlacement(_:) instead \u{2014} it gives you a closure with WindowLayoutRoot + WindowPlacementContext.",
                ".automatic and .maximum behave identically today; .automatic future-proofs the call site if defaults change."
            ])
        }
    }

    // MARK: Notes

    private struct WISNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [WISNote] = [
        .init(title: "Three values, one knob.",
              detail: ".automatic, .fitToContent, .maximum. Pick .fitToContent when zoom should reflect content (a video at native aspect ratio, a fixed-width article); pick .maximum or .automatic for the classic Mac \u{201C}fill the screen\u{201D} zoom.",
              symbol: "arrow.up.left.and.arrow.down.right"),
        .init(title: ".windowIdealPlacement(_:) is the escape hatch.",
              detail: "When neither .fitToContent nor .maximum captures what you want, swap to .windowIdealPlacement(_:) and compute a WindowPlacement programmatically using the content's sizeThatFits(\u{2026}) and the display's visibleRect.",
              symbol: "function"),
        .init(title: "Apple's Destination Video sample uses .windowIdealPlacement.",
              detail: "Their video player computes a zoom size that maintains the video's aspect ratio so black bars don't appear. See the linked HIG article in this section's docs.",
              symbol: "play.rectangle"),
        .init(title: "macOS 15 only.",
              detail: "Earlier targets had no SwiftUI control over zoom \u{2014} the green button always went full or maximum. macOS 15+ adds this knob and the more granular .windowIdealPlacement.",
              symbol: "calendar.badge.exclamationmark")
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

// MARK: - Reusable demo helpers (page-local)

private struct WindowSnippet: View {
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

private struct VariantBlock<Content: View>: View {
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
    WindowIdealSizePage()
        .frame(width: 1100, height: 800)
}
