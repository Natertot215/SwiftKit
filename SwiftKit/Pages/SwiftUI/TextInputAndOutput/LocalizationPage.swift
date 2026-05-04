import SwiftUI

// Localization and type-select reference page.
// Covers: LocalizedStringKey, typeSelectEquivalent(_:), typesettingLanguage(_:isEnabled:),
//         TypesettingLanguage, SystemFormatStyle, TimeDataSource
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 10.15+

struct LocalizationPage: View {
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
            Text("Localization & Type-Select")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("LocalizedStringKey, language-aware typesetting, type-select equivalents, and system format styles.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("LocalizedStringKey · typeSelectEquivalent · typesettingLanguage · TypesettingLanguage · SystemFormatStyle · TimeDataSource · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LocCard(api: "Text(\"LocalizedStringKey\") — automatic lookup via string literal") {
            Text("Hello, world!")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LocVariant(title: "LocalizedStringKey") {
                LocCard(api: "LocalizedStringKey — wraps a string for localization table lookup") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Text(\"Hello, world!\") implicitly creates a LocalizedStringKey.")
                            .font(.body)
                        Text("To pass a plain String (no lookup), use Text(verbatim: \"Hello\") or init(_:tableName:bundle:comment:).")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Divider()
                        HStack(spacing: 16) {
                            VStack(alignment: .leading) {
                                Text("Localized (key lookup):")
                                    .font(.caption).foregroundStyle(.secondary)
                                Text("Hello, world!")
                                    .font(.body)
                            }
                            VStack(alignment: .leading) {
                                Text("Verbatim (no lookup):")
                                    .font(.caption).foregroundStyle(.secondary)
                                Text(verbatim: "Hello, world!")
                                    .font(.body)
                            }
                        }
                    }
                }
            }

            LocVariant(title: "typeSelectEquivalent(_:)") {
                LocCard(api: ".typeSelectEquivalent(\"equivalent string for list type-select\")") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Provides a plain-text string that list keyboard type-selection uses when the row content is an Image or custom view.")
                            .font(.body)
                        Text("Example: a row showing an icon + number badge uses .typeSelectEquivalent(\"42\") so typing 4 jumps to that row.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            LocVariant(title: "typesettingLanguage(_:isEnabled:)") {
                LocCard(api: ".typesettingLanguage(Locale.Language(identifier: \"ar\"))") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Overrides the language used for line-breaking and typographic rules.")
                            .font(.body)
                        Text("مرحبا بالعالم")
                            .typesettingLanguage(Locale.Language(identifier: "ar"))
                            .font(.title3)
                        Text("Using Arabic typesetting rules")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            LocVariant(title: "SystemFormatStyle") {
                LocCard(api: "Text(value, format: .currency(code: \"USD\"))") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("SystemFormatStyle lets Text render formatted values using system locale rules.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        HStack(spacing: 20) {
                            VStack(alignment: .leading) {
                                Text(1234.56, format: .currency(code: "USD"))
                                Text(0.853, format: .percent)
                                Text(Date.now, style: .date)
                            }
                            VStack(alignment: .leading) {
                                Text("currency").font(.caption).foregroundStyle(.secondary)
                                Text("percent").font(.caption).foregroundStyle(.secondary)
                                Text("date").font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }

            LocVariant(title: "TimeDataSource") {
                LocCard(api: "TimeDataSource — drives live-updating time displays in Text") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("TimeDataSource is the protocol behind Text's time-based styles (.relative, .timer, .offset).")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        HStack(spacing: 16) {
                            VStack(alignment: .leading) {
                                Text("Relative:").font(.caption).foregroundStyle(.secondary)
                                Text(Date.now.addingTimeInterval(-300), style: .relative)
                            }
                            VStack(alignment: .leading) {
                                Text("Offset:").font(.caption).foregroundStyle(.secondary)
                                Text(Date.now.addingTimeInterval(3600), style: .offset)
                            }
                            VStack(alignment: .leading) {
                                Text("Timer:").font(.caption).foregroundStyle(.secondary)
                                Text(Date.now.addingTimeInterval(120), style: .timer)
                            }
                        }
                    }
                }
            }
        }
    }

    private struct LocNote { let title: String; let detail: String; let symbol: String }
    private let notes: [LocNote] = [
        .init(title: "String literals in Text create LocalizedStringKeys automatically.", detail: "Text(\"Hello\") is identical to Text(LocalizedStringKey(\"Hello\")). Use Text(verbatim: \"Hello\") to skip localization.", symbol: "globe"),
        .init(title: "TypesettingLanguage adjusts line-break and spacing rules.", detail: "Useful for mixed-language UIs where part of the content must follow a specific language's typographic conventions independent of the system locale.", symbol: "character.book.closed"),
        .init(title: "typeSelectEquivalent enables keyboard navigation in Lists.", detail: "When a List row's label is not plain text, supply .typeSelectEquivalent(_:) so the user can jump to the row by typing its equivalent string.", symbol: "keyboard"),
        .init(title: "TimeDataSource drives automatic live-update Text views.", detail: "The framework handles scheduling updates itself — you don't need a Timer. Text(date, style: .relative) self-updates as time passes.", symbol: "clock.arrow.circlepath"),
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

private struct LocCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 360, minHeight: 48, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct LocVariant<C: View>: View {
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
    LocalizationPage().frame(width: 900, height: 1100)
}
