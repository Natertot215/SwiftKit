import SwiftUI

// SwiftUI `View/controlGroupStyle(_:)` + `ControlGroupStyle` + `ControlGroupStyleConfiguration`
// Source: Documentation/SwiftUI/view-styles/controlgroupstyle(_:).md (and protocol/configuration)
// macOS 12.0+. Built-in style values: .automatic, .navigation (limited), .palette,
// .menu, .compactMenu.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 100

struct ControlGroupStylePage: View {
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
            Text("View/controlGroupStyle(_:) + ControlGroupStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for control groups within this view. ControlGroupStyle is the protocol; ControlGroupStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/controlgroupstyle(_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        CGSCard(title: ".automatic", api: ".controlGroupStyle(.automatic)") {
            sampleGroup.controlGroupStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Built-in ControlGroupStyle values supported on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                CGSCard(title: ".automatic", api: ".controlGroupStyle(.automatic)") {
                    sampleGroup.controlGroupStyle(.automatic)
                }
                CGSCard(title: ".palette", api: ".controlGroupStyle(.palette)") {
                    sampleGroup.controlGroupStyle(.palette)
                }
                CGSCard(title: ".menu", api: ".controlGroupStyle(.menu)") {
                    sampleGroup.controlGroupStyle(.menu)
                }
                CGSCard(title: ".compactMenu", api: ".controlGroupStyle(.compactMenu)") {
                    sampleGroup.controlGroupStyle(.compactMenu)
                }
            }
        }
    }

    private var sampleGroup: some View {
        ControlGroup {
            Button { } label: { Label("Bold", systemImage: "bold") }
            Button { } label: { Label("Italic", systemImage: "italic") }
            Button { } label: { Label("Underline", systemImage: "underline") }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("With Label content")
                    .font(.headline)
                CGSCard(title: ".compactMenu + Label", api: "ControlGroup { … } label: { Label(\"Format\", systemImage: \"textformat\") }") {
                    ControlGroup {
                        Button { } label: { Label("Bold", systemImage: "bold") }
                        Button { } label: { Label("Italic", systemImage: "italic") }
                    } label: {
                        Label("Format", systemImage: "textformat")
                    }
                    .controlGroupStyle(.compactMenu)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("ControlGroupStyleConfiguration shape")
                    .font(.headline)
                CGSCodeBlock(text:
                    """
                    struct ControlGroupStyleConfiguration {
                        struct Label : View { … }     // optional label view
                        struct Content : View { … }   // group's controls

                        var label: Label
                        var content: Content
                    }
                    """)
                Text("SwiftKit does NOT author custom ControlGroupStyle conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct CGSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [CGSNote] = [
        .init(title: ".automatic resolves to a borderless control row.",
              detail: "On macOS toolbar contexts .automatic looks like a tight cluster of borderless buttons. In other contexts it tracks the surrounding container.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: ".palette renders as a row of tappable swatches.",
              detail: "Best for visually-distinct icon choices (formatting tools, paint colors). The control group is non-collapsible.",
              symbol: "paintpalette"),
        .init(title: ".menu collapses to a single button + popup.",
              detail: "When space is tight (toolbar overflow, inspector), .menu hides the children behind a chevron. The group's label becomes the button title.",
              symbol: "menubar.dock.rectangle"),
        .init(title: ".compactMenu is the smallest variant.",
              detail: "Same idea as .menu but tighter; useful for inline contexts. Provide a Label to give the trigger a meaningful glyph.",
              symbol: "ellipsis.circle"),
        .init(title: "ControlGroup is for related, parallel actions.",
              detail: "Don't reach for it when the actions aren't a tight cluster — toolbars or HStack of Buttons usually look better.",
              symbol: "questionmark.circle")
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

private struct CGSCard<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct CGSCodeBlock: View {
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
    ControlGroupStylePage()
        .frame(width: 1200, height: 1000)
}
