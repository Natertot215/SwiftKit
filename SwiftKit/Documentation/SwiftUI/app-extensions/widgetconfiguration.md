---
url: https://developer.apple.com/documentation/swiftui/widgetconfiguration
framework: SwiftUI
category: App extensions
title: WidgetConfiguration
kind: protocol
captured: 2026-05-02
---

# WidgetConfiguration

A type that describes a widget’s content.

## Declaration

```swift
@MainActor @preconcurrency protocol WidgetConfiguration
```

### Overview

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is included in the type’s base declaration:

```swift
struct MyCustomType: Transition {
    // `@preconcurrency @MainActor` isolation by default
}
```

Isolation to the main actor is the default, but it’s not required. Declare the conformance in an extension to opt out of main actor isolation:

```swift
extension MyCustomType: Transition {
    // `nonisolated` by default
}
```





## Relationships

**Conforming Types**: `EmptyWidgetConfiguration`, `LimitedAvailabilityConfiguration`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Implementing a widget

- `body`
- `Body`

### Setting a name

- `configurationDisplayName(_:)`

### Setting a description

- `description(_:)`

### Setting the appearance

- `supportedFamilies(_:)`
- `contentMarginsDisabled()`
- `disfavoredLocations(_:for:)`
- `containerBackgroundRemovable(_:)`

### Managing background tasks

- `backgroundTask(_:action:)`
- `onBackgroundURLSessionEvents(matching:_:)`

### Instance Methods

- `associatedKind(_:)`
- `promptsForUserConfiguration()`
- `pushHandler(_:)`
- `supplementalActivityFamilies(_:)`
- `supportedMountingStyles(_:)`
- `widgetTexture(_:)`

## See Also

- `Building Widgets Using WidgetKit and SwiftUI`
- `Creating a widget extension`
- `Keeping a widget up to date`
- `Making a configurable widget`
- `Widget`
- `WidgetBundle`
- `LimitedAvailabilityConfiguration`
- `EmptyWidgetConfiguration`
