---
url: https://developer.apple.com/documentation/swiftui/dynamicproperty
framework: SwiftUI
category: Model data
title: DynamicProperty
kind: protocol
captured: 2026-05-02
---

# DynamicProperty

An interface for a stored variable that updates an external property of a view.

## Declaration

```swift
protocol DynamicProperty
```

### Overview

The view gives values to these properties prior to recomputing the view’s `View/body-8kl5o`.





## Relationships

**Conforming Types**: `AccessibilityFocusState`, `AppStorage`, `Binding`, `Environment`, `EnvironmentObject`, `FetchRequest`, `FocusState`, `FocusedBinding`, `FocusedObject`, `FocusedValue`, `GestureState`, `NSApplicationDelegateAdaptor`, `Namespace`, `ObservedObject`, `PhysicalMetric`, `ScaledMetric`, `SceneStorage`, `SectionedFetchRequest`, `State`, `StateObject`, `UIApplicationDelegateAdaptor`, `WKApplicationDelegateAdaptor`, `WKExtensionDelegateAdaptor`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Updating the value

- `update()`
