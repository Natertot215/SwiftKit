import SwiftUI

// Dense SwiftUI Searchable gallery — consolidates the entire family:
//   View/searchable(text:placement:prompt:)                                                — base text overload
//   View/searchable(text:isPresented:placement:prompt:)                                    — programmatic presentation
//   View/searchable(text:tokens:placement:prompt:token:)                                   — text + tokens
//   View/searchable(text:tokens:isPresented:placement:prompt:token:)                       — tokens + isPresented
//   View/searchable(text:editableTokens:placement:prompt:token:)                           — editable tokens
//   View/searchable(text:editableTokens:isPresented:placement:prompt:token:)               — editable tokens + isPresented
//   View/searchable(text:tokens:suggestedTokens:placement:prompt:token:)                   — suggested tokens
//   View/searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)       — suggested tokens + isPresented
//   SearchFieldPlacement                                                                   — placement struct
//   View/searchScopes(_:scopes:) and (_:activation:_:)                                     — scope picker
//   SearchScopeActivation                                                                  — activation struct
//   View/searchSuggestions(_:) and (_:for:)                                                — suggestion content + visibility
//   SearchSuggestionsPlacement                                                             — suggestion placement
//   View/searchCompletion(_:)                                                              — completion attached to suggestion
//   View/searchPresentationToolbarBehavior(_:) + SearchPresentationToolbarBehavior         — toolbar behavior on presentation
//   "Adding a search interface to your app" / "Performing a search operation" /
//   "Scoping a search operation" / "Suggesting search terms" /
//   "Managing search interface activation"                                                 — Apple article references
//
// Source docs:
//   Documentation/SwiftUI/search/searchable(text:placement:prompt:).md
//   Documentation/SwiftUI/search/searchable(text:ispresented:placement:prompt:).md
//   Documentation/SwiftUI/search/searchable(text:tokens:placement:prompt:token:).md
//   Documentation/SwiftUI/search/searchable(text:tokens:ispresented:placement:prompt:token:).md
//   Documentation/SwiftUI/search/searchable(text:editabletokens:placement:prompt:token:).md
//   Documentation/SwiftUI/search/searchable(text:editabletokens:ispresented:placement:prompt:token:).md
//   Documentation/SwiftUI/search/searchable(text:tokens:suggestedtokens:placement:prompt:token:).md
//   Documentation/SwiftUI/search/searchable(text:tokens:suggestedtokens:ispresented:placement:prompt:token:).md
//   Documentation/SwiftUI/search/searchfieldplacement.md
//   Documentation/SwiftUI/search/searchscopes(_:scopes:).md
//   Documentation/SwiftUI/search/searchscopes(_:activation:_:).md
//   Documentation/SwiftUI/search/searchscopeactivation.md
//   Documentation/SwiftUI/search/searchsuggestions(_:).md
//   Documentation/SwiftUI/search/searchsuggestions(_:for:).md
//   Documentation/SwiftUI/search/searchsuggestionsplacement.md
//   Documentation/SwiftUI/search/searchcompletion(_:).md
//   Documentation/SwiftUI/search/searchpresentationtoolbarbehavior(_:).md
//
// Per L-001 / L-012: semantic tokens only, no hand-mixed colors.

// MARK: — Shared demo data (file-private)

private struct SearchFruit: Identifiable, Hashable {
    let name: String
    let symbol: String
    let id = UUID()
}

private let searchFruits: [SearchFruit] = [
    SearchFruit(name: "Apple",      symbol: "\u{1F34E}"),
    SearchFruit(name: "Apricot",    symbol: "\u{1F351}"),
    SearchFruit(name: "Banana",     symbol: "\u{1F34C}"),
    SearchFruit(name: "Blueberry",  symbol: "\u{1FAD0}"),
    SearchFruit(name: "Cherry",     symbol: "\u{1F352}"),
    SearchFruit(name: "Date",       symbol: "\u{1F33F}"),
    SearchFruit(name: "Elderberry", symbol: "\u{1F347}"),
    SearchFruit(name: "Fig",        symbol: "\u{1F33F}"),
    SearchFruit(name: "Grape",      symbol: "\u{1F347}"),
    SearchFruit(name: "Mango",      symbol: "\u{1F96D}"),
    SearchFruit(name: "Orange",     symbol: "\u{1F34A}"),
    SearchFruit(name: "Pear",       symbol: "\u{1F350}"),
    SearchFruit(name: "Strawberry", symbol: "\u{1F353}")
]

private func filteredFruits(_ source: [SearchFruit], _ query: String) -> [SearchFruit] {
    guard !query.isEmpty else { return source }
    return source.filter { $0.name.localizedCaseInsensitiveContains(query) }
}

private struct ItemRow: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private let itemRows: [ItemRow] = (1...20).map { ItemRow(name: "Item \($0)") }

private func filteredItems(_ source: [ItemRow], _ query: String) -> [ItemRow] {
    guard !query.isEmpty else { return source }
    return source.filter { $0.name.localizedCaseInsensitiveContains(query) }
}

// Token enum used by tokens / suggested-tokens overloads
private enum FruitToken: String, Identifiable, Hashable, CaseIterable {
    case apple, pear, banana, mango, orange
    var id: Self { self }
    var label: String {
        switch self {
        case .apple:  return "Apple"
        case .pear:   return "Pear"
        case .banana: return "Banana"
        case .mango:  return "Mango"
        case .orange: return "Orange"
        }
    }
}

private struct SearchProduct: Identifiable, Hashable {
    let name: String
    let kind: FruitToken
    let id = UUID()
}

private let searchProducts: [SearchProduct] = [
    SearchProduct(name: "Apple — Honeycrisp",   kind: .apple),
    SearchProduct(name: "Apple — Granny Smith", kind: .apple),
    SearchProduct(name: "Pear — Bartlett",      kind: .pear),
    SearchProduct(name: "Banana — Cavendish",   kind: .banana),
    SearchProduct(name: "Mango — Ataulfo",      kind: .mango),
    SearchProduct(name: "Orange — Navel",       kind: .orange),
    SearchProduct(name: "Orange — Blood",       kind: .orange)
]

private func filteredProducts(_ source: [SearchProduct], text: String, tokens: [FruitToken]) -> [SearchProduct] {
    source.filter { product in
        let matchesText = text.isEmpty || product.name.localizedCaseInsensitiveContains(text)
        let matchesTokens = tokens.isEmpty || tokens.contains(product.kind)
        return matchesText && matchesTokens
    }
}

// Editable token model — token closure receives Binding<C.Element>
private struct EditableFruitToken: Identifiable, Hashable {
    enum Kind: String, Hashable, CaseIterable, Identifiable {
        case apple, pear, banana, mango
        var id: Self { self }
        var label: String { rawValue.capitalized }
    }
    enum Hydration: String, Hashable, CaseIterable, Identifiable {
        case hydrated, dehydrated
        var id: Self { self }
        var label: String { rawValue.capitalized }
    }
    let id = UUID()
    var kind: Kind
    var hydration: Hydration = .hydrated
}

// Scope enum used by searchScopes overloads
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

private struct ScopedProduct: Identifiable, Hashable {
    let name: String
    let scope: ProductScope
    let id = UUID()
}

private let scopedProducts: [ScopedProduct] = [
    ScopedProduct(name: "Apple",    scope: .fruit),
    ScopedProduct(name: "Banana",   scope: .fruit),
    ScopedProduct(name: "Carrot",   scope: .vegetable),
    ScopedProduct(name: "Broccoli", scope: .vegetable),
    ScopedProduct(name: "Pear",     scope: .fruit)
]

private func filteredScoped(text: String, scope: ProductScope) -> [ScopedProduct] {
    scopedProducts.filter { product in
        let scopeMatch = scope == .all || product.scope == scope
        let textMatch = text.isEmpty || product.name.localizedCaseInsensitiveContains(text)
        return scopeMatch && textMatch
    }
}

private let demoFrameWidth: CGFloat = 460
private let demoFrameHeight: CGFloat = 240

// MARK: — Main page

struct SearchableGalleryPage: View {
    // base text overload state
    @State private var baseText: String = ""
    @State private var promptText: String = ""
    @State private var automaticText: String = ""
    @State private var toolbarText: String = ""
    @State private var sidebarText: String = ""

    // isPresented overload state
    @State private var isPresentedText: String = ""
    @State private var isPresented: Bool = true

    // tokens overload state
    @State private var tokensText: String = ""
    @State private var tokensTokens: [FruitToken] = []
    @State private var tokensPromptText: String = ""
    @State private var tokensPromptTokens: [FruitToken] = [.apple]

    // tokens + isPresented overload state
    @State private var tokensIsPresentedText: String = ""
    @State private var tokensIsPresentedTokens: [FruitToken] = []
    @State private var tokensIsPresented: Bool = true

    // editable tokens overload state
    @State private var editableTokensText: String = ""
    @State private var editableTokens: [EditableFruitToken] = [
        EditableFruitToken(kind: .apple),
        EditableFruitToken(kind: .pear, hydration: .dehydrated)
    ]

    // editable tokens + isPresented overload state
    @State private var editableTokensIsPresentedText: String = ""
    @State private var editableTokensIsPresentedTokens: [EditableFruitToken] = [
        EditableFruitToken(kind: .apple)
    ]
    @State private var editableTokensIsPresented: Bool = true

    // suggested tokens overload state
    @State private var suggestedText: String = ""
    @State private var suggestedTokens: [FruitToken] = []
    @State private var suggestedSuggestions: [FruitToken] = FruitToken.allCases

    // suggested tokens + isPresented overload state
    @State private var suggestedIsPresentedText: String = ""
    @State private var suggestedIsPresentedTokens: [FruitToken] = []
    @State private var suggestedIsPresentedSuggestions: [FruitToken] = FruitToken.allCases
    @State private var suggestedIsPresented: Bool = true

    // SearchFieldPlacement state
    @State private var placementAutomaticText: String = ""
    @State private var placementToolbarText: String = ""
    @State private var placementSidebarText: String = ""
    @State private var placementPrincipalText: String = ""

    // searchScopes state
    @State private var scopeDefault: ProductScope = .all
    @State private var scopeDefaultText: String = ""
    @State private var scopePresScope: ProductScope = .all
    @State private var scopePresText: String = ""
    @State private var scopeTypeScope: ProductScope = .all
    @State private var scopeTypeText: String = ""

    // searchSuggestions state
    @State private var suggestionsSimpleText: String = ""
    @State private var suggestionsDynamicText: String = ""
    @State private var suggestionsSectionedText: String = ""
    @State private var suggestionsMenuOnlyText: String = ""

    // searchCompletion state
    @State private var completionStringText: String = ""
    @State private var completionLabelText: String = ""

    // searchPresentationToolbarBehavior state
    @State private var presBehaviorAutoText: String = ""
    @State private var presBehaviorAvoidText: String = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                referenceSearchFieldPlacementSection
                referenceSearchScopeActivationSection
                referenceSearchSuggestionsPlacementSection
                referenceSearchPresentationToolbarBehaviorSection
                searchableTextSection
                searchableIsPresentedSection
                searchableTokensSection
                searchableTokensIsPresentedSection
                searchableEditableTokensSection
                searchableEditableTokensIsPresentedSection
                searchableSuggestedTokensSection
                searchableSuggestedTokensIsPresentedSection
                searchFieldPlacementSection
                searchScopesSection
                searchSuggestionsSection
                searchCompletionSection
                searchPresentationToolbarBehaviorSection
                addingSearchInterfaceArticleSection
                performingSearchOperationArticleSection
                scopingSearchOperationArticleSection
                suggestingSearchTermsArticleSection
                managingSearchInterfaceActivationArticleSection
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
            Text("Searchable")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The searchable family marks a view as searchable and configures the surrounding search experience: scopes, suggestions, completions, and toolbar behavior. searchScopes, searchSuggestions, searchCompletion, and the toolbar-behavior modifier all share searchable's activation contract and can't be demoed standalone.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/search/  \u{00b7}  macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("searchable \u{00b7} searchScopes \u{00b7} searchSuggestions \u{00b7} searchCompletion \u{00b7} searchPresentationToolbarBehavior \u{00b7} SearchFieldPlacement \u{00b7} SearchScopeActivation \u{00b7} SearchSuggestionsPlacement")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference — SearchFieldPlacement

    private var referenceSearchFieldPlacementSection: some View {
        PageSection("Reference — SearchFieldPlacement",
                    subtitle: "struct SearchFieldPlacement \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("The placement of a search field in a view hierarchy. Passed as the placement: argument of every searchable overload.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                codeBlock(
"""
// macOS-supported placements:
.automatic                          // system decides (typically toolbar)
.toolbar                            // explicit toolbar placement
.sidebar                            // sidebar column of NavigationSplitView
.toolbarPrincipal                   // toolbar's principal slot

// iOS-only (silently fall back to .automatic on macOS):
.navigationBarDrawer
.navigationBarDrawer(displayMode:)
"""
                )

                noteRow(
                    title: "SearchFieldPlacement is a struct, not an enum.",
                    detail: "It exposes static factory members. New placements may appear without breaking source. .sidebar requires a NavigationSplitView ancestor — otherwise SwiftUI falls back to its automatic rule.",
                    symbol: "shippingbox"
                )
            }
        }
    }

    // MARK: Reference — SearchScopeActivation

    private var referenceSearchScopeActivationSection: some View {
        PageSection("Reference — SearchScopeActivation",
                    subtitle: "struct SearchScopeActivation \u{00b7} macOS 13.3+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Controls when the scope Picker appears in a searchable field. Passed as the activation: argument of searchScopes(_:activation:_:).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                codeBlock(
"""
.automatic                          // platform default
.onSearchPresentation               // picker shows when field is active
.onTextEntry                        // picker shows after the user types

// macOS treats .automatic ≈ .onSearchPresentation.
// iOS treats .automatic ≈ .onTextEntry.
"""
                )
            }
        }
    }

    // MARK: Reference — SearchSuggestionsPlacement

    private var referenceSearchSuggestionsPlacementSection: some View {
        PageSection("Reference — SearchSuggestionsPlacement",
                    subtitle: "struct SearchSuggestionsPlacement \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("The ways that SwiftUI can display search suggestions — used as the second argument to .searchSuggestions(_:for:).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                codeBlock(
"""
.menu                               // pop-down menu under the field
.content                            // inline alongside results

// SearchSuggestionsPlacement.Set is an OptionSet:
[.menu, .content]                   // both placements
.menu.union(.content)               // equivalent

// Pair with Visibility (.automatic / .visible / .hidden), not boolean:
.searchSuggestions(.hidden, for: .menu)
.searchSuggestions(.visible, for: [.menu, .content])
"""
                )

                noteRow(
                    title: "Read EnvironmentValues/searchSuggestionsPlacement inside a suggestion.",
                    detail: "Lets a single suggestion view adapt its layout depending on whether it's drawn in the menu vs. inline in content.",
                    symbol: "leaf"
                )
            }
        }
    }

    // MARK: Reference — SearchPresentationToolbarBehavior

    private var referenceSearchPresentationToolbarBehaviorSection: some View {
        PageSection("Reference — SearchPresentationToolbarBehavior",
                    subtitle: "struct SearchPresentationToolbarBehavior \u{00b7} macOS 14.1+") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Configures how the toolbar behaves when presenting search. Passed to .searchPresentationToolbarBehavior(_:) above the searchable modifier.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                codeBlock(
"""
.automatic                          // system decides
.avoidHidingContent                 // keep toolbar items visible during search

// Effect is most visible on iOS where toolbar items collapse.
// macOS keeps toolbar items visible by default; the modifier is a hint.
"""
                )
            }
        }
    }

    // MARK: searchable(text:placement:prompt:)

    private var searchableTextSection: some View {
        PageSection("searchable(text:placement:prompt:)",
                    subtitle: "View/searchable(text:placement:prompt:) \u{00b7} macOS 12.0+ \u{00b7} the base overload") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — text-only binding")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text)") {
                        NavigationStack {
                            List(filteredFruits(searchFruits, baseText)) { fruit in
                                Text(fruit.name)
                            }
                            .searchable(text: $baseText)
                        }
                    }
                    Text("text = \"\(baseText)\" \u{00b7} \(filteredFruits(searchFruits, baseText).count) result(s)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With prompt — LocalizedStringKey")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, prompt: \"Search fruits\")") {
                        NavigationStack {
                            List(filteredFruits(searchFruits, promptText)) { fruit in
                                Text(fruit.name)
                            }
                            .searchable(text: $promptText, prompt: "Search fruits")
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Placement — .automatic (default)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, placement: .automatic)") {
                        NavigationStack {
                            List(filteredFruits(searchFruits, automaticText)) { fruit in
                                Text(fruit.name)
                            }
                            .searchable(text: $automaticText, placement: .automatic)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Placement — .toolbar")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, placement: .toolbar)") {
                        NavigationStack {
                            List(filteredFruits(searchFruits, toolbarText)) { fruit in
                                Text(fruit.name)
                            }
                            .searchable(text: $toolbarText, placement: .toolbar)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Placement — .sidebar (within NavigationSplitView)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, placement: .sidebar)") {
                        NavigationSplitView {
                            List(filteredFruits(searchFruits, sidebarText)) { fruit in
                                Text(fruit.name)
                            }
                        } detail: {
                            Text("Select a fruit")
                                .foregroundStyle(.secondary)
                        }
                        .searchable(text: $sidebarText, placement: .sidebar)
                    }
                }
            }
        }
    }

    // MARK: searchable(text:isPresented:placement:prompt:)

    private var searchableIsPresentedSection: some View {
        PageSection("searchable(text:isPresented:placement:prompt:)",
                    subtitle: "View/searchable(text:isPresented:placement:prompt:) \u{00b7} macOS 14.0+ \u{00b7} programmatic presentation") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — Bool binding presents the field")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, isPresented: $isPresented)") {
                        NavigationStack {
                            List(filteredItems(itemRows, isPresentedText)) { item in
                                Text(item.name)
                            }
                            .searchable(text: $isPresentedText, isPresented: $isPresented)
                        }
                    }
                    HStack(spacing: 12) {
                        Toggle("Presented", isOn: $isPresented)
                            .toggleStyle(.switch)
                        Text("isPresented = \(isPresented.description)")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.secondary)
                    }
                }

                noteRow(
                    title: "isPresented controls field visibility.",
                    detail: "Set the binding to true to show the search field; false hides it. The binding is two-way — SwiftUI writes back when the user dismisses search via the system controls or escape key.",
                    symbol: "eye"
                )
                noteRow(
                    title: "Use to surface search from outside the toolbar.",
                    detail: "Lets you wire any control — a button, menu item, command — to focus the field. Pair with .keyboardShortcut(\"f\", modifiers: .command) on a Toggle for a Find affordance.",
                    symbol: "command"
                )
            }
        }
    }

    // MARK: searchable(text:tokens:placement:prompt:token:)

    private var searchableTokensSection: some View {
        PageSection("searchable(text:tokens:placement:prompt:token:)",
                    subtitle: "View/searchable(text:tokens:placement:prompt:token:) \u{00b7} macOS 13.0+ \u{00b7} text + tokens") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — token closure renders each chip")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, tokens: $tokens) { token in Text(token.label) }") {
                        NavigationStack {
                            List(filteredProducts(searchProducts, text: tokensText, tokens: tokensTokens)) { product in
                                Text(product.name)
                            }
                            .searchable(text: $tokensText, tokens: $tokensTokens, prompt: "Search products") { token in
                                Text(token.label)
                            }
                        }
                    }
                    let tokensList = tokensTokens.map(\.label).joined(separator: ", ")
                    let count = filteredProducts(searchProducts, text: tokensText, tokens: tokensTokens).count
                    Text("text = \"\(tokensText)\" \u{00b7} tokens = [\(tokensList)] \u{00b7} \(count) result(s)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Pre-populated tokens via @State default")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, tokens: $tokens, prompt: \"Search products\") { … }") {
                        NavigationStack {
                            List(filteredProducts(searchProducts, text: tokensPromptText, tokens: tokensPromptTokens)) { product in
                                Text(product.name)
                            }
                            .searchable(text: $tokensPromptText, tokens: $tokensPromptTokens, prompt: "Search products") { token in
                                Text(token.label)
                            }
                        }
                    }
                    HStack(spacing: 8) {
                        ForEach(FruitToken.allCases) { token in
                            Button(token.label) {
                                if !tokensPromptTokens.contains(token) { tokensPromptTokens.append(token) }
                            }
                        }
                        Button("Clear", role: .destructive) { tokensPromptTokens.removeAll() }
                    }
                    .controlSize(.small)
                }

                noteRow(
                    title: "Tokens are Identifiable values that appear as chips.",
                    detail: "Most apps use [SomeIdentifiable] backed by @State. The token closure returns a Text or Label per chip. macOS shows them inline before any plain text in the field. Users remove tokens with the field's built-in chip controls.",
                    symbol: "tag"
                )
                noteRow(
                    title: "You filter on (text + tokens).",
                    detail: "SwiftUI does not auto-filter — read both bindings to compute results. The tokens binding is stable across submission and field focus.",
                    symbol: "line.3.horizontal.decrease.circle"
                )
            }
        }
    }

    // MARK: searchable(text:tokens:isPresented:placement:prompt:token:)

    private var searchableTokensIsPresentedSection: some View {
        PageSection("searchable(text:tokens:isPresented:placement:prompt:token:)",
                    subtitle: "View/searchable(text:tokens:isPresented:placement:prompt:token:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — tokens + programmatic presentation")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text:, tokens:, isPresented:, prompt:) { token in Text(token.label) }") {
                        NavigationStack {
                            List(tokensIsPresentedTokens) { token in
                                Text(token.label)
                            }
                            .searchable(
                                text: $tokensIsPresentedText,
                                tokens: $tokensIsPresentedTokens,
                                isPresented: $tokensIsPresented,
                                prompt: "Search products"
                            ) { token in
                                Text(token.label)
                            }
                        }
                    }
                    Toggle("Presented", isOn: $tokensIsPresented)
                        .toggleStyle(.switch)
                    HStack(spacing: 8) {
                        ForEach(FruitToken.allCases) { token in
                            Button(token.label) {
                                if !tokensIsPresentedTokens.contains(token) { tokensIsPresentedTokens.append(token) }
                            }
                        }
                        Button("Clear", role: .destructive) { tokensIsPresentedTokens.removeAll() }
                    }
                    .controlSize(.small)
                    let list = tokensIsPresentedTokens.map(\.label).joined(separator: ", ")
                    Text("isPresented = \(tokensIsPresented.description) \u{00b7} tokens = [\(list)] \u{00b7} text = \"\(tokensIsPresentedText)\"")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                noteRow(
                    title: "Combines tokens with programmatic presentation.",
                    detail: "Use this when you both control whether the field shows AND surface chips inside it. Useful for find/filter UIs that activate on a keyboard shortcut and start with a default token applied.",
                    symbol: "tag.circle"
                )
            }
        }
    }

    // MARK: searchable(text:editableTokens:placement:prompt:token:)

    private var searchableEditableTokensSection: some View {
        PageSection("searchable(text:editableTokens:placement:prompt:token:)",
                    subtitle: "View/searchable(text:editableTokens:placement:prompt:token:) \u{00b7} macOS 14.0+ \u{00b7} mutable chips") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — token closure receives Binding<C.Element>")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, editableTokens: $tokens) { $token in Picker(…) }") {
                        NavigationStack {
                            List(editableTokens) { token in
                                Text("\(token.kind.label) \u{00b7} \(token.hydration.label)")
                            }
                            .searchable(text: $editableTokensText, editableTokens: $editableTokens, prompt: "Search products") { $token in
                                Picker(selection: $token.hydration) {
                                    ForEach(EditableFruitToken.Hydration.allCases) { hydration in
                                        Text(hydration.label).tag(hydration)
                                    }
                                } label: {
                                    Text(token.kind.label)
                                }
                            }
                        }
                    }
                    HStack(spacing: 8) {
                        ForEach(EditableFruitToken.Kind.allCases) { kind in
                            Button(kind.label) {
                                editableTokens.append(EditableFruitToken(kind: kind))
                            }
                        }
                        Button("Clear", role: .destructive) { editableTokens.removeAll() }
                    }
                    .controlSize(.small)
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(editableTokens) { token in
                            Text("\u{2022} \(token.kind.label) — \(token.hydration.label)")
                                .font(.caption)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                noteRow(
                    title: "Token closure receives a Binding to each element.",
                    detail: "Use $token to mutate properties in place — Picker(selection: $token.hydration) is the canonical example. The same chip stays in the field while its inner value changes.",
                    symbol: "slider.horizontal.3"
                )
                noteRow(
                    title: "Use when a token has a sub-axis.",
                    detail: "Editable tokens fit cases like a tag with a comparison operator (\"price > $20\") or a kind with a modifier (\"fruit \u{00b7} dehydrated\"). For pure removal/addition, prefer the non-editable tokens overload.",
                    symbol: "tag.circle"
                )
            }
        }
    }

    // MARK: searchable(text:editableTokens:isPresented:placement:prompt:token:)

    private var searchableEditableTokensIsPresentedSection: some View {
        PageSection("searchable(text:editableTokens:isPresented:placement:prompt:token:)",
                    subtitle: "View/searchable(text:editableTokens:isPresented:placement:prompt:token:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — editable tokens + programmatic presentation")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text:, editableTokens:, isPresented:, prompt:) { $token in Picker(…) }") {
                        NavigationStack {
                            List(editableTokensIsPresentedTokens) { token in
                                Text("\(token.kind.label) \u{00b7} \(token.hydration.label)")
                            }
                            .searchable(
                                text: $editableTokensIsPresentedText,
                                editableTokens: $editableTokensIsPresentedTokens,
                                isPresented: $editableTokensIsPresented,
                                prompt: "Search products"
                            ) { $token in
                                Picker(selection: $token.hydration) {
                                    ForEach(EditableFruitToken.Hydration.allCases) { h in
                                        Text(h.label).tag(h)
                                    }
                                } label: {
                                    Text(token.kind.label)
                                }
                            }
                        }
                    }
                    Toggle("Presented", isOn: $editableTokensIsPresented)
                        .toggleStyle(.switch)
                    HStack(spacing: 8) {
                        ForEach(EditableFruitToken.Kind.allCases) { kind in
                            Button(kind.label) {
                                editableTokensIsPresentedTokens.append(EditableFruitToken(kind: kind))
                            }
                        }
                        Button("Clear", role: .destructive) { editableTokensIsPresentedTokens.removeAll() }
                    }
                    .controlSize(.small)
                }

                noteRow(
                    title: "Editable tokens + isPresented combine the two activation tools.",
                    detail: "Use this when chips need an inline picker AND your app surfaces the field via a button or shortcut rather than the toolbar.",
                    symbol: "slider.horizontal.3"
                )
            }
        }
    }

    // MARK: searchable(text:tokens:suggestedTokens:placement:prompt:token:)

    private var searchableSuggestedTokensSection: some View {
        PageSection("searchable(text:tokens:suggestedTokens:placement:prompt:token:)",
                    subtitle: "View/searchable(text:tokens:suggestedTokens:placement:prompt:token:) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — tokens + suggested-tokens binding")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text:, tokens:, suggestedTokens:, prompt:) { token in Text(token.label) }") {
                        NavigationStack {
                            List(suggestedTokens) { token in
                                Text(token.label)
                            }
                            .searchable(
                                text: $suggestedText,
                                tokens: $suggestedTokens,
                                suggestedTokens: $suggestedSuggestions,
                                prompt: "Search products"
                            ) { token in
                                Text(token.label)
                            }
                        }
                    }
                    HStack(spacing: 8) {
                        Button("All") { suggestedSuggestions = FruitToken.allCases }
                        Button("Just Apple") { suggestedSuggestions = [.apple] }
                        Button("Empty") { suggestedSuggestions = [] }
                    }
                    .controlSize(.small)
                    let activeList = suggestedTokens.map(\.label).joined(separator: ", ")
                    let suggList = suggestedSuggestions.map(\.label).joined(separator: ", ")
                    Text("active = [\(activeList)] \u{00b7} suggested = [\(suggList)] \u{00b7} text = \"\(suggestedText)\"")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                noteRow(
                    title: "One token closure renders both the chip and the suggestion row.",
                    detail: "Apple's overload reuses your token view both inside the field and inside the suggestion menu. Keep the view compact and recognisable in both contexts.",
                    symbol: "rectangle.stack"
                )
                noteRow(
                    title: "suggestedTokens is a binding, not a static array.",
                    detail: "You can update the binding as users type or as your model changes. Set it to [] to hide the suggestion menu, or to FruitToken.allCases for the static-list shortcut.",
                    symbol: "list.bullet.indent"
                )
                noteRow(
                    title: "Tapping a suggestion appends to tokens.",
                    detail: "SwiftUI moves the chosen value from suggestedTokens (visually) to tokens. Both arrays are bindings — observe tokens to drive your search.",
                    symbol: "plus.app"
                )
            }
        }
    }

    // MARK: searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)

    private var searchableSuggestedTokensIsPresentedSection: some View {
        PageSection("searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)",
                    subtitle: "View/searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — all four bindings working in concert")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text:, tokens:, suggestedTokens:, isPresented:, prompt:) { … }") {
                        NavigationStack {
                            List(suggestedIsPresentedTokens) { token in
                                Text(token.label)
                            }
                            .searchable(
                                text: $suggestedIsPresentedText,
                                tokens: $suggestedIsPresentedTokens,
                                suggestedTokens: $suggestedIsPresentedSuggestions,
                                isPresented: $suggestedIsPresented,
                                prompt: "Search products"
                            ) { token in
                                Text(token.label)
                            }
                        }
                    }
                    Toggle("Presented", isOn: $suggestedIsPresented)
                        .toggleStyle(.switch)
                    HStack(spacing: 8) {
                        Button("All suggestions") { suggestedIsPresentedSuggestions = FruitToken.allCases }
                        Button("Just Apple") { suggestedIsPresentedSuggestions = [.apple] }
                        Button("Empty", role: .destructive) { suggestedIsPresentedSuggestions = [] }
                    }
                    .controlSize(.small)
                }

                noteRow(
                    title: "Suggested-tokens binding swaps as users type.",
                    detail: "If you trim suggestions in response to typed text, the menu updates live. Setting suggestions to [] hides the suggestions menu but keeps the field active.",
                    symbol: "list.bullet.indent"
                )
            }
        }
    }

    // MARK: SearchFieldPlacement gallery

    private var searchFieldPlacementSection: some View {
        PageSection("SearchFieldPlacement Gallery",
                    subtitle: "All four macOS placements — .automatic / .toolbar / .sidebar / .toolbarPrincipal") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(".automatic")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, placement: .automatic)") {
                        NavigationStack {
                            List { Text("macOS lifts the field into the trailing toolbar.") }
                                .searchable(text: $placementAutomaticText, placement: .automatic)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".toolbar")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, placement: .toolbar)") {
                        NavigationStack {
                            List { Text("Toolbar placement") }
                                .searchable(text: $placementToolbarText, placement: .toolbar)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".sidebar — only takes effect inside NavigationSplitView")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, placement: .sidebar)") {
                        NavigationSplitView {
                            List { Text("Sidebar column") }
                        } detail: {
                            Text("Detail").foregroundStyle(.secondary)
                        }
                        .searchable(text: $placementSidebarText, placement: .sidebar)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".toolbarPrincipal — pin to the toolbar's principal slot")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchable(text: $text, placement: .toolbarPrincipal)") {
                        NavigationStack {
                            List { Text("Principal-slot placement") }
                                .searchable(text: $placementPrincipalText, placement: .toolbarPrincipal)
                        }
                    }
                }

                noteRow(
                    title: "Sidebar placement requires NavigationSplitView.",
                    detail: "If you ask for .sidebar inside a NavigationStack, SwiftUI ignores the request and falls back to its automatic rule (typically .toolbar on macOS).",
                    symbol: "sidebar.left"
                )
            }
        }
    }

    // MARK: searchScopes(_:scopes:) and (_:activation:_:)

    private var searchScopesSection: some View {
        PageSection("searchScopes",
                    subtitle: "View/searchScopes(_:scopes:) and (_:activation:_:) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Adds a Picker beneath the search field to narrow the search to broad categories. Each subview's tag must match the scope binding's type.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — searchScopes(_:scopes:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchScopes($scope) { Text(\"…\").tag(…) }") {
                        NavigationStack {
                            List(filteredScoped(text: scopeDefaultText, scope: scopeDefault)) { product in
                                Text(product.name)
                            }
                            .searchable(text: $scopeDefaultText)
                            .searchScopes($scopeDefault) {
                                Text("All").tag(ProductScope.all)
                                Text("Fruit").tag(ProductScope.fruit)
                                Text("Vegetable").tag(ProductScope.vegetable)
                            }
                        }
                    }
                    Text("scope = \(scopeDefault.label) \u{00b7} text = \"\(scopeDefaultText)\"")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("activation: .onSearchPresentation (macOS default)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchScopes($scope, activation: .onSearchPresentation) { … }") {
                        NavigationStack {
                            List(filteredScoped(text: scopePresText, scope: scopePresScope)) { product in
                                Text(product.name)
                            }
                            .searchable(text: $scopePresText)
                            .searchScopes($scopePresScope, activation: .onSearchPresentation) {
                                Text("All").tag(ProductScope.all)
                                Text("Fruit").tag(ProductScope.fruit)
                                Text("Vegetable").tag(ProductScope.vegetable)
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("activation: .onTextEntry")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchScopes($scope, activation: .onTextEntry) { … }") {
                        NavigationStack {
                            List(filteredScoped(text: scopeTypeText, scope: scopeTypeScope)) { product in
                                Text(product.name)
                            }
                            .searchable(text: $scopeTypeText)
                            .searchScopes($scopeTypeScope, activation: .onTextEntry) {
                                Text("All").tag(ProductScope.all)
                                Text("Fruit").tag(ProductScope.fruit)
                                Text("Vegetable").tag(ProductScope.vegetable)
                            }
                        }
                    }
                }

                noteRow(
                    title: "Read scope alongside text + tokens to filter.",
                    detail: "Compose: filter products where (text matches name) AND (scope == .all || product.scope == scope). Same pattern as tokens; the binding is the source of truth.",
                    symbol: "line.3.horizontal.decrease.circle"
                )
                noteRow(
                    title: "Activation: .automatic / .onSearchPresentation / .onTextEntry.",
                    detail: "macOS defaults to .onSearchPresentation — the picker appears as soon as the search field is active. Use .onTextEntry to delay until the user types.",
                    symbol: "switch.2"
                )
            }
        }
    }

    // MARK: searchSuggestions(_:) and (_:for:)

    private var searchSuggestionsSection: some View {
        PageSection("searchSuggestions",
                    subtitle: "View/searchSuggestions(_:) and (_:for:) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Provide rendered suggestion views for the active searchable field — and constrain where they appear (menu vs. inline content).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default — static suggestions with completions")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchSuggestions { Text(\"…\").searchCompletion(\"…\") }") {
                        NavigationStack {
                            List { Text("Type to see suggestions") }
                                .searchable(text: $suggestionsSimpleText)
                                .searchSuggestions {
                                    Text("\u{1F34E} Apple").searchCompletion("apple")
                                    Text("\u{1F350} Pear").searchCompletion("pear")
                                    Text("\u{1F34C} Banana").searchCompletion("banana")
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Dynamic — driven by search text")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchSuggestions { ForEach(matches) { … } }") {
                        NavigationStack {
                            List { Text("Type 'a', 'b', etc.") }
                                .searchable(text: $suggestionsDynamicText)
                                .searchSuggestions {
                                    ForEach(searchSuggestionsMatches(suggestionsDynamicText)) { fruit in
                                        Text("\(fruit.symbol) \(fruit.name)")
                                            .searchCompletion(fruit.name.lowercased())
                                    }
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Sectioned — group with Section headers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: "Section { … }; Section { … } inside .searchSuggestions") {
                        NavigationStack {
                            List { Text("Sectioned suggestions") }
                                .searchable(text: $suggestionsSectionedText)
                                .searchSuggestions {
                                    Section("Fruits") {
                                        Text("\u{1F34E} Apple").searchCompletion("apple")
                                        Text("\u{1F34C} Banana").searchCompletion("banana")
                                    }
                                    Section("Recent") {
                                        Text("\u{1F96D} Mango").searchCompletion("mango")
                                    }
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".searchSuggestions(_:for:) — restrict visibility per placement")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchSuggestions(.hidden, for: .content)") {
                        NavigationStack {
                            List { Text("Suggestions show only in the menu") }
                                .searchable(text: $suggestionsMenuOnlyText)
                                .searchSuggestions {
                                    Text("\u{1F34E} Apple").searchCompletion("apple")
                                    Text("\u{1F34C} Banana").searchCompletion("banana")
                                }
                                .searchSuggestions(.hidden, for: .content)
                        }
                    }
                }

                noteRow(
                    title: "Suggestions are arbitrary views.",
                    detail: "Use Text, Label, or any custom view. Pair each with .searchCompletion(_:) to make tapping the row replace the field's text. Without .searchCompletion the row is visible but inert.",
                    symbol: "list.bullet.rectangle"
                )
                noteRow(
                    title: ".searchSuggestions(_:for:) constrains visibility.",
                    detail: "Pass a Visibility (.automatic/.visible/.hidden) and a SearchSuggestionsPlacement.Set (.menu, .content, .all). Use this to hide menu suggestions while keeping inline-content suggestions, or vice versa.",
                    symbol: "eye.slash"
                )
            }
        }
    }

    // MARK: searchCompletion(_:)

    private var searchCompletionSection: some View {
        PageSection("searchCompletion(_:)",
                    subtitle: "View/searchCompletion(_:) \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Associates a fully formed completion string (or token) with a suggestion view. Tapping the row writes the completion into the searchable field.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("String completion — replaces field text")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: "Text(\"\u{1F34E}\").searchCompletion(\"apple\")") {
                        NavigationStack {
                            List { Text("text = \"\(completionStringText)\"") }
                                .searchable(text: $completionStringText)
                                .searchSuggestions {
                                    Text("\u{1F34E}").searchCompletion("apple")
                                    Text("\u{1F350}").searchCompletion("pear")
                                    Text("\u{1F34C}").searchCompletion("banana")
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Custom suggestion view, completion replaces text")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: "Label(\"Apple\", systemImage: \"leaf\").searchCompletion(\"apple\")") {
                        NavigationStack {
                            List { Text("text = \"\(completionLabelText)\"") }
                                .searchable(text: $completionLabelText)
                                .searchSuggestions {
                                    Label("Apple",  systemImage: "leaf").searchCompletion("apple")
                                    Label("Pear",   systemImage: "leaf").searchCompletion("pear")
                                    Label("Banana", systemImage: "leaf").searchCompletion("banana")
                                }
                        }
                    }
                }

                noteRow(
                    title: "Replaces the search field text on selection.",
                    detail: "Tapping a row with .searchCompletion(_:) writes the completion string into the searchable text binding. The field then drives whatever filtering you've wired up.",
                    symbol: "text.cursor"
                )
                noteRow(
                    title: "Without it, suggestion rows are inert.",
                    detail: "Visible but non-interactive. Use this for section headers / dividers inside a .searchSuggestions block.",
                    symbol: "minus.circle"
                )
                noteRow(
                    title: "There's also a token-flavoured overload.",
                    detail: ".searchCompletion(token) (where token is Identifiable) lets a suggestion add a token to the field instead of replacing text. Pair with the suggested-tokens overloads above.",
                    symbol: "tag"
                )
            }
        }
    }

    // MARK: searchPresentationToolbarBehavior(_:)

    private var searchPresentationToolbarBehaviorSection: some View {
        PageSection("searchPresentationToolbarBehavior(_:)",
                    subtitle: "View/searchPresentationToolbarBehavior(_:) \u{00b7} macOS 14.1+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(".automatic — system decides whether to hide other toolbar content")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchPresentationToolbarBehavior(.automatic)") {
                        NavigationStack {
                            List { Text("Automatic") }
                                .searchable(text: $presBehaviorAutoText)
                                .searchPresentationToolbarBehavior(.automatic)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button("Action") { }
                                    }
                                }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".avoidHidingContent — keep toolbar items visible while searching")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    demoCard(api: ".searchPresentationToolbarBehavior(.avoidHidingContent)") {
                        NavigationStack {
                            List { Text("Avoid hiding") }
                                .searchable(text: $presBehaviorAvoidText)
                                .searchPresentationToolbarBehavior(.avoidHidingContent)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button("Action") { }
                                    }
                                }
                        }
                    }
                }

                noteRow(
                    title: "Effect is most visible on iOS.",
                    detail: "On iOS the system hides parts of the toolbar to focus the search affordance. Override with .avoidHidingContent. macOS keeps toolbar items visible by default; this modifier is a hint either way.",
                    symbol: "iphone"
                )
            }
        }
    }

    // MARK: Article — Adding a search interface to your app

    private var addingSearchInterfaceArticleSection: some View {
        PageSection("Article — Adding a search interface to your app",
                    subtitle: "Apple guide \u{00b7} canonical entry-point for the searchable family") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Apple's introductory guide for surfacing a search affordance in a view hierarchy. Establishes the contract that searchable owns presentation while you own the data filtering.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Topics covered")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 4) {
                        bulletRow("Pick a navigation container — NavigationStack or NavigationSplitView.")
                        bulletRow("Apply .searchable(text:) to the content view inside the container.")
                        bulletRow("Drive the visible collection from the bound text — SwiftUI does not filter for you.")
                        bulletRow("Use prompt: to set the placeholder text via LocalizedStringKey.")
                        bulletRow("Override placement: when the system default doesn't fit your layout.")
                    }
                }

                Text("Documentation/SwiftUI/search/adding-a-search-interface-to-your-app.md")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)
            }
        }
    }

    // MARK: Article — Performing a search operation

    private var performingSearchOperationArticleSection: some View {
        PageSection("Article — Performing a search operation",
                    subtitle: "Apple guide \u{00b7} how to filter, present results, and respond to submission") {
            VStack(alignment: .leading, spacing: 16) {
                Text("How to wire the search text binding into a live filtered collection, respond to submission via .onSubmit(of: .search), and read the EnvironmentValues.isSearching flag inside the searched view.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Key APIs")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("List(filtered(items, text)) { … }   // your filter")
                    APICallout(".onSubmit(of: .search) { commit() }  // user pressed return")
                    APICallout("@Environment(\\.isSearching) var isSearching  // bool inside the searchable subtree")
                    APICallout("@Environment(\\.dismissSearch) var dismissSearch  // call to dismiss the field")
                }

                Text("Documentation/SwiftUI/search/performing-a-search-operation.md")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)
            }
        }
    }

    // MARK: Article — Scoping a search operation

    private var scopingSearchOperationArticleSection: some View {
        PageSection("Article — Scoping a search operation",
                    subtitle: "Apple guide \u{00b7} narrowing search to broad categories") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Adds a Picker beneath the search field via .searchScopes(_:scopes:) so users can narrow to a category. The activation parameter controls when the picker appears (.onSearchPresentation vs. .onTextEntry).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Key APIs")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".searchScopes($scope) { Text(\"All\").tag(.all); Text(\"Fruit\").tag(.fruit) }")
                    APICallout(".searchScopes($scope, activation: .onTextEntry) { … }")
                    APICallout("// Filter on (text + scope) yourself — same pattern as tokens.")
                }

                Text("Documentation/SwiftUI/search/scoping-a-search-operation.md")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)
            }
        }
    }

    // MARK: Article — Suggesting search terms

    private var suggestingSearchTermsArticleSection: some View {
        PageSection("Article — Suggesting search terms",
                    subtitle: "Apple guide \u{00b7} suggestions, completions, and placement") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Provide rendered suggestion views for the active field with .searchSuggestions { … } and attach completion strings (or tokens) via .searchCompletion(_:). Pair with .searchSuggestions(_:for:) to constrain visibility per placement.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Key APIs")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".searchSuggestions { Text(\"\u{1F34E}\").searchCompletion(\"apple\") }")
                    APICallout(".searchSuggestions(.hidden, for: .content)  // restrict to menu only")
                    APICallout(".searchCompletion(token)  // overload that adds an Identifiable token")
                }

                Text("Documentation/SwiftUI/search/suggesting-search-terms.md")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)
            }
        }
    }

    // MARK: Article — Managing search interface activation

    private var managingSearchInterfaceActivationArticleSection: some View {
        PageSection("Article — Managing search interface activation",
                    subtitle: "Apple guide \u{00b7} programmatic presentation and dismissal") {
            VStack(alignment: .leading, spacing: 16) {
                Text("How to control whether the search field is visible (isPresented:), read the environment-supplied isSearching flag, and dismiss the field programmatically via DismissSearchAction.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 6) {
                    Text("Key APIs")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(".searchable(text: $text, isPresented: $isPresented)  // bidirectional Bool binding")
                    APICallout("@Environment(\\.isSearching) var isSearching  // true while the field is active")
                    APICallout("@Environment(\\.dismissSearch) var dismiss  // call dismiss() to close")
                }

                noteRow(
                    title: "isSearching and dismissSearch only work inside the searchable subtree.",
                    detail: "The values are injected by .searchable into the descendant environment. Reading them from outside the searched view returns false / no-op.",
                    symbol: "scope"
                )

                Text("Documentation/SwiftUI/search/managing-search-interface-activation.md")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.tertiary)
                    .textSelection(.enabled)
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints across the family.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Eight searchable overloads cover the surface.",
                    detail: "Pick the overload by axis: text-only / + isPresented / + tokens / + tokens + isPresented / + editableTokens / + editableTokens + isPresented / + tokens + suggestedTokens / + tokens + suggestedTokens + isPresented. Apply to a navigation container or a view inside one.",
                    symbol: "switch.2"
                )
                noteRow(
                    title: "macOS lifts the field into the toolbar by default.",
                    detail: "On macOS the field appears on the trailing edge of the navigation toolbar with .automatic placement. Inside NavigationSplitView, use placement: .sidebar to dock the field into the sidebar column.",
                    symbol: "macwindow"
                )
                noteRow(
                    title: "You filter the data — SwiftUI doesn't.",
                    detail: "The framework only renders and binds the field. Drive your visible collection from the binding (List(filtered(items, text))) for the live result feel.",
                    symbol: "line.3.horizontal.decrease.circle"
                )
                noteRow(
                    title: "Tokens are Identifiable values that appear as chips.",
                    detail: "Editable tokens (the closure receives Binding<C.Element>) let chips carry a sub-axis like a comparator. Suggested tokens add a separate binding the user can pull from.",
                    symbol: "tag"
                )
                noteRow(
                    title: "isPresented is bidirectional.",
                    detail: "Setting it shows the field and focuses it; user dismissal sets it back to false. The tokens binding survives presentation toggles — chips are not cleared when isPresented flips.",
                    symbol: "arrow.triangle.2.circlepath"
                )
                noteRow(
                    title: "Suggestions need .searchCompletion(_:) to be tappable.",
                    detail: "A row inside .searchSuggestions { … } without .searchCompletion is visible but inert — useful for section headers and dividers.",
                    symbol: "minus.circle"
                )
                noteRow(
                    title: "macOS 26+: SearchToolbarBehavior is documented separately.",
                    detail: "The newer .searchToolbarBehavior(_:) modifier (with .automatic / .minimize) is documented under Documentation/SwiftUI/toolbars/. .minimize is iOS-only — macOS toolbars do not collapse the search field.",
                    symbol: "calendar"
                )
            }
        }
    }

    // MARK: Helpers

    private func searchSuggestionsMatches(_ query: String) -> [SearchFruit] {
        guard !query.isEmpty else { return searchFruits }
        return searchFruits.filter {
            $0.name.localizedStandardRange(of: query)?.lowerBound == $0.name.startIndex
        }
    }

    private func demoCard<Content: View>(
        api: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
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

    private func codeBlock(_ text: String) -> some View {
        Text(text)
            .font(.callout)
            .fontDesign(.monospaced)
            .textSelection(.enabled)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: 1)
            )
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

    private func bulletRow(_ text: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text("\u{2022}")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text(text)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }
}

extension SearchableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.search.searchable",
        title: "Searchable",
        folder: "Search",
        framework: .swiftUI,
        absorbedSymbols: [
            "Adding a search interface to your app",
            "DismissSearchAction",
            "EnvironmentValues/dismissSearch",
            "EnvironmentValues/isSearching",
            "FindContext",
            "Managing search interface activation",
            "Performing a search operation",
            "Scoping a search operation",
            "SearchFieldPlacement",
            "SearchPresentationToolbarBehavior",
            "SearchScopeActivation",
            "SearchSuggestionsPlacement",
            "Suggesting search terms",
            "View/findDisabled(_:)",
            "View/findNavigator(isPresented:)",
            "View/replaceDisabled(_:)",
            "View/searchCompletion(_:)",
            "View/searchPresentationToolbarBehavior(_:)",
            "View/searchScopes(_:activation:_:)",
            "View/searchScopes(_:scopes:)",
            "View/searchSuggestions(_:)",
            "View/searchSuggestions(_:for:)",
            "View/searchable(text:editableTokens:isPresented:placement:prompt:token:)",
            "View/searchable(text:editableTokens:placement:prompt:token:)",
            "View/searchable(text:isPresented:placement:prompt:)",
            "View/searchable(text:placement:prompt:)",
            "View/searchable(text:tokens:isPresented:placement:prompt:token:)",
            "View/searchable(text:tokens:placement:prompt:token:)",
            "View/searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)",
            "View/searchable(text:tokens:suggestedTokens:placement:prompt:token:)"
        ],
        blurb: "The searchable family marks a view as searchable and configures the surrounding search experience: scopes, suggestions, completions, and the find-and-replace navigator. searchScopes, searchSuggestions, and the find/replace modifiers all share searchable's activation contract and can't be demoed standalone.",
        signature: "searchable \u{00b7} searchScopes \u{00b7} searchSuggestions \u{00b7} searchCompletion \u{00b7} findNavigator \u{00b7} findDisabled \u{00b7} replaceDisabled",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/search/searchable(text:placement:prompt:).md",
        page: { AnyView(SearchableGalleryPage()) }
    )
}

#Preview {
    SearchableGalleryPage()
        .frame(width: 1200, height: 1600)
}
