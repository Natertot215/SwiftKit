---
url: https://developer.apple.com/documentation/swiftui/view/upperlimbvisibility(_:)
framework: SwiftUI
category: Immersive spaces
title: upperLimbVisibility(_:)
kind: method
captured: 2026-05-02
---

# upperLimbVisibility(_:)

Sets the preferred visibility of the user’s upper limbs, while an `ImmersiveSpace` scene is presented.

## Declaration

```swift
nonisolated func upperLimbVisibility(_ preferredVisibility: Visibility) -> some View

```

### Discussion

The system can show the user’s upper limbs during fully immersive experiences, but you can also hide them, for example, in order to display virtual hands instead.

Note that this modifier only sets a preference and ultimately the system will decide if it will honor it or not. The system may be unable to honor the preference if the immersive space is currently not visible.

## Parameters

- **preferredVisibility**: A value indicating if the upper limbs should be visible. Use `.automatic` for a system-defined standard behavior, `.visible` to keep the upper limbs visible, and `.hidden` to hide the upper limbs.





## Availability

- visionOS 1.0



## See Also

- `upperLimbVisibility(_:)`
