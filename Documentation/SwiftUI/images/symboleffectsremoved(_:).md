---
url: https://developer.apple.com/documentation/swiftui/view/symboleffectsremoved(_:)
framework: SwiftUI
category: Images
title: symbolEffectsRemoved(_:)
kind: method
captured: 2026-05-02
---

# symbolEffectsRemoved(_:)

Returns a new view with its inherited symbol image effects either removed or left unchanged.

## Declaration

```swift
nonisolated func symbolEffectsRemoved(_ isEnabled: Bool = true) -> some View

```

### Return Value

A copy of the view with its symbol effects either removed or left unchanged.

### Discussion

The following example adds a repeating pulse effect to two symbol images, but then disables the effect on one of them:

```swift
VStack {
    Image(systemName: "bolt.slash.fill") // does not pulse
        .symbolEffectsRemoved()
    Image(systemName: "folder.fill.badge.person.crop") // pulses
}
.symbolEffect(.pulse)
```

## Parameters

- **isEnabled**: Whether to remove inherited symbol effects or not.





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `symbolEffect(_:options:isActive:)`
- `symbolEffect(_:options:value:)`
- `SymbolEffectTransition`
