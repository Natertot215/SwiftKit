---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/issearching
framework: SwiftUI
category: Environment values
title: isSearching
kind: property
captured: 2026-05-02
---

# isSearching

A Boolean value that indicates when the user is searching.

## Declaration

```swift
var isSearching: Bool { get }
```

### Discussion

You can read this value like any of the other `EnvironmentValues`, by creating a property with the `Environment` property wrapper:

```swift
@Environment(\.isSearching) private var isSearching
```

Get the value to find out when the user interacts with a search field that’s produced by one of the searchable modifiers, like `View/searchable(text:placement:prompt:)`:

```swift
struct SearchingExample: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            SearchedView()
                .searchable(text: $searchText)
        }
    }
}

struct SearchedView: View {
    @Environment(\.isSearching) private var isSearching

    var body: some View {
        Text(isSearching ? "Searching!" : "Not searching.")
    }
}
```

When the user first taps or clicks in a search field, the `isSearching` property becomes `true`. When the user cancels the search operation, the property becomes `false`. To programmatically set the value to `false` and dismiss the search operation, use `EnvironmentValues/dismissSearch`.

> **IMPORTANT:** Access the value from inside the searched view, as the example above demonstrates, rather than from the searched view’s parent. SwiftUI sets the value in the environment of the view that you apply the searchable modifier to, and doesn’t propagate the value up the view hierarchy.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Managing search interface activation`
- `dismissSearch`
- `DismissSearchAction`
- `searchable(text:isPresented:placement:prompt:)`
- `searchable(text:tokens:isPresented:placement:prompt:token:)`
- `searchable(text:editableTokens:isPresented:placement:prompt:token:)`
- `searchable(text:tokens:suggestedTokens:isPresented:placement:prompt:token:)`
