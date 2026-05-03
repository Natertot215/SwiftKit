import SwiftUI

// SwiftUI `View/badge(_:)` reference page.
// Source: Documentation/SwiftUI/lists/badge(_:).md
// Three primary overloads:
//   func badge(_ count: Int) -> some View
//   func badge(_ key: LocalizedStringKey?) -> some View
//   func badge(_ label: Text?) -> some View
// Renders supplementary info on list rows, tab bars, toolbar items, menus.
// macOS 12.0+.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

private struct Mailbox: Identifiable, Hashable {
    let title: String
    let count: Int
    let id = UUID()
}

private let mailboxes: [Mailbox] = [
    Mailbox(title: "Inbox",   count: 12),
    Mailbox(title: "Drafts",  count: 3),
    Mailbox(title: "Sent",    count: 0),
    Mailbox(title: "Junk",    count: 999),
    Mailbox(title: "Archive", count: 0)
]

struct BadgePage: View {
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
            Text("badge(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Generates a badge for the view from an integer value.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/badge(_:).md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "Text(...).badge(mailbox.count)") {
            List {
                ForEach(mailboxes) { mailbox in
                    Text(mailbox.title)
                        .badge(mailbox.count)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Int overload") {
                DemoCard(api: ".badge(42)") {
                    List {
                        Text("Recent").badge(42)
                        Text("Favorites").badge(5)
                        Text("Tags").badge(0) // hidden — count == 0
                    }
                }
            }

            VariantBlock(title: "LocalizedStringKey overload") {
                DemoCard(api: ".badge(\"NEW\")") {
                    List {
                        Text("Releases").badge("NEW")
                        Text("Beta").badge("β")
                        Text("Drafts").badge("3 unsent")
                    }
                }
            }

            VariantBlock(title: "Text overload — formatted/styled") {
                DemoCard(api: ".badge(Text(...).foregroundStyle(.tint))") {
                    List {
                        Text("Inbox")
                            .badge(Text("12 unread").foregroundStyle(.tint))
                        Text("Drafts")
                            .badge(Text("3"))
                    }
                }
            }

            VariantBlock(title: "Pass nil — hide the badge") {
                DemoCard(api: ".badge(nil as Text?)") {
                    List {
                        Text("Empty")
                            .badge(nil as Text?)
                        Text("Also empty")
                            .badge(nil as Text?)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Edge cases") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Zero hides the badge", api: ".badge(0)") {
                        List {
                            Text("Inbox").badge(0)
                            Text("Drafts").badge(0)
                            Text("Archive").badge(0)
                        }
                    }
                    StateColumn(label: "Large counts", api: ".badge(99999)") {
                        List {
                            Text("Inbox").badge(99999)
                            Text("Junk").badge(123456)
                            Text("Total").badge(999)
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Three overloads cover Int, LocalizedStringKey, and Text.",
              detail: "Int — most common, hides at zero. LocalizedStringKey — short text, localized via the bundle. Text — full Text view, supports .foregroundStyle / .font / etc. inside the badge.",
              symbol: "switch.2"),
        .init(title: "badge(0) hides the badge — by design.",
              detail: "Per the doc: 'Set the value to zero to hide the badge.' Lets you pass an unconditional badge(count) without conditional logic for the empty case.",
              symbol: "0.circle"),
        .init(title: "Surfaces beyond List rows: tab bars, toolbar items, menus.",
              detail: "Per the doc: 'Badges appear in list rows, tab bars, toolbar items, and menus.' On macOS the typical surface is List rows; macOS lacks an iOS-style tab bar, but toolbar items and menu items honor it.",
              symbol: "rectangle.3.group"),
        .init(title: "Pass nil (Text? overload) to suppress with a binding.",
              detail: "When the badge value is computed and may legitimately be 'no badge', use the Text? overload with nil. The Int overload only treats 0 as 'hide'; non-zero always renders.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Pair with .badgeProminence to adjust attention level.",
              detail: ".badgeProminence(.standard / .increased / .decreased) controls how visually loud the badge looks. Pair with badge(_:) to balance the badge's content against its visual weight.",
              symbol: "exclamationmark.bubble")
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

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: height)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 280, height: demoFrameHeight)
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
    BadgePage()
        .frame(width: 1100, height: 800)
}
