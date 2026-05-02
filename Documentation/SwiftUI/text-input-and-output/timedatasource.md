---
url: https://developer.apple.com/documentation/swiftui/timedatasource
framework: SwiftUI
category: Text input and output
title: TimeDataSource
kind: struct
captured: 2026-05-02
---

# TimeDataSource

A source of time related data.

## Declaration

```swift
struct TimeDataSource<Value>
```

### Overview

Instances of this type provide `Text` with live and automatically updating values in Widgets, Live Activities, watchOS Complications, and of course regular apps.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Type Properties

- `currentDate`

### Type Methods

- `dateRange(endingAt:)`
- `dateRange(startingAt:)`
- `durationOffset(to:)`

## See Also

- `SystemFormatStyle`
