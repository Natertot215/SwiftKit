---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/widgetrenderingmode
framework: SwiftUI
category: Environment values
title: widgetRenderingMode
kind: property
captured: 2026-05-02
---

# widgetRenderingMode

The widget’s rendering mode, based on where the system is displaying it.

## Declaration

```swift
var widgetRenderingMode: WidgetRenderingMode { get set }
```

### Discussion

You can read the rendering mode from the environment values using this key.

```swift
@Environment(\.widgetRenderingMode) var widgetRenderingMode
```

Then modify the widget’s appearance based on the mode.

```swift
var body: some View {
    ZStack {
       switch renderingMode {
        case .fullColor:
           Text("Full color")
        case .accented:
           ZStack {
               Circle(...)
               VStack {
                   Text("Accented")
                       .widgetAccentable()
                   Text("Normal")
               }
           }
        case .vibrant:
           Text("Full color")
        default:
           ...
        }
    }
}
```







## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 13.0
- visionOS 26.0
- watchOS 9.0



## See Also

- `showsWidgetContainerBackground`
- `showsWidgetLabel`
- `widgetFamily`
- `widgetContentMargins`
