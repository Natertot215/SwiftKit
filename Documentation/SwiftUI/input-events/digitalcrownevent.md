---
url: https://developer.apple.com/documentation/swiftui/digitalcrownevent
framework: SwiftUI
category: Input events
title: DigitalCrownEvent
kind: struct
captured: 2026-05-02
---

# DigitalCrownEvent

An event emitted when the user rotates the Digital Crown.

## Declaration

```swift
struct DigitalCrownEvent
```

### Overview

Use the `View/digitalCrownRotation(_:)` modifier to receive these events.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- watchOS 9.0

## Topics

### Getting events

- `offset`
- `velocity`

## See Also

- `digitalCrownAccessory(_:)`
- `digitalCrownAccessory(content:)`
- `digitalCrownRotation(_:from:through:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:onChange:onIdle:)`
- `digitalCrownRotation(detent:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:)`
- `digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:)`
- `DigitalCrownRotationalSensitivity`
