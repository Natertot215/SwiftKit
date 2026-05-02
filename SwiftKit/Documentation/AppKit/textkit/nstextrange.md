---
url: https://developer.apple.com/documentation/appkit/nstextrange
framework: AppKit
category: TextKit
title: NSTextRange
kind: class
captured: 2026-05-02
---

# NSTextRange

A class that represents a contiguous range between two locations inside document contents.

## Declaration

```swift
class NSTextRange
```

### Overview

An `NSTextRange` consists of the starting and terminating locations. There the two basic properties: `NSTextRange/location` and `NSTextRange/endLocation`, respectively. The terminating `NSTextRange/location`, `NSTextRange/endLocation`, is directly following the last location in the range. For example, a location contains a range if `(range.location <= location) && (location < range.endLocation)` is `true`.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 12.0

## Topics

### Creating a text range

- `init(location:)`
- `init(location:end:)`

### Characteristics of the text range

- `location`
- `endLocation`
- `isEmpty`

### Comparing text ranges

- `intersection(_:)`
- `intersects(_:)`
- `isEqual(to:)`
- `union(_:)`

### Finding text within the text range

- `contains(_:)`
- `contains(_:)`

### Initializers

- `init(location:endLocation:)`

## See Also

- `NSTextSelection`
- `NSTextSelectionNavigation`
- `NSTextLocation`
