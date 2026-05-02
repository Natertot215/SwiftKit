---
url: https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types
framework: SwiftUI
category: Navigation
title: Migrating to New Navigation Types
kind: article
captured: 2026-05-01
---

# Migrating to New Navigation Types

## Abstract

Improve navigation behavior by replacing navigation views with navigation stacks and navigation split views.

## Overview

Replace deprecated `NavigationView` with modern navigation containers: `NavigationStack` and `NavigationSplitView`.

**Minimum Deployment Targets:** iOS 16, iPadOS 16, macOS 13, tvOS 16, watchOS 9, or visionOS 1, or later.

## Update Single Column Navigation

**Before (Deprecated):**
```swift
NavigationView { // This is deprecated.
    /* content */
}
.navigationViewStyle(.stack)
```

**After:**
```swift
NavigationStack {
    /* content */
}
```

## Update Multicolumn Navigation

### Two-Column

```swift
NavigationSplitView {
    /* column 1 */
} detail: {
    /* column 2 */
}
```

### Three-Column

```swift
NavigationSplitView {
    /* column 1 */
} content: {
    /* column 2 */
} detail: {
    /* column 3 */
}
```

Embed `NavigationStack` within columns when internal navigation is needed.

## Update Programmatic Navigation

**Before:**
```swift
@State private var isShowingPurple = false
NavigationView {
    NavigationLink("Purple", isActive: $isShowingPurple) {
        ColorDetail(color: .purple)
    }
}
.navigationViewStyle(.stack)
```

**After:**
```swift
@State private var path: [Color] = []

NavigationStack(path: $path) {
    List {
        NavigationLink("Purple", value: Color.purple)
    }
    .navigationDestination(for: Color.self) { color in
        ColorDetail(color: color)
    }
}
```

## Update Selection-Based Navigation

```swift
NavigationSplitView {
    List(colors, id: \.self, selection: $selection) { color in
        NavigationLink(color.description, value: color)
    }
} detail: {
    if let color = selection {
        ColorDetail(color: color)
    } else {
        Text("Pick a color")
    }
}
```

## Backward Compatibility

```swift
struct NavigationSplitViewWrapper<Sidebar, Content, Detail>: View
    where Sidebar: View, Content: View, Detail: View
{
    private var sidebar: Sidebar
    private var content: Content
    private var detail: Detail

    var body: some View {
        if #available(iOS 16, macOS 13, tvOS 16, watchOS 9, visionOS 1, *) {
            NavigationSplitView {
                sidebar
            } content: {
                content
            } detail: {
                detail
            }
        } else {
            NavigationView {
                sidebar
                content
                detail
            }
            .navigationViewStyle(.columns)
        }
    }
}
```

## See Also

- Bringing robust navigation structure to your SwiftUI app
- `NavigationSplitView`
- `View.navigationSplitViewStyle(_:)`
- `NavigationSplitViewVisibility`
- `NavigationLink`
