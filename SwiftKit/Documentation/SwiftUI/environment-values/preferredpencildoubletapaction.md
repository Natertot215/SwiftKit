---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/preferredpencildoubletapaction
framework: SwiftUI
category: Environment values
title: preferredPencilDoubleTapAction
kind: property
captured: 2026-05-02
---

# preferredPencilDoubleTapAction

The action that the user prefers to perform after double-tapping their Apple Pencil, as selected in the Settings app.

## Declaration

```swift
var preferredPencilDoubleTapAction: PencilPreferredAction { get }
```

### Discussion

You can read this value by creating a property with the `Environment` property wrapper and using it inside the action closure of the `View/onPencilDoubleTap(perform:)` view modifier as an indication of what to do after the user double-taps their Apple Pencil:

```swift
@Environment(\.preferredPencilDoubleTapAction) private var preferredAction

var body: some View {
    MyDrawingCanvas()
        .onPencilDoubleTap { value in
            switch preferredAction {
                ...
            }
        }
}
```

In macOS, this value cannot be changed by users and is always set to `PencilPreferredAction/switchEraser`.







## Availability

- iOS 17.5
- iPadOS 17.5
- Mac Catalyst 17.5
- macOS 14.5
- visionOS 26.2



## See Also

- `onPencilDoubleTap(perform:)`
- `onPencilSqueeze(perform:)`
- `preferredPencilSqueezeAction`
- `PencilPreferredAction`
- `PencilDoubleTapGestureValue`
- `PencilSqueezeGestureValue`
- `PencilSqueezeGesturePhase`
- `PencilHoverPose`
