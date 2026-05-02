---
url: https://developer.apple.com/documentation/appkit/nscustomimagerep
framework: AppKit
category: Images and PDF
title: NSCustomImageRep
kind: class
captured: 2026-05-02
---

# NSCustomImageRep

An object that uses a delegate object to render an image from a custom format.

## Declaration

```swift
class NSCustomImageRep
```

### Overview

When called upon to produce an image, an `NSCustomImageRep` sends a message to its delegate to do the actual drawing. You can use this class to support custom image formats without going to the trouble of subclassing `NSImageRep` directly.





## Relationships

**Inherits From**: `NSImageRep`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSCopying`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS ?

## Topics

### Creating Representations of Images in Custom Formats

- `init(draw:delegate:)`
- `init(size:flipped:drawingHandler:)`

### Getting Drawing Handlers

- `drawingHandler`

### Getting Information About Images

- `delegate`
- `drawSelector`

### Initializers

- `init(drawSelector:delegate:)`
