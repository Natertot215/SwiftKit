---
url: https://developer.apple.com/documentation/swiftui/tabcontentbuilder
framework: SwiftUI
category: Navigation
title: TabContentBuilder
kind: struct
captured: 2026-05-02
---

# TabContentBuilder

A result builder that constructs tabs for a tab view that supports programmatic selection. This builder requires that all tabs in the tab view have the same selection type.

## Declaration

```swift
@resultBuilder struct TabContentBuilder<TabValue> where TabValue : Hashable
```









## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Structures

- `TabContentBuilder.Content`

### Type Methods

- `buildBlock(_:)`
- `buildBlock(_:_:)`
- `buildBlock(_:_:_:)`
- `buildBlock(_:_:_:_:)`
- `buildBlock(_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:_:_:)`
- `buildEither(first:)`
- `buildEither(second:)`
- `buildExpression(_:)`
- `buildIf(_:)`
- `buildLimitedAvailability(_:)`

## See Also

- `sectionActions(content:)`
- `TabPlacement`
- `TabContent`
- `AnyTabContent`
