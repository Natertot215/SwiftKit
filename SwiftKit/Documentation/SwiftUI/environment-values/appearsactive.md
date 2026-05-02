---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/appearsactive
framework: SwiftUI
category: Environment values
title: appearsActive
kind: property
captured: 2026-05-02
---

# appearsActive

Whether views and styles in this environment should prefer an active appearance over an inactive appearance.

## Declaration

```swift
@backDeployed(before: macOS 15.0)
var appearsActive: Bool { get set }
```

### Discussion

On macOS, views in the focused window (also referred to as the “key” window) should appear active. Some contexts also appear active in other circumstances, such as the contents of a window toolbar appearing active when the window is not focused but is the main window.

Typical adjustments made when a view does not appear active include:

- Uses of `Color.accentColor` should generally be removed or replaced with a desaturated style.
- Text and image content in sidebars should appear dimmer.
- Buttons with destructive actions should appear disabled.
- `ShapeStyle.selection` and selection in list and tables will automatically become a grey color

Custom views, styles, and shape styles can use this to adjust their own appearance:

```swift
struct ProminentPillButtonStyle: ButtonStyle {
    @Environment(\.appearsActive) private var appearsActive

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .lineLimit(1)
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .frame(minHeight: 20)
            .overlay(Capsule().strokeBorder(.tertiary))
            .background(appearsActive ? Color.accentColor : .clear, in: .capsule)
            .contentShape(.capsule)
    }
}
```

On all other platforms, this value is always `true`.

This is bridged with `UITraitCollection.activeAppearance` for UIKit hosted content.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 10.15
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0



## See Also

- `colorScheme`
- `colorSchemeContrast`
- `displayScale`
- `horizontalSizeClass`
- `imageScale`
- `pixelLength`
- `sidebarRowSize`
- `verticalSizeClass`
- `immersiveSpaceDisplacement`
- `labelsVisibility`
- `materialActiveAppearance`
- `TabBarPlacement`
- `toolbarLabelStyle`
