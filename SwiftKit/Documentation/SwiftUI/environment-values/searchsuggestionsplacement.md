---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/searchsuggestionsplacement
framework: SwiftUI
category: Environment values
title: searchSuggestionsPlacement
kind: property
captured: 2026-05-02
---

# searchSuggestionsPlacement

The current placement of search suggestions.

## Declaration

```swift
var searchSuggestionsPlacement: SearchSuggestionsPlacement { get }
```

### Discussion

Search suggestions render based on the platform and surrounding context in which you place the searchable modifier containing suggestions. You can render search suggestions in two ways:

- In a menu attached to the search field.
- Inline with the main content of the app.

You find the current search suggestion placement by querying the `EnvironmentValues/searchSuggestionsPlacement` in your search suggestions.

```swift
enum FruitSuggestion: String, Identifiable {
    case apple, banana, orange
    var id: Self { self }
}

@State private var text: String = ""
@State private var suggestions: [FruitSuggestion] = []

var body: some View {
    MainContent()
        .searchable(text: $text) {
            FruitSuggestions(suggestions: suggestions)
        }
}

struct FruitSuggestions: View {
    var suggestions: [FruitSuggestion]

    @Environment(\.searchSuggestionsPlacement)
    private var placement

    var body: some View {
        if shouldRender {
            ForEach(suggestions) { suggestion in
                Text(suggestion.rawValue.capitalized)
                    .searchCompletion(suggestion.rawValue)
            }
        }
    }

    var shouldRender: Bool {
        #if os(iOS)
        placement == .menu
        #else
        true
        #endif
    }
}
```

In the above example, search suggestions only render in iOS if the searchable modifier displays them in a menu. You might want to do this to render suggestions in your own list alongside your own search results when they would render in a list.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `buttonRepeatBehavior`
- `controlSize`
- `defaultWheelPickerItemHeight`
- `keyboardShortcut`
- `menuIndicatorVisibility`
- `menuOrder`
- `preferredPencilDoubleTapAction`
- `preferredPencilSqueezeAction`
