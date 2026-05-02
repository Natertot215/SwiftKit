---
url: https://developer.apple.com/documentation/swiftui/tabsection
framework: SwiftUI
category: Navigation
title: TabSection
kind: struct
captured: 2026-05-02
---

# TabSection

A container that you can use to add hierarchy within a tab view.

## Declaration

```swift
struct TabSection<Header, Content, Footer, SelectionValue>
```

### Overview

Use `TabSection` to organize tab content into separate sections. Each section has custom tab content that you provide on a per-instance basis. You can also provide a header for each section.





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

### Creating a tab section

- `init(content:)`
- `init(_:content:)`
- `init(content:header:)`

### Supporting types

- `DefaultTabLabel`

## See Also

- `Enhancing your app’s content with tab navigation`
- `TabView`
- `Tab`
- `TabRole`
- `tabViewStyle(_:)`
