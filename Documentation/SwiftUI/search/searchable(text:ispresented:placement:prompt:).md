---
url: https://developer.apple.com/documentation/swiftui/view/searchable(text:ispresented:placement:prompt:)
framework: SwiftUI
category: Search
title: searchable(text:isPresented:placement:prompt:)
kind: method
captured: 2026-05-02
---

# searchable(text:isPresented:placement:prompt:)

Marks this view as searchable with programmatic presentation of the search field.

## Declaration

```swift
nonisolated func searchable(text: Binding<String>, isPresented: Binding<Bool>, placement: SearchFieldPlacement = .automatic, prompt: LocalizedStringKey) -> some View

```

### Discussion

For more information about using searchable modifiers, see `Adding-a-search-interface-to-your-app`. For information about presenting a search field programmatically, see `Managing-search-interface-activation`.

## Parameters

- **text**: The text to display and edit in the search field.
- **isPresented**: A `Binding` that controls the presented state of search.
- **placement**: The preferred placement of the search field within the containing view hierarchy.
- **prompt**: The key for the localized prompt of the search field which provides users with guidance on what to search for.





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
- `searchable(text:tokens:isPresented:placement:prompt:token:)`
- `searchable(text:editableTokens:isPresented:placement:prompt:token:)`
- `searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)`
