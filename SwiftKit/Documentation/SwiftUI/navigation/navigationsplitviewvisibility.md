---
url: https://developer.apple.com/documentation/swiftui/navigationsplitviewvisibility
framework: SwiftUI
category: Navigation
title: NavigationSplitViewVisibility
kind: struct
captured: 2026-05-02
---

# NavigationSplitViewVisibility

The visibility of the leading columns in a navigation split view.

## Declaration

```swift
struct NavigationSplitViewVisibility
```

### Overview

Use a value of this type to control the visibility of the columns of a `NavigationSplitView`. Create a `State` property with a value of this type, and pass a `Binding` to that state to the `NavigationSplitView/init(columnVisibility:sidebar:detail:)` or `NavigationSplitView/init(columnVisibility:sidebar:content:detail:)` initializer when you create the navigation split view. You can then modify the value elsewhere in your code to:

- Hide all but the trailing column with `NavigationSplitViewVisibility/detailOnly`.
- Hide the leading column of a three-column navigation split view with `NavigationSplitViewVisibility/doubleColumn`.
- Show all the columns with `NavigationSplitViewVisibility/all`.
- Rely on the automatic behavior for the current context with `NavigationSplitViewVisibility/automatic`.

> **NOTE:** Some platforms don’t respect every option. For example, macOS always displays the content column.





## Relationships

**Conforms To**: `Decodable`, `Encodable`, `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- tvOS 16.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Getting visibilities

- `automatic`
- `all`
- `doubleColumn`
- `detailOnly`

## See Also

- `Bringing robust navigation structure to your SwiftUI app`
- `Migrating to new navigation types`
- `NavigationSplitView`
- `navigationSplitViewStyle(_:)`
- `navigationSplitViewColumnWidth(_:)`
- `navigationSplitViewColumnWidth(min:ideal:max:)`
- `NavigationLink`
