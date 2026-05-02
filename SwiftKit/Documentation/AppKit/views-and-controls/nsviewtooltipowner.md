---
url: https://developer.apple.com/documentation/appkit/nsviewtooltipowner
framework: AppKit
category: Views and controls
title: NSViewToolTipOwner
kind: protocol
captured: 2026-05-02
---

# NSViewToolTipOwner

A set of methods for dynamically associating a tool tip with a view.

## Declaration

```swift
protocol NSViewToolTipOwner : NSObjectProtocol
```

### Overview

Tool tips are hints displayed to the user when the mouse hovers over a view. Adopt this protocol in views for which you want to provide tool tips. If the view does not implement this protocol, the system uses the `NSObjectProtocol/description` method instead.





## Relationships

**Inherits From**: `NSObjectProtocol`

**Conforming Types**: `NSForm`, `NSMatrix`, `NSTableHeaderView`

## Availability

- macOS ?

## Topics

### Obtaining Tool Tip Strings

- `view(_:stringForToolTip:point:userData:)`
