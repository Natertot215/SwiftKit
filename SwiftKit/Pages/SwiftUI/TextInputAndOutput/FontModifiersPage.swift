import SwiftUI

// Font modifier views reference page.
// Covers: font(_:), fontDesign(_:), fontWeight(_:), fontWidth(_:)
// Source: Documentation/SwiftUI/text-input-and-output/
// macOS 10.15+

struct FontModifiersPage: View {
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
            Text("Font Modifiers")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("View modifiers for controlling font, design, weight, and width.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/font(_:) · View/fontDesign(_:) · View/fontWeight(_:) · View/fontWidth(_:) · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        FMCard(api: ".font(.title)") {
            Text("Title style text").font(.title)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FMVariant(title: "font(_:) — semantic styles") {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200), spacing: 16)], spacing: 16) {
                    FMCard(api: ".font(.largeTitle)") { Text("Large Title").font(.largeTitle) }
                    FMCard(api: ".font(.title)") { Text("Title").font(.title) }
                    FMCard(api: ".font(.headline)") { Text("Headline").font(.headline) }
                    FMCard(api: ".font(.body)") { Text("Body").font(.body) }
                    FMCard(api: ".font(.callout)") { Text("Callout").font(.callout) }
                    FMCard(api: ".font(.caption)") { Text("Caption").font(.caption) }
                }
            }

            FMVariant(title: "fontDesign(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    FMCard(api: ".fontDesign(.default)") {
                        Text("Default").font(.title3).fontDesign(.default)
                    }
                    FMCard(api: ".fontDesign(.serif)") {
                        Text("Serif").font(.title3).fontDesign(.serif)
                    }
                    FMCard(api: ".fontDesign(.rounded)") {
                        Text("Rounded").font(.title3).fontDesign(.rounded)
                    }
                    FMCard(api: ".fontDesign(.monospaced)") {
                        Text("Monospaced").font(.title3).fontDesign(.monospaced)
                    }
                }
            }

            FMVariant(title: "fontWeight(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    FMCard(api: ".fontWeight(.light)") { Text("Light").fontWeight(.light) }
                    FMCard(api: ".fontWeight(.regular)") { Text("Regular").fontWeight(.regular) }
                    FMCard(api: ".fontWeight(.semibold)") { Text("Semibold").fontWeight(.semibold) }
                    FMCard(api: ".fontWeight(.bold)") { Text("Bold").fontWeight(.bold) }
                    FMCard(api: ".fontWeight(.black)") { Text("Black").fontWeight(.black) }
                }
            }

            FMVariant(title: "fontWidth(_:)") {
                HStack(alignment: .top, spacing: 16) {
                    FMCard(api: ".fontWidth(.compressed)") {
                        Text("Compressed").fontWidth(.compressed)
                    }
                    FMCard(api: ".fontWidth(.condensed)") {
                        Text("Condensed").fontWidth(.condensed)
                    }
                    FMCard(api: ".fontWidth(.standard)") {
                        Text("Standard").fontWidth(.standard)
                    }
                    FMCard(api: ".fontWidth(.expanded)") {
                        Text("Expanded").fontWidth(.expanded)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            FMVariant(title: "Container inheritance") {
                FMCard(api: "VStack { … }.font(.caption) — all children inherit") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("I inherit .caption from VStack")
                        Text("Me too")
                        Text("I override to .headline").font(.headline)
                    }
                    .font(.caption)
                }
            }
            FMVariant(title: "Composing modifiers") {
                FMCard(api: ".font(.title3).fontWeight(.semibold).fontDesign(.rounded)") {
                    Text("Composed")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                }
            }
        }
    }

    private struct FMNote { let title: String; let detail: String; let symbol: String }
    private let notes: [FMNote] = [
        .init(title: "font(_:) sets the base style; other modifiers refine it.", detail: "Apply .font(.body) first, then layer .fontWeight(.bold) and .fontDesign(.rounded). The modifiers combine into a single resolved font.", symbol: "textformat"),
        .init(title: "fontDesign(_:) requires macOS 13+.", detail: "The .fontDesign(_:) view modifier was added in macOS 13. On macOS 10.15–12, use .font(.body.design(.rounded)) on the Font type instead.", symbol: "info.circle"),
        .init(title: "fontWidth(_:) maps to variable font width axis.", detail: "Not all typefaces support width variation. SF Pro on macOS supports .compressed, .condensed, .standard, and .expanded via the optical width axis.", symbol: "arrow.left.and.right"),
        .init(title: "Container-level font propagates to all children.", detail: "Setting .font(_:) on a VStack or HStack cascades to all Text views inside. Individual Text views can override by applying their own .font(_:).", symbol: "rectangle.stack"),
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

private struct FMCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 140, minHeight: 40, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct FMVariant<C: View>: View {
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
    FontModifiersPage().frame(width: 1000, height: 1000)
}
