import SwiftUI

// SwiftUI `View/toolbarForegroundStyle(_:for:)` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbarforegroundstyle(_:for:).md
// Tints toolbar items with a ShapeStyle. Doc lists watchOS 9.0 only in the
// availability block but the symbol is present on macOS \u{2014} treated as macOS 13+.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 220

struct ToolbarForegroundStylePage: View {
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
            Text("View/toolbarForegroundStyle(_:for:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Specifies the preferred foreground ShapeStyle of bars managed by SwiftUI \u{2014} the tint of the items inside the toolbar.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbarforegroundstyle(_:for:).md")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".toolbarForegroundStyle(.tint, for: .navigationBar)") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Unavailable on macOS \u{2014} watchOS only.")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Apple's availability block lists watchOS 9.0 only. The symbol fails to resolve on macOS, so SwiftKit shows the canonical example as a code snippet.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                CodeSnippet(code: """
                NavigationStack {
                    ContentView()
                        .navigationTitle("Blue")
                        .toolbarForegroundStyle(.blue, for: .navigationBar)
                }
                """)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Signature") {
                CodeSnippet(code: """
                func toolbarForegroundStyle<S: ShapeStyle>(
                    _ style: S,
                    for bars: ToolbarPlacement...
                ) -> some View
                """)
                Text("Same shape as .toolbarBackground(_:for:) and .toolbarColorScheme(_:for:) \u{2014} variadic placements, ShapeStyle for the value.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "Semantic ShapeStyles you would pass") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".primary / .secondary \u{2014} system foreground tints", systemImage: "paintpalette")
                    Label(".tint \u{2014} the current tint", systemImage: "drop.fill")
                    Label("Color.accentColor \u{2014} the app accent", systemImage: "paintbrush")
                }
                .font(.callout)
                .foregroundStyle(.primary)
                APICallout(".primary \u{00b7} .secondary \u{00b7} .tint \u{00b7} Color.accentColor")
            }

            VariantBlock(title: "macOS-equivalent surfaces") {
                VStack(alignment: .leading, spacing: 6) {
                    Label(".toolbarColorScheme(_:for:) \u{2014} pin the bar's color scheme", systemImage: "circle.lefthalf.filled")
                    Label(".tint(_:) on the toolbar's enclosing view \u{2014} affects toolbar item tint", systemImage: "drop.fill")
                    Label(".foregroundStyle(_:) per-Button \u{2014} explicit override", systemImage: "rectangle.split.2x1")
                }
                .font(.callout)
                .foregroundStyle(.primary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Why this page is code-only") {
                Text("Apple ships .toolbarForegroundStyle(_:for:) for watchOS 9.0 only. The symbol is unavailable in the macOS SDK at compile time. SwiftKit captures the API for cross-platform reference but does not call it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            VariantBlock(title: "Pairs naturally with .toolbarBackground / .toolbarColorScheme") {
                Text("Foreground style sets the tint of items; background sets the chrome behind them; color scheme decides how items contrast against that chrome. The three modifiers were designed as a trio.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct ToolbarNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ToolbarNote] = [
        .init(title: "Use semantic ShapeStyles only.",
              detail: "Per L-001/L-012: .primary, .secondary, .tint, Color.accentColor, system materials. Avoid hand-mixed Color(red:green:blue:) and hex literals.",
              symbol: "paintpalette"),
        .init(title: "watchOS 9.0+ only.",
              detail: "Apple's availability block lists watchOS 9.0 and nothing else. The symbol is unavailable on macOS \u{2014} for macOS toolbars use .toolbarColorScheme + .toolbarBackground or per-item .foregroundStyle.",
              symbol: "questionmark.circle"),
        .init(title: "Variadic placements.",
              detail: ".toolbarForegroundStyle(.tint, for: .navigationBar, .tabBar). Empty defaults to .automatic.",
              symbol: "rectangle.stack"),
        .init(title: "Items can still override locally.",
              detail: "A .foregroundStyle(\u{2026}) on a specific Button inside the toolbar wins over the toolbar-wide setting on platforms where the toolbar modifier is available.",
              symbol: "arrow.up.right.square")
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

private struct CodeSnippet: View {
    let code: String

    var body: some View {
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

#Preview {
    ToolbarForegroundStylePage()
        .frame(width: 1100, height: 1100)
}
