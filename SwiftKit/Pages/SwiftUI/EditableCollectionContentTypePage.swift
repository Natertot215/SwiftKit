import SwiftUI

// SwiftUI `EditableCollectionContent` (struct) reference page.
// Source: Documentation/SwiftUI/lists/editablecollectioncontent.md
// "An opaque wrapper view that adds editing capabilities to a row in a list."
// Per the doc: "You don't use this type directly. Instead SwiftUI creates this
// type on your behalf." It's the return type of the editActions ForEach overload.
// macOS 13.0+.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 240

private struct Item: Identifiable, Hashable {
    let title: String
    let id = UUID()
}

private let initialItems: [Item] = [
    Item(title: "Alpha"),
    Item(title: "Beta"),
    Item(title: "Gamma"),
    Item(title: "Delta")
]

struct EditableCollectionContentTypePage: View {
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
            Text("EditableCollectionContent")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An opaque wrapper view that adds editing capabilities to a row in a list.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/editablecollectioncontent.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "ForEach($items, editActions: .all) { … } returns EditableCollectionContent") {
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
            VariantBlock(title: "Created implicitly by the ForEach editActions overload") {
                DemoCard(api: "ForEach($items, editActions: [.move, .delete]) { … }") {
                    List {
                        ForEach($items, editActions: [.move, .delete]) { $item in
                            Text(item.title)
                        }
                    }
                }
                Text("The ForEach return type carries EditableCollectionContent so the framework knows which row supports which actions. You don't construct or name it in your own code.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("EditableCollectionContent is an opaque framework type. There are no per-instance states to demonstrate — see Variants for how it's produced.")
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
        .init(title: "Don't construct directly.",
              detail: "Per the doc: 'You don't use this type directly. Instead SwiftUI creates this type on your behalf.' It's an implementation detail of the editActions ForEach overload, surfaced in API for type-resolution purposes.",
              symbol: "function"),
        .init(title: "Conforms to View — composes like any other SwiftUI view.",
              detail: "Returned from the editActions ForEach overload, the value is itself a View. You can chain modifiers on it the same as any other view; you just rarely name the type.",
              symbol: "rectangle"),
        .init(title: "Generic over Content and Data.",
              detail: "EditableCollectionContent<Content, Data> — Content is the row builder's view type, Data is the collection's element type. Type inference handles both; no explicit annotation needed.",
              symbol: "switch.2"),
        .init(title: "Documented for API-surface completeness.",
              detail: "SwiftKit's purpose is to mirror Apple's API surface. Even types you don't construct directly belong in the catalog so a developer searching for 'EditableCollectionContent' lands on the official explanation rather than a dead end.",
              symbol: "book")
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
    EditableCollectionContentTypePage()
        .frame(width: 1100, height: 800)
}
