---
url: https://developer.apple.com/documentation/swiftui/searchfieldplacement
framework: SwiftUI
category: Search
title: SearchFieldPlacement
kind: struct
captured: 2026-05-02
---

# SearchFieldPlacement

The placement of a search field in a view hierarchy.

## Declaration

```swift
struct SearchFieldPlacement
```

### Overview

You can give a preferred placement to any of the searchable modifiers, like `View/searchable(text:placement:prompt:)`:

```swift
var body: some View {
    NavigationView {
        PrimaryView()
        SecondaryView()
        Text("Select a primary and secondary item")
    }
    .searchable(text: $text, placement: .sidebar)
}
```

Depending on the containing view hierachy, SwiftUI might not be able to fulfill your request.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting a search field placement

- `automatic`
- `navigationBarDrawer`
- `navigationBarDrawer(displayMode:)`
- `sidebar`
- `toolbar`

### Supporting types

- `SearchFieldPlacement.NavigationBarDrawerDisplayMode`

### Type Properties

- `toolbarPrincipal`

## See Also

- `Adding a search interface to your app`
- `Performing a search operation`
- `searchable(text:placement:prompt:)`
- `searchable(text:tokens:placement:prompt:token:)`
- `searchable(text:editableTokens:placement:prompt:token:)`
