import SwiftUI

// SwiftUI menu modifier reference page covering:
// - View/menuActionDismissBehavior(_:) + MenuActionDismissBehavior
// - View/menuOrder(_:) + MenuOrder
// - View/pullDownButton (PullDownButton is a deprecated alias — covered via menuStyle)
// macOS 14.0+

struct MenuModifiersPage: View {
    @State private var counter = 0

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
            Text("menuActionDismissBehavior · menuOrder · PullDownButton")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Modifiers controlling how menus dismiss after selection, the order of items, and the pull-down button style.")
                .font(.callout).foregroundStyle(.secondary)
            Text("menus-and-commands/menuactiondismissbehavior.md, menuorder.md · macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        MMCard(api: ".menuActionDismissBehavior(.automatic)") {
            Menu("Default Menu") {
                Button("Action 1") { counter += 1 }
                Button("Action 2") { counter += 1 }
            }
            .menuActionDismissBehavior(.automatic)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            MMVariant(title: "menuActionDismissBehavior(.automatic) — default") {
                MMCard(api: ".menuActionDismissBehavior(.automatic)") {
                    Menu("Automatic Dismiss") {
                        Button("Select A") { counter += 1 }
                        Button("Select B") { counter += 1 }
                    }
                    .menuActionDismissBehavior(.automatic)
                }
            }

            MMVariant(title: "menuActionDismissBehavior(.enabled) — always dismiss") {
                MMCard(api: ".menuActionDismissBehavior(.enabled)") {
                    Menu("Always Dismiss") {
                        Button("Pick 1") { counter += 1 }
                        Button("Pick 2") { counter += 1 }
                    }
                    .menuActionDismissBehavior(.enabled)
                }
            }

            MMVariant(title: "menuActionDismissBehavior(.disabled) — iOS only") {
                MMCard(api: ".menuActionDismissBehavior(.disabled)") {
                    Text(".disabled is @available(iOS 16.4+) only — not available on macOS.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }

            MMVariant(title: "menuOrder(.fixed) — preserve item declaration order") {
                MMCard(api: ".menuOrder(.fixed)") {
                    Menu("Fixed Order") {
                        Button("First") {}
                        Button("Second") {}
                        Button("Third") {}
                    }
                    .menuOrder(.fixed)
                }
            }

            MMVariant(title: "menuOrder(.priority) — iOS only") {
                MMCard(api: ".menuOrder(.priority)") {
                    Text(".priority is @available(iOS 16.0+) only — not available on macOS.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }

            MMVariant(title: "PullDownButton style — .menuStyle(.button) equivalent") {
                MMCard(api: ".menuStyle(.button)  // PullDownButton was renamed/deprecated") {
                    VStack(alignment: .leading, spacing: 6) {
                        Menu("Actions") {
                            Button("New") {}
                            Button("Open") {}
                        }
                        .menuStyle(.button)
                        Text("PullDownButton was deprecated in macOS 26.5. Use Menu with .menuStyle(.button) instead.")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            MMVariant(title: "MenuActionDismissBehavior values") {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(["automatic", "enabled", "disabled"], id: \.self) { name in
                        HStack(spacing: 12) {
                            Text(".\(name)")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                                .frame(width: 80, alignment: .trailing)
                            Text(name == "automatic" ? "Platform default (dismiss on macOS)"
                                 : name == "enabled" ? "Always dismiss after selection"
                                 : "Keep menu open after selection")
                                .font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                APICallout(".menuActionDismissBehavior(.automatic / .enabled / .disabled)")
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowMM(symbol: "xmark.circle", title: ".disabled dismiss is useful for palette/multi-select menus.",
                      detail: "When users need to make several sequential picks without reopening the menu each time (e.g., a formatting palette), .disabled keeps the interaction fluid.")
            NoteRowMM(symbol: "arrow.up.and.down", title: ".menuOrder(.priority) defers order to the system.",
                      detail: "On iOS, the system may move frequently-used items to the top. On macOS, .priority typically has no visible effect — items render in declaration order.")
            NoteRowMM(symbol: "menubar.rectangle", title: "PullDownButton is the deprecated predecessor to Menu.",
                      detail: "PullDownButton was available in SwiftUI 1.0 but deprecated in macOS 26.5. All new code should use Menu with .menuStyle(.button) for a pull-down button appearance.")
        }
    }
}

private struct MMCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 280, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct MMVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowMM: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

#Preview {
    MenuModifiersPage().frame(width: 800, height: 1000)
}
