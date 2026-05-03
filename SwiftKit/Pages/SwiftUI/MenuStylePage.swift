import SwiftUI

// SwiftUI `View/menuStyle(_:)` + `MenuStyle` + `MenuStyleConfiguration` page.
// Source: Documentation/SwiftUI/view-styles/menustyle(_:).md, menustyle.md, menustyleconfiguration.md
// macOS 11.0+. Built-in style values: .automatic, .borderlessButton (legacy),
// .button (renders as a Button, then inherits buttonStyle).

private let demoFrameWidth: CGFloat = 320
private let demoFrameHeight: CGFloat = 100

struct MenuStylePage: View {
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
            Text("View/menuStyle(_:) + MenuStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for menus within this view. MenuStyle is the protocol; MenuStyleConfiguration is the data passed to a custom conformer.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/menustyle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        MSCard(title: ".automatic", api: ".menuStyle(.automatic)") {
            sampleMenu.menuStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Built-in MenuStyle values on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack(alignment: .top, spacing: 24) {
                MSCard(title: ".automatic", api: ".menuStyle(.automatic)") {
                    sampleMenu.menuStyle(.automatic)
                }
                MSCard(title: ".button", api: ".menuStyle(.button)") {
                    sampleMenu.menuStyle(.button)
                }
                MSCard(title: ".borderlessButton", api: ".menuStyle(.borderlessButton)") {
                    sampleMenu.menuStyle(.borderlessButton)
                }
            }
        }
    }

    private var sampleMenu: some View {
        Menu("Actions") {
            Button("Open", action: {})
            Button("Open in New Window", action: {})
            Divider()
            Button("Close", action: {})
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(".menuStyle(.button) composes with .buttonStyle(_:)")
                    .font(.headline)
                Text("Once a Menu adopts the .button style, the surrounding .buttonStyle modifier styles it like a real Button.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                HStack(alignment: .top, spacing: 24) {
                    MSCard(title: ".menuStyle(.button) + .bordered", api: ".menuStyle(.button).buttonStyle(.bordered)") {
                        sampleMenu
                            .menuStyle(.button)
                            .buttonStyle(.bordered)
                    }
                    MSCard(title: ".menuStyle(.button) + .borderedProminent", api: ".menuStyle(.button).buttonStyle(.borderedProminent)") {
                        sampleMenu
                            .menuStyle(.button)
                            .buttonStyle(.borderedProminent)
                    }
                    MSCard(title: ".menuStyle(.button) + .glass", api: ".menuStyle(.button).buttonStyle(.glass)") {
                        sampleMenu
                            .menuStyle(.button)
                            .buttonStyle(.glass)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("MenuStyleConfiguration shape")
                    .font(.headline)
                MSCodeBlock(text:
                    """
                    struct MenuStyleConfiguration {
                        struct Title : View { … }    // type-erased title view
                        struct Content : View { … }  // type-erased menu items

                        // Inside makeBody:
                        // configuration.title    -- the menu's label
                        // configuration.content  -- the menu's items
                    }
                    """)
                Text("SwiftKit does NOT author custom MenuStyle conformers — Apple-only per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct MSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [MSNote] = [
        .init(title: ".automatic looks like .borderlessButton on macOS.",
              detail: "A small chevron next to the title; clicking opens the menu. The button chrome is borderless to match toolbar/inline contexts.",
              symbol: "chevron.down"),
        .init(title: ".button is the bridge to .buttonStyle(_:).",
              detail: "After .menuStyle(.button), Menu inherits whatever you put on .buttonStyle(_:) further up the tree — same as Toggle with .toggleStyle(.button).",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "MenuStyle has no isPressed / role — title + content only.",
              detail: "Custom conformers compose the title with whatever click target they like; the content is rendered by SwiftUI when the menu opens.",
              symbol: "doc.text"),
        .init(title: "macOS 26 Liquid Glass: pair .menuStyle(.button) with .buttonStyle(.glass).",
              detail: "That's the supported way to get a Liquid Glass menu trigger. Don't try to apply .glassEffect(_:in:) to the Menu directly.",
              symbol: "drop.halffull")
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

private struct MSCard<Content: View>: View {
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

private struct MSCodeBlock: View {
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
    MenuStylePage()
        .frame(width: 1200, height: 1100)
}
