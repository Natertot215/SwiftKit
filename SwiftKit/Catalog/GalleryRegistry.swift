import SwiftUI

/// Aggregates every `GalleryItem` declared by a gallery page.
///
/// **Reading:** the sidebar (`SidebarView`) reads `byFramework`; selection
/// resolution (`RootView`) reads `item(forID:)`. Those are the only two
/// public entry points — both derive from `allItems`.
///
/// **Current state — placeholder template *(2026-05-07, post-strip)*.**
/// `allItems` holds 81 placeholder items: 3 main folders (one per `Framework`
/// case) × 3 sub-folders × 9 pages each. Every item resolves to
/// `PlaceholderGalleryPage`, which renders the row's identity. The 5 Reference
/// page files (Materials/Motion/Color/SF Symbols/Typography) remain on disk
/// at `Pages/Reference/` as canonical authoring models — they are unregistered
/// here while the placeholder template is in effect.
///
/// **When real authoring starts:**
/// 1. Author the SwiftUI view under `Pages/<framework>/<folder>/`.
/// 2. Declare `static let item: GalleryItem` in an extension on the view.
/// 3. Append `<PageStruct>.item` to `allItems` below; remove the matching
///    placeholder block when its slot is fully authored.
/// 4. Once any framework has at least one real entry, restore the canonical
///    `Framework.displayName` for that case (Reference / SwiftUI / AppKit) —
///    see the extension at the bottom of this file.
///
/// Keep `allItems` flat (single non-nested expression) to satisfy L-011 — large
/// nested SwiftUI trees blow up SwiftUI type-checking. The placeholder fill is
/// a flat imperative function, not a nested literal.
@MainActor
enum GalleryRegistry {
    /// All gallery items registered so far. Sidebar groups by `folder`.
    static let allItems: [GalleryItem] = makePlaceholderTemplate()

    /// Items grouped first by framework (Reference / SwiftUI / AppKit), then by
    /// folder within each framework, in declaration order. The sidebar uses this
    /// shape directly to render the 3-tier disclosure (framework → folder → item).
    static let byFramework: [(framework: Framework, folders: [(folder: String, items: [GalleryItem])])] = {
        let frameworks: [Framework] = [.reference, .swiftUI, .appKit]
        return frameworks.compactMap { framework in
            let frameworkItems = allItems.filter { $0.framework == framework }
            guard !frameworkItems.isEmpty else { return nil }
            return (framework, groupByFolder(items: frameworkItems))
        }
    }()

    /// Returns the item with the given id, or nil. Used by selection-resolution
    /// when the sidebar emits a gallery-item ID like `"item:placeholder.f1s1.p111"`.
    static func item(forID id: String) -> GalleryItem? {
        idToItem[id]
    }

    // MARK: Placeholder template

    /// Builds the 81-item placeholder template. Three frameworks act as the
    /// three top-level folders; each carries three sub-folders; each sub-folder
    /// carries nine pages.
    private static func makePlaceholderTemplate() -> [GalleryItem] {
        let frameworks: [Framework] = [.reference, .swiftUI, .appKit]
        var out: [GalleryItem] = []
        for (idx, framework) in frameworks.enumerated() {
            let folderNum = idx + 1
            for sub in 1...3 {
                for page in 1...9 {
                    out.append(makePlaceholder(folder: folderNum, sub: sub, page: page, framework: framework))
                }
            }
        }
        return out
    }

    private static func makePlaceholder(folder: Int, sub: Int, page: Int, framework: Framework) -> GalleryItem {
        let folderName = "Folder \(folder)"
        let subfolderName = "Subfolder \(folder).\(sub)"
        let pageTitle = "Page \(folder).\(sub).\(page)"
        let id = "placeholder.f\(folder)s\(sub).p\(folder)\(sub)\(page)"
        return GalleryItem(
            id: id,
            title: pageTitle,
            folder: subfolderName,
            framework: framework,
            absorbedSymbols: [],
            blurb: "Placeholder template — pending real content authoring.",
            page: { AnyView(PlaceholderGalleryPage(folder: folderName, subfolder: subfolderName, title: pageTitle)) }
        )
    }

    // MARK: Derived indexes

    /// Derived index from gallery-item id to item.
    private static let idToItem: [String: GalleryItem] = {
        var map: [String: GalleryItem] = [:]
        for item in allItems {
            map[item.id] = item
        }
        return map
    }()

    private static func groupByFolder(items: [GalleryItem]) -> [(folder: String, items: [GalleryItem])] {
        var orderedFolders: [String] = []
        var grouped: [String: [GalleryItem]] = [:]
        for item in items {
            if grouped[item.folder] == nil {
                orderedFolders.append(item.folder)
            }
            grouped[item.folder, default: []].append(item)
        }
        return orderedFolders.map { ($0, grouped[$0] ?? []) }
    }
}

// MARK: - Framework display
//
// **Placeholder mode (2026-05-07).** While the sidebar is in placeholder
// template state, the three Framework cases are surfaced as generic
// "Folder 1 / 2 / 3" labels. When real authoring lands content under a
// framework, restore that case's canonical label and SF symbol:
//   .reference → "Reference" / "book.closed"
//   .swiftUI   → "SwiftUI"   / "swift"
//   .appKit    → "AppKit"    / "square.grid.2x2"

extension Framework {
    /// User-facing label shown in the sidebar's top-level disclosure.
    var displayName: String {
        switch self {
        case .reference: return "Folder 1"
        case .swiftUI:   return "Folder 2"
        case .appKit:    return "Folder 3"
        }
    }

    /// SF Symbol used for the framework's sidebar row.
    var sidebarSymbolName: String {
        switch self {
        case .reference, .swiftUI, .appKit: return "folder"
        }
    }
}
