---
url: https://developer.apple.com/documentation/swiftui/view/searchable(text:tokens:suggestedtokens:placement:prompt:token:)
framework: SwiftUI
category: Search
title: searchable(text:tokens:suggestedTokens:placement:prompt:token:)
kind: method
captured: 2026-05-02
---

# searchable(text:tokens:suggestedTokens:placement:prompt:token:)

Marks this view as searchable with text, tokens, and suggestions.

## Declaration

```swift
nonisolated func searchable<C, T, S>(text: Binding<String>, tokens: Binding<C>, suggestedTokens: Binding<C>, placement: SearchFieldPlacement = .automatic, prompt: S, @ViewBuilder token: @escaping (C.Element) -> T) -> some View where C : MutableCollection, C : RandomAccessCollection, C : RangeReplaceableCollection, T : View, S : StringProtocol, C.Element : Identifiable

```

### Discussion

For more information about using searchable modifiers, see `Adding-a-search-interface-to-your-app`.

## Parameters

- **text**: The text to display and edit in the search field.
- **tokens**: A collection of tokens to display and edit in the search field.
- **suggestedTokens**: A collection of tokens to display as suggestions.
- **placement**: The preferred placement of the search field within the containing view hierarchy.
- **prompt**: A string representing the prompt of the search field which provides users with guidance on what to search for.
- **token**: A view builder that creates a view given an element in tokens.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 1.0



## See Also

- `Suggesting search terms`
- `searchSuggestions(_:)`
- `searchSuggestions(_:for:)`
- `searchCompletion(_:)`
- `SearchSuggestionsPlacement`
