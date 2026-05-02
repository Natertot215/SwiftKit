---
url: https://developer.apple.com/documentation/swiftui/view/digitalcrownaccessory(_:)
framework: SwiftUI
category: Input events
title: digitalCrownAccessory(_:)
kind: method
captured: 2026-05-02
---

# digitalCrownAccessory(_:)

Specifies the visibility of Digital Crown accessory Views on Apple Watch.

## Declaration

```swift
nonisolated func digitalCrownAccessory(_ visibility: Visibility) -> some View

```

### Discussion

Use this method to customize the visibility of a Digital Crown accessory `View` created with the `View/digitalCrownAccessory(_ content:)` modifier. You may want to keep an accessory visible even when the Digital Crown Indicator is not visible to indicate what scrolling the crown will do.

## Parameters

- **visibility**: The visibility of the digital crown accessory.





## Availability

- watchOS 9.0



## See Also

- `digitalCrownAccessory(content:)`
- `digitalCrownRotation(_:from:through:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:onChange:onIdle:)`
- `digitalCrownRotation(detent:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:)`
- `digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:)`
- `DigitalCrownEvent`
- `DigitalCrownRotationalSensitivity`
