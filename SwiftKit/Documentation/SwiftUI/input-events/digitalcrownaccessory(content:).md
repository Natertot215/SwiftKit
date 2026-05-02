---
url: https://developer.apple.com/documentation/swiftui/view/digitalcrownaccessory(content:)
framework: SwiftUI
category: Input events
title: digitalCrownAccessory(content:)
kind: method
captured: 2026-05-02
---

# digitalCrownAccessory(content:)

Places an accessory View next to the Digital Crown on Apple Watch.

## Declaration

```swift
nonisolated func digitalCrownAccessory<Content>(@ViewBuilder content: @escaping () -> Content) -> some View where Content : View

```

### Discussion

Use this method to place a custom `View` next to the Digital Crown on Apple Watch. Use `View/digitalCrownAccessory(_:)` to specify the visibility of your custom view.

```swift
struct ZoomingMapView: View {
    // Width of the map displayed on screen in miles
    @State private var zoomLevel: Int = 1.0

    var body: some View {
        CustomMap(width: .miles(zoomLevel))
            .focusable()
            .digitalCrownRotation(value: $zoomLevel)
            .digitalCrownAccessory {
                Text("\(zoomLevel, specifier: "%.2f")MI")
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.gray)
                }
            }
    }
}
```

## Parameters

- **content**: The view to be used as a Digital Crown Accessory.





## Availability

- watchOS 9.0



## See Also

- `digitalCrownAccessory(_:)`
- `digitalCrownRotation(_:from:through:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:onChange:onIdle:)`
- `digitalCrownRotation(detent:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:onChange:onIdle:)`
- `digitalCrownRotation(_:)`
- `digitalCrownRotation(_:from:through:by:sensitivity:isContinuous:isHapticFeedbackEnabled:)`
- `DigitalCrownEvent`
- `DigitalCrownRotationalSensitivity`
