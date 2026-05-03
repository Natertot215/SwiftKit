import SwiftUI

// SwiftUI `View/navigationSubtitle(_:)` reference page.
// Source: Documentation/SwiftUI/navigation/navigationsubtitle(_:).md
// macOS 11.0+ (the documented Text-receiving overload). On macOS the subtitle
// renders below the navigation title in the window titlebar — a common pattern
// for Mail (account name), Notes (folder), and Calendar (date range). String and
// LocalizedStringKey overloads also exist via standard Text initializers.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 240

struct NavigationSubtitlePage: View {
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
            Text("View/navigationSubtitle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Configures the view's subtitle for purposes of navigation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationsubtitle(_:).md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".navigationTitle(\"Inbox\").navigationSubtitle(\"42 messages\")") {
            NavigationStack {
                List(0..<4, id: \.self) { i in Text("Message \(i + 1)") }
                    .navigationTitle("Inbox")
                    .navigationSubtitle("42 messages")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Title + subtitle pair") {
                DemoCard(api: ".navigationTitle(\"Drafts\").navigationSubtitle(\"3 unsent\")") {
                    NavigationStack {
                        List(0..<3, id: \.self) { i in Text("Draft \(i + 1)") }
                            .navigationTitle("Drafts")
                            .navigationSubtitle("3 unsent")
                    }
                }
            }

            VariantBlock(title: "Inside a NavigationSplitView column") {
                DemoCard(api: ".navigationTitle(\"Mailboxes\").navigationSubtitle(\"iCloud\") on the sidebar") {
                    NavigationSplitView {
                        List(0..<4, id: \.self) { i in Text("Mailbox \(i)") }
                            .navigationTitle("Mailboxes")
                            .navigationSubtitle("iCloud")
                    } detail: {
                        Text("Detail")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Subtitle alone (no title) — macOS still renders the subtitle, but the titlebar usually wants both. SwiftKit pages embed the toolbar so the effect is most visible when run in a top-level window.")
                .font(.callout)
                .foregroundStyle(.secondary)

            DemoCard(api: ".navigationSubtitle(\"Subtitle without title\")") {
                NavigationStack {
                    List(0..<3, id: \.self) { i in Text("Row \(i)") }
                        .navigationSubtitle("Subtitle without title")
                }
            }
        }
    }

    // MARK: Notes

    private struct NSTNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSTNote] = [
        .init(title: "macOS-flavored — appears in the titlebar below the title.",
              detail: "On macOS the subtitle slots below .navigationTitle in the window titlebar (or the column toolbar inside a NavigationSplitView). On iOS / iPadOS it shows beneath the navigation bar title; on watchOS / tvOS the modifier is a no-op.",
              symbol: "macwindow"),
        .init(title: "Pair with .navigationTitle for the standard window-chrome shape.",
              detail: "Apple's Mail, Notes, Pages, and Calendar all use this combination. Title is the primary identifier (folder, document name); subtitle adds quiet context (count, account, date range).",
              symbol: "rectangle.lefthalf.filled.righthalf.striped.horizontal"),
        .init(title: "Text overload — full Text styling supported.",
              detail: "The documented signature takes `Text`, but Swift's overload resolution + Text's literal-convertible initializers means you can pass a String literal directly. For italic, weight, or color, build a Text and apply modifiers.",
              symbol: "textformat"),
        .init(title: "Apply on the root content of the navigation container.",
              detail: "Same placement rule as .navigationTitle. Inside a NavigationSplitView, the subtitle on the leading column targets that column's toolbar; on the detail it targets the detail toolbar.",
              symbol: "arrow.up")
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

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
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

#Preview {
    NavigationSubtitlePage()
        .frame(width: 1100, height: 700)
}
