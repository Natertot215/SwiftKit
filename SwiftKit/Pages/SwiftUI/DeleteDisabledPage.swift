import SwiftUI

// SwiftUI `View/deleteDisabled(_:)` reference page.
// Source: Documentation/SwiftUI/lists/deletedisabled(_:).md
// Single API:
//   func deleteDisabled(_ isDisabled: Bool) -> some View
// Marks a row's view hierarchy as non-deletable inside a List that supports
// deletion (typically via ForEach.onDelete). macOS 10.15+.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

private struct Item: Identifiable, Hashable {
    let title: String
    var locked: Bool
    let id = UUID()
}

private let initialItems: [Item] = [
    Item(title: "Inbox (locked)",  locked: true),
    Item(title: "Drafts",           locked: false),
    Item(title: "Sent",             locked: false),
    Item(title: "Junk",             locked: false),
    Item(title: "Archive (locked)", locked: true)
]

struct DeleteDisabledPage: View {
    @State private var items: [Item] = initialItems

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
            Text("deleteDisabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a condition for whether the view's view hierarchy is deletable.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/deletedisabled(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".deleteDisabled(item.locked)") {
            List {
                ForEach(items) { item in
                    Label(item.title, systemImage: item.locked ? "lock" : "tray")
                        .deleteDisabled(item.locked)
                }
                .onDelete { offsets in
                    items.remove(atOffsets: offsets)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Conditional — first/last locked") {
                DemoCard(api: ".deleteDisabled(item.locked) on first/last") {
                    List {
                        ForEach(items) { item in
                            Text(item.title)
                                .deleteDisabled(item.locked)
                        }
                        .onDelete { offsets in
                            items.remove(atOffsets: offsets)
                        }
                    }
                }
            }

            VariantBlock(title: "Globally locked — every row unconditional") {
                DemoCard(api: ".deleteDisabled(true)") {
                    List {
                        ForEach(items) { item in
                            Text(item.title)
                                .deleteDisabled(true)
                        }
                        .onDelete { offsets in
                            items.remove(atOffsets: offsets)
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("deleteDisabled is a Bool toggle. Locked rows are not eligible for deletion even when the surrounding ForEach has an .onDelete handler installed.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Targets a row inside a delete-aware ForEach.",
              detail: "Effective when the ancestor ForEach has .onDelete(perform:) installed. Without an .onDelete handler, deletion isn't possible at all and the modifier is moot — the row was already not deletable.",
              symbol: "trash.slash"),
        .init(title: "macOS deletion paths: keyboard delete, drag-to-trash, custom buttons.",
              detail: "On macOS, deletion typically comes from a Cmd+Delete keyboard shortcut or an explicit Delete button in the toolbar/context menu. iOS uses swipe-to-delete and edit mode. The modifier blocks deletion via any of these paths.",
              symbol: "delete.left"),
        .init(title: "Pair with .moveDisabled(_:) for fully-locked rows.",
              detail: "deleteDisabled blocks deletion only. To prevent both moves and deletes — common for placeholder or fixed rows like 'Inbox', 'Sent' — apply both modifiers with the same condition.",
              symbol: "lock"),
        .init(title: "Apply per row, not to the List.",
              detail: "Attach to the row view inside ForEach. The List itself has no concept of 'all rows locked' — express that by applying .deleteDisabled(true) inside the row builder unconditionally.",
              symbol: "rectangle.split.1x2")
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

#Preview {
    DeleteDisabledPage()
        .frame(width: 1100, height: 800)
}
