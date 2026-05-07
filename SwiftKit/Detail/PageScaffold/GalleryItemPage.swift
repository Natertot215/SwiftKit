import SwiftUI

/// Canonical page scaffold for a gallery entry — header + adaptive tile grid.
///
/// **Authoring a new page.** Every new page in the app uses this scaffold:
///
/// ```swift
/// // Pages/<Framework>/<Folder>/<Name>Page.swift
/// struct MyThingGalleryPage: View {
///     var body: some View {
///         GalleryItemPage(
///             title: Self.item.title,
///             signature: Self.item.signature,
///             blurb: Self.item.blurb,
///             availability: Self.item.availability,
///             docPath: Self.item.docPath
///         ) {
///             VariantTile(name: "default", api: ".something()") { /* demo */ }
///             // ... more variants
///             ReferenceTile(name: "RelatedType", signature: "…", note: "…")
///         }
///     }
/// }
///
/// extension MyThingGalleryPage {
///     @MainActor static let item = GalleryItem(
///         id: "<framework>.<folder>.<name>",
///         title: "MyThing",
///         folder: "<sidebar folder>",
///         framework: .swiftUI,           // or .appKit, .reference
///         absorbedSymbols: ["MyThing"],
///         blurb: "…",
///         signature: "…",
///         availability: "macOS X+",
///         docPath: "Documentation/…",
///         page: { AnyView(MyThingGalleryPage()) }
///     )
/// }
/// ```
///
/// After authoring, append `MyThingGalleryPage.item` to
/// `GalleryRegistry.allItems` in the matching framework + folder section.
/// The sidebar (`SidebarView`) and selection resolution (`RootView`) pick it
/// up automatically.
///
/// **Tile vocabulary** (use the right one for each row):
/// - `VariantTile` — generic demo cell with arbitrary view in the demo well
/// - `MaterialDemoTile`, `AnimationDemoTile`, `TransitionDemoTile`,
///   `ShapeStyleDemoTile`, `EnvironmentValueDemoTile` — pre-baked canvases
///   for non-renderable APIs (see `DemoTiles.swift`)
/// - `ReferenceTile` — signature + note for protocols, deprecated overloads,
///   iOS-only APIs, related types you don't have a live demo for
///
/// **Layout note.** Per L-012, all chrome uses semantic ShapeStyles. The grid
/// width matches `galleryReadableContentWidth` so gallery pages don't sprawl
/// on wide windows.
struct GalleryItemPage<Tiles: View>: View {
    let title: String
    let signature: String?
    let blurb: String
    let availability: String?
    let docPath: String?
    let minTileWidth: CGFloat
    @ViewBuilder var tiles: () -> Tiles

    init(
        title: String,
        signature: String? = nil,
        blurb: String,
        availability: String? = nil,
        docPath: String? = nil,
        minTileWidth: CGFloat = 220,
        @ViewBuilder tiles: @escaping () -> Tiles
    ) {
        self.title = title
        self.signature = signature
        self.blurb = blurb
        self.availability = availability
        self.docPath = docPath
        self.minTileWidth = minTileWidth
        self.tiles = tiles
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                header
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: minTileWidth), spacing: 16)],
                    alignment: .leading,
                    spacing: 16
                ) {
                    tiles()
                }
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)

            Text(blurb)
                .font(.callout)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)

            if let signature {
                Text(signature)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)
            }

            metaLine
        }
    }

    @ViewBuilder
    private var metaLine: some View {
        switch (docPath, availability) {
        case let (path?, avail?):
            Text("\(path) \u{00b7} \(avail)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        case let (path?, nil):
            Text(path)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        case let (nil, avail?):
            Text(avail)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        case (nil, nil):
            EmptyView()
        }
    }
}
