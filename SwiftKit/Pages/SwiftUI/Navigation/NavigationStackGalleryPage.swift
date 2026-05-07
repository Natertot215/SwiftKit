import SwiftUI

// SwiftUI `NavigationStack` reference page.
// Source: Documentation/SwiftUI/navigation/navigationstack.md
// macOS 13.0+. Two documented initializers:
//   init(root:)              — uncontrolled, framework-managed stack
//   init(path:root:)         — bind to [Hashable] or NavigationPath for shared control
// Pairs with .navigationDestination(for:destination:) to enable value-based routing.
// Each demo is framed in a fixed container so the embedded stack doesn't expand
// past the host scroll view.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 320

private struct Park: Identifiable, Hashable {
    let name: String
    let state: String
    var id: String { name }
}

private let parks: [Park] = [
    Park(name: "Yosemite",         state: "California"),
    Park(name: "Sequoia",          state: "California"),
    Park(name: "Zion",             state: "Utah"),
    Park(name: "Acadia",           state: "Maine"),
    Park(name: "Olympic",          state: "Washington")
]

private struct Trail: Hashable {
    let name: String
    let lengthMiles: Double
}

private let trails: [Trail] = [
    Trail(name: "Mist Trail",        lengthMiles: 7.0),
    Trail(name: "Half Dome",         lengthMiles: 16.0),
    Trail(name: "Cathedral Lakes",   lengthMiles: 8.0)
]

struct NavigationStackGalleryPage: View {
    @State private var arrayPath: [Park] = []
    @State private var typedPath = NavigationPath()

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
            Text("NavigationStack")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that displays a root view and enables you to present additional views over the root view.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationstack.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: "NavigationStack { List { NavigationLink(value:) } .navigationDestination(for:) }") {
            NavigationStack {
                List(parks) { park in
                    NavigationLink(park.name, value: park)
                }
                .navigationDestination(for: Park.self) { park in
                    parkDetail(park)
                }
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init(root:) — uncontrolled stack") {
                DemoCard(api: "NavigationStack { … }") {
                    NavigationStack {
                        List(parks) { park in
                            NavigationLink(park.name, value: park)
                        }
                        .navigationDestination(for: Park.self) { park in
                            parkDetail(park)
                        }
                    }
                }
            }

            VariantBlock(title: "init(path:root:) — Array binding") {
                DemoCard(api: "NavigationStack(path: $arrayPath) { … } — path is [Park]") {
                    NavigationStack(path: $arrayPath) {
                        List(parks) { park in
                            NavigationLink(park.name, value: park)
                        }
                        .navigationDestination(for: Park.self) { park in
                            parkDetail(park)
                        }
                    }
                }
            }

            VariantBlock(title: "Multiple destination types — NavigationPath") {
                DemoCard(api: "NavigationStack(path: $typedPath) { … } — NavigationPath erases types") {
                    NavigationStack(path: $typedPath) {
                        List {
                            Section("Parks") {
                                ForEach(parks) { park in
                                    NavigationLink(park.name, value: park)
                                }
                            }
                            Section("Trails") {
                                ForEach(trails, id: \.self) { trail in
                                    NavigationLink(trail.name, value: trail)
                                }
                            }
                        }
                        .navigationDestination(for: Park.self) { park in
                            parkDetail(park)
                        }
                        .navigationDestination(for: Trail.self) { trail in
                            trailDetail(trail)
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
            VariantBlock(title: "Programmatic push / pop — Array binding") {
                DemoCard(api: "arrayPath.append(park) // push    arrayPath.removeLast() // pop") {
                    NavigationStack(path: $arrayPath) {
                        List(parks) { park in
                            NavigationLink(park.name, value: park)
                        }
                        .navigationDestination(for: Park.self) { park in
                            parkDetail(park)
                        }
                    }
                }
                HStack(spacing: 8) {
                    Button("Push Yosemite") { arrayPath.append(parks[0]) }
                    Button("Push Zion")     { arrayPath.append(parks[2]) }
                    Button("Pop")           {
                        if !arrayPath.isEmpty { arrayPath.removeLast() }
                    }
                    Button("Pop to root")   { arrayPath.removeAll() }
                    Spacer()
                    Text("depth = \(arrayPath.count)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "Programmatic push / pop — NavigationPath") {
                DemoCard(api: "typedPath.append(value)    typedPath.removeLast()    typedPath.count") {
                    NavigationStack(path: $typedPath) {
                        List {
                            Section("Parks") {
                                ForEach(parks) { park in
                                    NavigationLink(park.name, value: park)
                                }
                            }
                            Section("Trails") {
                                ForEach(trails, id: \.self) { trail in
                                    NavigationLink(trail.name, value: trail)
                                }
                            }
                        }
                        .navigationDestination(for: Park.self) { park in
                            parkDetail(park)
                        }
                        .navigationDestination(for: Trail.self) { trail in
                            trailDetail(trail)
                        }
                    }
                }
                HStack(spacing: 8) {
                    Button("Push Park")  { typedPath.append(parks[1]) }
                    Button("Push Trail") { typedPath.append(trails[0]) }
                    Button("Pop")        {
                        if !typedPath.isEmpty { typedPath.removeLast() }
                    }
                    Button("Pop to root") { typedPath = NavigationPath() }
                    Spacer()
                    Text("depth = \(typedPath.count)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "Empty stack — only the root view is visible") {
                StateColumn(label: "Path = []", api: "NavigationStack(path: .constant([Park]()))") {
                    NavigationStack(path: .constant([Park]())) {
                        List(parks) { park in
                            NavigationLink(park.name, value: park)
                        }
                        .navigationDestination(for: Park.self) { park in
                            parkDetail(park)
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct NSNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NSNote] = [
        .init(title: "Two initializers — pick one based on who owns the stack state.",
              detail: "init(root:) lets the framework own the path. init(path:root:) binds to your own state — required for deep links, programmatic push/pop, persistence, or restoring the stack across sessions.",
              symbol: "switch.2"),
        .init(title: "Value-based routing is the macOS 13+ pattern.",
              detail: "Pair NavigationLink(value:) with .navigationDestination(for:destination:) inside the stack's view hierarchy. The stack matches links to destinations by the value's type — no destination view is constructed until navigation actually happens.",
              symbol: "arrow.triangle.branch"),
        .init(title: "Array binding for one type; NavigationPath for many.",
              detail: "If every pushed value is the same Hashable type, bind to [Element]. To stack heterogeneous types, use NavigationPath — it erases types and lets you append any Hashable & Codable value.",
              symbol: "list.bullet.indent"),
        .init(title: "Mutate the path to push or pop programmatically.",
              detail: "path.append(value) pushes; path.removeLast() pops one; path.removeAll() (or path = NavigationPath()) returns to root. The stack reflects the mutation animatedly.",
              symbol: "arrow.up.arrow.down"),
        .init(title: ".navigationDestination must live inside the stack — typically on the root.",
              detail: "Apply it on a view in the stack's hierarchy (often the root List). Placing it outside the NavigationStack means the stack can't find the destination and the link won't fire. Multiple modifiers stack — register each value type once.",
              symbol: "exclamationmark.triangle"),
        .init(title: "NavigationStack is a column, not a window root for split layouts.",
              detail: "Use NavigationStack inside a NavigationSplitView column when that column needs its own push history (e.g. drilling into mailbox folders). Don't wrap the whole NavigationSplitView in a NavigationStack — they're peer container types.",
              symbol: "rectangle.stack"),
        .init(title: "NavigationPath is Codable when its values are.",
              detail: "If every value you append conforms to Codable, the entire NavigationPath can be persisted via init(_:) / .codable. Useful for state restoration of arbitrarily-typed deep links.",
              symbol: "externaldrive")
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

    // MARK: Detail builders (trivial composition only)

    private func parkDetail(_ park: Park) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(park.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(park.state)
                .font(.callout)
                .foregroundStyle(.secondary)
            Divider()
            ForEach(trails, id: \.self) { trail in
                NavigationLink(value: trail) {
                    HStack {
                        Label(trail.name, systemImage: "figure.hiking")
                        Spacer()
                        Text("\(trail.lengthMiles, specifier: "%.1f") mi")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func trailDetail(_ trail: Trail) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(trail.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("\(trail.lengthMiles, specifier: "%.1f") miles")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
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
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

extension NavigationStackGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.navigation.navigationStack",
        title: "NavigationStack",
        folder: "Navigation",
        framework: .swiftUI,
        absorbedSymbols: [
            "NavigationStack",
            "Understanding the navigation stack",
            "Bringing robust navigation structure to your SwiftUI app"
        ],
        blurb: "A view that displays a root view and enables you to present additional views over the root view. Pair with NavigationLink and navigationDestination to drive a stack-based navigation hierarchy.",
        signature: "@MainActor @preconcurrency struct NavigationStack<Data, Root> where Root : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/navigation/navigationstack.md",
        page: { AnyView(NavigationStackGalleryPage()) }
    )
}

#Preview {
    NavigationStackGalleryPage()
        .frame(width: 1100, height: 900)
}
