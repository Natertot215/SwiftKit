---
url: https://developer.apple.com/documentation/swiftui/dynamicviewcontent
framework: SwiftUI
category: View groupings
title: DynamicViewContent
kind: protocol
captured: 2026-05-02
---

# DynamicViewContent

A type of view that generates views from an underlying collection of data.

## Declaration

```swift
protocol DynamicViewContent<Data> : View
```







## Relationships

**Inherits From**: `View`

**Conforming Types**: `ForEach`, `ModifiedContent`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Managing the data

- `data`
- `Data`

### Responding to updates

- `onDelete(perform:)`
- `onInsert(of:perform:)`
- `onMove(perform:)`
- `dropDestination(for:action:)`

### Deprecated symbols

- `onInsert(of:perform:)`

### Instance Methods

- `onInsert(of:perform:)`

## See Also

- `ForEach`
- `ForEachSectionCollection`
- `ForEachSubviewCollection`
