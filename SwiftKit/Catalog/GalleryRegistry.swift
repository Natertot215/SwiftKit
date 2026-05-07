import SwiftUI

/// Aggregates every `GalleryItem` declared by a gallery page.
///
/// **Reading:** the sidebar (`SidebarView`) reads `byFramework`; selection
/// resolution (`RootView`) reads `item(forID:)`. Those are the only two
/// public entry points — both derive from `allItems`.
///
/// **Current state — intentionally empty pending Phase 2 manifest-driven repopulation.**
/// `allItems` is reset to an empty array. The registry waits for Phase 2 to rebuild
/// the catalog from the approved manifest. The 5 Reference page files
/// (Materials/Motion/Color/SF Symbols/Typography) remain on disk at `Pages/Reference/`
/// as canonical authoring models — they will be registered when real content authoring resumes.
///
/// **When real authoring starts:**
/// 1. Author the SwiftUI view under `Pages/<framework>/<folder>/`.
/// 2. Declare `static let item: GalleryItem` in an extension on the view.
/// 3. Append `<PageStruct>.item` directly to `allItems` below.
///
/// Keep `allItems` flat (single non-nested expression) to satisfy L-011 — large
/// nested SwiftUI trees blow up SwiftUI type-checking. Use a flat imperative
/// function or literal, never nested structures.
@MainActor
enum GalleryRegistry {
    /// All gallery items registered so far. Sidebar groups by `folder`.
    static let allItems: [GalleryItem] = []

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