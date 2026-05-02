---
url: https://developer.apple.com/documentation/swiftui/view/navigationsplitviewcolumnwidth(min:ideal:max:)
framework: SwiftUI
category: Navigation
title: navigationSplitViewColumnWidth(min:ideal:max:)
kind: method
captured: 2026-05-02
---

# navigationSplitViewColumnWidth(min:ideal:max:)

Sets a flexible, preferred width for the column containing this view.

## Declaration

```swift
nonisolated func navigationSplitViewColumnWidth(min: CGFloat? = nil, ideal: CGFloat, max: CGFloat? = nil) -> some View

```

### Discussion

Apply this modifier to the content of a column in a `NavigationSplitView` to specify a preferred flexible width for the column. Use `View/navigationSplitViewColumnWidth(_:)` if you need to specify a fixed width.

The following example shows a three-column navigation split view where the first column has a preferred width of 150 points, and the second column has a flexible, preferred width between 150 and 400 points:

```swift
NavigationSplitView {
    MySidebar()
        .navigationSplitViewColumnWidth(150)
} contents: {
    MyContents()
        .navigationSplitViewColumnWidth(
            min: 150, ideal: 200, max: 400)
} detail: {
    MyDetail()
}
```

Only some platforms enable resizing columns. If you specify a width that the current presentation environment doesn’t support, SwiftUI may use a different width for your column.







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0



## See Also

- `Bringing robust navigation structure to your SwiftUI app`
- `Migrating to new navigation types`
- `NavigationSplitView`
- `navigationSplitViewStyle(_:)`
- `navigationSplitViewColumnWidth(_:)`
- `NavigationSplitViewVisibility`
- `NavigationLink`
