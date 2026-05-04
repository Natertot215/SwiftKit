import SwiftUI
import Translation

// SwiftUI Translation framework modifiers reference page.
// Covers: translationPresentation(isPresented:text:attachmentAnchor:arrowEdge:replacementAction:),
//         translationTask(_:action:), translationTask(source:target:action:),
//         translationTask(source:target:preferredStrategy:action:)
// Source: Documentation/SwiftUI/technology-specific-views/

struct TranslationPage: View {
    @State private var showTranslation = false
    @State private var translationText = "Bonjour, monde!"
    @State private var translatedOutput = ""

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
            Text("Translation SwiftUI Modifiers")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("translationPresentation and translationTask — on-device translation via the Translation framework.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Translation macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "translationPresentation — system translation UI") {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Source text:").font(.caption).foregroundStyle(.secondary)
                    TextField("Text to translate", text: $translationText)
                        .textFieldStyle(.roundedBorder)
                }
                Button("Show Translation") { showTranslation = true }
                    .translationPresentation(
                        isPresented: $showTranslation,
                        text: translationText
                    )
            }
            APICallout(".translationPresentation(isPresented: $showTranslation, text: text)")
            Text("translationPresentation shows Apple's system translation UI as a popover attached to the modified view. The system detects the source language automatically.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "translationPresentation — full signature") {
                snippet("""
                view.translationPresentation(
                    isPresented: $showTranslation,
                    text: sourceText,
                    attachmentAnchor: .rect(.bounds),   // popover anchor
                    arrowEdge: .bottom,                 // arrow side
                    replacementAction: { translation in  // optional: apply translation
                        self.text = translation
                    }
                )
                """)
                Text("replacementAction provides the translated string if the user accepts. Without it, the translation popover is read-only.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "translationTask(_:action:) — translate on change") {
                snippet("""
                Text(displayText)
                    .translationTask(configuration) { session in
                        do {
                            let response = try await session.translate(sourceText)
                            displayText = response.targetText
                        } catch {
                            print("Translation error: \\(error)")
                        }
                    }

                // TranslationSession.Configuration:
                let config = TranslationSession.Configuration(
                    source: .init(identifier: "fr"),  // Locale.Language
                    target: .init(identifier: "en")
                )
                """)
                Text("translationTask(_:action:) fires whenever configuration changes and provides a TranslationSession for programmatic translation.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "translationTask(source:target:action:) — language pair") {
                snippet("""
                Text(content)
                    .translationTask(
                        source: Locale.Language(identifier: "ja"),
                        target: Locale.Language(identifier: "en")
                    ) { session in
                        let batch = try await session.translations(
                            from: [
                                .init(sourceText: "こんにちは"),
                                .init(sourceText: "ありがとう")
                            ]
                        )
                        translated = batch.map(\\.targetText)
                    }
                """)
                Text("The source/target overload is a shorthand for creating a TranslationSession.Configuration inline.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "translationTask(source:target:preferredStrategy:action:)") {
                snippet("""
                view.translationTask(
                    source: sourceLang,
                    target: targetLang,
                    preferredStrategy: .onDevice  // .automatic or .onDevice
                ) { session in
                    let result = try await session.translate(text)
                    output = result.targetText
                }
                // .onDevice — prefer on-device model, fallback to server
                // .automatic — system decides (default)
                """)
                Text("preferredStrategy: .onDevice uses the on-device neural translation model, which is faster and private — requires the language pack to be downloaded.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Batch translation with TranslationSession") {
                snippet("""
                view.translationTask(configuration) { session in
                    let requests: [TranslationSession.Request] = texts.map {
                        TranslationSession.Request(sourceText: $0)
                    }
                    let responses = try await session.translations(from: requests)
                    translatedTexts = responses.map(\\.targetText)
                }
                """)
                Text("TranslationSession.translations(from:) translates an array of strings in one call — more efficient than serial translate() calls.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("globe", "Translation is macOS 15.0+ / iOS 18.0+. Both on-device and server-based translation are available; the system picks based on language availability and network.")
            noteRow("arrow.down.circle", "On-device translation requires the language pack to be downloaded. The system prompts the user to download it if not present.")
            noteRow("lock.shield", "On-device translation with .onDevice strategy processes text locally — no data is sent to Apple's servers. Disclose this in your privacy policy.")
            noteRow("exclamationmark.triangle", "translationTask fires on the main actor. Await session.translate() inside the closure — SwiftUI manages the task lifetime.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    TranslationPage().frame(width: 1100, height: 800)
}
