---
url: https://developer.apple.com/documentation/swiftui/view/navigationdestination(ispresented:destination:)
framework: SwiftUI
category: Navigation
title: navigationDestination(isPresented:destination:)
kind: method
captured: 2026-05-02
---

# navigationDestination(isPresented:destination:)

Associates a destination view with a binding that can be used to push the view onto a `NavigationStack`.

## Declaration

```swift
nonisolated func navigationDestination<V>(isPresented: Binding<Bool>, @ViewBuilder destination: () -> V) -> some View where V : View

```

### Discussion

In general, favor binding a path to a navigation stack for programmatic navigation. Add this view modifier to a view inside a `NavigationStack` to programmatically push a single view onto the stack. This is useful for building components that can push an associated view. For example, you can present a `ColorDetail` view for a particular color:

```swift
@State private var showDetails = false
var favoriteColor: Color

NavigationStack {
    VStack {
        Circle()
            .fill(favoriteColor)
        Button("Show details") {
            showDetails = true
        }
    }
    .navigationDestination(isPresented: $showDetails) {
        ColorDetail(color: favoriteColor)
    }
    .navigationTitle("My Favorite Color")
}
```

Do not put a navigation destination modifier inside a “lazy” container, like `List` or `LazyVStack`. These containers create child views only when needed to render on screen. Add the navigation destination modifier outside these containers so that the navigation stack can always see the destination.

## Parameters

- **isPresented**: A binding to a Boolean value that indicates whether `destination` is currently presented.
- **destination**: A view to present.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `NavigationStack`
- `NavigationPath`
- `navigationDestination(for:destination:)`
- `navigationDestination(item:destination:)`
