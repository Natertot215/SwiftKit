---
url: https://developer.apple.com/documentation/swiftui/asyncimagephase
framework: SwiftUI
category: Images
title: AsyncImagePhase
kind: enum
captured: 2026-05-02
---

# AsyncImagePhase

The current phase of the asynchronous image loading operation.

## Declaration

```swift
enum AsyncImagePhase
```

### Overview

When you create an `AsyncImage` instance with the `AsyncImage/init(url:scale:transaction:content:)` initializer, you define the appearance of the view using a `content` closure. SwiftUI calls the closure with a phase value at different points during the load operation to indicate the current state. Use the phase to decide what to draw. For example, you can draw the loaded image if it exists, a view that indicates an error, or a placeholder:

```swift
AsyncImage(url: URL(string: "https://example.com/icon.png")) { phase in
    if let image = phase.image {
        image // Displays the loaded image.
    } else if phase.error != nil {
        Color.red // Indicates an error.
    } else {
        Color.blue // Acts as a placeholder.
    }
}
```





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting load phases

- `AsyncImagePhase.empty`
- `AsyncImagePhase.success(_:)`
- `AsyncImagePhase.failure(_:)`

### Getting the image

- `image`

### Getting the error

- `error`

## See Also

- `AsyncImage`
