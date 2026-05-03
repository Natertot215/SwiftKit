import SwiftUI

// View/searchScopes(_:scopes:) + View/searchScopes(_:activation:_:) reference page.
// Sources:
//   Documentation/SwiftUI/search/searchscopes(_:scopes:).md
//   Documentation/SwiftUI/search/searchscopes(_:activation:_:).md
// Apple primitive only.

private let demoFrameWidth: CGFloat = 520
private let demoFrameHeight: CGFloat = 320

private enum ProductScope: String, Hashable, CaseIterable, Identifiable {
    case fruit, vegetable, all
    var id: Self { self }
    var label: String {
        switch self {
        case .fruit:     return "Fruit"
        case .vegetable: return "Vegetable"
        case .all:       return "All"
        }
    }
}

private struct Product: Identifiable, Hashable {
    let name: String
    let scope: ProductScope
    let id = UUID()
}

private let products: [Product] = [
    Product(name: "Apple",    scope: .fruit),
    Product(name: "Banana",   scope: .fruit),
    Product(name: "Carrot",   scope: .vegetable),
    Product(name: "Broccoli", scope: .vegetable),
    Product(name: "Pear",     scope: .fruit)
]

struct SearchScopesPage: View {
    @State private var defaultScope: ProductScope = .all
    @State private var defaultText: String = ""
    @State private var presScope: ProductScope = .all
    @State private var presText: String = ""
    @State private var typeScope: ProductScope = .all
    @State private var typeText: String = ""

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

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/searchScopes(_:scopes:) & (_:activation:_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Adds a Picker beneath the search field to narrow the search to broad categories.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/searchscopes(_:scopes:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoCard(api: ".searchScopes($scope) { Text(\"…\").tag(…) }") {
            NavigationStack {
                List(filtered(text: defaultText, scope: defaultScope)) { product in
                    Text(product.name)
                }
                .searchable(text: $defaultText)
                .searchScopes($defaultScope) {
                    Text("All").tag(ProductScope.all)
                    Text("Fruit").tag(ProductScope.fruit)
                    Text("Vegetable").tag(ProductScope.vegetable)
                }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "activation: .onSearchPresentation (default on macOS)") {
                DemoCard(api: ".searchScopes($scope, activation: .onSearchPresentation) { … }") {
                    NavigationStack {
                        List(filtered(text: presText, scope: presScope)) { product in
                            Text(product.name)
                        }
                        .searchable(text: $presText)
                        .searchScopes($presScope, activation: .onSearchPresentation) {
                            Text("All").tag(ProductScope.all)
                            Text("Fruit").tag(ProductScope.fruit)
                            Text("Vegetable").tag(ProductScope.vegetable)
                        }
                    }
                }
            }

            VariantBlock(title: "activation: .onTextEntry") {
                DemoCard(api: ".searchScopes($scope, activation: .onTextEntry) { … }") {
                    NavigationStack {
                        List(filtered(text: typeText, scope: typeScope)) { product in
                            Text(product.name)
                        }
                        .searchable(text: $typeText)
                        .searchScopes($typeScope, activation: .onTextEntry) {
                            Text("All").tag(ProductScope.all)
                            Text("Fruit").tag(ProductScope.fruit)
                            Text("Vegetable").tag(ProductScope.vegetable)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("default scope = \(defaultScope.label) · text = \"\(defaultText)\"")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
            Text("onSearchPresentation scope = \(presScope.label) · text = \"\(presText)\"")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
            Text("onTextEntry scope = \(typeScope.label) · text = \"\(typeText)\"")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }

    private func filtered(text: String, scope: ProductScope) -> [Product] {
        products.filter { product in
            let scopeMatch = scope == .all || product.scope == scope
            let textMatch = text.isEmpty || product.name.localizedCaseInsensitiveContains(text)
            return scopeMatch && textMatch
        }
    }

    private struct PageNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let pageNotes: [PageNote] = [
        .init(title: "Adds a Picker bound to scope.",
              detail: "Each subview's tag must match the scope binding's type. SwiftUI generates the picker chrome — your job is the binding and the per-scope tags.",
              symbol: "rectangle.split.3x1"),
        .init(title: "Read scope alongside text + tokens to filter.",
              detail: "Compose: filter products where (text matches name) AND (scope == .all || product.scope == scope). Same pattern as tokens; the binding is the source of truth.",
              symbol: "line.3.horizontal.decrease.circle"),
        .init(title: "Activation: .automatic / .onSearchPresentation / .onTextEntry.",
              detail: "macOS defaults to .onSearchPresentation — the picker appears as soon as the search field is active. Use .onTextEntry to delay until the user types.",
              symbol: "switch.2")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(pageNotes, id: \.title) { note in
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
    SearchScopesPage()
        .frame(width: 1100, height: 900)
}
