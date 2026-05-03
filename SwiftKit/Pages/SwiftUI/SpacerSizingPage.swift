import SwiftUI

// SwiftUI `SpacerSizing` reference page.
// Source: Documentation/SwiftUI/toolbars/spacersizing.md
// macOS 26.0+. Drives ToolbarSpacer's behavior. Two cases: .fixed, .flexible.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct SpacerSizingPage: View {
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
            Text("SpacerSizing")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Defines how a ToolbarSpacer sizes itself \u{2014} a small fixed gap or a greedy flexible push.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/spacersizing.md \u{00b7} macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "ToolbarSpacer(.fixed)") {
            NavigationStack {
                Text("Two clusters separated by a fixed-size spacer")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar(id: "sizing-default") {
                        ToolbarItem(id: "a") { Button { } label: { Image(systemName: "plus") } }
                        ToolbarSpacer(.fixed)
                        ToolbarItem(id: "b") { Button { } label: { Image(systemName: "minus") } }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".fixed \u{2014} system-defined small gap") {
                DemoFrame(api: "ToolbarSpacer(.fixed)") {
                    NavigationStack {
                        Text(".fixed inserts a constant standard gap between items")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "sizing-fixed") {
                                ToolbarItem(id: "a") { Button { } label: { Image(systemName: "bold") } }
                                ToolbarSpacer(.fixed)
                                ToolbarItem(id: "b") { Button { } label: { Image(systemName: "italic") } }
                            }
                    }
                }
            }

            VariantBlock(title: ".flexible \u{2014} push items apart") {
                DemoFrame(api: "ToolbarSpacer(.flexible)") {
                    NavigationStack {
                        Text(".flexible pushes left items toward the leading edge and right items toward the trailing edge")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar(id: "sizing-flex") {
                                ToolbarItem(id: "left") { Button { } label: { Image(systemName: "chevron.left") } }
                                ToolbarSpacer(.flexible)
                                ToolbarItem(id: "right") { Button { } label: { Image(systemName: "chevron.right") } }
                            }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Type properties") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".fixed \u{2014} constant width per system metrics", systemImage: "ruler")
                    Label(".flexible \u{2014} greedy, expands to fill available space", systemImage: "arrow.left.and.right")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Pairs exclusively with ToolbarSpacer.",
              detail: "SpacerSizing exists to coordinate with ToolbarSpacer; you don't pass it anywhere else in the SwiftUI surface.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "Sendable.",
              detail: "Sendable + SendableMetatype \u{2014} cheap to ferry across actors and use in concurrent code.",
              symbol: "tag"),
        .init(title: "macOS 26+ only.",
              detail: "Pre-26 macOS apps used a Spacer() inside a ToolbarItemGroup as a brittle workaround. SpacerSizing + ToolbarSpacer are the supported pattern from 26 onwards.",
              symbol: "calendar"),
        .init(title: "User customization treats them as items.",
              detail: "In a customizable toolbar, .fixed and .flexible spacers behave like any other ToolbarItem \u{2014} the user can add, remove, or rearrange them via the macOS Customize\u{2026} sheet, including adding multiple copies.",
              symbol: "slider.horizontal.3")
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
    SpacerSizingPage()
        .frame(width: 1100, height: 900)
}
