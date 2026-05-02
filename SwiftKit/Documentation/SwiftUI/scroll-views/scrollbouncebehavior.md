---
url: https://developer.apple.com/documentation/swiftui/scrollbouncebehavior
framework: SwiftUI
category: Scroll views
title: ScrollBounceBehavior
kind: struct
captured: 2026-05-02
---

# ScrollBounceBehavior

The ways that a scrollable view can bounce when it reaches the end of its content.

## Declaration

```swift
struct ScrollBounceBehavior
```

### Overview

Use the `View/scrollBounceBehavior(_:axes:)` view modifier to set a value of this type for a scrollable view, like a `ScrollView` or a `List`. The value configures the bounce behavior when people scroll to the end of the view’s content.

You can configure each scrollable axis to use a different bounce mode.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 16.4
- iPadOS 16.4
- Mac Catalyst 16.4
- macOS 13.3
- tvOS 16.4
- visionOS 1.0
- watchOS 9.4

## Topics

### Bounce behaviors

- `automatic`
- `always`
- `basedOnSize`

## See Also

- `scrollBounceBehavior(_:axes:)`
- `horizontalScrollBounceBehavior`
- `verticalScrollBounceBehavior`
