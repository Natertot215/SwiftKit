import SwiftUI

// SwiftUI `Label` view reference page.
// Source: Documentation/SwiftUI/view-styles/label.md
// macOS 11.0+. The Label view itself — title + icon composed into a single
// labeled control. Distinct from labelStyle(_:) modifier (separate page).

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 80

struct LabelTypePage: View {
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
            Text("Label")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A standard label for user interface items, consisting of an icon with a title.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/label.md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LTCard(title: "Label(\"_:\", systemImage:)", api: "Label(\"Mailbox\", systemImage: \"tray\")") {
            Label("Mailbox", systemImage: "tray")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Built-in initializers — most call sites use Label(_, systemImage:).")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                LTCard(title: "Label(_:systemImage:)", api: "Label(\"Inbox\", systemImage: \"tray\")") {
                    Label("Inbox", systemImage: "tray")
                }
                LTCard(title: "Label(_:image:)", api: "Label(\"Brand\", image: \"BrandAsset\")") {
                    Label {
                        Text("Brand")
                    } icon: {
                        Image(systemName: "sparkle")
                    }
                }
                LTCard(title: "Label { title } icon: { icon }", api: "Label { Text(\"…\") } icon: { Image(systemName: \"…\") }") {
                    Label {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Mailbox")
                            Text("12 unread")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    } icon: {
                        Image(systemName: "tray.full")
                    }
                }
                LTCard(title: "LocalizedStringKey + symbol", api: "Label(\"settings\", systemImage: \"gear\")") {
                    Label("settings", systemImage: "gear")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("With labelStyle(_:) — see LabelStylePage for full details")
                    .font(.headline)
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
                ], alignment: .leading, spacing: 24) {
                    LTCard(title: ".titleAndIcon", api: ".labelStyle(.titleAndIcon)") {
                        Label("Send", systemImage: "paperplane").labelStyle(.titleAndIcon)
                    }
                    LTCard(title: ".titleOnly", api: ".labelStyle(.titleOnly)") {
                        Label("Send", systemImage: "paperplane").labelStyle(.titleOnly)
                    }
                    LTCard(title: ".iconOnly", api: ".labelStyle(.iconOnly)") {
                        Label("Send", systemImage: "paperplane").labelStyle(.iconOnly)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Tint colors the icon")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    LTCard(title: ".tint(.green)", api: ".tint(.green)") {
                        Label("Available", systemImage: "checkmark.circle.fill").tint(.green)
                    }
                    LTCard(title: ".tint(.red)", api: ".tint(.red)") {
                        Label("Error", systemImage: "exclamationmark.octagon.fill").tint(.red)
                    }
                }
            }
        }
    }

    private struct LTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LTNote] = [
        .init(title: "Label vs labelStyle — different concepts.",
              detail: "Label is the VIEW that pairs a title with an icon. labelStyle(_:) is the MODIFIER that controls how that pair is rendered (.titleAndIcon, .iconOnly, etc.).",
              symbol: "rectangle.split.2x1"),
        .init(title: "Most call sites: Label(_:systemImage:).",
              detail: "Pair a localized title with an SF Symbol. The system handles spacing, baseline, accessibility automatically.",
              symbol: "textformat"),
        .init(title: "Custom title view via the trailing closure init.",
              detail: "Label { title } icon: { icon } accepts arbitrary Views for both. Use it when the title needs multi-line or formatted text.",
              symbol: "doc.text"),
        .init(title: "Image init for non-symbol assets.",
              detail: "Label(_:image:) with a string asset name, or use the closure init with Image(\"BrandLogo\"). Both work for non-SF artwork.",
              symbol: "photo"),
        .init(title: "Inside controls, Label drives the layout.",
              detail: "Button { … } label: { Label(\"Send\", systemImage: \"paperplane\") } picks up labelStyle from the environment and renders accordingly. That's why .labelStyle(.iconOnly) on a Button hides the title.",
              symbol: "rectangle.connected.to.line.below")
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

private struct LTCard<Content: View>: View {
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
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    LabelTypePage()
        .frame(width: 1200, height: 1100)
}
