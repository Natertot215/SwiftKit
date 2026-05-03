import SwiftUI

// SwiftUI `OutlineGroup` reference page.
// Source: Documentation/SwiftUI/lists/outlinegroup.md
// Three documented initializers for the common DisclosureGroup-leaf form:
//   init(_:children:)              — Identifiable data, default text rendering
//   init(_:children:content:)      — Identifiable data, custom row content
//   init(_:id:children:content:)   — KeyPath ID for non-Identifiable data
// macOS 11.0+. The OutlineGroup vs List(_:children:) distinction is the page's pedagogy.

private let demoFrameWidth: CGFloat = 380
private let demoFrameHeight: CGFloat = 300

private struct FileItem: Identifiable, Hashable {
    var id: Self { self }
    let name: String
    let symbol: String
    var children: [FileItem]? = nil
}

private let fileTree: [FileItem] = [
    FileItem(name: "Users", symbol: "folder", children: [
        FileItem(name: "nathan", symbol: "person.crop.square", children: [
            FileItem(name: "Photos", symbol: "folder", children: [
                FileItem(name: "sunset.jpg", symbol: "photo"),
                FileItem(name: "beach.jpg", symbol: "photo")
            ]),
            FileItem(name: "Documents", symbol: "folder", children: [
                FileItem(name: "notes.md", symbol: "doc.text"),
                FileItem(name: "budget.numbers", symbol: "tablecells")
            ])
        ])
    ]),
    FileItem(name: "Applications", symbol: "folder", children: [
        FileItem(name: "Mail.app", symbol: "envelope"),
        FileItem(name: "Finder.app", symbol: "macwindow"),
        FileItem(name: "SwiftKit.app", symbol: "swift")
    ]),
    FileItem(name: "System", symbol: "folder", children: [])
]

private struct PlainNode: Hashable {
    let key: String
    let title: String
    var children: [PlainNode]? = nil
}

private let plainTree: [PlainNode] = [
    PlainNode(key: "root", title: "Root", children: [
        PlainNode(key: "a", title: "Branch A", children: [
            PlainNode(key: "a1", title: "Leaf A1"),
            PlainNode(key: "a2", title: "Leaf A2")
        ]),
        PlainNode(key: "b", title: "Branch B")
    ])
]

struct OutlineGroupPage: View {
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
            Text("OutlineGroup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A structure that computes views and disclosure groups on demand from an underlying collection of tree-structured, identified data.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/outlinegroup.md · macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "OutlineGroup(fileTree, children: \\.children) { Label($0.name, systemImage: $0.symbol) }",
                 height: demoFrameHeight) {
            ScrollView {
                OutlineGroup(fileTree, children: \.children) { item in
                    Label(item.name, systemImage: item.symbol)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Identifiable data, custom content") {
                DemoCard(api: "OutlineGroup(fileTree, children: \\.children) { item in Label(...) }",
                         height: demoFrameHeight) {
                    ScrollView {
                        OutlineGroup(fileTree, children: \.children) { item in
                            Label(item.name, systemImage: item.symbol)
                        }
                    }
                }
            }

            VariantBlock(title: "Non-Identifiable data — id KeyPath") {
                DemoCard(api: "OutlineGroup(plainTree, id: \\.key, children: \\.children) { Text($0.title) }",
                         height: demoFrameHeight) {
                    ScrollView {
                        OutlineGroup(plainTree, id: \.key, children: \.children) { node in
                            Text(node.title)
                        }
                    }
                }
            }

            VariantBlock(title: "Inside a List — promotes to source-list look") {
                DemoCard(api: "List { OutlineGroup(fileTree, children: \\.children) { Label(...) } }",
                         height: demoFrameHeight) {
                    List {
                        OutlineGroup(fileTree, children: \.children) { item in
                            Label(item.name, systemImage: item.symbol)
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
            VariantBlock(title: "Empty children array — folder is expandable but empty") {
                DemoCard(api: "FileItem(name: \"System\", children: [])",
                         height: 180) {
                    ScrollView {
                        OutlineGroup([fileTree[2]], children: \.children) { item in
                            Label(item.name, systemImage: item.symbol)
                        }
                    }
                }
            }

            VariantBlock(title: "Nil children — node renders as a leaf") {
                DemoCard(api: "FileItem(name: \"file.md\", children: nil)",
                         height: 180) {
                    ScrollView {
                        OutlineGroup([
                            FileItem(name: "leaf-only.md", symbol: "doc.text", children: nil)
                        ], children: \.children) { item in
                            Label(item.name, systemImage: item.symbol)
                        }
                    }
                }
            }

            VariantBlock(title: "Side-by-side — OutlineGroup vs List(_:children:)") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "OutlineGroup (raw)", api: "OutlineGroup(_:children:)") {
                        ScrollView {
                            OutlineGroup(fileTree, children: \.children) { item in
                                Label(item.name, systemImage: item.symbol)
                            }
                        }
                    }
                    StateColumn(label: "List(_:children:)", api: "List(_:children:)") {
                        List(fileTree, children: \.children) { item in
                            Label(item.name, systemImage: item.symbol)
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct OGNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [OGNote] = [
        .init(title: "Tree shape comes from a KeyPath to optional children.",
              detail: "Each node's `children` is an Optional<[Item]>. nil = leaf (renders as plain row). Empty array = expandable folder with no contents. Non-empty = expandable with contents. The same key path drives expansion at every depth.",
              symbol: "list.triangle"),
        .init(title: "OutlineGroup is the engine; List(_:children:) is the wrapper.",
              detail: "List(_:children:rowContent:) literally builds an OutlineGroup internally and applies List's row chrome on top. Use OutlineGroup directly when you need the hierarchy without List's frame, separators, or selection chrome — e.g. inside a Form, custom container, or ScrollView.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Three init forms cover every collection.",
              detail: "init(_:children:) for Identifiable with default rendering. init(_:children:content:) for Identifiable with a custom row. init(_:id:children:content:) for non-Identifiable data via KeyPath<Element, ID>.",
              symbol: "switch.2"),
        .init(title: "Disclosure chevrons are built in — never draw your own.",
              detail: "OutlineGroup uses the platform's standard disclosure indicator at every depth and handles its rotation, focus ring, and click target. Adding a custom chevron in the row builder produces double indicators.",
              symbol: "chevron.right"),
        .init(title: "Indentation is the system default; do not manually pad.",
              detail: "Each depth level inherits a calibrated indent from the disclosure mechanism. Adding `.padding(.leading, depth * N)` in the row builder breaks alignment with the chevron column.",
              symbol: "arrow.left.and.right"),
        .init(title: "See also: DisclosureGroup for a single hand-built node.",
              detail: "If you only need ONE collapsible section (not an arbitrary tree), reach for DisclosureGroup. OutlineGroup pays for itself once you have recursive data.",
              symbol: "chevron.down")
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
                .padding(8)
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
                .padding(8)
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
    OutlineGroupPage()
        .frame(width: 1100, height: 800)
}
