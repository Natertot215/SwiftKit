---
url: https://developer.apple.com/documentation/swiftui/accessibilityheadinglevel
framework: SwiftUI
category: Accessible descriptions
title: AccessibilityHeadingLevel
kind: enum
captured: 2026-05-02
---

# AccessibilityHeadingLevel

The hierarchy of a heading in relation to other headings.

## Declaration

```swift
@frozen enum AccessibilityHeadingLevel
```

### Overview

Assistive technologies can use this to improve a user’s navigation through multiple headings. When users navigate through top level headings they expect the content for each heading to be unrelated.

For example, you can categorize a list of available products into sections, like Fruits and Vegetables. With only top level headings, this list requires no heading hierarchy, and you use the `AccessibilityHeadingLevel/unspecified` heading level. On the other hand, if sections contain subsections, like if the Fruits section has subsections for varieties of Apples, Pears, and so on, you apply the `AccessibilityHeadingLevel/h1` level to Fruits and Vegetables, and the `AccessibilityHeadingLevel/h2` level to Apples and Pears.

Except for `AccessibilityHeadingLevel/h1`, be sure to precede all leveled headings by another heading with a level that’s one less.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `Equatable`, `Escapable`, `Hashable`, `RawRepresentable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting the heading level

- `AccessibilityHeadingLevel.h1`
- `AccessibilityHeadingLevel.h2`
- `AccessibilityHeadingLevel.h3`
- `AccessibilityHeadingLevel.h4`
- `AccessibilityHeadingLevel.h5`
- `AccessibilityHeadingLevel.h6`
- `AccessibilityHeadingLevel.unspecified`

## See Also

- `accessibilityTextContentType(_:)`
- `accessibilityHeading(_:)`
- `AccessibilityTextContentType`
