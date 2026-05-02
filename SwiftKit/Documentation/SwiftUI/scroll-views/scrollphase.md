---
url: https://developer.apple.com/documentation/swiftui/scrollphase
framework: SwiftUI
category: Scroll views
title: ScrollPhase
kind: enum
captured: 2026-05-02
---

# ScrollPhase

A type that describes the state of a scroll gesture of a scrollable view like a scroll view.

## Declaration

```swift
@frozen enum ScrollPhase
```

### Overview

A scroll gesture can be in one of four phases: - idle: No active scroll is occurring. - panning: An active scroll being driven by the user is occurring. - decelerating: The user has stopped driving a scroll and the scroll view is decelerating to its final target. - animating: The system is animating to a final target as a result of a programmatic animated scroll from using a `ScrollViewReader` or `View/scrollPosition(id:anchor:)` modifier.

SwiftUI provides you a value of this type when using the `View/onScrollPhaseChange(_:)` modifier.





## Relationships

**Conforms To**: `BitwiseCopyable`, `Copyable`, `CustomDebugStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Getting scroll gesture states

- `ScrollPhase.animating`
- `ScrollPhase.decelerating`
- `ScrollPhase.idle`
- `ScrollPhase.interacting`
- `ScrollPhase.tracking`

### Checking for active scrolling

- `isScrolling`

## See Also

- `onScrollGeometryChange(for:of:action:)`
- `onScrollTargetVisibilityChange(idType:threshold:_:)`
- `onScrollVisibilityChange(threshold:_:)`
- `onScrollPhaseChange(_:)`
- `ScrollGeometry`
- `ScrollPhaseChangeContext`
