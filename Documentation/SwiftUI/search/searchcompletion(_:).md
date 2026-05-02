---
url: https://developer.apple.com/documentation/swiftui/view/searchcompletion(_:)
framework: SwiftUI
category: Search
title: searchCompletion(_:)
kind: method
captured: 2026-05-02
---

# searchCompletion(_:)

Associates a fully formed string with the value of this view when used as a search suggestion.

## Declaration

```swift
nonisolated func searchCompletion(_ completion: String) -> some View

```

### Discussion

Use this method to associate a fully formed string with a view that is within a search suggestion list context. The system uses this value when the view is selected to replace the partial text being currently edited of the associated search field.

On tvOS, the string that you provide to the this modifier is used when displaying the associated suggestion and when replacing the partial text of the search field.

```swift
SearchPlaceholderView()
    .searchable(text: $text) {
        Text("🍎").searchCompletion("apple")
        Text("🍐").searchCompletion("pear")
        Text("🍌").searchCompletion("banana")
    }
```

## Parameters

- **completion**: A string to use as the view’s completion.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Suggesting search terms`
- `searchSuggestions(_:)`
- `searchSuggestions(_:for:)`
- `searchable(text:tokens:suggestedTokens:placement:prompt:token:)`
- `SearchSuggestionsPlacement`
