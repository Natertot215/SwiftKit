---
url: https://developer.apple.com/documentation/swiftui/nsviewcontrollerrepresentablecontext
framework: SwiftUI
category: AppKit integration
title: NSViewControllerRepresentableContext
kind: struct
captured: 2026-05-02
---

# NSViewControllerRepresentableContext

Contextual information about the state of the system that you use to create and update your AppKit view controller.

## Declaration

```swift
@MainActor @preconcurrency struct NSViewControllerRepresentableContext<ViewController> where ViewController : NSViewControllerRepresentable
```

### Overview

An `NSViewControllerRepresentableContext` structure contains details about the current state of the system. When creating and updating your view controller, the system creates one of these structures and passes it to the appropriate method of your custom `NSViewControllerRepresentable` instance. Use the information in this structure to configure your view controller. For example, use the provided environment values to configure the appearance of your view controller and views. Don’t create this structure yourself.





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
- `NSViewRepresentableContext`
- `NSViewControllerRepresentable`
