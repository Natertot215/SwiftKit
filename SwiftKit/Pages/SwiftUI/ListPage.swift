import SwiftUI

// SwiftUI `List` reference page.
// Source: Documentation/SwiftUI/lists/list.md
// Compose Apple primitives directly per L-001 / L-007 / framework hard constraints.
// macOS 26 supports 5 of the 9 documented ListStyle values: .automatic, .bordered,
// .inset, .plain, .sidebar. Others (.grouped, .insetGrouped, .carousel, .elliptical)
// are iOS/watchOS-only and fall back silently on macOS.

private let demoHeight: CGFloat = 220
private let demoFrameWidth: CGFloat = 320

private struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private let oceans: [Ocean] = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]

private struct OceanRegion: Identifiable, Hashable {
    let name: String
    let seas: [Ocean]
    let id = UUID()
}

private let oceanRegions: [OceanRegion] = [
    OceanRegion(name: "Pacific", seas: [
        Ocean(name: "Philippine"),
        Ocean(name: "Coral"),
        Ocean(name: "South China")
    ]),
    OceanRegion(name: "Atlantic", seas: [
        Ocean(name: "Sargasso"),
        Ocean(name: "Caribbean")
    ]),
    OceanRegion(name: "Indian", seas: [
        Ocean(name: "Bay of Bengal")
    ])
]

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
                FileItem(name: "notes.md", symbol: "doc.text")
            ])
        ])
    ]),
    FileItem(name: "Applications", symbol: "folder", children: [
        FileItem(name: "Mail.app", symbol: "envelope"),
        FileItem(name: "Finder.app", symbol: "macwindow")
    ])
]

struct ListPage: View {
    @State private var singleSelection: Ocean.ID?
    @State private var multiSelection: Set<Ocean.ID> = []

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
            Text("List")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A container that presents rows of data arranged in a single column, optionally providing the ability to select one or more members.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/list.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoBlock(api: "List { Text(\"…\"); Text(\"…\"); Text(\"…\") }") {
            List {
                Text("A List Item")
                Text("A Second List Item")
                Text("A Third List Item")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "From Identifiable data") {
                DemoBlock(api: "List(oceans) { Text($0.name) }") {
                    List(oceans) { ocean in
                        Text(ocean.name)
                    }
                }
            }

            VariantRow(title: "Sectioned") {
                DemoBlock(api: "List { ForEach(regions) { Section(header:) { ForEach(seas) { Text } } } }") {
                    List {
                        ForEach(oceanRegions) { region in
                            Section(header: Text(region.name)) {
                                ForEach(region.seas) { sea in
                                    Text(sea.name)
                                }
                            }
                        }
                    }
                }
            }

            VariantRow(title: "Hierarchical") {
                DemoBlock(api: "List(fileTree, children: \\.children) { Label($0.name, systemImage: $0.symbol) }") {
                    List(fileTree, children: \.children) { item in
                        Label(item.name, systemImage: item.symbol)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Single selection") {
                DemoBlock(api: "List(oceans, selection: $singleSelection) { Text($0.name) }") {
                    List(oceans, selection: $singleSelection) { ocean in
                        Text(ocean.name)
                    }
                }
                Text(singleSelection.flatMap { id in oceans.first(where: { $0.id == id })?.name } ?? "—")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VariantRow(title: "Multi-selection") {
                DemoBlock(api: "List(oceans, selection: $multiSelection) { Text($0.name) } — Set<UUID>") {
                    List(oceans, selection: $multiSelection) { ocean in
                        Text(ocean.name)
                    }
                }
                Text("\(multiSelection.count) selected")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            stylesGrid
        }
    }

    private var stylesGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("List styles available on macOS")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Apply via .listStyle(_:). Five of the nine documented styles render on macOS — others fall back to the default.")
                .font(.caption)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: demoFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                styleSample(title: ".automatic", api: ".listStyle(.automatic)") {
                    AnyView(stylableList.listStyle(.automatic))
                }
                styleSample(title: ".bordered", api: ".listStyle(.bordered)") {
                    AnyView(stylableList.listStyle(.bordered))
                }
                styleSample(title: ".inset", api: ".listStyle(.inset)") {
                    AnyView(stylableList.listStyle(.inset))
                }
                styleSample(title: ".plain", api: ".listStyle(.plain)") {
                    AnyView(stylableList.listStyle(.plain))
                }
                styleSample(title: ".sidebar", api: ".listStyle(.sidebar)") {
                    AnyView(stylableList.listStyle(.sidebar))
                }
            }
        }
    }

    private var stylableList: some View {
        List {
            Section(header: Text("Pacific")) {
                ForEach(oceanRegions[0].seas) { sea in
                    Label(sea.name, systemImage: "water.waves")
                }
            }
            Section(header: Text("Atlantic")) {
                ForEach(oceanRegions[1].seas) { sea in
                    Label(sea.name, systemImage: "water.waves")
                }
            }
        }
    }

    private func styleSample(title: String, api: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: demoFrameWidth, height: demoHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    // MARK: Notes

    private struct ListNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ListNote] = [
        .init(title: "Selection works without edit mode on macOS.",
              detail: "On Mac (and iPad with a keyboard/trackpad), people can click rows or shift/cmd-click to select multiple — no EditButton or edit mode needed. EditButton is iOS-flavored.",
              symbol: "cursorarrow.rays"),
        .init(title: "Bind to .ID for single, Set<.ID> for multi.",
              detail: "List(_:selection:) infers single vs multi from the binding type. Optional<ID> = single. Set<ID> = multi. Identifiable.ID is the value bound, not the model itself.",
              symbol: "checklist"),
        .init(title: "Hierarchical lists need Identifiable + KeyPath to children.",
              detail: "List(_:children:) takes a key path to an Optional<[Item]> on each node. Nil children = leaf, empty array = empty folder, non-empty = expandable.",
              symbol: "list.bullet.indent"),
        .init(title: "Five list styles render on macOS.",
              detail: ".automatic, .bordered, .inset, .plain, .sidebar. The iOS .grouped / .insetGrouped and watchOS .carousel / .elliptical fall back to the default style on macOS.",
              symbol: "square.grid.2x2"),
        .init(title: ".sidebar fully renders inside NavigationSplitView's sidebar column.",
              detail: "Outside NavigationSplitView the .sidebar style still applies (translucent material, source-list row metrics) but doesn't pick up window-chrome integration like real sidebars do.",
              symbol: "sidebar.left"),
        .init(title: "Don't fight the framework's selection chrome.",
              detail: "Per L-012: avoid .listRowBackground / .background overrides on List rows — they introduce additional grouping chrome on top of the framework's selection rendering. Compose List as Apple intends; if Mail-style selection is needed, bridge to NSOutlineView (see .claude/sidebar-plan.md).",
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

// MARK: - Reusable demo helpers

private struct DemoBlock<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantRow<Content: View>: View {
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
    ListPage()
        .frame(width: 1100, height: 800)
}
