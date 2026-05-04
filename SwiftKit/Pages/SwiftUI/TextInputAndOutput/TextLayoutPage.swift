import SwiftUI

// Text layout modifier reference page.
// Covers: truncationMode(_:), allowsTightening(_:), minimumScaleFactor(_:), baselineOffset(_:),
//         kerning(_:), tracking(_:), flipsForRightToLeftLayoutDirection(_:),
//         TextAlignment, TextAttribute
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 10.15+

struct TextLayoutPage: View {
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
            Text("Text Layout Modifiers")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Control truncation, spacing, baseline, kerning, and alignment.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("truncationMode · allowsTightening · minimumScaleFactor · baselineOffset · kerning · tracking · flipsForRightToLeftLayoutDirection · TextAlignment · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TLCard(api: ".truncationMode(.tail)  (default)") {
            Text("The quick brown fox jumps over the lazy dog with a very long string.")
                .truncationMode(.tail)
                .lineLimit(1)
                .frame(width: 300)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TLVariant(title: "truncationMode(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    TLCard(api: ".truncationMode(.head)") {
                        Text("The quick brown fox jumps over the lazy dog.")
                            .truncationMode(.head).lineLimit(1).frame(width: 200)
                    }
                    TLCard(api: ".truncationMode(.middle)") {
                        Text("The quick brown fox jumps over the lazy dog.")
                            .truncationMode(.middle).lineLimit(1).frame(width: 200)
                    }
                    TLCard(api: ".truncationMode(.tail)") {
                        Text("The quick brown fox jumps over the lazy dog.")
                            .truncationMode(.tail).lineLimit(1).frame(width: 200)
                    }
                }
            }

            TLVariant(title: "allowsTightening(_:) and minimumScaleFactor(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    TLCard(api: ".allowsTightening(true)") {
                        Text("Slightly compressed to fit the container.")
                            .allowsTightening(true)
                            .lineLimit(1)
                            .frame(width: 180)
                    }
                    TLCard(api: ".minimumScaleFactor(0.7)") {
                        Text("Scales down to 70% to fit the container width.")
                            .minimumScaleFactor(0.7)
                            .lineLimit(1)
                            .frame(width: 140)
                    }
                }
            }

            TLVariant(title: "baselineOffset(_:)") {
                TLCard(api: "Text(\"H2O\") with subscript via baselineOffset") {
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("H")
                        Text("2").font(.caption).baselineOffset(-4)
                        Text("O")
                        Text("  —  normal baseline: ")
                        Text("CO").foregroundStyle(.secondary)
                        Text("2")
                            .font(.caption)
                            .baselineOffset(-4)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            TLVariant(title: "kerning(_:) — adjusts space between adjacent characters") {
                HStack(alignment: .top, spacing: 16) {
                    TLCard(api: ".kerning(-2)") {
                        Text("Tight kerning").kerning(-2)
                    }
                    TLCard(api: ".kerning(0) — default") {
                        Text("Default kerning").kerning(0)
                    }
                    TLCard(api: ".kerning(4)") {
                        Text("Loose kerning").kerning(4)
                    }
                }
            }

            TLVariant(title: "tracking(_:) — uniform spacing added to all characters") {
                HStack(alignment: .top, spacing: 16) {
                    TLCard(api: ".tracking(-1)") {
                        Text("Tight tracking").tracking(-1)
                    }
                    TLCard(api: ".tracking(0)") {
                        Text("Default tracking").tracking(0)
                    }
                    TLCard(api: ".tracking(6)") {
                        Text("Wide tracking").tracking(6)
                    }
                }
            }

            TLVariant(title: "TextAlignment (multiline)") {
                HStack(alignment: .top, spacing: 16) {
                    TLCard(api: ".multilineTextAlignment(.leading)") {
                        Text("Leading aligned\nsecond line\nthird")
                            .multilineTextAlignment(.leading)
                            .frame(width: 160)
                    }
                    TLCard(api: ".multilineTextAlignment(.center)") {
                        Text("Center aligned\nsecond line\nthird")
                            .multilineTextAlignment(.center)
                            .frame(width: 160)
                    }
                    TLCard(api: ".multilineTextAlignment(.trailing)") {
                        Text("Trailing aligned\nsecond line\nthird")
                            .multilineTextAlignment(.trailing)
                            .frame(width: 160)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TLVariant(title: "flipsForRightToLeftLayoutDirection(_:)") {
                TLCard(api: ".flipsForRightToLeftLayoutDirection(true)") {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.right")
                            .flipsForRightToLeftLayoutDirection(true)
                        Text("Arrow flips in RTL layouts")
                    }
                }
            }
        }
    }

    private struct TLNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TLNote] = [
        .init(title: "kerning vs tracking — subtle but different.", detail: "kerning uses the font's built-in kerning table and adjusts pairs; tracking adds a fixed offset after every character. Kerning can be overridden by the font; tracking is always applied on top.", symbol: "arrow.left.and.right.text.vertical"),
        .init(title: "baselineOffset lifts or lowers text relative to the baseline.", detail: "Positive values lift the text; negative values lower it. Useful for super/subscript effects without switching to a smaller font size.", symbol: "arrow.up.and.down"),
        .init(title: "minimumScaleFactor shrinks text before truncating.", detail: "Text first tries to fit at full size. If it still overflows, it scales down to the minimum factor before applying truncation.", symbol: "textformat.size"),
        .init(title: "TextAlignment only affects multiline text.", detail: "For single-line Text, alignment is determined by the frame/layout container. multilineTextAlignment(_:) only takes effect when the text wraps to two or more lines.", symbol: "text.alignleft"),
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

private struct TLCard<C: View>: View {
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

private struct TLVariant<C: View>: View {
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
    TextLayoutPage().frame(width: 1100, height: 1200)
}
