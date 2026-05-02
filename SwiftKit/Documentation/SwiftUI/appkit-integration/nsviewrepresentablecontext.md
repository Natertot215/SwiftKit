---
url: https://developer.apple.com/documentation/swiftui/nsviewrepresentablecontext
framework: SwiftUI
category: AppKit integration
title: NSViewRepresentableContext
kind: struct
captured: 2026-05-02
---

# NSViewRepresentableContext

Contextual information about the state of the system that you use to create and update your AppKit view.

## Declaration

```swift
@MainActor @preconcurrency struct NSViewRepresentableContext<View> where View : NSViewRepresentable
```

### Overview

An `NSViewRepresentableContext` structure contains details about the current state of the system. When creating and updating your view, the system creates one of these structures and passes it to the appropriate method of your custom `NSViewRepresentable` instance. Use the information in this structure to configure your view. For example, use the provided environment values to configure the appearance of your view. Don’t create this structure yourself.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- macOS 10.15

## Topics

### Coordinating view-related interactions

- `coordinator`
- `transaction`

### Getting the current environment data

- `environment`

### Instance Methods

- `animate(changes:completion:)`

## See Also

- `NSViewRepresentable`
- `NSViewControllerRepresentable`
- `NSViewControllerRepresentableContext`
