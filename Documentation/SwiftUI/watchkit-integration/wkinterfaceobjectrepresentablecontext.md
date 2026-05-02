---
url: https://developer.apple.com/documentation/swiftui/wkinterfaceobjectrepresentablecontext
framework: SwiftUI
category: WatchKit integration
title: WKInterfaceObjectRepresentableContext
kind: struct
captured: 2026-05-02
---

# WKInterfaceObjectRepresentableContext

Contextual information about the state of the system that you use to create and update your WatchKit interface object.

## Declaration

```swift
@MainActor @preconcurrency struct WKInterfaceObjectRepresentableContext<Representable> where Representable : WKInterfaceObjectRepresentable
```

### Overview

A `WKInterfaceObjectRepresentableContext` structure contains details about the current state of the system. When creating and updating your interface objects, the system creates one of these structures and passes it to the appropriate method of your custom `WKInterfaceObjectRepresentable` instance. Use the information in this structure to configure your object. Don’t create this structure yourself.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- watchOS 6.0

## Topics

### Coordinating interactions

- `coordinator`
- `transaction`

### Getting the current environment data

- `environment`

## See Also

- `WKInterfaceObjectRepresentable`
