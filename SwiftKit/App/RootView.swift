import SwiftUI

/// 2-column shell: `SidebarView` left, page-of-the-moment right.
///
/// Selection resolution is the only piece of routing logic in the app:
/// `SidebarView` writes a `"item:<gallery-item-id>"` string into `selectedID`,
/// `RootView` strips the prefix and looks up the page via
/// `GalleryRegistry.item(forID:)`. There is no other dispatch layer — to add
/// a page, declare its `GalleryItem` next to the view (see `GalleryItemPage`)
/// and register it in `GalleryRegistry.allItems`.
struct RootView: View {
    /// Persisted selection. Survives app relaunch via `@SceneStorage`.
    ///
    /// `@SceneStorage` doesn't accept an Optional with a default value (Apple's
    /// public init signature for optionals takes only `_ key:`). First-launch
    /// default is applied in `.onAppear` instead.
    @SceneStorage("selectedNodeID") private var selectedID: String?

    @StateObject private var appearance = AppearanceController()

    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selectedID)
        } detail: {
            DetailPane(appearance: appearance) {
                detailContent
            }
        }
        .navigationSplitViewStyle(.prominentDetail)
        .onAppear {
            if selectedID == nil, let first = GalleryRegistry.allItems.first {
                selectedID = "item:\(first.id)"
            }
        }
    }

    /// Resolves the current selection ID to a page view.
    @ViewBuilder
    private var detailContent: some View {
        if let item = galleryItem(for: selectedID) {
            item.page()
        } else {
            DetailEmptyState()
        }
    }

    /// If the selection is a gallery-item ID (`"item:..."`), return the
    /// matching `GalleryItem`. Otherwise nil.
    private func galleryItem(for id: String?) -> GalleryItem? {
        guard let id, id.hasPrefix("item:") else { return nil }
        let itemID = String(id.dropFirst("item:".count))
        return GalleryRegistry.item(forID: itemID)
    }
}
