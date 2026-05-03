import SwiftUI

// SwiftUI `IndexedIdentifierCollection` (struct) reference page.
// Source: Documentation/SwiftUI/lists/indexedidentifiercollection.md
// "A collection wrapper that iterates over the indices and identifiers of a
//  collection together." Per the doc: "You don't use this type directly.
//  Instead SwiftUI creates this type on your behalf."
// macOS 13.0+.

struct IndexedIdentifierCollectionTypePage: View {
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
            Text("IndexedIdentifierCollection")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A collection wrapper that iterates over the indices and identifiers of a collection together.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/indexedidentifiercollection.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        InfoCard {
            Text("IndexedIdentifierCollection<Base, ID> is an opaque framework wrapper used by SwiftUI internally when iterating over collections that need both an index and an identifier (e.g., inside the editActions ForEach overload).")
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            DetailRow(label: "Generic signature",
                      value: "IndexedIdentifierCollection<Base, ID> where Base : Collection, ID : Hashable")
            DetailRow(label: "Element type",
                      value: "IndexedIdentifierCollection<Base, ID>.Element — combines an index and identifier")
            DetailRow(label: "Index type",
                      value: "Base.Index — the underlying collection's index type")
            DetailRow(label: "Conformances",
                      value: "Collection, BidirectionalCollection, RandomAccessCollection")
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        Text("IndexedIdentifierCollection is an opaque framework wrapper. There are no per-instance states to demonstrate.")
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
              detail: "Per the doc: 'You don't use this type directly. Instead SwiftUI creates this type on your behalf.' It exists so SwiftUI can iterate over a collection's indices alongside identifiers without forcing the caller to zip them manually.",
              symbol: "function"),
        .init(title: "Conforms to RandomAccessCollection.",
              detail: "Iteration is O(1) per element. Useful when SwiftUI needs to index-address a row (move/delete) while also matching identity (animation diffing).",
              symbol: "list.number"),
        .init(title: "Documented for API-surface completeness.",
              detail: "SwiftKit mirrors Apple's API surface, including types you don't construct yourself. Future agents searching for 'IndexedIdentifierCollection' should land on this page rather than guess at it.",
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

// MARK: - Reusable display helpers (page-local)

private struct InfoCard<Content: View>: View {
    @ViewBuilder var content: () -> Content

    var body: some View {
        Label {
            content()
                .font(.callout)
                .foregroundStyle(.primary)
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(value)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

#Preview {
    IndexedIdentifierCollectionTypePage()
        .frame(width: 1100, height: 800)
}
