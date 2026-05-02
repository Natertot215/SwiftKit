---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/isscenecaptured
framework: SwiftUI
category: Environment values
title: isSceneCaptured
kind: property
captured: 2026-05-02
---

# isSceneCaptured

The current capture state.

## Declaration

```swift
var isSceneCaptured: Bool { get set }
```

### Discussion

Use this value to determine whether the scene is actively being cloned to another destination (like during AirPlay) or is being mirrored or recorded.

Your app can respond to changes in this value to take appropriate action, like obscuring content.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- visionOS 1.0



## See Also

- `Designing your app for the Always On state`
- `privacySensitive(_:)`
- `redacted(reason:)`
- `unredacted()`
- `redactionReasons`
- `RedactionReasons`
