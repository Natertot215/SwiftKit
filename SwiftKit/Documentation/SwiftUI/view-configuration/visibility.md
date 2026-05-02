---
url: https://developer.apple.com/documentation/swiftui/visibility
framework: SwiftUI
category: View configuration
title: Visibility
kind: enum
captured: 2026-05-02
---

# Visibility

The visibility of a UI element, chosen automatically based on the platform, current context, and other factors.

## Declaration

```swift
@frozen enum Visibility
```

### Overview

For example, the preferred visibility of list row separators can be configured using the `View/listRowSeparator(_:edges:)`.





## Relationships

**Conforms To**: `BitwiseCopyable`, `CaseIterable`, `Copyable`, `Equatable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting visibility options

- `Visibility.automatic`
- `Visibility.visible`
- `Visibility.hidden`

## See Also

- `labelsHidden()`
- `labelsVisibility(_:)`
- `labelsVisibility`
- `menuIndicator(_:)`
- `statusBarHidden(_:)`
- `persistentSystemOverlays(_:)`
