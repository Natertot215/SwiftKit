---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/widgetcontentmargins
framework: SwiftUI
category: Environment values
title: widgetContentMargins
kind: property
captured: 2026-05-02
---

# widgetContentMargins

A property that identifies the content margins of a widget.

## Declaration

```swift
var widgetContentMargins: EdgeInsets { get }
```

### Return Value

Returns the content margins for the current widget presentation context.

### Discussion

The content margins of a widget depend on the context in which it appears. The system applies default content margins. However, if you disable automatic application of default content margins with `WidgetConfiguration/contentMarginsDisabled()`, the system uses the `widgetContentMargins` property in combination with `View/padding(_:)` to selectively apply default content margins.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 26.0
- watchOS 10.0



## See Also

- `showsWidgetContainerBackground`
- `showsWidgetLabel`
- `widgetFamily`
- `widgetRenderingMode`
