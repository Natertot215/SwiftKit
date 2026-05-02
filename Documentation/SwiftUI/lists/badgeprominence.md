---
url: https://developer.apple.com/documentation/swiftui/badgeprominence
framework: SwiftUI
category: Lists
title: BadgeProminence
kind: struct
captured: 2026-05-02
---

# BadgeProminence

The visual prominence of a badge.

## Declaration

```swift
struct BadgeProminence
```

### Overview

Badges can be used for different kinds of information, from the passive number of items in a container to the number of required actions. The prominence of badges in Lists can be adjusted to reflect this and be made to draw more or less attention to themselves.

Badges will default to `standard` prominence unless specified.

The following example shows a `List` displaying a list of folders with an informational badge with lower prominence, showing the number of items in the folder.

```swift
List(folders) { folder in
    Text(folder.name)
        .badge(folder.numberOfItems)
}
.badgeProminence(.decreased)
```





## Relationships

**Conforms To**: `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0

## Topics

### Getting background prominence

- `standard`
- `increased`
- `decreased`

## See Also

- `badge(_:)`
- `badgeProminence(_:)`
- `badgeProminence`
