---
url: https://developer.apple.com/documentation/swiftui/view/scrollinputbehavior(_:for:)
framework: SwiftUI
category: Scroll views
title: scrollInputBehavior(_:for:)
kind: method
captured: 2026-05-02
---

# scrollInputBehavior(_:for:)

Enables or disables scrolling in scrollable views when using particular inputs.

## Declaration

```swift
@MainActor @preconcurrency func scrollInputBehavior(_ behavior: ScrollInputBehavior, for input: ScrollInputKind) -> some View

```

### Discussion

In contrast to `View/scrollDisabled(_:)`, this modifier will enable or disable scrolling only for particular inputs. The following, for instance, disables double-tap-to-scroll on watchOS while preserving the ability to scroll via touch and the Digital Crown:

```swift
ScrollView(...)
    .scrollInputBehavior(.disabled, for: .handGestureShortcut)
```

If `scrollDisabled(true)` has been applied to this view, scrolling will be disabled for all inputs and this modifier cannot be used to re-enable scrolling.

## Parameters

- **behavior**: Whether scrolling should be enabled or disabled for this input.
- **input**: The input for which to enable or disable scrolling.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `ScrollInputKind`
- `ScrollInputBehavior`
