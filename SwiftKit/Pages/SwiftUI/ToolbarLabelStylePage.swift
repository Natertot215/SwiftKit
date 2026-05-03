import SwiftUI

// SwiftUI ToolbarLabelStyle + EnvironmentValues/toolbarLabelStyle reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarlabelstyle.md
// macOS 15.0+. Used with Scene/windowToolbarLabelStyle(_:) and the read-only
// EnvironmentValues/toolbarLabelStyle. Cases: .automatic, .iconOnly, .titleOnly,
// .titleAndIcon.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarLabelStylePage: View {
    @Environment(\.toolbarLabelStyle) private var environmentLabelStyle

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
            Text("EnvironmentValues/toolbarLabelStyle + ToolbarLabelStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("How toolbar items render their Label \u{2014} icon only, title only, both, or system default. Configured at the Scene level via .windowToolbarLabelStyle(_:); read inside views via the @Environment(\\.toolbarLabelStyle) value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarlabelstyle.md \u{00b7} macOS 15.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "@Environment(\\.toolbarLabelStyle) var style") {
            VStack(alignment: .leading, spacing: 6) {
                Text("Current environment value")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("toolbarLabelStyle = \(envDescription)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    private var envDescription: String {
        guard let style = environmentLabelStyle else { return "nil (system default)" }
        return String(describing: style)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".automatic \u{2014} system default per platform") {
                APICallout(".windowToolbarLabelStyle(.automatic)")
                Text("On macOS the default is icon-only for compact toolbars, title+icon for expanded chrome.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: ".iconOnly \u{2014} just the SF Symbol") {
                APICallout(".windowToolbarLabelStyle(.iconOnly)")
            }

            VariantBlock(title: ".titleOnly \u{2014} just the text") {
                APICallout(".windowToolbarLabelStyle(.titleOnly)")
            }

            VariantBlock(title: ".titleAndIcon \u{2014} both") {
                APICallout(".windowToolbarLabelStyle(.titleAndIcon)")
                Text("On macOS this is the most label-heavy option \u{2014} renders the SF Symbol stacked or beside the title depending on chrome height.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "Scene-level configuration") {
                APICallout("WindowGroup { \u{2026} }.windowToolbarLabelStyle(.titleAndIcon)")
                Text("This is a Scene modifier \u{2014} apply at WindowGroup / Window level. SwiftKit's gallery shell can't reconfigure its own toolbar mid-page, so demos here are documentation rather than live previews.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Cross-page link") {
                Text("See WindowToolbarLabelStylePage for the Scene-level modifier (.windowToolbarLabelStyle(_:) and (fixed:)) that consumes this type.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                APICallout("Scene/windowToolbarLabelStyle(_:)  \u{00b7}  Scene/windowToolbarLabelStyle(fixed:)")
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Two surfaces \u{2014} the type and the environment value.",
              detail: "ToolbarLabelStyle: the four cases. EnvironmentValues/toolbarLabelStyle: read-only in views, populated by the Scene modifier. Setting it in the View tree has no effect; the Scene-level modifier is the writer.",
              symbol: "rectangle.split.2x1"),
        .init(title: "macOS 15+ only.",
              detail: "Earlier macOS releases hard-coded the toolbar label style. From macOS 15 you can pin it on a Scene.",
              symbol: "calendar"),
        .init(title: "Equatable + Sendable.",
              detail: "Cheap to compare and store; safe to ferry across actors.",
              symbol: "tag"),
        .init(title: "User can override via the toolbar context menu.",
              detail: "macOS users can right-click the toolbar to choose Icon, Text, or Icon and Text. .windowToolbarLabelStyle(_:) sets the default; .windowToolbarLabelStyle(fixed:) prevents user override.",
              symbol: "hand.tap")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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

#Preview {
    ToolbarLabelStylePage()
        .frame(width: 1100, height: 900)
}
