import SwiftUI

// Dense SwiftUI Lists gallery — consolidates the entire List family:
//   List                                         (struct List)
//   View/listRowBackground(_:)
//   View/listRowInsets(_:)
//   View/listRowSeparator(_:edges:)
//   View/listRowSeparatorTint(_:edges:)
//   View/listRowSpacing(_:)                       (macOS unavailable)
//   View/listRowHoverEffect(_:)                   (macOS unavailable)
//   View/listRowHoverEffectDisabled(_:)           (macOS unavailable)
//   View/listSectionMargins(_:_:)                 (macOS unavailable)
//   View/listSectionSeparator(_:edges:)
//   View/listSectionSeparatorTint(_:edges:)
//   View/listSectionSpacing(_:) + ListSectionSpacing  (macOS unavailable)
//   View/listSectionIndexVisibility(_:) + sectionIndexLabel  (macOS unavailable)
//   View/listItemTint(_:) + ListItemTint
//   "Displaying data in lists" article reference
//
// Source docs:
//   Documentation/SwiftUI/lists/list.md
//   Documentation/SwiftUI/lists/displaying-data-in-lists.md
//   Documentation/SwiftUI/lists/listrowbackground(_:).md
//   Documentation/SwiftUI/lists/listrowinsets(_:).md
//   Documentation/SwiftUI/lists/listrowseparator(_:edges:).md
//   Documentation/SwiftUI/lists/listrowseparatortint(_:edges:).md
//   Documentation/SwiftUI/lists/listrowspacing(_:).md
//   Documentation/SwiftUI/lists/listrowhovereffect(_:).md
//   Documentation/SwiftUI/lists/listrowhovereffectdisabled(_:).md
//   Documentation/SwiftUI/lists/listsectionmargins(_:_:).md
//   Documentation/SwiftUI/lists/listsectionseparator(_:edges:).md
//   Documentation/SwiftUI/lists/listsectionseparatortint(_:edges:).md
//   Documentation/SwiftUI/lists/listsectionspacing(_:).md
//   Documentation/SwiftUI/lists/listsectionspacing.md
//   Documentation/SwiftUI/lists/listsectionindexvisibility(_:).md
//   Documentation/SwiftUI/lists/listitemtint(_:).md
//   Documentation/SwiftUI/lists/listitemtint.md
//
// Per L-001 / L-007 / L-012: semantic tokens only, no hand-mixed colors,
// avoid row-background overrides on production source lists (see L-012 note).
// macOS 26 supports 5 of the 9 documented ListStyle values: .automatic,
// .bordered, .inset, .plain, .sidebar. Others (.grouped, .insetGrouped,
// .carousel, .elliptical) are iOS/watchOS-only and fall back silently.

// MARK: — Shared demo data (file-private)

private let listDemoFrameWidth: CGFloat = 320
private let listDemoFrameHeight: CGFloat = 220
private let listDemoNarrowWidth: CGFloat = 220
private let listDemoMediumWidth: CGFloat = 280
private let listDemoWideWidth: CGFloat = 360
private let listDemoTallHeight: CGFloat = 240
private let listDemoShortHeight: CGFloat = 200

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

// Folder rows used by the listItemTint demos (absorbed from former
// ListItemTintPage). Renamed from `TintFolder` to remain unique.
private struct ListItemTintFolder: Identifiable, Hashable {
    let name: String
    let symbol: String
    let tint: Color
    let id = UUID()
}

private let listItemTintFolders: [ListItemTintFolder] = [
    ListItemTintFolder(name: "Inbox",   symbol: "tray",       tint: .blue),
    ListItemTintFolder(name: "Drafts",  symbol: "doc.text",   tint: .orange),
    ListItemTintFolder(name: "Sent",    symbol: "paperplane", tint: .green),
    ListItemTintFolder(name: "Junk",    symbol: "xmark.bin",  tint: .red),
    ListItemTintFolder(name: "Archive", symbol: "archivebox", tint: .gray)
]

private let listItemTintShortFolders: [ListItemTintFolder] = [
    ListItemTintFolder(name: "Inbox",   symbol: "tray",       tint: .indigo),
    ListItemTintFolder(name: "Drafts",  symbol: "doc.text",   tint: .indigo),
    ListItemTintFolder(name: "Sent",    symbol: "paperplane", tint: .indigo),
    ListItemTintFolder(name: "Archive", symbol: "archivebox", tint: .indigo)
]

// Cars used by the listRowSeparatorTint demos (absorbed from former
// ListRowSeparatorTintPage). Renamed for clarity in the merged file.
private struct ListRowSeparatorCar: Identifiable, Hashable {
    let model: String
    let brandColor: Color
    let id = UUID()
}

private let listRowSeparatorCars: [ListRowSeparatorCar] = [
    ListRowSeparatorCar(model: "Mustang",  brandColor: .blue),
    ListRowSeparatorCar(model: "Camaro",   brandColor: .orange),
    ListRowSeparatorCar(model: "Charger",  brandColor: .red),
    ListRowSeparatorCar(model: "Corvette", brandColor: .yellow),
    ListRowSeparatorCar(model: "Viper",    brandColor: .purple)
]

// Staff/department model used by the "Displaying data in lists" article
// section (absorbed from former DisplayingDataInListsPage). Renamed to
// avoid collision with future Person types in the catalog.
private struct ArticlePerson: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let phoneNumber: String
}

private struct ArticleDepartment: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let staff: [ArticlePerson]
}

private struct ArticleCompany {
    let departments: [ArticleDepartment]
}

private let articleStaff: [ArticlePerson] = [
    ArticlePerson(name: "Juan Chavez", phoneNumber: "(408) 555-4301"),
    ArticlePerson(name: "Mei Chen",    phoneNumber: "(919) 555-2481")
]

private let articleCompany = ArticleCompany(departments: [
    ArticleDepartment(name: "Sales", staff: [
        ArticlePerson(name: "Juan Chavez", phoneNumber: "(408) 555-4301"),
        ArticlePerson(name: "Mei Chen",    phoneNumber: "(919) 555-2481")
    ]),
    ArticleDepartment(name: "Engineering", staff: [
        ArticlePerson(name: "Bill James",   phoneNumber: "(408) 555-4450"),
        ArticlePerson(name: "Anne Johnson", phoneNumber: "(417) 555-9311")
    ])
])

private struct ArticlePersonRow: View {
    let person: ArticlePerson
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(person.name)
                .font(.headline)
                .foregroundStyle(.primary)
            Label(person.phoneNumber, systemImage: "phone")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

private struct ArticlePersonDetail: View {
    let person: ArticlePerson
    var body: some View {
        VStack(spacing: 12) {
            Text(person.name)
                .font(.title)
                .foregroundStyle(.primary)
            Label(person.phoneNumber, systemImage: "phone")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

// MARK: — Main page

struct ListGalleryPage: View {
    @State private var singleSelection: Ocean.ID?
    @State private var multiSelection: Set<Ocean.ID> = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                defaultSection
                variantsSection
                selectionSection
                stylesSection
                listRowBackgroundSection
                listRowInsetsSection
                listRowSeparatorSection
                listRowSeparatorTintSection
                listRowSpacingSection
                listRowHoverEffectSection
                listRowHoverEffectDisabledSection
                listSectionMarginsSection
                listSectionSeparatorSection
                listSectionSeparatorTintSection
                listSectionSpacingSection
                listSectionIndexVisibilitySection
                listItemTintSection
                displayingDataArticleSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("List")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A container that presents rows of data arranged in a single column, optionally providing the ability to select one or more members. Absorbs the full set of List-only modifiers — row insets, spacing, backgrounds, separators, hover effects, item tint, header prominence, alternating row backgrounds, and section index/margin presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/list.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("List \u{00b7} listRowBackground \u{00b7} listRowInsets \u{00b7} listRowSeparator \u{00b7} listRowSeparatorTint \u{00b7} listRowSpacing\u{00b9} \u{00b7} listRowHoverEffect\u{00b9} \u{00b7} listSectionMargins\u{00b9} \u{00b7} listSectionSeparator \u{00b7} listSectionSeparatorTint \u{00b7} listSectionSpacing\u{00b9} \u{00b7} listSectionIndexVisibility\u{00b9} \u{00b7} listItemTint  (\u{00b9} macOS unavailable)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default", subtitle: "List { Text(\"\u{2026}\") } \u{00b7} the simplest data-less form") {
            DemoFrame(api: "List { Text(\"\u{2026}\"); Text(\"\u{2026}\"); Text(\"\u{2026}\") }") {
                List {
                    Text("A List Item")
                    Text("A Second List Item")
                    Text("A Third List Item")
                }
            }
        }
    }

    // MARK: Variants — data-driven, sectioned, hierarchical

    private var variantsSection: some View {
        PageSection("Variants",
                    subtitle: "Identifiable data \u{00b7} Section grouping \u{00b7} Hierarchical (children:)") {
            VStack(alignment: .leading, spacing: 24) {
                LabeledRow(title: "From Identifiable data") {
                    DemoFrame(api: "List(oceans) { Text($0.name) }") {
                        List(oceans) { ocean in
                            Text(ocean.name)
                        }
                    }
                }

                LabeledRow(title: "Sectioned") {
                    DemoFrame(api: "List { ForEach(regions) { Section(header:) { ForEach(seas) { Text } } } }") {
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

                LabeledRow(title: "Hierarchical") {
                    DemoFrame(api: "List(fileTree, children: \\.children) { Label($0.name, systemImage: $0.symbol) }") {
                        List(fileTree, children: \.children) { item in
                            Label(item.name, systemImage: item.symbol)
                        }
                    }
                }
            }
        }
    }

    // MARK: Selection

    private var selectionSection: some View {
        PageSection("Selection",
                    subtitle: "Optional<ID> for single \u{00b7} Set<ID> for multi \u{00b7} inferred from binding type") {
            VStack(alignment: .leading, spacing: 24) {
                LabeledRow(title: "Single selection") {
                    DemoFrame(api: "List(oceans, selection: $singleSelection) { Text($0.name) }") {
                        List(oceans, selection: $singleSelection) { ocean in
                            Text(ocean.name)
                        }
                    }
                    Text(singleSelection.flatMap { id in oceans.first(where: { $0.id == id })?.name } ?? "\u{2014}")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                LabeledRow(title: "Multi-selection") {
                    DemoFrame(api: "List(oceans, selection: $multiSelection) { Text($0.name) } \u{2014} Set<UUID>") {
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
            }
        }
    }

    // MARK: Styles

    private var stylesSection: some View {
        PageSection("List styles available on macOS",
                    subtitle: "Apply via .listStyle(_:). Five of the nine documented styles render on macOS \u{2014} others fall back to the default.") {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: listDemoFrameWidth + 24), spacing: 24)],
                alignment: .leading,
                spacing: 24
            ) {
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
                .frame(width: listDemoFrameWidth, height: listDemoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    // MARK: listRowBackground

    private var listRowBackgroundSection: some View {
        PageSection("listRowBackground(_:)",
                    subtitle: "func listRowBackground<V: View>(_ view: V?) -> some View \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Places a custom background view behind a list row item. Accepts any View — Color, Shape, Image, or composed layout. The framework places it under the row's content view.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LabeledRow(title: "Plain semantic Color background") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: ".listRowBackground(Color(.controlBackgroundColor))") {
                        List {
                            Text("One").listRowBackground(Color(.controlBackgroundColor))
                            Text("Two").listRowBackground(Color(.controlBackgroundColor))
                            Text("Three").listRowBackground(Color(.controlBackgroundColor))
                        }
                    }
                }

                LabeledRow(title: "Shape background \u{2014} Ellipse with tint") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: ".listRowBackground(Ellipse().fill(.tint.opacity(0.2)))") {
                        List {
                            Text("Vanilla")
                                .listRowBackground(Ellipse().fill(.tint.opacity(0.2)))
                            Text("Chocolate")
                                .listRowBackground(Ellipse().fill(.tint.opacity(0.2)))
                            Text("Strawberry")
                                .listRowBackground(Ellipse().fill(.tint.opacity(0.2)))
                        }
                    }
                }

                LabeledRow(title: "Pass nil \u{2014} restore the default") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: ".listRowBackground(nil as Color?)") {
                        List {
                            Text("One").listRowBackground(nil as Color?)
                            Text("Two").listRowBackground(nil as Color?)
                            Text("Three").listRowBackground(nil as Color?)
                        }
                    }
                }

                LabeledRow(title: "Side-by-side \u{2014} default vs translucent fill") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: "Default", api: "(no modifier)",
                                        width: listDemoMediumWidth, height: listDemoTallHeight) {
                            List {
                                Text("Pacific")
                                Text("Atlantic")
                                Text("Indian")
                            }
                        }
                        StateColumnView(label: "Translucent fill", api: ".listRowBackground(.tint.opacity(0.15))",
                                        width: listDemoMediumWidth, height: listDemoTallHeight) {
                            List {
                                Text("Pacific").listRowBackground(Color.accentColor.opacity(0.15))
                                Text("Atlantic").listRowBackground(Color.accentColor.opacity(0.15))
                                Text("Indian").listRowBackground(Color.accentColor.opacity(0.15))
                            }
                        }
                    }
                }

                noteRow(
                    title: "L-012 caveat \u{2014} SwiftKit's sidebar avoids this modifier.",
                    detail: "On macOS 26 source lists, .listRowBackground introduces additional grouping chrome on top of the framework's own selection rendering. SwiftKit's SidebarView uses NO row-background overrides for that reason. See .claude/sidebar-plan.md and L-012 in .claude/lessons.md.",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "Combines with .alternatingRowBackgrounds \u{2014} per-row wins.",
                    detail: "Per the alternatingRowBackgrounds doc: applying .listRowBackground to a specific row overrides the alternating background for that row. Other rows keep alternating per the list-level setting.",
                    symbol: "rectangle.split.2x1"
                )
            }
        }
    }

    // MARK: listRowInsets

    private var listRowInsetsSection: some View {
        PageSection("listRowInsets(_:)",
                    subtitle: "func listRowInsets(_ insets: EdgeInsets?) -> some View \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Applies an inset to the rows in a list. Apply per-row, not to the List itself \u{2014} the modifier targets the per-cell layout.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LabeledRow(title: "Custom leading inset") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoShortHeight,
                              api: ".listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))") {
                        List {
                            Text("Vanilla")
                                .listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                            Text("Chocolate")
                                .listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                            Text("Strawberry")
                                .listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                        }
                    }
                }

                LabeledRow(title: "Zero insets \u{2014} flush to row container") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoShortHeight,
                              api: ".listRowInsets(EdgeInsets())") {
                        List {
                            Text("Edge to edge").listRowInsets(EdgeInsets())
                            Text("Edge to edge").listRowInsets(EdgeInsets())
                        }
                    }
                }

                LabeledRow(title: "Per-edge insets \u{2014} uneven padding") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoShortHeight,
                              api: ".listRowInsets(.init(top: 12, leading: 40, bottom: 12, trailing: 8))") {
                        List {
                            Text("Indented")
                                .listRowInsets(EdgeInsets(top: 12, leading: 40, bottom: 12, trailing: 8))
                            Text("Indented")
                                .listRowInsets(EdgeInsets(top: 12, leading: 40, bottom: 12, trailing: 8))
                        }
                    }
                }

                LabeledRow(title: "Pass nil \u{2014} restore the list style's default") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoShortHeight,
                              api: ".listRowInsets(nil)") {
                        List {
                            Text("Default insets").listRowInsets(nil)
                            Text("Default insets").listRowInsets(nil)
                        }
                    }
                }

                noteRow(
                    title: "Per L-012, prefer this over manual .padding inside the row.",
                    detail: ".listRowInsets feeds the list's row layout machinery so selection chrome, separators, and hover effects align correctly. .padding inside the row's content view shifts the content but leaves the row chrome at its original metrics.",
                    symbol: "exclamationmark.triangle"
                )
            }
        }
    }

    // MARK: listRowSeparator

    private var listRowSeparatorSection: some View {
        PageSection("listRowSeparator(_:edges:)",
                    subtitle: "func listRowSeparator(_ visibility: Visibility, edges: VerticalEdge.Set = .all) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets the display mode for the separator associated with this specific row. Visibility values: .automatic / .visible / .hidden. The list style is the final arbiter \u{2014} some styles refuse to draw certain edges.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LabeledRow(title: "Three Visibility values") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: ".automatic", api: ".listRowSeparator(.automatic)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            rowSeparatorList(visibility: .automatic)
                        }
                        StateColumnView(label: ".visible", api: ".listRowSeparator(.visible)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            rowSeparatorList(visibility: .visible)
                        }
                        StateColumnView(label: ".hidden", api: ".listRowSeparator(.hidden)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            rowSeparatorList(visibility: .hidden)
                        }
                    }
                }

                LabeledRow(title: "edges parameter \u{2014} top vs bottom") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: "Hide .top",
                                        api: ".listRowSeparator(.hidden, edges: .top)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            List {
                                Text("One").listRowSeparator(.hidden, edges: .top)
                                Text("Two").listRowSeparator(.hidden, edges: .top)
                                Text("Three").listRowSeparator(.hidden, edges: .top)
                            }
                        }
                        StateColumnView(label: "Hide .bottom",
                                        api: ".listRowSeparator(.hidden, edges: .bottom)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            List {
                                Text("One").listRowSeparator(.hidden, edges: .bottom)
                                Text("Two").listRowSeparator(.hidden, edges: .bottom)
                                Text("Three").listRowSeparator(.hidden, edges: .bottom)
                            }
                        }
                    }
                }
            }
        }
    }

    private func rowSeparatorList(visibility: Visibility) -> some View {
        List {
            Text("One").listRowSeparator(visibility)
            Text("Two").listRowSeparator(visibility)
            Text("Three").listRowSeparator(visibility)
            Text("Four").listRowSeparator(visibility)
        }
    }

    // MARK: listRowSeparatorTint

    private var listRowSeparatorTintSection: some View {
        PageSection("listRowSeparatorTint(_:edges:)",
                    subtitle: "func listRowSeparatorTint(_ color: Color?, edges: VerticalEdge.Set = .all) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets the tint color associated with a row's separators. The list style is the final arbiter \u{2014} the tint is a preference, not a hard override.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LabeledRow(title: "Per-row tint \u{2014} brand-color separators") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: "Text(...).listRowSeparatorTint(car.brandColor)") {
                        List {
                            ForEach(listRowSeparatorCars) { car in
                                Text(car.model)
                                    .listRowSeparatorTint(car.brandColor)
                            }
                        }
                    }
                }

                LabeledRow(title: "Single uniform tint \u{2014} all rows") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: ".listRowSeparatorTint(.purple)") {
                        List {
                            ForEach(listRowSeparatorCars) { car in
                                Text(car.model)
                                    .listRowSeparatorTint(.purple)
                            }
                        }
                    }
                }

                LabeledRow(title: "edges parameter \u{2014} top vs bottom") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: ".top edge only",
                                        api: ".listRowSeparatorTint(.red, edges: .top)",
                                        width: listDemoMediumWidth, height: listDemoTallHeight) {
                            List {
                                ForEach(listRowSeparatorCars) { car in
                                    Text(car.model)
                                        .listRowSeparatorTint(.red, edges: .top)
                                }
                            }
                        }
                        StateColumnView(label: ".bottom edge only",
                                        api: ".listRowSeparatorTint(.blue, edges: .bottom)",
                                        width: listDemoMediumWidth, height: listDemoTallHeight) {
                            List {
                                ForEach(listRowSeparatorCars) { car in
                                    Text(car.model)
                                        .listRowSeparatorTint(.blue, edges: .bottom)
                                }
                            }
                        }
                    }
                }

                LabeledRow(title: "Pass nil \u{2014} restore the style's default tint") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: ".listRowSeparatorTint(nil)") {
                        List {
                            ForEach(listRowSeparatorCars) { car in
                                Text(car.model)
                                    .listRowSeparatorTint(nil)
                            }
                        }
                    }
                }
            }
        }
    }

    // MARK: listRowSpacing (macOS unavailable)

    private var listRowSpacingSection: some View {
        PageSection("listRowSpacing(_:)",
                    subtitle: "func listRowSpacing(_ spacing: CGFloat?) -> some View \u{00b7} iOS 15.0+ (macOS UNAVAILABLE)") {
            VStack(alignment: .leading, spacing: 16) {
                unavailableNotice(
                    label: ".listRowSpacing(_:) is unavailable on macOS.",
                    detail: "Per the macOS 26 SDK, the modifier is gated to iOS / iPadOS / Mac Catalyst / visionOS. macOS code that needs row gap reaches for .listRowInsets(_:) on each row instead."
                )
                Text("Documented examples (iOS only)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                ReferenceCodeBlock(text: "List { Text(\"Blue\"); Text(\"Red\") }\n    .listRowSpacing(10)")
                ReferenceCodeBlock(text: "List { \u{2026} }.listRowSpacing(0)   // tight\nList { \u{2026} }.listRowSpacing(24)  // loose")
                ReferenceCodeBlock(text: "List { \u{2026} }.listRowSpacing(nil) // restore the style's default")

                noteRow(
                    title: "Different from .listRowInsets and .listSectionSpacing.",
                    detail: "Spacing is between rows; insets are inside rows; section spacing is around sections. The trio (only listRowInsets is on macOS) covers the three layout axes.",
                    symbol: "rectangle.split.3x1"
                )
            }
        }
    }

    // MARK: listRowHoverEffect (macOS unavailable)

    private var listRowHoverEffectSection: some View {
        PageSection("listRowHoverEffect(_:)",
                    subtitle: "func listRowHoverEffect(_ effect: HoverEffect?) -> some View \u{00b7} iOS 17.0+ / visionOS 1.0+ (macOS UNAVAILABLE)") {
            VStack(alignment: .leading, spacing: 16) {
                unavailableNotice(
                    label: ".listRowHoverEffect(_:) is unavailable on macOS.",
                    detail: "Per the macOS 26 SDK swiftinterface, the modifier is annotated @available(macOS, unavailable). It exists on iOS / iPadOS / Mac Catalyst / visionOS."
                )
                Text("Documented examples (iOS / visionOS only)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                ReferenceCodeBlock(text: """
                List {
                    Text("Pacific").listRowHoverEffect(.automatic)
                    Text("Atlantic").listRowHoverEffect(.automatic)
                    Text("Indian").listRowHoverEffect(.automatic)
                }
                """)
                ReferenceCodeBlock(text: """
                // Three documented HoverEffect values
                List {
                    Text("One").listRowHoverEffect(.automatic)
                    Text("Two").listRowHoverEffect(.highlight)
                    Text("Three").listRowHoverEffect(.lift) // unsupported for list rows
                }
                """)
                ReferenceCodeBlock(text: """
                // Pass nil — preserve the default effect
                List {
                    Text("One").listRowHoverEffect(nil)
                    Text("Two").listRowHoverEffect(nil)
                }
                """)

                noteRow(
                    title: "HoverEffect: .automatic / .highlight / .lift.",
                    detail: ".automatic uses the default platform effect. .highlight applies a tinted highlight. .lift is documented but the doc explicitly notes 'HoverEffect.lift is not supported for list rows.'",
                    symbol: "switch.2"
                )
            }
        }
    }

    // MARK: listRowHoverEffectDisabled (macOS unavailable)

    private var listRowHoverEffectDisabledSection: some View {
        PageSection("listRowHoverEffectDisabled(_:)",
                    subtitle: "func listRowHoverEffectDisabled(_ disabled: Bool = true) -> some View \u{00b7} iOS 17.0+ / visionOS 1.0+ (macOS UNAVAILABLE)") {
            VStack(alignment: .leading, spacing: 16) {
                unavailableNotice(
                    label: ".listRowHoverEffectDisabled(_:) is unavailable on macOS.",
                    detail: "Per the macOS 26 SDK, the modifier is gated to iOS / iPadOS / Mac Catalyst / visionOS. SwiftKit can't show a live demo on macOS."
                )
                Text("Documented examples (iOS / visionOS only)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                ReferenceCodeBlock(text: """
                // Bool overload — true (suppress)
                List {
                    Text("Pacific").listRowHoverEffectDisabled(true)
                    Text("Atlantic").listRowHoverEffectDisabled(true)
                }
                """)
                ReferenceCodeBlock(text: """
                // Bool overload — false (allow)
                List {
                    Text("Pacific").listRowHoverEffectDisabled(false)
                    Text("Atlantic").listRowHoverEffectDisabled(false)
                }
                """)
                ReferenceCodeBlock(text: """
                // Bare call (default true)
                List {
                    Text("One").listRowHoverEffectDisabled()
                }
                """)

                noteRow(
                    title: "Companion: .listRowHoverEffect(_:) for overrides.",
                    detail: "Use this modifier when you want NO hover effect at all. Use .listRowHoverEffect(_:) when you want a different effect (.automatic / .highlight / nil to inherit). The two are complementary \u{2014} and both are macOS-unavailable.",
                    symbol: "arrow.left.arrow.right"
                )
            }
        }
    }

    // MARK: listSectionMargins (macOS unavailable)

    private var listSectionMarginsSection: some View {
        PageSection("listSectionMargins(_:_:)",
                    subtitle: "func listSectionMargins(_ edges: Edge.Set = .all, _ length: CGFloat?) -> some View \u{00b7} iOS 26.0+ (macOS UNAVAILABLE)") {
            VStack(alignment: .leading, spacing: 16) {
                unavailableNotice(
                    label: ".listSectionMargins(_:_:) is unavailable on macOS.",
                    detail: "Per the macOS 26 SDK swiftinterface, the modifier is gated to iOS 26 / iPadOS 26 / Mac Catalyst 26 / visionOS 26. macOS does not expose this modifier; section margins are derived from the list style and content margins."
                )
                Text("Documented examples (iOS only)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                ReferenceCodeBlock(text: ".listSectionMargins(.all, 20)")
                ReferenceCodeBlock(text: ".listSectionMargins(.leading, 32)")
                ReferenceCodeBlock(text: ".listSectionMargins([.leading, .trailing], 24)")
                ReferenceCodeBlock(text: ".listSectionMargins(.all, nil) // restore default")

                noteRow(
                    title: "Margins replace the style's defaults on the specified edges (iOS).",
                    detail: "Per the doc: defaults are derived from the list style, list section spacing, and content margins. Calling this modifier overrides them completely on the named edges; other edges remain at their style-defined values.",
                    symbol: "rectangle.dashed"
                )
            }
        }
    }

    // MARK: listSectionSeparator

    private var listSectionSeparatorSection: some View {
        PageSection("listSectionSeparator(_:edges:)",
                    subtitle: "func listSectionSeparator(_ visibility: Visibility, edges: VerticalEdge.Set = .all) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets whether to hide the separator associated with a list section. Apply to a Section, not the List \u{2014} the section's rules sit above and below the entire group.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LabeledRow(title: "Three Visibility values") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: ".automatic",
                                        api: ".listSectionSeparator(.automatic)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            sectionSeparatorList(visibility: .automatic)
                        }
                        StateColumnView(label: ".visible",
                                        api: ".listSectionSeparator(.visible)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            sectionSeparatorList(visibility: .visible)
                        }
                        StateColumnView(label: ".hidden",
                                        api: ".listSectionSeparator(.hidden)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            sectionSeparatorList(visibility: .hidden)
                        }
                    }
                }

                LabeledRow(title: "edges parameter \u{2014} top vs bottom of the section") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: "Hide .top",
                                        api: ".listSectionSeparator(.hidden, edges: .top)",
                                        width: listDemoMediumWidth, height: listDemoTallHeight) {
                            List {
                                Section(header: Text("A")) { Text("a1") }
                                    .listSectionSeparator(.hidden, edges: .top)
                                Section(header: Text("B")) { Text("b1") }
                                    .listSectionSeparator(.hidden, edges: .top)
                            }
                        }
                        StateColumnView(label: "Hide .bottom",
                                        api: ".listSectionSeparator(.hidden, edges: .bottom)",
                                        width: listDemoMediumWidth, height: listDemoTallHeight) {
                            List {
                                Section(header: Text("A")) { Text("a1") }
                                    .listSectionSeparator(.hidden, edges: .bottom)
                                Section(header: Text("B")) { Text("b1") }
                                    .listSectionSeparator(.hidden, edges: .bottom)
                            }
                        }
                    }
                }
            }
        }
    }

    private func sectionSeparatorList(visibility: Visibility) -> some View {
        List {
            Section(header: Text("Colors")) {
                Text("Blue"); Text("Red")
            }
            .listSectionSeparator(visibility)
            Section(header: Text("Shapes")) {
                Text("Square"); Text("Circle")
            }
            .listSectionSeparator(visibility)
        }
    }

    // MARK: listSectionSeparatorTint

    private var listSectionSeparatorTintSection: some View {
        PageSection("listSectionSeparatorTint(_:edges:)",
                    subtitle: "func listSectionSeparatorTint(_ color: Color?, edges: VerticalEdge.Set = .all) -> some View \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets the tint color associated with a section's separators. List style is the final arbiter \u{2014} the tint is a preference.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LabeledRow(title: "Tint applied uniformly to .all edges") {
                    DemoFrame(width: listDemoWideWidth, height: 280,
                              api: ".listSectionSeparatorTint(.purple)") {
                        List {
                            Section(header: Text("A")) {
                                Text("a1"); Text("a2")
                            }
                            .listSectionSeparatorTint(.purple)
                            Section(header: Text("B")) {
                                Text("b1"); Text("b2")
                            }
                            .listSectionSeparatorTint(.purple)
                        }
                    }
                }

                LabeledRow(title: "Per-edge tinting") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: ".top only",
                                        api: "edges: .top, color: .red",
                                        width: listDemoMediumWidth, height: 280) {
                            List {
                                Section(header: Text("A")) { Text("a1"); Text("a2") }
                                    .listSectionSeparatorTint(.red, edges: .top)
                                Section(header: Text("B")) { Text("b1"); Text("b2") }
                                    .listSectionSeparatorTint(.red, edges: .top)
                            }
                        }
                        StateColumnView(label: ".bottom only",
                                        api: "edges: .bottom, color: .blue",
                                        width: listDemoMediumWidth, height: 280) {
                            List {
                                Section(header: Text("A")) { Text("a1"); Text("a2") }
                                    .listSectionSeparatorTint(.blue, edges: .bottom)
                                Section(header: Text("B")) { Text("b1"); Text("b2") }
                                    .listSectionSeparatorTint(.blue, edges: .bottom)
                            }
                        }
                    }
                }

                LabeledRow(title: "Pass nil \u{2014} restore the style's default") {
                    DemoFrame(width: listDemoWideWidth, height: 280,
                              api: ".listSectionSeparatorTint(nil)") {
                        List {
                            Section(header: Text("A")) { Text("a1"); Text("a2") }
                                .listSectionSeparatorTint(nil)
                            Section(header: Text("B")) { Text("b1"); Text("b2") }
                                .listSectionSeparatorTint(nil)
                        }
                    }
                }
            }
        }
    }

    // MARK: listSectionSpacing (macOS unavailable)

    private var listSectionSpacingSection: some View {
        PageSection("listSectionSpacing(_:) + ListSectionSpacing",
                    subtitle: "func listSectionSpacing(_ spacing: CGFloat) / (_ spacing: ListSectionSpacing) \u{00b7} iOS 17.0+ (macOS UNAVAILABLE)") {
            VStack(alignment: .leading, spacing: 16) {
                unavailableNotice(
                    label: "listSectionSpacing(_:) and ListSectionSpacing are unavailable on macOS.",
                    detail: "Per the macOS 26 SDK, both modifier overloads (CGFloat and ListSectionSpacing) and the ListSectionSpacing type are gated to iOS / iPadOS / Mac Catalyst / visionOS / watchOS. The closest macOS surface is .listSectionMargins(_:_:) \u{2014} also iOS-flavored on macOS 26."
                )

                Text("Two overloads on iOS")
                    .font(.headline)
                    .foregroundStyle(.primary)
                APICallout("func listSectionSpacing(_ spacing: CGFloat) -> some View")
                APICallout("func listSectionSpacing(_ spacing: ListSectionSpacing) -> some View")

                Text("Documented examples (iOS only)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                ReferenceCodeBlock(text: """
                List {
                    Section("Colors") { Text("Blue"); Text("Red") }
                    Section("Shapes") { Text("Square"); Text("Circle") }
                }
                .listSectionSpacing(5.0)
                """)
                ReferenceCodeBlock(text: """
                // Per-Section override — wins over the List-level value
                Section("Borders") {
                    Text("Dashed"); Text("Solid")
                }
                .listSectionSpacing(10.0)
                """)
                ReferenceCodeBlock(text: """
                // ListSectionSpacing enum overload
                .listSectionSpacing(.compact)
                .listSectionSpacing(.default)
                .listSectionSpacing(.custom(30))
                """)

                Text("ListSectionSpacing values")
                    .font(.headline)
                    .foregroundStyle(.primary)
                APICallout("struct ListSectionSpacing : Sendable  // iOS 17.0+, macOS UNAVAILABLE")
                VStack(alignment: .leading, spacing: 8) {
                    caseRow(name: "ListSectionSpacing.default",
                            summary: "Inherits the active list style's default section gap.")
                    Divider()
                    caseRow(name: "ListSectionSpacing.compact",
                            summary: "Tighter gap between sections than the style's default.")
                    Divider()
                    caseRow(name: "ListSectionSpacing.custom(_ spacing: CGFloat)",
                            summary: "Explicit point value \u{2014} escape-hatch for hand-tuned spacing.")
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    // MARK: listSectionIndexVisibility (macOS unavailable)

    private var listSectionIndexVisibilitySection: some View {
        PageSection("listSectionIndexVisibility(_:)",
                    subtitle: "func listSectionIndexVisibility(_ visibility: Visibility) -> some View \u{00b7} iOS 26.0+ / watchOS 26.0+ (macOS UNAVAILABLE)") {
            VStack(alignment: .leading, spacing: 16) {
                unavailableNotice(
                    label: ".listSectionIndexVisibility(_:) is unavailable on macOS.",
                    detail: "Per the macOS 26 SDK, the modifier is gated to iOS / iPadOS / Mac Catalyst / watchOS. macOS does not surface a section-index control."
                )
                Text("Three Visibility values (iOS / watchOS only)")
                    .font(.headline)
                    .foregroundStyle(.primary)
                ReferenceCodeBlock(text: ".listSectionIndexVisibility(.automatic)")
                ReferenceCodeBlock(text: ".listSectionIndexVisibility(.visible)")
                ReferenceCodeBlock(text: ".listSectionIndexVisibility(.hidden)")

                Text("Pair with .sectionIndexLabel")
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text("Section index labels are set per Section via .sectionIndexLabel(_:). The section-index control reads those labels and lays them out in a stacked column. Sections without a label do not appear in the index.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                ReferenceCodeBlock(text: """
                List {
                    Section("A") {
                        Text("Apple"); Text("Apricot")
                    }
                    .sectionIndexLabel("A")
                    Section("B") {
                        Text("Banana"); Text("Blueberry")
                    }
                    .sectionIndexLabel("B")
                }
                .listSectionIndexVisibility(.visible)
                """)

                noteRow(
                    title: "Default: visible if any section has an index label.",
                    detail: "Per the doc: 'By default, the list section index is visible if the list contains any sections with an index label.' Use .hidden to suppress, .visible to force-show, .automatic to defer to the platform default.",
                    symbol: "switch.2"
                )
                noteRow(
                    title: "Macro-pattern: empty header + index label = synthetic index entries.",
                    detail: "Per the doc: 'By hiding section headers of empty sections with an index label, a list section index can be made to show index labels without a corresponding section.' Useful for alphabetical scaffolding.",
                    symbol: "wand.and.stars"
                )
            }
        }
    }

    // MARK: listItemTint

    private var listItemTintSection: some View {
        PageSection("listItemTint(_:) + ListItemTint",
                    subtitle: "func listItemTint(_ tint: Color?) / (_ tint: ListItemTint?) \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets a fixed tint color for content in a list. On macOS sidebar lists, replaces the accent color for the row's Label icon. Two overloads exist \u{2014} one taking Color?, one taking ListItemTint?.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                APICallout("func listItemTint(_ tint: Color?) -> some View")
                APICallout("func listItemTint(_ tint: ListItemTint?) -> some View")

                LabeledRow(title: "Per-row tint \u{2014} brand colors via .sidebar list") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: "Label(...).listItemTint(folder.tint)") {
                        List {
                            ForEach(listItemTintFolders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                                    .listItemTint(folder.tint)
                            }
                        }
                        .listStyle(.sidebar)
                    }
                }

                LabeledRow(title: "Color overload \u{2014} direct color tint") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: ".listItemTint(.purple)") {
                        List {
                            ForEach(listItemTintFolders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                                    .listItemTint(.purple)
                            }
                        }
                        .listStyle(.sidebar)
                    }
                }

                LabeledRow(title: "nil \u{2014} inherit (don't override)") {
                    DemoFrame(width: listDemoWideWidth, height: listDemoTallHeight,
                              api: ".listItemTint(nil)") {
                        List {
                            ForEach(listItemTintFolders) { folder in
                                Label(folder.name, systemImage: folder.symbol)
                                    .listItemTint(nil as Color?)
                            }
                        }
                        .listStyle(.sidebar)
                    }
                }

                Text("ListItemTint values")
                    .font(.headline)
                    .foregroundStyle(.primary)
                APICallout("struct ListItemTint : Equatable, Sendable")
                VStack(alignment: .leading, spacing: 8) {
                    caseRow(name: "ListItemTint.fixed(_ color: Color)",
                            summary: "Wins over all context tinting. Use when the color carries semantic meaning that must not be overridden.")
                    Divider()
                    caseRow(name: "ListItemTint.preferred(_ color: Color)",
                            summary: "A hint \u{2014} yields to higher-priority context tints. Use when the color is a default that other code may override.")
                    Divider()
                    caseRow(name: "ListItemTint.monochrome",
                            summary: "No chromatic tint \u{2014} renders icon in secondary text style without color.")
                }
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                LabeledRow(title: ".fixed vs .preferred vs .monochrome \u{2014} side by side") {
                    HStack(alignment: .top, spacing: 24) {
                        StateColumnView(label: ".fixed(.blue)",
                                        api: ".listItemTint(.fixed(.blue))",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            sidebarTintList(tint: .fixed(.blue))
                        }
                        StateColumnView(label: ".preferred(.orange)",
                                        api: ".listItemTint(.preferred(.orange))",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            sidebarTintList(tint: .preferred(.orange))
                        }
                        StateColumnView(label: ".monochrome",
                                        api: ".listItemTint(.monochrome)",
                                        width: listDemoNarrowWidth, height: listDemoTallHeight) {
                            sidebarTintList(tint: .monochrome)
                        }
                    }
                }

                noteRow(
                    title: ".preferred yields to higher-priority context tints.",
                    detail: ".fixed(_:) wins over context. .preferred(_:) is a hint \u{2014} the list style and surrounding context can override it. Use .preferred when the row's tint is a default that other code may want to replace.",
                    symbol: "paintpalette"
                )
            }
        }
    }

    private func sidebarTintList(tint: ListItemTint) -> some View {
        List {
            ForEach(listItemTintShortFolders) { folder in
                Label(folder.name, systemImage: folder.symbol)
                    .listItemTint(tint)
            }
        }
        .listStyle(.sidebar)
    }

    // MARK: Article — Displaying Data In Lists

    private var displayingDataArticleSection: some View {
        PageSection("Article \u{2014} Displaying Data in Lists",
                    subtitle: "Documentation/SwiftUI/lists/displaying-data-in-lists.md \u{00b7} canonical staff-directory walkthrough") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Apple's article walking through three escalations of a staff-directory list: a custom row view, sectioning by department, and wiring it into a NavigationStack with NavigationLink for drill-down.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                LabeledRow(title: "Minimal staff-directory example") {
                    DemoFrame(width: listDemoWideWidth, height: 240,
                              api: "List { ForEach(staff) { Text($0.name) } }") {
                        List {
                            ForEach(articleStaff) { person in
                                Text(person.name)
                            }
                        }
                    }
                }

                LabeledRow(title: "1. Custom row view (PersonRowView equivalent)") {
                    DemoFrame(width: listDemoWideWidth, height: 240,
                              api: "List { ForEach(staff) { PersonRowView(person:) } }") {
                        List {
                            ForEach(articleStaff) { person in
                                ArticlePersonRow(person: person)
                            }
                        }
                    }
                }

                LabeledRow(title: "2. Sectioned by department") {
                    DemoFrame(width: listDemoWideWidth, height: 280,
                              api: "List { ForEach(company.departments) { Section(header:) { ForEach(staff) { \u{2026} } } } }") {
                        List {
                            ForEach(articleCompany.departments) { department in
                                Section {
                                    ForEach(department.staff) { person in
                                        ArticlePersonRow(person: person)
                                    }
                                } header: {
                                    Text(department.name)
                                }
                            }
                        }
                    }
                }

                LabeledRow(title: "3. Navigation-aware (NavigationStack + NavigationLink)") {
                    DemoFrame(width: listDemoWideWidth, height: 320,
                              api: "NavigationStack { List { \u{2026} NavigationLink { Detail } label: { Row } } }") {
                        NavigationStack {
                            List {
                                ForEach(articleCompany.departments) { department in
                                    Section {
                                        ForEach(department.staff) { person in
                                            NavigationLink {
                                                ArticlePersonDetail(person: person)
                                            } label: {
                                                ArticlePersonRow(person: person)
                                            }
                                        }
                                    } header: {
                                        Text(department.name)
                                    }
                                }
                            }
                            .navigationTitle("Staff")
                        }
                    }
                }

                noteRow(
                    title: "Identity must be unique and stable.",
                    detail: "Per the article: 'The values you use for Identifiable data must be unique. Using a UUID or a database row identifier are both good choices, whereas using data like a person's name or phone number could potentially contain duplicates.' Identity drives diffing animations and selection.",
                    symbol: "person.badge.key"
                )
                noteRow(
                    title: "If you don't need List chrome, reach for LazyVStack.",
                    detail: "Per the article note: 'If you want to remove the platform-appropriate styling \u{2014} such as row separators or automatic disclosure indicators \u{2014} from your list, consider using LazyVStack instead.' LazyVStack lazily creates rows as they scroll into view without the List's chrome.",
                    symbol: "rectangle.split.3x1"
                )
                noteRow(
                    title: "Refactor row views as they grow.",
                    detail: "Per the article: 'As your row views get more sophisticated, refactor the views into separate view structures, passing in the data that the row needs to render.' Inline row builders inside ForEach become unreadable past a few lines \u{2014} pull them out.",
                    symbol: "function"
                )
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes",
                    subtitle: "Key behaviors, availability, and constraints across the List family.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Selection works without edit mode on macOS.",
                    detail: "On Mac (and iPad with a keyboard/trackpad), people can click rows or shift/cmd-click to select multiple \u{2014} no EditButton or edit mode needed. EditButton is iOS-flavored.",
                    symbol: "cursorarrow.rays"
                )
                noteRow(
                    title: "Bind to .ID for single, Set<.ID> for multi.",
                    detail: "List(_:selection:) infers single vs multi from the binding type. Optional<ID> = single. Set<ID> = multi. Identifiable.ID is the value bound, not the model itself.",
                    symbol: "checklist"
                )
                noteRow(
                    title: "Hierarchical lists need Identifiable + KeyPath to children.",
                    detail: "List(_:children:) takes a key path to an Optional<[Item]> on each node. Nil children = leaf, empty array = empty folder, non-empty = expandable.",
                    symbol: "list.bullet.indent"
                )
                noteRow(
                    title: "Five list styles render on macOS.",
                    detail: ".automatic, .bordered, .inset, .plain, .sidebar. The iOS .grouped / .insetGrouped and watchOS .carousel / .elliptical fall back to the default style on macOS.",
                    symbol: "square.grid.2x2"
                )
                noteRow(
                    title: ".sidebar fully renders inside NavigationSplitView's sidebar column.",
                    detail: "Outside NavigationSplitView the .sidebar style still applies (translucent material, source-list row metrics) but doesn't pick up window-chrome integration like real sidebars do.",
                    symbol: "sidebar.left"
                )
                noteRow(
                    title: "Don't fight the framework's selection chrome.",
                    detail: "Per L-012: avoid .listRowBackground / .background overrides on List rows \u{2014} they introduce additional grouping chrome on top of the framework's selection rendering. Compose List as Apple intends; if Mail-style selection is needed, bridge to NSOutlineView (see .claude/sidebar-plan.md).",
                    symbol: "exclamationmark.triangle"
                )
                noteRow(
                    title: "Visibility and tint are orthogonal.",
                    detail: "Set visibility (.listRowSeparator / .listSectionSeparator) first to decide if a separator draws; set tint (.listRowSeparatorTint / .listSectionSeparatorTint) to color it. Both are preferences the style can override.",
                    symbol: "paintpalette"
                )
                noteRow(
                    title: "Apply row/section modifiers to rows/sections, not the List.",
                    detail: ".listRowInsets, .listRowBackground, .listRowSeparator, .listRowSeparatorTint, and .listItemTint attach to the row content view. .listSectionSeparator(Tint) attaches to a Section. The List itself only takes container-level modifiers like .listStyle and (on iOS) .listRowSpacing / .listSectionSpacing.",
                    symbol: "rectangle.split.1x2"
                )
                noteRow(
                    title: "Use semantic tokens for backgrounds and tints.",
                    detail: ".tint, .background.secondary, Color(.controlBackgroundColor), Color.accentColor \u{2014} all valid. Avoid hex literals or raw RGB; the semantic tokens adapt to dark mode and accent color changes.",
                    symbol: "paintpalette"
                )
            }
        }
    }

    // MARK: View helpers

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }

    private func caseRow(name: String, summary: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
            Text(summary)
                .font(.callout)
                .foregroundStyle(.primary)
        }
    }

    private func unavailableNotice(label: String, detail: String) -> some View {
        Label {
            VStack(alignment: .leading, spacing: 4) {
                Text(label)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(detail)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        } icon: {
            Image(systemName: "info.circle")
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Reusable demo helpers (file-private, single set)

private struct DemoFrame<Content: View>: View {
    var width: CGFloat = listDemoFrameWidth
    var height: CGFloat = listDemoFrameHeight
    let api: String
    @ViewBuilder var content: () -> Content

    init(
        width: CGFloat = listDemoFrameWidth,
        height: CGFloat = listDemoFrameHeight,
        api: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.width = width
        self.height = height
        self.api = api
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: width, height: height)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct LabeledRow<Content: View>: View {
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

private struct StateColumnView<Content: View>: View {
    let label: String
    let api: String
    let width: CGFloat
    let height: CGFloat
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: width, height: height)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct ReferenceCodeBlock: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
    }
}

extension ListGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.lists.list",
        title: "List",
        folder: "Lists",
        framework: .swiftUI,
        absorbedSymbols: [
            "AlternatingRowBackgroundBehavior",
            "BackgroundProminence",
            "Displaying data in lists",
            "List",
            "ListItemTint",
            "ListSectionSpacing",
            "Prominence",
            "View/alternatingRowBackgrounds(_:)",
            "View/headerProminence(_:)",
            "View/listItemTint(_:)",
            "View/listRowBackground(_:)",
            "View/listRowHoverEffect(_:)",
            "View/listRowHoverEffectDisabled(_:)",
            "View/listRowInsets(_:)",
            "View/listRowSeparator(_:edges:)",
            "View/listRowSeparatorTint(_:edges:)",
            "View/listRowSpacing(_:)",
            "View/listSectionIndexVisibility(_:)",
            "View/listSectionMargins(_:_:)",
            "View/listSectionSeparator(_:edges:)",
            "View/listSectionSeparatorTint(_:edges:)",
            "View/listSectionSpacing(_:)",
            "View/sectionIndexLabel(_:)"
        ],
        blurb: "A container that presents rows of data arranged in a single column, optionally providing the ability to select one or more members. Absorbs the full set of List-only modifiers — row insets, spacing, backgrounds, separators, hover effects, item tint, header prominence, alternating row backgrounds, and section index/margin presentation.",
        signature: "struct List<SelectionValue, Content> where SelectionValue : Hashable, Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/lists/list.md",
        page: { AnyView(ListGalleryPage()) }
    )
}

#Preview {
    ListGalleryPage()
        .frame(width: 1200, height: 1600)
}
