---
url: https://developer.apple.com/documentation/swiftui/view/navigationbarbackbuttonhidden(_:)
framework: SwiftUI
category: Navigation
title: navigationBarBackButtonHidden(_:)
kind: method
captured: 2026-05-02
---

# navigationBarBackButtonHidden(_:)

Hides the navigation bar back button for the view.

## Declaration

```swift
nonisolated func navigationBarBackButtonHidden(_ hidesBackButton: Bool = true) -> some View

```

### Discussion

Use `navigationBarBackButtonHidden(_:)` to hide the back button for this view.

This modifier only takes effect when this view is inside of and visible within a `NavigationStack` or a `NavigationSplitView` in narrow size classes.

The example below demonstrates how to hide the navigation back button for a view within a navigation stack:

```swift
NavigationStack {
   List {
       NavigationLink("Mint") {
           Color.mint
               .navigationBarBackButtonHidden()
       }
   }
   .navigationTitle("Colors")
}
```

## Parameters

- **hidesBackButton**: A Boolean value that indicates whether to hide the back button. The default value is `true`.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 13.0
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `navigationBarTitleDisplayMode(_:)`
- `NavigationBarItem`
