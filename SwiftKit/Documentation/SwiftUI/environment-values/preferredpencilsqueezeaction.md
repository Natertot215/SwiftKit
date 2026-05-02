---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/preferredpencilsqueezeaction
framework: SwiftUI
category: Environment values
title: preferredPencilSqueezeAction
kind: property
captured: 2026-05-02
---

# preferredPencilSqueezeAction

The action that the user prefers to perform when squeezing their Apple Pencil, as selected in the Settings app.

## Declaration

```swift
var preferredPencilSqueezeAction: PencilPreferredAction { get }
```

### Discussion

You can read this value by creating a property with the `Environment` property wrapper and using it inside the action closure of the `View/onPencilSqueeze(perform:)` view modifier as an indication of what to do when the user squeezes their Apple Pencil:

```swift
@Environment(\.preferredPencilSqueezeAction) private var preferredAction

var body: some View {
    MyDrawingCanvas()
        .onPencilSqueeze { phase in
            switch (phase, preferredAction) {
                ...
            }
        }
}
```

In macOS, this value cannot be changed by users and is always set to `PencilPreferredAction/showContextualPalette`.







## Availability

- iOS 17.5
- iPadOS 17.5
- Mac Catalyst 17.5
- macOS 14.5
- visionOS 26.2



## See Also

- `onPencilDoubleTap(perform:)`
- `onPencilSqueeze(perform:)`
- `preferredPencilDoubleTapAction`
- `PencilPreferredAction`
- `PencilDoubleTapGestureValue`
- `PencilSqueezeGestureValue`
- `PencilSqueezeGesturePhase`
- `PencilHoverPose`
