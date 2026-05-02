---
url: https://developer.apple.com/documentation/appkit/nsmutablefontcollection
framework: AppKit
category: Fonts
title: NSMutableFontCollection
kind: class
captured: 2026-05-02
---

# NSMutableFontCollection

A mutable collection of font descriptors taken together as a single object.

## Declaration

```swift
class NSMutableFontCollection
```

### Overview

You can use this class to modify the search queries for the font descriptors used by the parent `NSFontCollection` class.





## Relationships

**Inherits From**: `NSFontCollection`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSMutableCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.7

## Topics

### Creating a Font Collection

- `init(descriptors:)`
- `init(locale:)`
- `init(name:)`
- `init(name:visibility:)`
- `withAllAvailableDescriptors`

### Getting the Font Descriptors

- `queryDescriptors`
- `addQuery(for:)`
- `removeQuery(for:)`
- `exclusionDescriptors`

## See Also

- `NSFontManager`
- `NSFontCollection`
- `NSFontCollectionOptions`
