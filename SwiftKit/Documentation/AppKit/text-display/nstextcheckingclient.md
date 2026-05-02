---
url: https://developer.apple.com/documentation/appkit/nstextcheckingclient
framework: AppKit
category: Text display
title: NSTextCheckingClient
kind: protocol
captured: 2026-05-02
---

# NSTextCheckingClient


## Declaration

```swift
protocol NSTextCheckingClient : NSTextInputClient, NSTextInputTraits
```







## Relationships

**Inherits From**: `NSTextInputClient`, `NSTextInputTraits`

## Availability

- macOS ?

## Topics

### Instance Methods

- `addAnnotations(_:range:)`
- `annotatedSubstring(forProposedRange:actualRange:)`
- `candidateListTouchBarItem()`
- `removeAnnotation(_:range:)`
- `replaceCharacters(in:withAnnotatedString:)`
- `selectAndShow(_:)`
- `setAnnotations(_:range:)`
- `view(for:firstRect:actualRange:)`

## See Also

- `NSTextCheckingController`
- `NSTextInputTraits`
- `NSTextInputTraitType`
