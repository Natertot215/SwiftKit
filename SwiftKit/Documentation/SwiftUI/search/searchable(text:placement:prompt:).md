---
url: https://developer.apple.com/documentation/swiftui/view/searchable(text:placement:prompt:)
framework: SwiftUI
category: Search
title: searchable(text:placement:prompt:)
kind: method
captured: 2026-05-02
---

# searchable(text:placement:prompt:)

Marks this view as searchable, which configures the display of a search field.

## Declaration

```swift
nonisolated func searchable(text: Binding<String>, placement: SearchFieldPlacement = .automatic, prompt: LocalizedStringKey) -> some View

```

### Discussion

For more information about using searchable modifiers, see `Adding-a-search-interface-to-your-app`.

## Parameters

- **text**: The text to display and edit in the search field.
- **placement**: The preferred placement of the search field within the containing view hierarchy.
- **prompt**: The key for the localized prompt of the search field which provides users with guidance on what to search for.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Adding a search interface to your app`
- `Performing a search operation`
- `searchable(text:tokens:placement:prompt:token:)`
- `searchable(text:editableTokens:placement:prompt:token:)`
- `SearchFieldPlacement`
