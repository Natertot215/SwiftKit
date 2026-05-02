---
url: https://developer.apple.com/documentation/appkit/nsevent/eventtypemask/init(type:)
framework: AppKit
category: Mouse, keyboard, and trackpad
title: init(type:)
kind: init
captured: 2026-05-02
---

# init(type:)

Returns the event mask for the specified type.

## Declaration

```swift
init(type: NSEvent.EventType)
```

### Return Value

The event mask corresponding to the specified type. The returned mask is equivalent to the number 1 left-shifted by `type` bits.

## Parameters

- **type**: The event type whose mask you want to get.





## Availability

- macOS ?



## See Also

- `NSEvent.EventTypeMask`
- `NSEvent.ButtonMask`
- `NSEvent.ModifierFlags`
- `NSEvent.Phase`
- `NSEvent.SwipeTrackingOptions`
