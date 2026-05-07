import SwiftUI

// Dense SwiftUI NavigationSplitView gallery — consolidates the entire family:
//   NavigationSplitView                        (struct NavigationSplitView)
//   NavigationSplitViewColumn                  (case .sidebar / .content / .detail)
//   NavigationSplitViewVisibility              (case .all / .doubleColumn / .detailOnly / .automatic)
//   View/navigationSplitViewColumnWidth(_:)    (fixed-width form)
//   View/navigationSplitViewColumnWidth(min:ideal:max:) (flexible form)
//   View/navigationSplitViewStyle(_:)          (.automatic / .balanced / .prominentDetail)
//
// Source docs:
//   Documentation/SwiftUI/navigation/navigationsplitview.md
//   Documentation/SwiftUI/navigation/navigationsplitviewcolumn.md
//   Documentation/SwiftUI/navigation/navigationsplitviewvisibility.md
//   Documentation/SwiftUI/navigation/navigationsplitviewcolumnwidth(_:).md
//   Documentation/SwiftUI/navigation/navigationsplitviewcolumnwidth(min:ideal:max:).md

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 280
private let halfFrameWidth: CGFloat = 320
private let columnDemoHeight: CGFloat = 240

// MARK: - Shared demo data

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

// Mailbox-style chips used by the column / column-width / visibility sections
// (absorbed from the four split-view companion pages).
private struct NSVChip: Identifiable, Hashable {
    let name: String
    let symbol: String
    var id: String { name }
}

private let chips: [NSVChip] = [
    NSVChip(name: "Inbox",   symbol: "tray"),
    NSVChip(name: "Sent",    symbol: "paperplane"),
    NSVChip(name: "Drafts",  symbol: "doc.text"),
    NSVChip(name: "Archive", symbol: "archivebox")
]

struct NavigationSplitViewGalleryPage: View {
    @State private var twoColumnSelection: Employee.ID?
    @State private var departmentSelection: Department.ID?
    @State private var employeeSelection: Employee.ID?
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var styleVisibility: NavigationSplitViewVisibility = .all

    // Absorbed: NavigationSplitViewColumnPage
    @State private var compactColumn: NavigationSplitViewColumn = .sidebar

    // Absorbed: NavigationSplitViewVisibilityPage
    @State private var visibilityDemo: NavigationSplitViewVisibility = .all

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                defaultSection
                variantsSection
                statesSection
                stylesSection
                columnEnumSection
                columnWidthFixedSection
                columnWidthFlexibleSection
                visibilityEnumSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NavigationSplitView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns. The family covers NavigationSplitView itself plus the column enum, visibility enum, fixed and flexible column-width modifiers, and the three documented split styles.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/  \u{00b7}  macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("NavigationSplitView  \u{00b7}  NavigationSplitViewColumn  \u{00b7}  NavigationSplitViewVisibility  \u{00b7}  .navigationSplitViewColumnWidth(_:)  \u{00b7}  .navigationSplitViewColumnWidth(min:ideal:max:)  \u{00b7}  .navigationSplitViewStyle(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default", subtitle: "Two-column form — init(sidebar:detail:)") {
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
    }

    // MARK: Variants

    private var variantsSection: some View {
        PageSection("Variants", subtitle: "Two-column, three-column, and per-column width.") {
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
    }

    // MARK: States

    private var statesSection: some View {
        PageSection("States", subtitle: "columnVisibility binding and side-by-side fixed states.") {
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
                        Button(".all")          { visibility = .all }
                        Button(".doubleColumn") { visibility = .doubleColumn }
                        Button(".detailOnly")   { visibility = .detailOnly }
                        Button(".automatic")    { visibility = .automatic }
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
            }
        }
    }

    // MARK: Styles

    private var stylesSection: some View {
        PageSection("Styles — .navigationSplitViewStyle(_:)",
                    subtitle: "Three documented styles: .automatic, .balanced, .prominentDetail.") {
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

    // MARK: NavigationSplitViewColumn (absorbed from former NavigationSplitViewColumnPage)

    private var columnEnumSection: some View {
        PageSection("NavigationSplitViewColumn — .sidebar / .content / .detail",
                    subtitle: "preferredCompactColumn binding \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Three cases name the column position. Used with the preferredCompactColumn parameter to choose which column appears when the split collapses to a single stack (iPhone, narrow Catalyst). On macOS the value is rarely consulted because the split form rarely collapses.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                ColumnDemo(api: "NavigationSplitView(preferredCompactColumn: $compactColumn) { … }") {
                    NavigationSplitView(preferredCompactColumn: $compactColumn) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: {
                        placeholder("Detail")
                    }
                }
                HStack(spacing: 8) {
                    Button(".sidebar") { compactColumn = .sidebar }
                    Button(".content") { compactColumn = .content }
                    Button(".detail")  { compactColumn = .detail }
                    Spacer()
                    Text("preferredCompactColumn = \(columnLabel(for: compactColumn))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("All three cases — fixed bindings")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        StateColumn(label: ".sidebar", api: ".constant(.sidebar)") {
                            NavigationSplitView(preferredCompactColumn: .constant(.sidebar)) {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                            } content: {
                                List(chips.prefix(3)) { Text($0.name) }
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: ".content", api: ".constant(.content)") {
                            NavigationSplitView(preferredCompactColumn: .constant(.content)) {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                            } content: {
                                List(chips.prefix(3)) { Text($0.name) }
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: ".detail", api: ".constant(.detail)") {
                            NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                            } content: {
                                List(chips.prefix(3)) { Text($0.name) }
                            } detail: { placeholder("Detail") }
                        }
                    }
                }

                noteRow(
                    title: "macOS rarely collapses.",
                    detail: "Standard Mac windows present the split as multiple columns, so preferredCompactColumn almost never takes effect on macOS. The binding still round-trips correctly; it's just visually inert here.",
                    symbol: "macwindow"
                )
            }
        }
    }

    // MARK: navigationSplitViewColumnWidth(_:) — fixed
    // (Absorbed from former NavigationSplitViewColumnWidthPage.)

    private var columnWidthFixedSection: some View {
        PageSection("View/navigationSplitViewColumnWidth(_:) — fixed",
                    subtitle: "Pin a column to a single preferred width \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Apply the modifier inside the column closure (typically directly on the List) to pin that column to a fixed preferred width. Use the (min:ideal:max:) overload for a flexible range.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                ColumnDemo(api: ".navigationSplitViewColumnWidth(180) — sidebar pinned to 180pt") {
                    NavigationSplitView {
                        List(chips) { chip in
                            Label(chip.name, systemImage: chip.symbol)
                        }
                        .navigationSplitViewColumnWidth(180)
                    } detail: {
                        placeholder("Detail")
                    }
                }

                VariantBlock(title: "Three-column — sidebar 140, content 200") {
                    ColumnDemo(api: "Apply on each column's root") {
                        NavigationSplitView {
                            List(chips) { Label($0.name, systemImage: $0.symbol) }
                                .navigationSplitViewColumnWidth(140)
                        } content: {
                            List(chips.prefix(3)) { Text($0.name) }
                                .navigationSplitViewColumnWidth(200)
                        } detail: {
                            placeholder("Detail")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Side-by-side — same content, different fixed sidebar widths")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        StateColumn(label: "120pt", api: ".navigationSplitViewColumnWidth(120)") {
                            NavigationSplitView {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                                    .navigationSplitViewColumnWidth(120)
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: "180pt", api: ".navigationSplitViewColumnWidth(180)") {
                            NavigationSplitView {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                                    .navigationSplitViewColumnWidth(180)
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: "240pt", api: ".navigationSplitViewColumnWidth(240)") {
                            NavigationSplitView {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                                    .navigationSplitViewColumnWidth(240)
                            } detail: { placeholder("Detail") }
                        }
                    }
                }

                noteRow(
                    title: "Apply on the column's root view, not on the NavigationSplitView itself.",
                    detail: "Place .navigationSplitViewColumnWidth(_:) inside the closure for the column you want to size — typically directly on the List that fills the column. Applying it on the NavigationSplitView itself has no effect.",
                    symbol: "arrow.left.and.right"
                )
            }
        }
    }

    // MARK: navigationSplitViewColumnWidth(min:ideal:max:) — flexible
    // (Absorbed from former NavigationSplitViewColumnWidthFlexiblePage.)

    private var columnWidthFlexibleSection: some View {
        PageSection("View/navigationSplitViewColumnWidth(min:ideal:max:) — flexible",
                    subtitle: "ideal is required; min and max are optional \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The signature is (min: CGFloat? = nil, ideal: CGFloat, max: CGFloat? = nil). Pass only ideal for an unconstrained-but-preferred width; supply bounds when you want to clamp the user's resize range.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                ColumnDemo(api: ".navigationSplitViewColumnWidth(min: 140, ideal: 180, max: 240)") {
                    NavigationSplitView {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                            .navigationSplitViewColumnWidth(min: 140, ideal: 180, max: 240)
                    } detail: {
                        placeholder("Detail")
                    }
                }

                VariantBlock(title: "Three-column — Apple's reference shape") {
                    ColumnDemo(api: "Sidebar fixed 150 \u{00b7} content min 150 / ideal 200 / max 400 \u{00b7} detail flexible") {
                        NavigationSplitView {
                            List(chips) { Label($0.name, systemImage: $0.symbol) }
                                .navigationSplitViewColumnWidth(150)
                        } content: {
                            List(chips.prefix(3)) { Text($0.name) }
                                .navigationSplitViewColumnWidth(min: 150, ideal: 200, max: 400)
                        } detail: {
                            placeholder("Detail")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Side-by-side — three flexible-range configurations on the sidebar")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        StateColumn(label: "120…180 (ideal 150)",
                                    api: ".navigationSplitViewColumnWidth(min: 120, ideal: 150, max: 180)") {
                            NavigationSplitView {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                                    .navigationSplitViewColumnWidth(min: 120, ideal: 150, max: 180)
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: "160…240 (ideal 200)",
                                    api: ".navigationSplitViewColumnWidth(min: 160, ideal: 200, max: 240)") {
                            NavigationSplitView {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                                    .navigationSplitViewColumnWidth(min: 160, ideal: 200, max: 240)
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: "200…320 (ideal 260)",
                                    api: ".navigationSplitViewColumnWidth(min: 200, ideal: 260, max: 320)") {
                            NavigationSplitView {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                                    .navigationSplitViewColumnWidth(min: 200, ideal: 260, max: 320)
                            } detail: { placeholder("Detail") }
                        }
                    }
                }

                noteRow(
                    title: "macOS honors the range when the user drags the divider.",
                    detail: "On macOS the user can resize between min and max with the divider; outside macOS the modifier still describes a preferred shape but resize affordances vary by platform.",
                    symbol: "arrow.up.and.down.and.arrow.left.and.right"
                )
            }
        }
    }

    // MARK: NavigationSplitViewVisibility (absorbed from former NavigationSplitViewVisibilityPage)

    private var visibilityEnumSection: some View {
        PageSection("NavigationSplitViewVisibility — .all / .doubleColumn / .detailOnly / .automatic",
                    subtitle: "The columnVisibility binding type \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Four cases: .all shows every column. .doubleColumn hides only the leading column of a three-column split. .detailOnly collapses everything except the trailing column. .automatic asks the platform to choose. The type is Equatable / Hashable / Codable / Sendable.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                ColumnDemo(api: "NavigationSplitView(columnVisibility: $visibility) { … }") {
                    NavigationSplitView(columnVisibility: $visibilityDemo) {
                        List(chips) { Label($0.name, systemImage: $0.symbol) }
                    } content: {
                        List(chips.prefix(3)) { Text($0.name) }
                    } detail: {
                        placeholder("Detail")
                    }
                }
                HStack(spacing: 8) {
                    Button(".all")          { visibilityDemo = .all }
                    Button(".doubleColumn") { visibilityDemo = .doubleColumn }
                    Button(".detailOnly")   { visibilityDemo = .detailOnly }
                    Button(".automatic")    { visibilityDemo = .automatic }
                    Spacer()
                    Text("visibility = \(label(for: visibilityDemo))")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("All four cases as fixed bindings")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 24) {
                        StateColumn(label: ".all", api: ".constant(.all)") {
                            NavigationSplitView(columnVisibility: .constant(.all)) {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                            } content: {
                                List(chips.prefix(3)) { Text($0.name) }
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: ".doubleColumn", api: ".constant(.doubleColumn)") {
                            NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                            } content: {
                                List(chips.prefix(3)) { Text($0.name) }
                            } detail: { placeholder("Detail") }
                        }
                        StateColumn(label: ".detailOnly", api: ".constant(.detailOnly)") {
                            NavigationSplitView(columnVisibility: .constant(.detailOnly)) {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                            } content: {
                                List(chips.prefix(3)) { Text($0.name) }
                            } detail: { placeholder("Detail only") }
                        }
                        StateColumn(label: ".automatic", api: ".constant(.automatic)") {
                            NavigationSplitView(columnVisibility: .constant(.automatic)) {
                                List(chips) { Label($0.name, systemImage: $0.symbol) }
                            } content: {
                                List(chips.prefix(3)) { Text($0.name) }
                            } detail: { placeholder("Detail") }
                        }
                    }
                }

                noteRow(
                    title: "macOS always shows the content column.",
                    detail: "Apple's docs explicitly warn that some platforms ignore some cases — macOS keeps the content column visible even when you bind to .doubleColumn. Use the leading-column toggle in the toolbar to confirm what your shell actually honors.",
                    symbol: "macwindow"
                )
            }
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

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(notes, id: \.title) { note in
                    noteRow(title: note.title, detail: note.detail, symbol: note.symbol)
                }
            }
        }
    }

    // MARK: Detail / placeholder helpers

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

    private func columnLabel(for column: NavigationSplitViewColumn) -> String {
        switch column {
        case .sidebar: return ".sidebar"
        case .content: return ".content"
        case .detail:  return ".detail"
        default:       return String(describing: column)
        }
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
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

private struct ColumnDemo<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: 560, height: columnDemoHeight)
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
        .frame(width: 1100, height: 1600)
}
