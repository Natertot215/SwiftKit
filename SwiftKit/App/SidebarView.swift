import SwiftUI

/// Sidebar for SwiftKit's 2-column NavigationSplitView shell.
///
/// Renders `GalleryRegistry.byFramework` as a disclosure tree. The shape is
/// usually 3-tier (framework → folder → item), but when a framework has only
/// one folder (Reference), the redundant folder tier is collapsed and items
/// hang directly off the framework heading. Selection IDs look like
/// `"item:<framework>.<folder>.<item>"` and resolve through
/// `GalleryRegistry.item(forID:)` → `item.page()`. Each visible item maps 1:1
/// to a `GalleryItem` descriptor declared on its page.
///
/// Selection chrome is the `List(.sidebar)` framework default — rounded-rect fill in
/// `NSColor.unemphasizedSelectedContentBackgroundColor` + accent text + accent icon. Per L-012,
/// do NOT add `.listRowBackground`, `.background`, `.tint`, custom row containers, or any chrome
/// painting — the framework handles it correctly when nothing overrides it.
struct SidebarView: View {
    @Binding var selection: String?

    var body: some View {
        List(selection: $selection) {
            ForEach(GalleryRegistry.byFramework, id: \.framework) { frameworkGroup in
                DisclosureGroup {
                    if frameworkGroup.folders.count == 1 {
                        ForEach(frameworkGroup.folders[0].items, id: \.id) { item in
                            galleryItemRow(item)
                        }
                    } else {
                        ForEach(frameworkGroup.folders, id: \.folder) { folderGroup in
                            DisclosureGroup {
                                ForEach(folderGroup.items, id: \.id) { item in
                                    galleryItemRow(item)
                                }
                            } label: {
                                Label(folderGroup.folder, systemImage: "folder")
                                    .lineLimit(1)
                                    .truncationMode(.middle)
                            }
                        }
                    }
                } label: {
                    Label(frameworkGroup.framework.displayName, systemImage: frameworkGroup.framework.sidebarSymbolName)
                        .lineLimit(1)
                }
            }
        }
        .listStyle(.sidebar)
        .navigationSplitViewColumnWidth(min: 240, ideal: 280, max: 360)
    }

    private func galleryItemRow(_ item: GalleryItem) -> some View {
        Label(item.title, systemImage: "rectangle.grid.2x2")
            .lineLimit(1)
            .truncationMode(.middle)
            .tag("item:\(item.id)")
    }
}
