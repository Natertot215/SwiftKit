---
url: https://developer.apple.com/documentation/appkit/nsbrowsercell
framework: AppKit
category: Views and controls
title: NSBrowserCell
kind: class
captured: 2026-05-02
---

# NSBrowserCell

The user interface of a browser.

## Declaration

```swift
class NSBrowserCell
```

### Overview

The `NSBrowserCell` class is the subclass of `NSCell` used by default to display data in the columns of an `NSBrowser` object. (Each column contains an `NSMatrix` object filled with `NSBrowserCell` objects.)





## Relationships

**Inherits From**: `NSCell`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `NSUserInterfaceItemIdentification`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Getting Browser Cell Information

- `branchImage`
- `highlightedBranchImage`

### Configuring Browser Cells

- `image`
- `alternateImage`

### Managing Browser Cell State

- `reset()`
- `set()`
- `isLeaf`
- `isLoaded`
- `highlightColor(in:)`

### Initializers

- `init(coder:)`
- `init(imageCell:)`
- `init(textCell:)`
