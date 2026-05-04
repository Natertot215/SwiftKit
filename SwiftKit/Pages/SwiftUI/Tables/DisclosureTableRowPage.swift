import SwiftUI

// SwiftUI DisclosureTableRow reference page.
// Source: Documentation/SwiftUI/tables/disclosuretablerow.md
// macOS 14.0+

private struct FileItem: Identifiable {
    let id = UUID()
    let name: String
    let size: String
    let kind: String
    var children: [FileItem]?
}

private let fileTree: [FileItem] = [
    FileItem(name: "Documents", size: "—", kind: "Folder", children: [
        FileItem(name: "Report.pdf", size: "2.1 MB", kind: "PDF"),
        FileItem(name: "Notes.md", size: "14 KB", kind: "Markdown"),
        FileItem(name: "Archive", size: "—", kind: "Folder", children: [
            FileItem(name: "old-draft.docx", size: "512 KB", kind: "Word"),
            FileItem(name: "backup.zip", size: "8.4 MB", kind: "ZIP")
        ])
    ]),
    FileItem(name: "Downloads", size: "—", kind: "Folder", children: [
        FileItem(name: "Xcode.dmg", size: "12 GB", kind: "Disk Image"),
        FileItem(name: "installer.pkg", size: "234 MB", kind: "Package")
    ]),
    FileItem(name: "README.txt", size: "2 KB", kind: "Text")
]

struct DisclosureTableRowPage: View {
    @State private var selection: Set<FileItem.ID> = []
    @State private var sortOrder = [KeyPathComparator(\FileItem.name)]

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("DisclosureTableRow")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("A table row that can be expanded to reveal child rows — hierarchical tables. Equivalent to OutlineGroup but inside a Table.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/tables/disclosuretablerow.md · macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("DisclosureTableRow(root) { DisclosureTableRow(child) { … } }")
                Table(fileTree, children: \.children, selection: $selection, sortOrder: $sortOrder) {
                    TableColumn("Name", value: \.name) { item in
                        Label(item.name, systemImage: item.children != nil ? "folder" : "doc")
                    }
                    TableColumn("Size", value: \.size)
                    TableColumn("Kind", value: \.kind)
                }
                .frame(height: 240)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                Text("Click the disclosure triangle to expand folder rows")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        } variants: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Table(children:) vs DisclosureTableRow").font(.headline).foregroundStyle(.primary)
                APICallout("Table(items, children: \\.children) { columns }  // shorthand")
                APICallout("Table { DisclosureTableRow(root) { rows } } columns: { cols }")
                Text("The children: keypath shorthand (shown in the default demo) is equivalent to manually nesting DisclosureTableRow. Use manual nesting for mixed-depth or conditional expansion logic.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("TableColumnCustomization").font(.headline).foregroundStyle(.primary)
                APICallout("@AppStorage var customization = TableColumnCustomization<FileItem>()")
                APICallout("Table(…).tableColumnCustomization($customization)")
                Text("TableColumnCustomization persists column ordering and visibility via @AppStorage. Attach it via .tableColumnCustomization($binding). The user can reorder and hide columns in the column header context menu.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("DisclosureTableRow requires the model to have an Optional<[Self]> children property.", systemImage: "list.bullet.indent")
                    .font(.callout).foregroundStyle(.secondary)
                Label("The children: keypath shorthand on Table automatically generates DisclosureTableRow entries.", systemImage: "bolt")
                    .font(.callout).foregroundStyle(.secondary)
                Label("'Building a great Mac app with SwiftUI' covers hierarchical tables and column customization in depth.", systemImage: "book")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    DisclosureTableRowPage().frame(width: 900, height: 800)
}
