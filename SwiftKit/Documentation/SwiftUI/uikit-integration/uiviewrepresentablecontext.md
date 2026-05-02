---
url: https://developer.apple.com/documentation/swiftui/uiviewrepresentablecontext
framework: SwiftUI
category: UIKit integration
title: UIViewRepresentableContext
kind: struct
captured: 2026-05-02
---

# UIViewRepresentableContext

Contextual information about the state of the system that you use to create and update your UIKit view.

## Declaration

```swift
@MainActor @preconcurrency struct UIViewRepresentableContext<Representable> where Representable : UIViewRepresentable
```

### Overview

A `UIViewRepresentableContext` structure contains details about the current state of the system. When creating and updating your view, the system creates one of these structures and passes it to the appropriate method of your custom `UIViewRepresentable` instance. Use the information in this structure to configure your view. For example, use the provided environment values to configure the appearance of your view. Don’t create this structure yourself.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- tvOS 13.0
- visionOS 1.0

## Topics

### Coordinating view-related interactions

- `coordinator`
- `transaction`

### Getting the current environment data

- `environment`

### Instance Methods

- `animate(changes:completion:)`

## See Also

- `UIViewRepresentable`
- `UIViewControllerRepresentable`
- `UIViewControllerRepresentableContext`
