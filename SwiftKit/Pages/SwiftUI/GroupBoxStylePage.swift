import SwiftUI

// SwiftUI `View/groupBoxStyle(_:)` + `GroupBoxStyle` + `GroupBoxStyleConfiguration` page.
// Source: Documentation/SwiftUI/view-styles/groupboxstyle(_:).md (and protocol/configuration)
// macOS 11.0+. Built-in style values: .automatic.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 200

struct GroupBoxStylePage: View {
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
            Text("View/groupBoxStyle(_:) + GroupBoxStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for group boxes within this view. GroupBoxStyle is the protocol; GroupBoxStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/groupboxstyle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        GBSCard(title: ".automatic", api: ".groupBoxStyle(.automatic)") {
            sampleBox.groupBoxStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Apple ships .automatic publicly. The GroupBoxStyle protocol exists for custom conformers — SwiftKit doesn't author them per project hard constraint.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                GBSCard(title: ".automatic", api: ".groupBoxStyle(.automatic)") {
                    sampleBox.groupBoxStyle(.automatic)
                }
            }
        }
    }

    private var sampleBox: some View {
        GroupBox(label: Label("Account", systemImage: "person.crop.circle")) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Signed in as ada@apple.com")
                Text("Member since 2026")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("With and without label")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    GBSCard(title: "GroupBox(label:) — labeled", api: "GroupBox(label: Label(\"Account\", systemImage: \"person.crop.circle\")) { … }") {
                        sampleBox
                    }
                    GBSCard(title: "GroupBox — unlabeled", api: "GroupBox { … }") {
                        GroupBox {
                            Text("Plain content with no label.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("GroupBoxStyleConfiguration shape")
                    .font(.headline)
                GBSCodeBlock(text:
                    """
                    struct GroupBoxStyleConfiguration {
                        struct Label : View { … }
                        struct Content : View { … }

                        var label: Label
                        var content: Content
                    }
                    """)
                Text("SwiftKit does NOT author custom GroupBoxStyle conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct GBSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [GBSNote] = [
        .init(title: ".automatic is currently the only public conformer.",
              detail: "Apple ships only one literal value. Custom conformers via the protocol let you re-skin GroupBox app-wide.",
              symbol: "rectangle"),
        .init(title: "GroupBox draws a labeled card on macOS.",
              detail: "Headed grouping for related content — Preferences, dashboards, inspectors. Visual chrome: subtle background fill + corner radius + optional label above.",
              symbol: "square.stack"),
        .init(title: "Configuration exposes label + content separately.",
              detail: "Custom conformers compose configuration.label above configuration.content (or beside it, or omit it). Both are type-erased Views.",
              symbol: "rectangle.dashed"),
        .init(title: "macOS 11.0+ for GroupBox itself.",
              detail: "GroupBox debuted on macOS 11. The styling protocol shipped at the same time.",
              symbol: "calendar")
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

private struct GBSCard<Content: View>: View {
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
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct GBSCodeBlock: View {
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
    GroupBoxStylePage()
        .frame(width: 1200, height: 1000)
}
