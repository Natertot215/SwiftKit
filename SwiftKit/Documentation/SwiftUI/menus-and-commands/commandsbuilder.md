---
url: https://developer.apple.com/documentation/swiftui/commandsbuilder
framework: SwiftUI
category: Menus and commands
title: CommandsBuilder
kind: struct
captured: 2026-05-02
---

# CommandsBuilder

Constructs command sets from multi-expression closures. Like `ViewBuilder`, it supports up to ten expressions in the closure body.

## Declaration

```swift
@resultBuilder struct CommandsBuilder
```









## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0

## Topics

### Building content

- `buildBlock()`
- `buildBlock(_:)`
- `buildBlock(_:_:)`
- `buildBlock(_:_:_:)`
- `buildBlock(_:_:_:_:)`
- `buildBlock(_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:_:)`
- `buildBlock(_:_:_:_:_:_:_:_:_:_:)`

### Building conditionally

- `buildEither(first:)`
- `buildEither(second:)`
- `buildIf(_:)`
- `buildLimitedAvailability(_:)`
- `buildExpression(_:)`

## See Also

- `commands(content:)`
- `commandsRemoved()`
- `commandsReplaced(content:)`
- `Commands`
- `CommandMenu`
- `CommandGroup`
- `CommandGroupPlacement`
