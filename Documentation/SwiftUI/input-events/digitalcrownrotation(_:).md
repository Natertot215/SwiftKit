---
url: https://developer.apple.com/documentation/swiftui/view/digitalcrownrotation(_:)
framework: SwiftUI
category: Input events
title: digitalCrownRotation(_:)
kind: method
captured: 2026-05-02
---

# digitalCrownRotation(_:)

Tracks Digital Crown rotations by updating the specified binding.

## Declaration

```swift
nonisolated func digitalCrownRotation<V>(_ binding: Binding<V>) -> some View where V : BinaryFloatingPoint

```

### Discussion

Use this method to receive values on a binding you provide as the user turns the Digital Crown on Apple Watch. The example below receives changes to the binding value, starting at `0.0` and incrementing or decrementing depending on the direction that the user turns the Digital Crown:

```swift
struct DigitalCrown: View {
    @State private var crownValue = 0.0

    var body: some View {
        Text("Received Value:\(crownValue, specifier: "%.1f")")
            .focusable()
            .digitalCrownRotation($crownValue)
    }
}
```

## Parameters

- **binding**: A binding to a value that updates as the user rotates the Digital Crown. The implicit range is `(-infinity, +infinity)`.





## Availability

- watchOS 6.0



## See Also

- `digitalCrownAccessory(_:)`
- `digitalCrownAccessory(content:)`
- `digitalCrownRotation(_:from:through:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:onChange:onIdle:)`
- `digitalCrownRotation(detent:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:)`
- `DigitalCrownEvent`
- `DigitalCrownRotationalSensitivity`
