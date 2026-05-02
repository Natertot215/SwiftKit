---
url: https://developer.apple.com/documentation/swiftui/view/searchpresentationtoolbarbehavior(_:)
framework: SwiftUI
category: Search
title: searchPresentationToolbarBehavior(_:)
kind: method
captured: 2026-05-02
---

# searchPresentationToolbarBehavior(_:)

Configures the search toolbar presentation behavior for any searchable modifiers within this view.

## Declaration

```swift
nonisolated func searchPresentationToolbarBehavior(_ behavior: SearchPresentationToolbarBehavior) -> some View

```

### Discussion

By default on iOS, a toolbar may hide parts of its content when presenting search to focus on searching. You can override this behavior by providing a value of `SearchPresentationToolbarBehavior/avoidHidingContent` to this modifer.

```swift
@State private var searchText = ""

List {
    // ... content
}
.searchable(text: $searchText)
.searchPresentationToolbarBehavior(.avoidHidingContent)
```







## Availability

- iOS 17.1
- iPadOS 17.1
- Mac Catalyst 17.1
- macOS 14.1
- tvOS 17.1
- visionOS 1.0
- watchOS 10.1



## See Also

- `SearchPresentationToolbarBehavior`
