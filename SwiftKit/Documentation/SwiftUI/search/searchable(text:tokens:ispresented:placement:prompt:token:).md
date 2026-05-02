---
url: https://developer.apple.com/documentation/swiftui/view/searchable(text:tokens:ispresented:placement:prompt:token:)
framework: SwiftUI
category: Search
title: searchable(text:tokens:isPresented:placement:prompt:token:)
kind: method
captured: 2026-05-02
---

# searchable(text:tokens:isPresented:placement:prompt:token:)

Marks this view as searchable with text and tokens, as well as programmatic presentation.

## Declaration

```swift
nonisolated func searchable<C, T, S>(text: Binding<String>, tokens: Binding<C>, isPresented: Binding<Bool>, placement: SearchFieldPlacement = .automatic, prompt: S, @ViewBuilder token: @escaping (C.Element) -> T) -> some View where C : RandomAccessCollection, C : RangeReplaceableCollection, T : View, S : StringProtocol, C.Element : Identifiable

```

### Discussion

For more information about using searchable modifiers, see `Adding-a-search-interface-to-your-app`. For information about presenting a search field programmatically, see `Managing-search-interface-activation`.

## Parameters

- **text**: The text to display and edit in the search field.
- **tokens**: A collection of tokens to display and edit in the search field.
- **isPresented**: A `Binding` that controls the presented state of search.
- **placement**: The preferred placement of the search field within the containing view hierarchy.
- **prompt**: A string representing the prompt of the search field which provides users with guidance on what to search for.
- **token**: A view builder that creates a view given an element in tokens.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0



## See Also

- `Managing search interface activation`
- `isSearching`
- `dismissSearch`
- `DismissSearchAction`
- `searchable(text:isPresented:placement:prompt:)`
- `searchable(text:editableTokens:isPresented:placement:prompt:token:)`
- `searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)`
