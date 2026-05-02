---
url: https://developer.apple.com/documentation/swiftui/digitalcrownrotationalsensitivity
framework: SwiftUI
category: Input events
title: DigitalCrownRotationalSensitivity
kind: enum
captured: 2026-05-02
---

# DigitalCrownRotationalSensitivity

The amount of Digital Crown rotation needed to move between two integer numbers.

## Declaration

```swift
enum DigitalCrownRotationalSensitivity
```

### Overview

You may need to experiment to find the level of sensitivity that works for your use case.





## Relationships

**Conforms To**: `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- watchOS 6.0

## Topics

### Getting sensitivity options

- `DigitalCrownRotationalSensitivity.low`
- `DigitalCrownRotationalSensitivity.medium`
- `DigitalCrownRotationalSensitivity.high`

## See Also

- `digitalCrownAccessory(_:)`
- `digitalCrownAccessory(content:)`
- `digitalCrownRotation(_:from:through:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:onChange:onIdle:)`
- `digitalCrownRotation(detent:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:)`
- `digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:)`
- `DigitalCrownEvent`
