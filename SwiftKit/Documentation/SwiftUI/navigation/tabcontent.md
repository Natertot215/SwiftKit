---
url: https://developer.apple.com/documentation/swiftui/tabcontent
framework: SwiftUI
category: Navigation
title: TabContent
kind: protocol
captured: 2026-05-02
---

# TabContent

A type that provides content for programmatically selectable tabs in a tab view.

## Declaration

```swift
@MainActor @preconcurrency protocol TabContent<TabValue>
```

### Overview

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `AnyTabContent`, `ForEach`, `Group`, `Tab`, `TabSection`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Associated Types

- `Body`
- `TabValue`

### Instance Properties

- `body`

### Instance Methods

- `accessibilityHint(_:isEnabled:)`
- `accessibilityIdentifier(_:isEnabled:)`
- `accessibilityInputLabels(_:isEnabled:)`
- `accessibilityLabel(_:isEnabled:)`
- `accessibilityValue(_:isEnabled:)`
- `badge(_:)`
- `contextMenu(menuItems:)`
- `customizationBehavior(_:for:)`
- `customizationID(_:)`
- `defaultVisibility(_:for:)`
- `disabled(_:)`
- `draggable(_:)`
- `dropDestination(for:action:)`
- `hidden(_:)`
- `popover(isPresented:attachmentAnchor:arrowEdge:content:)`
- `popover(item:attachmentAnchor:arrowEdge:content:)`
- `sectionActions(content:)`
- `springLoadingBehavior(_:)`
- `swipeActions(edge:allowsFullSwipe:content:)`
- `tabPlacement(_:)`

## See Also

- `sectionActions(content:)`
- `TabPlacement`
- `TabContentBuilder`
- `AnyTabContent`
