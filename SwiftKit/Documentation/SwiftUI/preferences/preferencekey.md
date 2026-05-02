---
url: https://developer.apple.com/documentation/swiftui/preferencekey
framework: SwiftUI
category: Preferences
title: PreferenceKey
kind: protocol
captured: 2026-05-02
---

# PreferenceKey

A named value produced by a view.

## Declaration

```swift
protocol PreferenceKey
```

### Overview

A view with multiple children automatically combines its values for a given preference into a single value visible to its ancestors.





## Relationships

**Conforming Types**: `PreferredColorSchemeKey`, `Text.LayoutKey`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting the default value

- `defaultValue`
- `Value`

### Combining preferences

- `reduce(value:nextValue:)`
