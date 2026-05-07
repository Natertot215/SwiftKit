import SwiftUI

// SwiftUI `View/toggleStyle(_:)` + `ToggleStyle` + `ToggleStyleConfiguration` page.
// Source: Documentation/SwiftUI/view-styles/togglestyle(_:).md, togglestyle.md, togglestyleconfiguration.md
// macOS 10.15+. Built-in style values: .automatic, .switch, .checkbox, .button.

private let demoFrameWidth: CGFloat = 280
private let demoFrameHeight: CGFloat = 90

struct ToggleStyleGalleryPage: View {
    @State private var on1: Bool = true
    @State private var on2: Bool = true
    @State private var on3: Bool = true
    @State private var on4: Bool = true

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
            Text("View/toggleStyle(_:) + ToggleStyle")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the style for toggles within this view. ToggleStyle is the protocol; ToggleStyleConfiguration is the data shape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/togglestyle(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        TSCard(title: ".automatic", api: ".toggleStyle(.automatic)") {
            Toggle("Notifications", isOn: $on1).toggleStyle(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Four built-in ToggleStyle values supported on macOS.")
                .font(.callout)
                .foregroundStyle(.secondary)
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                TSCard(title: ".automatic", api: ".toggleStyle(.automatic)") {
                    Toggle("Notifications", isOn: $on1).toggleStyle(.automatic)
                }
                TSCard(title: ".switch", api: ".toggleStyle(.switch)") {
                    Toggle("Notifications", isOn: $on2).toggleStyle(.switch)
                }
                TSCard(title: ".checkbox", api: ".toggleStyle(.checkbox)") {
                    Toggle("Notifications", isOn: $on3).toggleStyle(.checkbox)
                }
                TSCard(title: ".button", api: ".toggleStyle(.button)") {
                    Toggle(isOn: $on4) {
                        Label("Notifications", systemImage: "bell")
                    }.toggleStyle(.button)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text(".toggleStyle(.button) composes with .buttonStyle(_:)")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    TSCard(title: ".button + .bordered", api: ".toggleStyle(.button).buttonStyle(.bordered)") {
                        Toggle(isOn: $on1) {
                            Label("Mute", systemImage: "speaker.slash")
                        }
                        .toggleStyle(.button)
                        .buttonStyle(.bordered)
                    }
                    TSCard(title: ".button + .borderedProminent", api: ".toggleStyle(.button).buttonStyle(.borderedProminent)") {
                        Toggle(isOn: $on2) {
                            Label("Mute", systemImage: "speaker.slash")
                        }
                        .toggleStyle(.button)
                        .buttonStyle(.borderedProminent)
                    }
                    TSCard(title: ".button + .glass", api: ".toggleStyle(.button).buttonStyle(.glass)") {
                        Toggle(isOn: $on3) {
                            Label("Mute", systemImage: "speaker.slash")
                        }
                        .toggleStyle(.button)
                        .buttonStyle(.glass)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Disabled propagates to every style.")
                    .font(.headline)
                HStack(alignment: .top, spacing: 24) {
                    TSCard(title: ".switch + disabled", api: ".disabled(true)") {
                        Toggle("Notifications", isOn: $on1).toggleStyle(.switch).disabled(true)
                    }
                    TSCard(title: ".checkbox + disabled", api: ".disabled(true)") {
                        Toggle("Notifications", isOn: $on2).toggleStyle(.checkbox).disabled(true)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("ToggleStyleConfiguration shape")
                    .font(.headline)
                TSCodeBlock(text:
                    """
                    struct ToggleStyleConfiguration {
                        struct Label : View { … }     // type-erased label
                        @Binding var isOn: Bool       // mutate to flip the toggle
                        var isMixed: Bool             // tri-state indicator
                    }
                    """)
                Text("SwiftKit does NOT author custom conformers per project hard constraint.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct TSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TSNote] = [
        .init(title: ".automatic resolves to .checkbox in Form-style contexts.",
              detail: "Outside a Form macOS picks .switch for stand-alone toggles. Wrap in Form to get checkbox semantics in Preferences.",
              symbol: "checkmark.square"),
        .init(title: ".switch is iOS-flavored on macOS but valid.",
              detail: "Renders the familiar pill switch; on macOS it's tighter and more rectangular than iOS. Reach for it when the toggle is the only action in its row.",
              symbol: "switch.2"),
        .init(title: ".checkbox is the macOS-canonical form-toggle.",
              detail: "Pairs naturally with multi-line description text. Users expect this in Preferences and inspector panes.",
              symbol: "checkmark.square.fill"),
        .init(title: ".button bridges to .buttonStyle(_:) — same trick as Menu.",
              detail: "Once .toggleStyle(.button) is applied, the surrounding .buttonStyle(_:) controls the appearance. Symbol-style content (Label) shows on/off via tint.",
              symbol: "rectangle.connected.to.line.below"),
        .init(title: "ToggleStyleConfiguration carries an isMixed tri-state.",
              detail: "When the represented set is partially on (parent checkbox over a heterogeneous group of children), set isMixed and the system draws the dash glyph.",
              symbol: "minus.square")
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

private struct TSCard<Content: View>: View {
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

private struct TSCodeBlock: View {
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

extension ToggleStyleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.toggleStyle",
        title: "ToggleStyle",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "ToggleStyle",
            "View/toggleStyle(_:)",
            "ToggleStyleConfiguration"
        ],
        blurb: "The appearance and behavior of a toggle. Apply with View/toggleStyle(_:); customize with a type conforming to ToggleStyle whose makeBody receives a ToggleStyleConfiguration.",
        signature: "@MainActor @preconcurrency protocol ToggleStyle",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-styles/togglestyle.md",
        page: { AnyView(ToggleStyleGalleryPage()) }
    )
}

#Preview {
    ToggleStyleGalleryPage()
        .frame(width: 1200, height: 1200)
}
