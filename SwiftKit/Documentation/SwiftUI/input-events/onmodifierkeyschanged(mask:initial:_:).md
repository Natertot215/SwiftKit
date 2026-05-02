---
url: https://developer.apple.com/documentation/swiftui/view/onmodifierkeyschanged(mask:initial:_:)
framework: SwiftUI
category: Input events
title: onModifierKeysChanged(mask:initial:_:)
kind: method
captured: 2026-05-02
---

# onModifierKeysChanged(mask:initial:_:)

Performs an action whenever the user presses or releases a hardware modifier key.

## Declaration

```swift
nonisolated func onModifierKeysChanged(mask: EventModifiers = .all, initial: Bool = true, _ action: @escaping (EventModifiers, EventModifiers) -> Void) -> some View

```

### Return Value

A modified view that updates when hardware modifier keys change.

### Discussion

If a mask is provided, updates will only occur when they involve a change in one of the keys included in the mask. The default mask includes all modifier keys.

```swift
ContentView()
    .onModifierKeysChanged(mask: .option) { old, new in
        if new.isEmpty {
            // Option key released
            ...
        } else {
            // Option key pressed
            ...
        }
    }
```

When the view first appears, SwiftUI will check the state of the modifier keys and call the provided action if any matched keys are pressed. Otherwise, the first call will come the first time the user presses a matched modifier key down. When multiple keyboards are in use at the same time, the updates emitted by the stream reflect the combined set of all modifier keys being held down on all attached keyboards.

## Parameters

- **mask**: A set of modifier keys controlling which keys to observe for changes. The default mask includes all keys.
- **action**: A closure to receive updates when modifier key press state changes. The closure receives the old and new values as input.





## Availability

- macOS 15.0



## See Also

- `modifierKeyAlternate(_:_:)`
