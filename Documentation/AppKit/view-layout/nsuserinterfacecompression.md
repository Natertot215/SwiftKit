---
url: https://developer.apple.com/documentation/appkit/nsuserinterfacecompression
framework: AppKit
category: View layout
title: NSUserInterfaceCompression
kind: protocol
captured: 2026-05-02
---

# NSUserInterfaceCompression

A protocol that describes how a UI control should redisplay when space is restricted.

## Declaration

```swift
protocol NSUserInterfaceCompression
```

### Overview

A control that adopts this protocol has the ability to resize itself when space is at a premium.





## Relationships

**Conforming Types**: `NSButton`, `NSPopUpButton`, `NSSegmentedControl`, `NSStatusBarButton`

## Availability

- macOS ?

## Topics

### Compressing the UI

- `compress(withPrioritizedCompressionOptions:)`

### Querying Compression Status

- `minimumSize(withPrioritizedCompressionOptions:)`
- `activeCompressionOptions`
