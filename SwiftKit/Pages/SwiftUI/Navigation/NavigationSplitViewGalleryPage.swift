import SwiftUI

// SwiftUI `NavigationSplitView` reference page.
// Source: Documentation/SwiftUI/navigation/navigationsplitview.md
// macOS 13.0+. Two- and three-column initializers, columnVisibility binding,
// preferredCompactColumn (macOS 14.0+), .navigationSplitViewStyle(_:),
// .navigationSplitViewColumnWidth(_:), and the NavigationSplitViewVisibility
// state surface. Each demo is framed in a fixed container so the embedded
// split views don't blow up the host scroll view.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 280
private let halfFrameWidth: CGFloat = 320

private struct Department: Identifiable, Hashable {
    let name: String
    let employees: [Employee]
    let id = UUID()
}

private struct Employee: Identifiable, Hashable {
    let name: String
    let title: String
    let id = UUID()
}

private let departments: [Department] = [
    Department(name: "Engineering", employees: [
        Employee(name: "Ada Lovelace",      title: "Compiler Engineer"),
        Employee(name: "Grace Hopper",       title: "Systems Architect"),
        Employee(name: "Linus Torvalds",     title: "Kernel Lead")
    ]),
    Department(name: "Design", employees: [
        Employee(name: "Susan Kare",         title: "Iconographer"),
        Employee(name: "Dieter Rams",        title: "Industrial Designer")
    ]),
    Department(name: "Research", employees: [
        Employee(name: "Alan Turing",        title: "Cryptanalyst"),
        Employee(name: "Margaret Hamilton",  title: "Software Engineer")
    ])
]

private let employees: [Employee] = departments.flatMap(\.employees)

struct NavigationSplitViewGalleryPage: View {
    @State private var twoColumnSelection: Employee.ID?
    @State private var departmentSelection: Department.ID?
    @State private var employeeSelection: Employee.ID?
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var styleVisibility: NavigationSplitViewVisibility = .all

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NavigationSplitView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationsplitview.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "NavigationSplitView { sidebar } detail: { detail }") {
            NavigationSplitView {
                List(employees, selection: $twoColumnSelection) { employee in
                    Text(employee.name)
                }
            } detail: {
                if let id = twoColumnSelection,
                   let employee = employees.first(where: { $0.id == id }) {
                    employeeDetail(employee)
                } else {
                    placeholder("Select an employee")
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Two-column — init(sidebar:detail:)") {
                DemoCard(api: "NavigationSplitView { List(_, selection:) } detail: { … }") {
                    NavigationSplitView {
                        List(employees, selection: $twoColumnSelection) { employee in
                            Text(employee.name)
                        }
                    } detail: {
                        if let id = twoColumnSelection,
                           let employee = employees.first(where: { $0.id == id }) {
                            employeeDetail(employee)
                        } else {
                            placeholder("Select an employee")
                        }
                    }
                }
            }

            VariantBlock(title: "Three-column — init(sidebar:content:detail:)") {
                DemoCard(api: "NavigationSplitView { sidebar } content: { content } detail: { detail }") {
                    NavigationSplitView {
                        List(departments, selection: $departmentSelection) { department in
                            Text(department.name)
                        }
                    } content: {
                        if let id = departmentSelection,
                           let department = departments.first(where: { $0.id == id }) {
                            List(department.employees, selection: $employeeSelection) { employee in
                                Text(employee.name)
                            }
                        } else {
                            placeholder("Select a department")
                        }
                    } detail: {
                        if let id = employeeSelection,
                           let employee = employees.first(where: { $0.id == id }) {
                            employeeDetail(employee)
                        } else {
                            placeholder("Select an employee")
                        }
                    }
                }
            }

            VariantBlock(title: "Column widths — .navigationSplitViewColumnWidth(min:ideal:max:)") {
                DemoCard(api: ".navigationSplitViewColumnWidth(min: 140, ideal: 180, max: 220)") {
                    NavigationSplitView {
                        List(employees, selection: $twoColumnSelection) { employee in
                            Text(employee.name)
                        }
                        .navigationSplitViewColumnWidth(min: 140, ideal: 180, max: 220)
                    } detail: {
                        if let id = twoColumnSelection,
                           let employee = employees.first(where: { $0.id == id }) {
                            employeeDetail(employee)
                        } else {
                            placeholder("Select an employee")
                        }
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "columnVisibility — bound to NavigationSplitViewVisibility") {
                DemoCard(api: "NavigationSplitView(columnVisibility: $visibility) { sidebar } detail: { detail }") {
                    NavigationSplitView(columnVisibility: $visibility) {
                        List(employees, selection: $twoColumnSelection) { employee in
                            Text(employee.name)
                        }
                    } detail: {
                        if let id = twoColumnSelection,
                           let employee = employees.first(where: { $0.id == id }) {
                            employeeDetail(employee)
                        } else {
                            placeholder("Select an employee")
                        }
                    }
                }
                HStack(spacing: 8) {
                    Button(".all")        { visibility = .all }
                    Button(".doubleColumn") { visibility = .doubleColumn }
                    Button(".detailOnly") { visibility = .detailOnly }
                    Button(".automatic")  { visibility = .automatic }
                    Spacer()
                    Text("visibility = \(label(for: visibility))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "Visibility — side-by-side fixed states") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: ".all", api: ".constant(.all)") {
                        NavigationSplitView(columnVisibility: .constant(.all)) {
                            List(employees.prefix(3), id: \.id) { e in Text(e.name) }
                        } detail: {
                            placeholder("Detail")
                        }
                    }
                    StateColumn(label: ".doubleColumn", api: ".constant(.doubleColumn)") {
                        NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
                            List(departments, id: \.id) { d in Text(d.name) }
                        } content: {
                            List(employees.prefix(3), id: \.id) { e in Text(e.name) }
                        } detail: {
                            placeholder("Detail")
                        }
                    }
                    StateColumn(label: ".detailOnly", api: ".constant(.detailOnly)") {
                        NavigationSplitView(columnVisibility: .constant(.detailOnly)) {
                            List(employees.prefix(3), id: \.id) { e in Text(e.name) }
                        } detail: {
                            placeholder("Detail only")
                        }
                    }
                }
            }

            stylesGrid
        }
    }

    private var stylesGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Split-view styles available on macOS")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Apply via .navigationSplitViewStyle(_:). Three documented styles: .automatic, .balanced, .prominentDetail.")
                .font(.caption)
                .foregroundStyle(.secondary)

            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: halfFrameWidth + 24), spacing: 24)
            ], alignment: .leading, spacing: 24) {
                styleSample(title: ".automatic", api: ".navigationSplitViewStyle(.automatic)") {
                    AnyView(stylableSplit.navigationSplitViewStyle(.automatic))
                }
                styleSample(title: ".balanced", api: ".navigationSplitViewStyle(.balanced)") {
                    AnyView(stylableSplit.navigationSplitViewStyle(.balanced))
                }
                styleSample(title: ".prominentDetail", api: ".navigationSplitViewStyle(.prominentDetail)") {
                    AnyView(stylableSplit.navigationSplitViewStyle(.prominentDetail))
                }
            }
        }
    }

    private var stylableSplit: some View {
        NavigationSplitView(columnVisibility: $styleVisibility) {
            List(departments, id: \.id) { d in Text(d.name) }
        } content: {
            List(employees.prefix(3), id: \.id) { e in Text(e.name) }
        } detail: {
            placeholder("Detail")
        }
    }

    private func styleSample(title: String, api: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: halfFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    // MARK: Notes

    private struct NSVNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSVNote] = [
        .init(title: "Two columns or three — pick the init that matches the data depth.",
              detail: "init(sidebar:detail:) is two columns. init(sidebar:content:detail:) is three. Apple uses three for hierarchies like Account → Mailbox → Message; two for flat lists like Inspector → Detail.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Selections drive subsequent columns — no NavigationLink required.",
              detail: "Bind the leading column's List(selection:) to a state property and read it in the next column to compute that column's contents. Three-column form layers two of these selections in series.",
              symbol: "cursorarrow.click.2"),
        .init(title: "columnVisibility uses NavigationSplitViewVisibility.",
              detail: "Cases: .all (every column), .doubleColumn (hide sidebar in three-column form), .detailOnly (only the trailing column), .automatic (system decides). Bind it for programmatic show/hide; the framework also writes back when the user toggles columns via the toolbar.",
              symbol: "sidebar.left"),
        .init(title: "Three documented styles, applied with .navigationSplitViewStyle(_:).",
              detail: ".automatic chooses per platform; .balanced gives equal weight to columns and pushes detail aside as columns appear; .prominentDetail keeps the trailing column at full size and overlays the leading columns. macOS treats .automatic and .balanced similarly.",
              symbol: "paintbrush"),
        .init(title: "Column widths via .navigationSplitViewColumnWidth(...) on each column's root.",
              detail: "Apply the modifier inside the column closure (e.g. on the List), not on the NavigationSplitView itself. Use .navigationSplitViewColumnWidth(_:) for a fixed width or the (min:ideal:max:) form to allow user resize within bounds.",
              symbol: "arrow.left.and.right"),
        .init(title: "preferredCompactColumn is macOS 14+ and iPhone-flavored.",
              detail: "Bind a NavigationSplitViewColumn to choose which column appears when the split collapses to a single stack on narrow size classes. macOS rarely collapses, so this matters most for Mac Catalyst and small windows.",
              symbol: "iphone"),
        .init(title: "Don't nest NavigationSplitView inside NavigationStack (or vice versa) at the root.",
              detail: "These are root container types. SwiftKit's own shell uses NavigationSplitView at the WindowGroup root with the sidebar/detail paradigm. NavigationStack belongs inside one column when that column needs its own push history.",
              symbol: "exclamationmark.triangle")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }

    // MARK: Detail / placeholder helpers (trivial composition only)

    private func employeeDetail(_ employee: Employee) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(employee.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(employee.title)
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func placeholder(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func label(for visibility: NavigationSplitViewVisibility) -> String {
        switch visibility {
        case .all:          return ".all"
        case .doubleColumn: return ".doubleColumn"
        case .detailOnly:   return ".detailOnly"
        case .automatic:    return ".automatic"
        default:            return String(describing: visibility)
        }
    }
}

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var width: CGFloat = demoFrameWidth
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: width, height: height)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: halfFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

extension NavigationSplitViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationSplitView",
        title: "NavigationSplitView",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationSplitView",
            "View/navigationSplitViewStyle(_:)",
            "View/navigationSplitViewColumnWidth(_:)",
            "View/navigationSplitViewColumnWidth(min:ideal:max:)",
            "NavigationSplitViewVisibility",
            "NavigationSplitViewColumn"
        ],
        blurb: "A view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns. Companion modifiers configure column style, widths, visibility, and the preferred compact column.",
        signature: "struct NavigationSplitView<Sidebar, Content, Detail> where Sidebar : View, Content : View, Detail : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationsplitview.md",
        page: { AnyView(NavigationSplitViewGalleryPage()) }
    )
}

#Preview {
    NavigationSplitViewGalleryPage()
        .frame(width: 1100, height: 900)
}
