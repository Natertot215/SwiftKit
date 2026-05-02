---
url: https://developer.apple.com/documentation/swiftui/searchsuggestionsplacement
framework: SwiftUI
category: Search
title: SearchSuggestionsPlacement
kind: struct
captured: 2026-05-02
---

# SearchSuggestionsPlacement

The ways that SwiftUI displays search suggestions.

## Declaration

```swift
struct SearchSuggestionsPlacement
```

### Overview

You can influence which modes SwiftUI displays search suggestions for by using the `View/searchSuggestions(_:for:)` modifier:

```swift
enum FruitSuggestion: String, Identifiable {
    case apple, banana, orange
    var id: Self { self }
}

@State private var text = ""
@State private var suggestions: [FruitSuggestion] = []

var body: some View {
    MainContent()
        .searchable(text: $text) {
            ForEach(suggestions) { suggestion in
                Text(suggestion.rawValue)
                    .searchCompletion(suggestion.rawValue)
            }
            .searchSuggestions(.hidden, for: .content)
        }
}
```

In the above example, SwiftUI only displays search suggestions in a suggestions menu. You might want to do this when you want to render search suggestions in a container, like inline with your own set of search results.

You can get the current search suggestion placement by querying the `EnvironmentValues/searchSuggestionsPlacement` environment value in your search suggestions.





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting placements

- `automatic`
- `content`
- `menu`

### Supporting types

- `SearchSuggestionsPlacement.Set`

## See Also

- `Suggesting search terms`
- `searchSuggestions(_:)`
- `searchSuggestions(_:for:)`
- `searchCompletion(_:)`
- `searchable(text:tokens:suggestedTokens:placement:prompt:token:)`
