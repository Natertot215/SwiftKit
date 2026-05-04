import SwiftUI

// SwiftUI TableColumnCustomization, Building a great Mac app with SwiftUI article reference page.
// macOS 14.0+

private struct Developer: Identifiable {
    let id = UUID()
    let name: String
    let language: String
    let stars: Int
    let online: Bool
}

private let developers: [Developer] = [
    Developer(name: "Alice Chen", language: "Swift", stars: 2341, online: true),
    Developer(name: "Bob Ivanov", language: "Rust", stars: 891, online: false),
    Developer(name: "Carol Davis", language: "Python", stars: 5120, online: true),
    Developer(name: "Dmitri Nowak", language: "Swift", stars: 773, online: true),
    Developer(name: "Eva Larsson", language: "Go", stars: 1450, online: false)
]

struct TableColumnCustomizationPage: View {
    @State private var selection: Set<Developer.ID> = []
    @State private var sortOrder = [KeyPathComparator(\Developer.name)]
    @State private var customization = TableColumnCustomization<Developer>()

    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("TableColumnCustomization")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Enables users to reorder, resize, and hide table columns. The customization state can be persisted with @AppStorage.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/tables/tablecolumncustomization.md · macOS 14.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("@State var customization = TableColumnCustomization<Developer>()")
                APICallout("Table(…).tableColumnCustomization($customization)")
                Text("Right-click a column header to access the column visibility menu:")
                    .font(.caption).foregroundStyle(.tertiary)
                Table(developers, selection: $selection, sortOrder: $sortOrder, columnCustomization: $customization) {
                    TableColumn("Name", value: \.name)
                        .customizationID("name")
                    TableColumn("Language", value: \.language)
                        .customizationID("language")
                    TableColumn("Stars") { dev in
                        Text("\(dev.stars)")
                            .fontDesign(.monospaced)
                    }
                    .customizationID("stars")
                    TableColumn("Status") { dev in
                        Label(dev.online ? "Online" : "Offline",
                              systemImage: dev.online ? "circle.fill" : "circle")
                            .foregroundStyle(dev.online ? .green : .secondary)
                            .font(.callout)
                    }
                    .customizationID("status")
                }
                .frame(height: 220)
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("customizationID — required for persistence").font(.headline).foregroundStyle(.primary)
                    APICallout("TableColumn(…).customizationID(\"name\")")
                    Text("Each column must have a unique customizationID string for the customization state to be saved and restored correctly. Columns without an ID cannot be customized.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Persist with @AppStorage").font(.headline).foregroundStyle(.primary)
                    APICallout("@AppStorage(\"developerTableColumns\") var customization = TableColumnCustomization<Developer>()")
                    Text("TableColumnCustomization conforms to Codable, so @AppStorage can persist it between app launches automatically.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Building a great Mac app with SwiftUI — article").font(.headline).foregroundStyle(.primary)
                    APICallout("// Apple sample: WWDC 2021 session 10062")
                    Text("This Apple article/session demonstrates combining Table, TableColumnCustomization, NavigationSplitView, and OutlineGroup for a production-grade macOS document browser. Covers column reordering, multiple selection, and hierarchical disclosure.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Reset customization").font(.headline).foregroundStyle(.primary)
                APICallout("customization = TableColumnCustomization<Developer>()")
                Button("Reset column layout") {
                    withAnimation { customization = TableColumnCustomization<Developer>() }
                }
                .font(.callout)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("TableColumnCustomization stores visibility, ordering, and width. All three are restored on next launch when persisted via @AppStorage.", systemImage: "square.grid.3x3")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Column reordering is done by dragging column headers. Column hiding is in the column header right-click menu.", systemImage: "cursorarrow.rays")
                    .font(.callout).foregroundStyle(.secondary)
                Label("sortOrder is separate from customization — sorting state is managed independently.", systemImage: "arrow.up.arrow.down")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    TableColumnCustomizationPage().frame(width: 900, height: 800)
}
