import SwiftUI

// Writing Tools behavior reference page.
// Covers: writingToolsBehavior(_:), WritingToolsBehavior
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 15+ (Writing Tools)

struct WritingToolsPage: View {
    @State private var text = "Writing Tools can proofread, rewrite, and summarize text in this editor on macOS 15."

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("WritingToolsBehavior")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Control Apple Writing Tools availability in text editing views.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/writingToolsBehavior(_:) · WritingToolsBehavior · macOS 15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        WTCard(api: ".writingToolsBehavior(.automatic) — default") {
            TextEditor(text: $text)
                .writingToolsBehavior(.automatic)
                .frame(width: 480, height: 100)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            WTVariant(title: ".automatic — system decides based on context") {
                WTCard(api: ".writingToolsBehavior(.automatic)") {
                    TextEditor(text: $text)
                        .writingToolsBehavior(.automatic)
                        .frame(width: 480, height: 80)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }

            WTVariant(title: ".limited — inline rewrite only, no proofread/summarize") {
                WTCard(api: ".writingToolsBehavior(.limited)") {
                    TextEditor(text: $text)
                        .writingToolsBehavior(.limited)
                        .frame(width: 480, height: 80)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }

            WTVariant(title: ".disabled — opt out of Writing Tools entirely") {
                WTCard(api: ".writingToolsBehavior(.disabled)") {
                    TextEditor(text: $text)
                        .writingToolsBehavior(.disabled)
                        .frame(width: 480, height: 80)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }

            WTVariant(title: "WritingToolsBehavior values") {
                WTCard(api: "WritingToolsBehavior.automatic / .limited / .disabled") {
                    VStack(alignment: .leading, spacing: 6) {
                        let behaviors: [(String, String)] = [
                            (".automatic", "Default — Writing Tools available based on field type"),
                            (".limited", "Inline rewrite panel only — no proofread/summarize"),
                            (".disabled", "No Writing Tools — use for code, passwords, technical fields"),
                        ]
                        ForEach(behaviors, id: \.0) { name, detail in
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Text(name)
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.primary)
                                    .frame(width: 90, alignment: .leading)
                                Text(detail)
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }

    private struct WTNote { let title: String; let detail: String; let symbol: String }
    private let notes: [WTNote] = [
        .init(title: "Writing Tools shipped in macOS 15 / iOS 18.", detail: "The API is available on macOS 15+ and requires an Apple Silicon Mac for full functionality. Intel Macs see a limited subset.", symbol: "apple.intelligence"),
        .init(title: "Disable for code, passwords, and technical content.", detail: "Use .disabled for code editors, password fields, and structured data inputs where AI rewrites would corrupt the content.", symbol: "nosign"),
        .init(title: ".limited shows only the inline panel.", detail: "The inline rewrite panel appears directly in the editing area. The full Writing Tools window (proofread, summarize, compose) is suppressed.", symbol: "rectangle.and.pencil.and.ellipsis"),
        .init(title: "Applies to both TextField and TextEditor.", detail: "writingToolsBehavior(_:) works on any text editing view. TextEditor benefits most since it accepts longer-form content.", symbol: "doc.text"),
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

private struct WTCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
            APICallout(api)
        }
    }
}

private struct WTVariant<C: View>: View {
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
    WritingToolsPage().frame(width: 900, height: 900)
}
