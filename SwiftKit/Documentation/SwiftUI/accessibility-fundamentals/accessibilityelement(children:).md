---
url: https://developer.apple.com/documentation/swiftui/view/accessibilityelement(children:)
framework: SwiftUI
category: Accessibility fundamentals
title: accessibilityElement(children:)
kind: method
captured: 2026-05-02
---

# accessibilityElement(children:)

Creates a new accessibility element, or modifies the `AccessibilityChildBehavior` of the existing accessibility element.

## Declaration

```swift
nonisolated func accessibilityElement(children: AccessibilityChildBehavior = .ignore) -> some View

```

### Discussion

See also:

- `AccessibilityChildBehavior/ignore`
- `AccessibilityChildBehavior/combine`
- `AccessibilityChildBehavior/contain`

## Parameters

- **children**: The behavior to use when creating or transforming an accessibility element. The default is `AccessibilityChildBehavior/ignore`





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `accessibilityChildren(children:)`
- `accessibilityRepresentation(representation:)`
- `AccessibilityChildBehavior`
