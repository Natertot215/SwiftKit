import SwiftUI

/// Generic placeholder view used by the sidebar template *(2026-05-07 onward,
/// post-strip)*. Every entry in `GalleryRegistry.allItems` resolves to one of
/// these while the project waits for real per-primitive authoring.
///
/// **Why this exists.** After the 2026-05-07 strip, the project resets to a
/// clean shell. The sidebar mechanics (`SidebarView` + `GalleryRegistry.byFramework`)
/// were proven, so a placeholder template registers 81 generic items — 3 main
/// folders × 3 sub-folders × 9 pages — to validate the disclosure shape before
/// real content authoring resumes. When the first real folder gets authored
/// per `framework.md`'s restart spec, the matching placeholder block gets
/// replaced; placeholders survive in the framework slots that haven't been
/// authored yet.
///
/// **What it shows.** Three `VariantTile`s — one per tier of the sidebar
/// hierarchy *(folder / sub-folder / page)*. The header `signature` echoes the
/// full path so the user can confirm the routed selection matches the
/// clicked sidebar row.
struct PlaceholderGalleryPage: View {
    let folder: String
    let subfolder: String
    let title: String

    var body: some View {
        GalleryItemPage(
            title: title,
            signature: "\(folder) → \(subfolder) → \(title)",
            blurb: "Placeholder template — sidebar disclosure mechanism only. Real content pending authoring.",
            availability: nil,
            docPath: nil
        ) {
            VariantTile(name: "Folder") {
                tileContent(label: folder, systemImage: "folder.fill")
            }
            VariantTile(name: "Subfolder") {
                tileContent(label: subfolder, systemImage: "folder")
            }
            VariantTile(name: "Page") {
                tileContent(label: title, systemImage: "doc.text")
            }
        }
    }

    private func tileContent(label: String, systemImage: String) -> some View {
        Label {
            Text(label).font(.headline)
        } icon: {
            Image(systemName: systemImage).font(.title2)
        }
        .foregroundStyle(.secondary)
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
