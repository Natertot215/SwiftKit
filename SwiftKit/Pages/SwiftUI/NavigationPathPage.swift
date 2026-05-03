import SwiftUI

// SwiftUI `NavigationPath` reference page.
// Source: Documentation/SwiftUI/navigation/navigationpath.md
// macOS 13.0+. Type-erased list of Hashable values backing a NavigationStack(path:).
// API surface:
//   init() / init(_:CodableRepresentation)
//   isEmpty / count
//   append(_:) / removeLast(_:)
//   codable          → Optional<CodableRepresentation>
//   CodableRepresentation
// Demonstrate each via a single bound stack with mixed-type pushes.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 320

private struct NPPark: Identifiable, Hashable, Codable {
    let name: String
    let state: String
    var id: String { name }
}

private struct NPTrail: Hashable, Codable {
    let name: String
    let lengthMiles: Double
}

private let parks: [NPPark] = [
    NPPark(name: "Yosemite", state: "California"),
    NPPark(name: "Zion",     state: "Utah"),
    NPPark(name: "Acadia",   state: "Maine")
]

private let trails: [NPTrail] = [
    NPTrail(name: "Mist Trail",      lengthMiles: 7.0),
    NPTrail(name: "Half Dome",       lengthMiles: 16.0),
    NPTrail(name: "Cathedral Lakes", lengthMiles: 8.0)
]

struct NavigationPathPage: View {
    @State private var path = NavigationPath()
    @State private var serializedJSON: String = "—"

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
            Text("NavigationPath")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A type-erased list of data representing the content of a navigation stack.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/navigationpath.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            DemoCard(api: "NavigationStack(path: $path) { … } — path: NavigationPath") {
                NavigationStack(path: $path) {
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
                    .navigationDestination(for: NPPark.self) { park in
                        parkDetail(park)
                    }
                    .navigationDestination(for: NPTrail.self) { trail in
                        trailDetail(trail)
                    }
                }
            }
            countRow
        }
    }

    private var countRow: some View {
        HStack(spacing: 8) {
            Text("path.isEmpty = \(String(path.isEmpty))")
            Text("·").foregroundStyle(.tertiary)
            Text("path.count = \(path.count)")
        }
        .font(.caption)
        .fontDesign(.monospaced)
        .foregroundStyle(.secondary)
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "init() — empty path") {
                APICallout("var path = NavigationPath()        // count == 0")
            }
            VariantBlock(title: "append(_:) — push any Hashable") {
                APICallout("path.append(parks[0])              // pushes a Park")
                APICallout("path.append(trails[1])             // pushes a Trail (different type — fine)")
            }
            VariantBlock(title: "removeLast(_:) — pop one or many") {
                APICallout("path.removeLast()                  // pops one")
                APICallout("path.removeLast(path.count)        // pops everything → root")
            }
            VariantBlock(title: "isEmpty / count") {
                APICallout("path.isEmpty                       // Bool — empty stack")
                APICallout("path.count                         // Int — current depth")
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Programmatic mutation") {
                HStack(spacing: 8) {
                    Button("Push Park")  { path.append(parks[0]) }
                    Button("Push Trail") { path.append(trails[0]) }
                    Button("Pop")        {
                        if !path.isEmpty { path.removeLast() }
                    }
                    Button("Pop to root") { path = NavigationPath() }
                    Spacer()
                    Text("count = \(path.count)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantBlock(title: "Codable round-trip — path.codable / NavigationPath.CodableRepresentation") {
                HStack(spacing: 8) {
                    Button("Encode → JSON") { serializedJSON = encode() }
                    Button("Decode JSON ← path") { path = decode(serializedJSON) ?? NavigationPath() }
                    Spacer()
                }
                Text(serializedJSON)
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .padding(8)
                    .frame(maxWidth: .infinity, minHeight: 60, alignment: .topLeading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                    .textSelection(.enabled)
                APICallout("path.codable                       // Optional<NavigationPath.CodableRepresentation>")
                APICallout("NavigationPath(rep)                // rebuilds from a CodableRepresentation")
            }
        }
    }

    private func encode() -> String {
        guard let representation = path.codable else { return "nil — at least one element is not Codable" }
        do {
            let data = try JSONEncoder().encode(representation)
            return String(data: data, encoding: .utf8) ?? "—"
        } catch {
            return "encode error: \(error)"
        }
    }

    private func decode(_ json: String) -> NavigationPath? {
        guard let data = json.data(using: .utf8) else { return nil }
        do {
            let rep = try JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data)
            return NavigationPath(rep)
        } catch {
            return nil
        }
    }

    private func parkDetail(_ park: NPPark) -> some View {
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
                    Label(trail.name, systemImage: "figure.hiking")
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func trailDetail(_ trail: NPTrail) -> some View {
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

    // MARK: Notes

    private struct NPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NPNote] = [
        .init(title: "Type-erased — pushes any Hashable, regardless of element type.",
              detail: "Use NavigationPath when a stack mixes destination types. For a single Hashable type, a plain [Element] binding is simpler.",
              symbol: "list.bullet.indent"),
        .init(title: "Mutate to push and pop.",
              detail: "path.append(value) pushes; path.removeLast() pops one; path.removeLast(path.count) (or path = NavigationPath()) returns to root. Mutations animate through the stack.",
              symbol: "arrow.up.arrow.down"),
        .init(title: "Codable when every value is Codable.",
              detail: "If — and only if — every appended value conforms to Codable, the path's `codable` accessor returns a serializable representation. JSON-encode it for state restoration; reconstruct with NavigationPath(_:CodableRepresentation).",
              symbol: "externaldrive"),
        .init(title: "isEmpty + count are the queryable surface.",
              detail: "There's no public `removeAll()` and no API to read individual elements; the type erases everything except depth. Compare counts (or .isEmpty) to detect root state.",
              symbol: "number"),
        .init(title: "Avoid stuffing model objects into the path.",
              detail: "Apple's docs (and the article 'Understanding the Navigation Stack') recommend keeping path elements lightweight — IDs or small value types — and resolving full models inside the destination.",
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
}

// MARK: - Page-local helpers

private struct DemoCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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

#Preview {
    NavigationPathPage()
        .frame(width: 1100, height: 900)
}
