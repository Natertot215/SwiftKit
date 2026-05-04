import SwiftUI

// Text variant preference reference page.
// Covers: TextVariantPreference, FixedTextVariant, SizeDependentTextVariant
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 26+

struct TextVariantPage: View {
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
            Text("TextVariantPreference")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Control which variant of a variable font is used in a view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("TextVariantPreference · FixedTextVariant · SizeDependentTextVariant · macOS 26+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TVCard(api: "TextVariantPreference — controls variable font axis selection") {
            VStack(alignment: .leading, spacing: 4) {
                Text("TextVariantPreference selects which variant of a variable font to use.")
                    .font(.body)
                Text("FixedTextVariant fixes it to a specific variant.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                Text("SizeDependentTextVariant picks variant based on resolved point size.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            TVVariant(title: "TextVariantPreference (protocol)") {
                TVCard(api: "TextVariantPreference — implemented by FixedTextVariant and SizeDependentTextVariant") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("TextVariantPreference is a protocol.")
                            .font(.body)
                        Text("Two concrete conformances: FixedTextVariant and SizeDependentTextVariant.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            TVVariant(title: "FixedTextVariant — always uses a fixed variant") {
                TVCard(api: "FixedTextVariant — forces a specific display variant") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Applies a fixed variant regardless of the current text size.")
                            .font(.body)
                        Text("Useful when your layout requires a specific optical appearance that should not shift with Dynamic Type.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            TVVariant(title: "SizeDependentTextVariant — variant chosen by point size") {
                TVCard(api: "SizeDependentTextVariant — chooses variant from resolved point size") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("The system picks the best variant for the actual rendered size.")
                            .font(.body)
                        Text("At small sizes, a text variant optimized for legibility is chosen; at large sizes, a display variant with finer details may be used.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private struct TVNote { let title: String; let detail: String; let symbol: String }
    private let notes: [TVNote] = [
        .init(title: "Applies to variable fonts with a 'opsz' axis.", detail: "TextVariantPreference affects the optical size (opsz) axis of variable fonts. SF Pro has this axis and uses it automatically.", symbol: "textformat.alt"),
        .init(title: "SizeDependentTextVariant is the default system behavior.", detail: "The system already applies size-dependent variant selection by default. Only override when you need to lock a specific variant.", symbol: "checkmark.seal"),
        .init(title: "FixedTextVariant is for design-driven decisions.", detail: "Use it when the design requires a specific optical style regardless of the user's text size — for example, always using the display variant in a hero headline.", symbol: "paintbrush.pointed"),
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

private struct TVCard<C: View>: View {
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

private struct TVVariant<C: View>: View {
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
    TextVariantPage().frame(width: 900, height: 700)
}
