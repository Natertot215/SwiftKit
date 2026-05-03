import SwiftUI

// SwiftUI `EditActions` (struct) reference page.
// Source: Documentation/SwiftUI/lists/editactions.md
// EditActions<Data> is an OptionSet containing edit actions a view can offer.
// Documented members:
//   .all      — everything available
//   .delete   — deletion (RangeReplaceableCollection only)
//   .move     — reorder
// Used as an argument to ForEach(_:editActions:content:). macOS 13.0+.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 280

private struct Item: Identifiable, Hashable {
    let title: String
    let id = UUID()
}

private let initialItems: [Item] = [
    Item(title: "Pacific"),
    Item(title: "Atlantic"),
    Item(title: "Indian"),
    Item(title: "Southern"),
    Item(title: "Arctic")
]

struct EditActionsTypePage: View {
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
            Text("EditActions")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A set of edit actions on a collection of data that a view can offer to a user.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/editactions.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "ForEach($items, editActions: .all) { $item in Text(item.title) }") {
            List {
                ForEach($items, editActions: .all) { $item in
                    Text(item.title)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: ".all — every documented operation") {
                DemoCard(api: "editActions: .all") {
                    List {
                        ForEach($items, editActions: .all) { $item in
                            Text(item.title)
                        }
                    }
                }
            }

            VariantBlock(title: ".delete — deletion only") {
                DemoCard(api: "editActions: .delete") {
                    List {
                        ForEach($items, editActions: .delete) { $item in
                            Text(item.title)
                        }
                    }
                }
            }

            VariantBlock(title: ".move — reorder only") {
                DemoCard(api: "editActions: .move") {
                    List {
                        ForEach($items, editActions: .move) { $item in
                            Text(item.title)
                        }
                    }
                }
            }

            VariantBlock(title: "Combined — OptionSet brackets") {
                DemoCard(api: "editActions: [.move, .delete]") {
                    List {
                        ForEach($items, editActions: [.move, .delete]) { $item in
                            Text(item.title)
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("EditActions is an OptionSet — the documented members combine via brackets. macOS Lists don't expose iOS-style edit-mode chrome, so the gestures may not be visible by default; the actions still wire up correctly when triggered programmatically or through other means.")
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    // MARK: Notes

    private struct TypeNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [TypeNote] = [
        .init(title: "Conforms to OptionSet — combine with brackets.",
              detail: "EditActions<Data> is a SetAlgebra option set. Use .all, .delete, .move individually, or combine like [.move, .delete] for the common 'reorder + delete' pair.",
              symbol: "list.bullet.rectangle"),
        .init(title: "Used as the argument to ForEach(_:editActions:content:).",
              detail: "The ForEach overload takes a Binding to the collection plus an EditActions value. The closure receives a binding to each element ($item) so deletion and reordering can mutate the original collection.",
              symbol: "function"),
        .init(title: ".delete requires a RangeReplaceableCollection.",
              detail: "Per the swiftinterface: 'Delete is available only for collections conforming to RangeReplaceableCollection.' Array and ArraySlice qualify; many custom collections do not.",
              symbol: "checkmark.shield"),
        .init(title: "macOS edit chrome is minimal — gestures may not appear by default.",
              detail: "iOS edit mode (EditButton + swipe) is the canonical surface. macOS Lists don't expose those gestures; the editActions wiring still allows programmatic mutation via the binding, and macOS-specific paths (Cmd+Delete, drag-to-reorder) can hook in.",
              symbol: "exclamationmark.triangle")
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
    EditActionsTypePage()
        .frame(width: 1100, height: 800)
}
