import SwiftUI

/// Aggregates every `GalleryItem` declared by a gallery page.
///
/// **Reading:** the sidebar (`SidebarView`) reads `byFramework`; selection
/// resolution (`RootView`) reads `item(forID:)`. Those are the only two
/// public entry points — both derive from `allItems`.
///
/// **Writing a new page:**
/// 1. Author the SwiftUI view under `Pages/<framework>/<folder>/`.
/// 2. Declare `static let item: GalleryItem` in an extension on the view.
/// 3. Append `<PageStruct>.item` to `allItems` below, in the appropriate
///    framework + folder section.
///
/// Keep `allItems` a flat array literal (no nested computed sections) to
/// satisfy L-011 — large nested SwiftUI trees blow up SwiftUI type-checking.
///
/// **Post-strip state (2026-05-07):** registry reset to the 5 Reference
/// pages only. Restart spec lives in `.claude/Planning/2026-05-07-restart-spec.md`.
/// The pre-strip corpus is preserved at git tag `pre-restart`.
@MainActor
enum GalleryRegistry {
    /// All gallery items registered so far. Sidebar groups by `folder`.
    static let allItems: [GalleryItem] = [
        // Reference — canonical "right shape" pages
        MaterialsGalleryPage.item,
        MotionGalleryPage.item,
        ReferenceColorGalleryPage.item,
        SFSymbolsGalleryPage.item,
        TypographyGalleryPage.item,
    ]

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
    /// when the sidebar emits a gallery-item ID like `"item:swiftui.shapes.circle"`.
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

// MARK: - Framework display

extension Framework {
    /// User-facing label shown in the sidebar's top-level disclosure.
    var displayName: String {
        switch self {
        case .reference: return "Reference"
        case .swiftUI: return "SwiftUI"
        case .appKit:  return "AppKit"
        }
    }

    /// SF Symbol used for the framework's sidebar row.
    var sidebarSymbolName: String {
        switch self {
        case .reference: return "book.closed"
        case .swiftUI: return "swift"
        case .appKit:  return "square.grid.2x2"
        }
    }
}
