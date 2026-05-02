---
url: https://developer.apple.com/documentation/swiftui/contentshapekinds
framework: SwiftUI
category: Input events
title: ContentShapeKinds
kind: struct
captured: 2026-05-02
---

# ContentShapeKinds

A kind for the content shape of a view.

## Declaration

```swift
struct ContentShapeKinds
```

### Overview

The kind is used by the system to influence various effects, hit-testing, and more.





## Relationships

**Conforms To**: `Equatable`, `ExpressibleByArrayLiteral`, `OptionSet`, `RawRepresentable`, `Sendable`, `SendableMetatype`, `SetAlgebra`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting shape kinds

- `interaction`
- `dragPreview`
- `contextMenuPreview`
- `focusEffect`
- `hoverEffect`
- `accessibility`

### Creating a set of options

- `init(rawValue:)`

## See Also

- `allowsTightening(_:)`
- `contentShape(_:eoFill:)`
- `contentShape(_:_:eoFill:)`
