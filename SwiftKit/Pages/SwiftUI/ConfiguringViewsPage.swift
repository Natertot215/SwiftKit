import SwiftUI

// SwiftUI "Configuring views" article reference page.
// Source: Documentation/SwiftUI/view-fundamentals/configuring-views.md
// Article-stub: a primer on view modifiers.

struct ConfiguringViewsPage: View {
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
            Text("Configuring Views")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adjust the characteristics of a view by applying view modifiers.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/configuring-views.md \u{00b7} article")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Plain vs. modified") {
            VStack(alignment: .leading, spacing: 12) {
                Text("Plain text")
                Text("Modified text")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.tint)
            }
            APICallout(".font(.title2).fontWeight(.semibold).foregroundStyle(.tint)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Layout modifiers") {
                Text("Centered")
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                APICallout(".frame(maxWidth: .infinity, minHeight: 60)")
                Text("Layout modifiers shape and size — .frame, .padding, .offset, .position, .layoutPriority, .alignmentGuide.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Appearance modifiers") {
                HStack(spacing: 12) {
                    Text("Tint")
                        .padding(8)
                        .foregroundStyle(.tint)
                    Text("Card")
                        .padding(8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                    Text("Bordered")
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, lineWidth: 1))
                }
                APICallout(".foregroundStyle(\u{2026}) / .background(\u{2026}) / .overlay(\u{2026})")
            }

            Block(title: "Behavior modifiers") {
                snippet("""
                Button("Save") { save() }
                    .keyboardShortcut("s", modifiers: .command)
                    .disabled(!hasChanges)
                    .help("Save current document")
                """)
                Text("Behavior modifiers wire interaction — .keyboardShortcut, .disabled, .help, .focused, .gesture, .onTapGesture.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Environment modifiers") {
                snippet("""
                Form { \u{2026} }
                    .environment(\\.colorScheme, .dark)
                    .preferredColorScheme(.dark)
                    .controlSize(.large)
                    .tint(.indigo)
                """)
                Text("Environment modifiers set values that propagate to descendants. Children opt-in by reading @Environment.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Order matters") {
                HStack(spacing: 24) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("padding then background").font(.caption).foregroundStyle(.secondary)
                        Text("Hello")
                            .padding()
                            .background(.tint)
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("background then padding").font(.caption).foregroundStyle(.secondary)
                        Text("Hello")
                            .background(.tint)
                            .padding()
                    }
                }
                APICallout(".padding().background(\u{2026})  vs.  .background(\u{2026}).padding()")
            }
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "Modifiers wrap, they don't mutate.",
              detail: "Each modifier returns a new View — original input is untouched. The order in which you chain modifiers determines the wrapping order.",
              symbol: "arrow.triangle.2.circlepath"),
        .init(title: "Layout vs. appearance vs. behavior vs. environment.",
              detail: "Apple groups modifiers into four families. Knowing which family a modifier belongs to predicts where in the chain it should sit.",
              symbol: "square.stack.3d.up"),
        .init(title: "Environment modifiers cascade.",
              detail: ".environment, .preferredColorScheme, .tint, .controlSize set values that descendants read via @Environment. Apply at the level you want the value to take effect.",
              symbol: "tree"),
        .init(title: "Group when many siblings need the same modifier.",
              detail: "Wrap several views in Group { \u{2026} } and apply one modifier — the modifier is applied to each child individually, not the Group itself.",
              symbol: "rectangle.3.group"),
        .init(title: "Custom modifiers via ViewModifier.",
              detail: "Bundle 2+ chained modifiers into a ViewModifier and expose via a View extension. See the 'Reducing view modifier maintenance' page.",
              symbol: "wand.and.stars")
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

    private func snippet(_ code: String) -> some View {
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
    }
}

private struct Block<Content: View>: View {
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
    ConfiguringViewsPage()
        .frame(width: 1100, height: 800)
}
