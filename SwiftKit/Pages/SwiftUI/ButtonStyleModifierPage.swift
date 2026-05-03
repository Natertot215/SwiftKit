import SwiftUI

// SwiftUI `View/buttonStyle(_:)` reference page.
// Source: Documentation/SwiftUI/view-styles/buttonstyle(_:).md
// macOS 10.15+. Sets the style for all buttons within a view to a ButtonStyle
// conformer. Built-in macOS-supported values: .automatic, .borderless, .bordered,
// .borderedProminent, .plain, .glass (macOS 26+), .glassProminent (macOS 26+),
// .link, .accessoryBar (macOS 14+), .accessoryBarAction (macOS 14+).

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 100

struct ButtonStyleModifierPage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/buttonStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for buttons within this view to a button style with a custom appearance and standard interaction behavior.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/buttonstyle(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        StyleSpecimen(title: ".automatic", api: ".buttonStyle(.automatic)") {
            sampleStack
                .buttonStyle(.automatic)
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Eight built-in styles available on macOS, applied to identical button trios.")
                .font(.callout)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                StyleSpecimen(title: ".automatic", api: ".buttonStyle(.automatic)") {
                    sampleStack.buttonStyle(.automatic)
                }
                StyleSpecimen(title: ".borderless", api: ".buttonStyle(.borderless)") {
                    sampleStack.buttonStyle(.borderless)
                }
                StyleSpecimen(title: ".bordered", api: ".buttonStyle(.bordered)") {
                    sampleStack.buttonStyle(.bordered)
                }
                StyleSpecimen(title: ".borderedProminent", api: ".buttonStyle(.borderedProminent)") {
                    sampleStack.buttonStyle(.borderedProminent)
                }
                StyleSpecimen(title: ".plain", api: ".buttonStyle(.plain)") {
                    sampleStack.buttonStyle(.plain)
                }
                StyleSpecimen(title: ".glass", api: ".buttonStyle(.glass)") {
                    sampleStack.buttonStyle(.glass)
                }
                StyleSpecimen(title: ".glassProminent", api: ".buttonStyle(.glassProminent)") {
                    sampleStack.buttonStyle(.glassProminent)
                }
                StyleSpecimen(title: ".link", api: ".buttonStyle(.link)") {
                    sampleStack.buttonStyle(.link)
                }
            }
        }
    }

    private var sampleStack: some View {
        HStack(spacing: 8) {
            Button("Save") {}
            Button("Cancel") {}
            Button(role: .destructive) {} label: {
                Text("Delete")
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(".bordered with all three roles plus an explicit tint.")
                .font(.callout)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                StyleSpecimen(title: ".bordered + .tint", api: ".buttonStyle(.bordered).tint(.accentColor)") {
                    sampleStack
                        .buttonStyle(.bordered)
                        .tint(.accentColor)
                }
                StyleSpecimen(title: ".bordered + disabled", api: ".disabled(true)") {
                    sampleStack
                        .buttonStyle(.bordered)
                        .disabled(true)
                }
                StyleSpecimen(title: ".borderedProminent + .tint", api: ".buttonStyle(.borderedProminent).tint(.green)") {
                    sampleStack
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                }
                StyleSpecimen(title: ".glassProminent + .tint", api: ".buttonStyle(.glassProminent).tint(.purple)") {
                    sampleStack
                        .buttonStyle(.glassProminent)
                        .tint(.purple)
                }
            }
        }
    }

    // MARK: Notes

    private struct BSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [BSNote] = [
        .init(title: "Modifier walks down the view tree.",
              detail: "Apply once on a container; every Button in that subtree picks it up. Inner .buttonStyle(...) overrides outer for its own subtree.",
              symbol: "arrow.down"),
        .init(title: "Composes with Toggle/Menu via .toggleStyle(.button) / .menuStyle(.button).",
              detail: "Once a Toggle or Menu adopts the .button style, the surrounding .buttonStyle modifier renders them with the same style as a real Button.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: ".glass and .glassProminent are macOS 26+.",
              detail: "Liquid Glass button styles arrived with macOS 26. They render the button background with the system's Liquid Glass material and respect .tint.",
              symbol: "drop.halffull"),
        .init(title: ".link renders blue text without a button background.",
              detail: "Useful for inline navigation that should read as a hyperlink rather than a control. Pairs well with Link(_:destination:).",
              symbol: "link"),
        .init(title: "Tint colors propagate to bordered / borderedProminent / glass styles.",
              detail: "Use .tint(_:) to color the background fill of .borderedProminent / .glassProminent and the border accent of .bordered. .plain and .borderless ignore tint.",
              symbol: "paintpalette")
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

// MARK: - Page-local helpers

private struct StyleSpecimen<Content: View>: View {
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
                .frame(width: demoFrameWidth, height: demoFrameHeight, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    ButtonStyleModifierPage()
        .frame(width: 1100, height: 900)
}
