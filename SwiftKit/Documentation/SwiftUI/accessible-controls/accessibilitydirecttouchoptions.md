---
url: https://developer.apple.com/documentation/swiftui/accessibilitydirecttouchoptions
framework: SwiftUI
category: Accessible controls
title: AccessibilityDirectTouchOptions
kind: struct
captured: 2026-05-02
---

# AccessibilityDirectTouchOptions

An option set that defines the functionality of a view’s direct touch area.

## Declaration

```swift
struct AccessibilityDirectTouchOptions
```







## Relationships

**Conforms To**: `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0

## Topics

### Getting the options

- `requiresActivation`
- `silentOnTouch`

### Creating a set of options

- `init(rawValue:)`

## See Also

- `accessibilityActivationPoint(_:)`
- `accessibilityActivationPoint(_:isEnabled:)`
- `accessibilityDragPoint(_:description:)`
- `accessibilityDragPoint(_:description:isEnabled:)`
- `accessibilityDropPoint(_:description:)`
- `accessibilityDropPoint(_:description:isEnabled:)`
- `accessibilityDirectTouch(_:options:)`
- `accessibilityZoomAction(_:)`
- `AccessibilityZoomGestureAction`
