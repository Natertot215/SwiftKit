---
url: https://developer.apple.com/documentation/swiftui/submittriggers
framework: SwiftUI
category: Input events
title: SubmitTriggers
kind: struct
captured: 2026-05-02
---

# SubmitTriggers

A type that defines various triggers that result in the firing of a submission action.

## Declaration

```swift
struct SubmitTriggers
```

### Overview

These triggers may be provided to the `View/onSubmit(of:_:)` modifier to alter which types of user behaviors trigger a provided submission action.





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

### Getting submit triggers

- `search`
- `text`

### Creating a set of options

- `init(rawValue:)`

## See Also

- `onSubmit(of:_:)`
- `submitScope(_:)`
