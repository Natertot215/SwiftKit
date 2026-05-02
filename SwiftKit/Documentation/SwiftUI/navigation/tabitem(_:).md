---
url: https://developer.apple.com/documentation/swiftui/view/tabitem(_:)
framework: SwiftUI
category: Navigation
title: tabItem(_:)
kind: method
captured: 2026-05-02
---

# tabItem(_:)

Sets the tab bar item associated with this view.

## Declaration

```swift
nonisolated func tabItem<V>(@ViewBuilder _ label: () -> V) -> some View where V : View

```

### Discussion

Use `tabItem(_:)` to configure a view as a tab bar item in a `TabView`. The example below adds two views as tabs in a `TabView`:

```swift
struct View1: View {
    var body: some View {
        Text("View 1")
    }
}

struct View2: View {
    var body: some View {
        Text("View 2")
    }
}

struct TabItem: View {
    var body: some View {
        TabView {
            View1()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }

            View2()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}
```

## Parameters

- **label**: The tab bar item to associate with this view.





## Availability

- iOS 13.0 (deprecated 26.5)
- iPadOS 13.0 (deprecated 26.5)
- Mac Catalyst 13.0 (deprecated 26.5)
- macOS 10.15 (deprecated 26.5)
- tvOS 13.0 (deprecated 26.5)
- visionOS 1.0
- watchOS 7.0 (deprecated 26.5)



## See Also

- `NavigationView`
