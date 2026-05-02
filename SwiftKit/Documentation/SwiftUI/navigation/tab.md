---
url: https://developer.apple.com/documentation/swiftui/tab
framework: SwiftUI
category: Navigation
title: Tab
kind: struct
captured: 2026-05-02
---

# Tab

The content for a tab and the tab’s associated tab item in a tab view.

## Declaration

```swift
struct Tab<Value, Content, Label>
```







## Relationships

**Conforms To**: `Copyable`, `Escapable`, `TabContent`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Creating a tab

- `init(content:)`
- `init(value:content:)`
- `init(role:content:)`
- `init(value:role:content:)`

### Creating a tab with label

- `init(content:label:)`
- `init(value:content:label:)`
- `init(role:content:label:)`
- `init(value:role:content:label:)`

### Creating a tab with system symbol

- `init(_:systemImage:content:)`
- `init(_:systemImage:value:content:)`
- `init(_:systemImage:role:content:)`
- `init(_:systemImage:value:role:content:)`

### Creating a tab with image

- `init(_:image:content:)`
- `init(_:image:value:content:)`
- `init(_:image:role:content:)`
- `init(_:image:value:role:content:)`

### Supporting types

- `DefaultTabLabel`

## See Also

- `Enhancing your app’s content with tab navigation`
- `TabView`
- `TabRole`
- `TabSection`
- `tabViewStyle(_:)`
