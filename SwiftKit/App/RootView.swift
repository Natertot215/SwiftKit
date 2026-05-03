import SwiftUI

struct RootView: View {
    @State private var selectedID: CatalogNode.ID? = "leaf:reference.typography"  // initial selection so app opens to Typography
    @StateObject private var appearance = AppearanceController()

    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selectedID)
        } detail: {
            DetailPane(selection: selectedLeaf, appearance: appearance)
        }
        .navigationSplitViewStyle(.prominentDetail)
    }

    private var selectedLeaf: Leaf? {
        guard let selectedID else { return nil }
        return GalleryCatalog.leaf(forID: selectedID)
    }
}
