---
url: https://developer.apple.com/documentation/swiftui/backgroundprominence
framework: SwiftUI
category: Lists
title: BackgroundProminence
kind: struct
captured: 2026-05-02
---

# BackgroundProminence

The prominence of backgrounds underneath other views.

## Declaration

```swift
struct BackgroundProminence
```

### Overview

Background prominence should influence foreground styling to maintain sufficient contrast against the background. For example, selected rows in a `List` and `Table` can have increased prominence backgrounds with accent color fills when focused; the foreground content above the background should be adjusted to reflect that level of prominence.

This can be read and written for views with the `EnvironmentValues.backgroundProminence` property.





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting background prominence

- `standard`
- `increased`

## See Also

- `listRowBackground(_:)`
- `alternatingRowBackgrounds(_:)`
- `AlternatingRowBackgroundBehavior`
- `backgroundProminence`
