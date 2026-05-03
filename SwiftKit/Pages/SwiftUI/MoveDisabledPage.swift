import SwiftUI

// SwiftUI `View/moveDisabled(_:)` reference page.
// Source: Documentation/SwiftUI/lists/movedisabled(_:).md
// Single API:
//   func moveDisabled(_ isDisabled: Bool) -> some View
// Marks a row's view hierarchy as non-movable inside a List that supports
// reordering (typically via ForEach.onMove). macOS 10.15+.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

private struct Item: Identifiable, Hashable {
    let title: String
    var locked: Bool
    let id = UUID()
}

private let initialItems: [Item] = [
    Item(title: "Pinned (locked)", locked: true),
    Item(title: "Mobile",           locked: false),
    Item(title: "Mobile",           locked: false),
    Item(title: "Mobile",           locked: false),
    Item(title: "Pinned (locked)", locked: true)
]

struct MoveDisabledPage: View {
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
            Text("moveDisabled(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a condition for whether the view's view hierarchy is movable.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/movedisabled(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".moveDisabled(item.locked)") {
            List {
                ForEach(items) { item in
                    Label(item.title, systemImage: item.locked ? "lock" : "circle")
                        .moveDisabled(item.locked)
                }
                .onMove { source, destination in
                    items.move(fromOffsets: source, toOffset: destination)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Bool overload — locked rows can't be reordered") {
                DemoCard(api: ".moveDisabled(true) on first row") {
                    List {
                        ForEach(items) { item in
                            Text(item.title)
                                .moveDisabled(item.locked)
                        }
                        .onMove { source, destination in
                            items.move(fromOffsets: source, toOffset: destination)
                        }
                    }
                }
            }

            VariantBlock(title: "Disable globally for a static list") {
                DemoCard(api: ".moveDisabled(true)") {
                    List {
                        ForEach(items) { item in
                            Text(item.title)
                                .moveDisabled(true)
                        }
                        .onMove { source, destination in
                            items.move(fromOffsets: source, toOffset: destination)
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("moveDisabled is a Bool toggle. Locked rows resist reordering even when the surrounding ForEach has an .onMove handler installed.")
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
        .init(title: "Targets a row inside a reorder-aware ForEach.",
              detail: "Effective when the ancestor ForEach has an .onMove(perform:) handler. With no .onMove, reordering isn't possible at all and moveDisabled is moot — the row was already non-movable.",
              symbol: "arrow.up.arrow.down"),
        .init(title: "macOS reordering is drag-based; iOS uses edit mode.",
              detail: "On macOS, drag-to-reorder works with selected rows in a List that has .onMove. iOS surfaces edit mode as the standard reorder UI. The modifier honors both paths.",
              symbol: "rectangle.and.hand.point.up.left"),
        .init(title: "Pair with .deleteDisabled(_:) for fully-locked rows.",
              detail: "moveDisabled blocks reordering only. To prevent both moves and deletes — typical for header/footer placeholder rows — apply both modifiers with the same condition.",
              symbol: "lock"),
        .init(title: "Apply per row, not to the List.",
              detail: "Attach to the row view inside ForEach. The List itself has no concept of 'all rows locked' — express that by applying .moveDisabled(true) inside the row builder unconditionally.",
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
    MoveDisabledPage()
        .frame(width: 1100, height: 800)
}
