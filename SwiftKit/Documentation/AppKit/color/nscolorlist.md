---
url: https://developer.apple.com/documentation/appkit/nscolorlist
framework: AppKit
category: Color
title: NSColorList
kind: class
captured: 2026-05-02
---

# NSColorList

An ordered list of color objects, identified by keys.

## Declaration

```swift
class NSColorList
```

### Overview

A color list manages a list of `NSColor` objects, each of which has an associated name. The `NSColorPanel` list mode color picker uses instances of `NSColorList` to represent any lists of colors that come with the system, as well as any lists the user creates. An app can use a color list to manage document-specific color lists.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `NSSecureCoding`

## Availability

- macOS ?

## Topics

### Creating Lists of Colors

- `init(name:)`
- `init(name:fromFile:)`

### Getting Lists of Colors

- `availableColorLists`
- `init(named:)`

### Getting Information About Lists of Colors

- `name`
- `NSColorList.Name`
- `isEditable`

### Managing Colors By Key

- `allKeys`
- `color(withKey:)`
- `insertColor(_:key:at:)`
- `removeColor(withKey:)`
- `setColor(_:forKey:)`

### Writing and Removing Color List Files

- `write(to:)`
- `removeFile()`
- `write(toFile:)`

### Notifications

- `didChangeNotification`

### Initializers

- `init(coder:)`

## See Also

- `NSColor`
- `NSColorSpace`
