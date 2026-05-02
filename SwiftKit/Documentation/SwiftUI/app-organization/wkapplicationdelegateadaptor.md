---
url: https://developer.apple.com/documentation/swiftui/wkapplicationdelegateadaptor
framework: SwiftUI
category: App organization
title: WKApplicationDelegateAdaptor
kind: struct
captured: 2026-05-02
---

# WKApplicationDelegateAdaptor

A property wrapper that is used in `App` to provide a delegate from WatchKit.

## Declaration

```swift
@MainActor @preconcurrency @propertyWrapper struct WKApplicationDelegateAdaptor<DelegateType> where DelegateType : NSObject, DelegateType : WKApplicationDelegate
```







## Relationships

**Conforms To**: `DynamicProperty`, `Sendable`, `SendableMetatype`

## Availability

- watchOS 7.0

## Topics

### Creating a delegate adaptor

- `init(_:)`

### Getting the delegate adaptor

- `projectedValue`
- `wrappedValue`

## See Also

- `WKExtensionDelegateAdaptor`
