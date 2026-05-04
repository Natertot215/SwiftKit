import SwiftUI

// Line limit and spacing reference page.
// Covers: lineLimit(_:), lineLimit(_:reservesSpace:), lineSpacing(_:), multilineTextAlignment(_:)
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 10.15+

struct LineLimitPage: View {
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
            Text("Line Limit & Spacing")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Control how many lines text displays and how they're spaced.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/lineLimit(_:) · View/lineLimit(_:reservesSpace:) · View/lineSpacing(_:) · View/multilineTextAlignment(_:) · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private let sample = "The quick brown fox jumps over the lazy dog. Pack my box with five dozen liquor jugs."

    private var defaultDemo: some View {
        LLCard(api: ".lineLimit(2)") {
            Text(sample).lineLimit(2).frame(width: 320)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LLVariant(title: "lineLimit(_:) — fixed count") {
                HStack(alignment: .top, spacing: 16) {
                    LLCard(api: ".lineLimit(1)") {
                        Text(sample).lineLimit(1).frame(width: 240)
                    }
                    LLCard(api: ".lineLimit(2)") {
                        Text(sample).lineLimit(2).frame(width: 240)
                    }
                    LLCard(api: ".lineLimit(nil)") {
                        Text(sample).lineLimit(nil).frame(width: 240)
                    }
                }
            }

            LLVariant(title: "lineLimit(_:) — range") {
                HStack(alignment: .top, spacing: 16) {
                    LLCard(api: ".lineLimit(1...3)") {
                        Text(sample).lineLimit(1...3).frame(width: 240)
                    }
                    LLCard(api: ".lineLimit(2...)") {
                        Text(sample).lineLimit(2...).frame(width: 240)
                    }
                }
            }

            LLVariant(title: "lineLimit(_:reservesSpace:)") {
                HStack(alignment: .top, spacing: 16) {
                    LLCard(api: ".lineLimit(3, reservesSpace: true) — short text") {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Short text.")
                                .lineLimit(3, reservesSpace: true)
                                .frame(width: 200)
                                .background(.tint.opacity(0.05))
                            Text("↑ reserves 3-line height")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    LLCard(api: ".lineLimit(3, reservesSpace: false)") {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Short text.")
                                .lineLimit(3, reservesSpace: false)
                                .frame(width: 200)
                                .background(.tint.opacity(0.05))
                            Text("↑ collapses to content")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }

            LLVariant(title: "lineSpacing(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    LLCard(api: ".lineSpacing(0)") {
                        Text("Line one\nLine two\nLine three")
                            .lineSpacing(0).frame(width: 180)
                    }
                    LLCard(api: ".lineSpacing(8)") {
                        Text("Line one\nLine two\nLine three")
                            .lineSpacing(8).frame(width: 180)
                    }
                    LLCard(api: ".lineSpacing(20)") {
                        Text("Line one\nLine two\nLine three")
                            .lineSpacing(20).frame(width: 180)
                    }
                }
            }

            LLVariant(title: "multilineTextAlignment(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    LLCard(api: ".multilineTextAlignment(.leading)") {
                        Text("First line\nSecond line\nThird")
                            .multilineTextAlignment(.leading)
                            .frame(width: 150)
                    }
                    LLCard(api: ".multilineTextAlignment(.center)") {
                        Text("First line\nSecond line\nThird")
                            .multilineTextAlignment(.center)
                            .frame(width: 150)
                    }
                    LLCard(api: ".multilineTextAlignment(.trailing)") {
                        Text("First line\nSecond line\nThird")
                            .multilineTextAlignment(.trailing)
                            .frame(width: 150)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LLVariant(title: "TextField with lineLimit (axis: .vertical)") {
                LLCard(api: "TextField(…, axis: .vertical).lineLimit(3, reservesSpace: true)") {
                    @State var text = "Type here..."
                    return TextField("Notes", text: $text, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(3, reservesSpace: true)
                        .frame(width: 280)
                }
            }
        }
    }

    private struct LLNote { let title: String; let detail: String; let symbol: String }
    private let notes: [LLNote] = [
        .init(title: "lineLimit nil means unlimited lines.", detail: "Passing nil removes any cap. This is the default for Text but you may need to explicitly set it when overriding a parent's limit.", symbol: "infinity"),
        .init(title: "Range forms were added in macOS 14.", detail: ".lineLimit(1...3) sets both a minimum and maximum. .lineLimit(2...) sets a minimum with no upper bound. Both forms require macOS 14+.", symbol: "arrow.up.and.down"),
        .init(title: "reservesSpace stabilizes layout.", detail: "lineLimit(_:reservesSpace: true) makes the view always occupy the space of the maximum number of lines, preventing layout shifts when text content changes.", symbol: "rectangle.compress.vertical"),
        .init(title: "multilineTextAlignment only affects wrapped text.", detail: "Single-line Text ignores multilineTextAlignment — the surrounding frame/layout controls alignment. Only wrapping text is affected.", symbol: "text.aligncenter"),
    ]

    @ViewBuilder private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct LLCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 160, minHeight: 44, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct LLVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    LineLimitPage().frame(width: 1100, height: 1200)
}
