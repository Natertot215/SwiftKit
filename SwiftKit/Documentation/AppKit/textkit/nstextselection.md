---
url: https://developer.apple.com/documentation/appkit/nstextselection
framework: AppKit
category: TextKit
title: NSTextSelection
kind: class
captured: 2026-05-02
---

# NSTextSelection

A class that represents a single logical selection context that corresponds to an insertion point.

## Declaration

```swift
class NSTextSelection
```







## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS 12.0

## Topics

### Creating a text selection

- `init(_:affinity:)`
- `init(range:affinity:granularity:)`
- `init(_:affinity:granularity:)`
- `init(coder:)`

### Characteristics of a selection

- `affinity`
- `NSTextSelection.Affinity`
- `anchorPositionOffset`
- `granularity`
- `NSTextSelection.Granularity`
- `isLogical`
- `isTransient`
- `secondarySelectionLocation`
- `NSTextLocation`
- `textRanges`
- `typingAttributes`

### Creating subselections

- `textSelection(_:)`

### Initializers

- `init(location:affinity:)`
- `init(ranges:affinity:granularity:)`

## See Also

- `NSTextRange`
- `NSTextSelectionNavigation`
- `NSTextLocation`
