---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/showswidgetcontainerbackground
framework: SwiftUI
category: Environment values
title: showsWidgetContainerBackground
kind: property
captured: 2026-05-02
---

# showsWidgetContainerBackground

An environment variable that indicates whether the background of a widget appears.

## Declaration

```swift
var showsWidgetContainerBackground: Bool { get }
```

### Return Value

`true` if, by default, the background appears in this context; `false` otherwise.

### Discussion

In iOS 16 and earlier, this environment variable is always `true` for system widgets and `false` for accessory widgets. In macOS 13 and earlier, and in watchOS 9 and earlier, it always evaluates to `true`.

If you pass `false` to `WidgetConfiguration/containerBackgroundRemovable(_:)` to always show the widget background, the system shows the widget background even if `showsWidgetContainerBackground` evaluates to `true`.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- visionOS 26.0
- watchOS 8.0



## See Also

- `showsWidgetLabel`
- `widgetFamily`
- `widgetRenderingMode`
- `widgetContentMargins`
