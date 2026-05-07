import SwiftUI

// SwiftUI `View/swipeActions(edge:allowsFullSwipe:content:)` reference page.
// Source: Documentation/SwiftUI/lists/swipeactions(edge:allowsfullswipe:content:).md
// Single API:
//   func swipeActions<T: View>(edge: HorizontalEdge = .trailing,
//                              allowsFullSwipe: Bool = true,
//                              @ViewBuilder content: () -> T) -> some View
// macOS 12.0+. Compiles on macOS but: macOS Lists do NOT expose horizontal swipe
// gestures the way iOS does. The buttons may not be visible until interacted
// with — see Notes for the macOS-flavored caveat.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 240

private struct Message: Identifiable, Hashable {
    let subject: String
    var isUnread: Bool
    let id = UUID()
}

private let messages: [Message] = [
    Message(subject: "Welcome to SwiftKit", isUnread: true),
    Message(subject: "Re: Lists batch — 2026-05",  isUnread: true),
    Message(subject: "Build status — passing",      isUnread: false),
    Message(subject: "Weekly digest",                isUnread: false)
]

struct SwipeActionsGalleryPage: View {
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
            Text("swipeActions(edge:allowsFullSwipe:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds custom swipe actions to a row in a list.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/swipeactions(edge:allowsfullswipe:content:).md · macOS 12.0+ (iOS-flavored)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".swipeActions(edge: .trailing) { Button(role:) { … } }") {
            List {
                ForEach(messages) { message in
                    Text(message.subject)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                // no-op for the gallery
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            Button {
                                // no-op
                            } label: {
                                Label("Flag", systemImage: "flag")
                            }
                            .tint(.orange)
                        }
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Trailing edge — destructive + secondary action") {
                DemoCard(api: ".swipeActions(edge: .trailing) { destructive; flag }") {
                    List {
                        ForEach(messages) { message in
                            Text(message.subject)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) { } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                    Button { } label: {
                                        Label("Flag", systemImage: "flag")
                                    }
                                    .tint(.orange)
                                }
                        }
                    }
                }
            }

            VariantBlock(title: "Leading edge — read/unread toggle") {
                DemoCard(api: ".swipeActions(edge: .leading) { Button { … } }") {
                    List {
                        ForEach(messages) { message in
                            Text(message.subject)
                                .swipeActions(edge: .leading) {
                                    Button { } label: {
                                        Label(
                                            message.isUnread ? "Read" : "Unread",
                                            systemImage: message.isUnread ? "envelope.open" : "envelope.badge"
                                        )
                                    }
                                    .tint(.blue)
                                }
                        }
                    }
                }
            }

            VariantBlock(title: "allowsFullSwipe: false — disable full-swipe execution") {
                DemoCard(api: ".swipeActions(edge: .leading, allowsFullSwipe: false) { … }") {
                    List {
                        ForEach(messages) { message in
                            Text(message.subject)
                                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                    Button { } label: {
                                        Label("Pin", systemImage: "pin")
                                    }
                                    .tint(.yellow)
                                }
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "macOS — actions are not visible without a swipe gesture") {
                DemoCard(api: "(no chrome on macOS Lists)") {
                    List {
                        ForEach(messages) { message in
                            Text(message.subject)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) { } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                }
                Text("On macOS, .swipeActions compiles and the buttons are part of the row's accessibility tree, but List does not present a horizontal swipe gesture by default. Apple's macOS guidance is to use context menus, table column buttons, or NSTableView delegate methods for row actions instead.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.top, 4)
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
        .init(title: "iOS-flavored — macOS has no built-in swipe gesture for List rows.",
              detail: "Per the doc this is a list-row gesture; macOS Lists historically don't surface horizontal swipe gestures. The modifier compiles on macOS and is in the API, but the iconography (red 'Delete', orange 'Flag') is not exposed by default. Use .contextMenu or a Table with column buttons for macOS-native row actions.",
              symbol: "exclamationmark.triangle"),
        .init(title: "edge: .trailing (default) for destructive, .leading for affirmative.",
              detail: "Apple's convention: trailing for destructive (delete, archive), leading for affirmative or workflow toggles (mark read, pin). The HorizontalEdge parameter accepts .leading or .trailing.",
              symbol: "arrow.left.and.right"),
        .init(title: "Buttons accumulate when the modifier is called multiple times per edge.",
              detail: "Per the doc: 'Actions accumulate for a given edge if you call the modifier multiple times on the same list row view.' Useful for composing actions from different code paths.",
              symbol: "rectangle.stack"),
        .init(title: "ButtonRole.destructive auto-styles in red; .tint(_:) overrides per button.",
              detail: "Use .destructive for delete/discard. Apply .tint(.blue / .orange / .yellow / etc.) for color cues outside red. SwiftUI applies the .fill SF Symbol variant inside swipe actions automatically.",
              symbol: "paintbrush"),
        .init(title: "Replaces ForEach.onDelete behavior.",
              detail: "Per the doc: 'When you add swipe actions, SwiftUI no longer synthesizes the Delete actions that otherwise appear when using ForEach.onDelete(perform:).' You become responsible for the Delete action.",
              symbol: "trash")
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

extension SwipeActionsGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.swipeActions",
        title: "SwipeActions",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/swipeActions(edge:allowsFullSwipe:content:)"
        ],
        blurb: "Adds custom swipe actions to a row in a list. Each action is a Button placed at the leading or trailing edge.",
        signature: "func swipeActions<T>(edge: HorizontalEdge = .trailing, allowsFullSwipe: Bool = true, @ViewBuilder content: () -> T) -> some View where T : View",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/lists/swipeactions(edge:allowsfullswipe:content:).md",
        page: { AnyView(SwipeActionsGalleryPage()) }
    )
}

#Preview {
    SwipeActionsGalleryPage()
        .frame(width: 1100, height: 800)
}
