import SwiftUI

// SwiftUI `View/textFieldStyle(_:)` + `TextFieldStyle` page.
// Source: Documentation/SwiftUI/view-styles/textfieldstyle(_:).md, textfieldstyle.md
// macOS 10.15+. Built-in style values on macOS: .automatic, .roundedBorder,
// .squareBorder, .plain.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 90

struct TextFieldStylePage: View {
    @State private var text1: String = "Sample"
    @State private var text2: String = "Sample"
    @State private var text3: String = "Sample"
    @State private var text4: String = "Sample"

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
            Text("View/textFieldStyle(_:) + TextFieldStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for text fields within this view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/textfieldstyle(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TFCard(title: ".automatic", api: ".textFieldStyle(.automatic)") {
            TextField("Name", text: $text1).textFieldStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Four built-in TextFieldStyle values supported on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                TFCard(title: ".automatic", api: ".textFieldStyle(.automatic)") {
                    TextField("Name", text: $text1).textFieldStyle(.automatic)
                }
                TFCard(title: ".roundedBorder", api: ".textFieldStyle(.roundedBorder)") {
                    TextField("Name", text: $text2).textFieldStyle(.roundedBorder)
                }
                TFCard(title: ".squareBorder", api: ".textFieldStyle(.squareBorder)") {
                    TextField("Name", text: $text3).textFieldStyle(.squareBorder)
                }
                TFCard(title: ".plain", api: ".textFieldStyle(.plain)") {
                    TextField("Name", text: $text4).textFieldStyle(.plain)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Disabled propagates")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    TFCard(title: ".roundedBorder + disabled", api: ".disabled(true)") {
                        TextField("Name", text: $text1).textFieldStyle(.roundedBorder).disabled(true)
                    }
                    TFCard(title: ".squareBorder + disabled", api: ".disabled(true)") {
                        TextField("Name", text: $text2).textFieldStyle(.squareBorder).disabled(true)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("TextFieldStyle protocol surface")
                    .font(.headline)
                Text("TextFieldStyle is a marker protocol for the built-in conformers. The required methods are SPI; you can't author custom conformers without using @_spi imports.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                TFCodeBlock(text:
                    """
                    @MainActor protocol TextFieldStyle {
                        // Required members are SPI in SwiftUI.
                        // SwiftKit only documents the built-in
                        // .automatic / .roundedBorder / .squareBorder / .plain.
                    }
                    """)
            }
        }
    }

    private struct TFNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TFNote] = [
        .init(title: ".automatic is .roundedBorder in most macOS contexts.",
              detail: "Inside Form rows .automatic flattens to a label/value pair; standalone it usually resolves to .roundedBorder.",
              symbol: "rectangle.roundedtop"),
        .init(title: ".squareBorder is the macOS-classic NSTextField bezel.",
              detail: "Use it when matching legacy AppKit chrome; it's slightly more compact than .roundedBorder.",
              symbol: "rectangle"),
        .init(title: ".plain has no chrome — no border, no fill.",
              detail: "Pair with custom backgrounds when designing your own field UI. The text caret and selection still work normally.",
              symbol: "rectangle.dashed"),
        .init(title: "TextFieldStyle has no public conformer protocol body.",
              detail: "The required _body method is SPI. SwiftKit follows project hard constraint: document the built-ins, do not author conformers.",
              symbol: "lock"),
        .init(title: "Style is inherited; outer .textFieldStyle(_:) wins for the subtree.",
              detail: "Standard SwiftUI inheritance pattern. Inner .textFieldStyle overrides outer for its own subtree.",
              symbol: "arrow.down")
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

private struct TFCard<Content: View>: View {
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

private struct TFCodeBlock: View {
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
    TextFieldStylePage()
        .frame(width: 1200, height: 1100)
}
