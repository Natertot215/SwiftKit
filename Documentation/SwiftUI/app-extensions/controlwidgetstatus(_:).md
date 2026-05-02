---
url: https://developer.apple.com/documentation/swiftui/view/controlwidgetstatus(_:)
framework: SwiftUI
category: App extensions
title: controlWidgetStatus(_:)
kind: method
captured: 2026-05-02
---

# controlWidgetStatus(_:)

The status of the control described by the modified label.

## Declaration

```swift
@MainActor @preconcurrency func controlWidgetStatus(_ status: LocalizedStringResource) -> some View

```

### Discussion

This text appears in Control Center when your control’s state changes. You can customize the text by applying this modifier to the control’s value label:

```swift
// Status Text: "Do Not Disturb Until This Evening" / "Do Not Disturb Disabled"
ControlWidgetToggle("Do Not Disturb", ...) { isOn in
    Image(systemName: "moon")
        .controlWidgetStatus(isOn ? "Do Not Disturb Until This Evening" : "Do Not Disturb Disabled")
}
```

## Parameters

- **status**: The localized string resource to display.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 26.0
- watchOS 26.0



## See Also

- `ControlWidget`
- `ControlWidgetConfiguration`
- `EmptyControlWidgetConfiguration`
- `ControlWidgetConfigurationBuilder`
- `ControlWidgetTemplate`
- `EmptyControlWidgetTemplate`
- `ControlWidgetTemplateBuilder`
- `controlWidgetActionHint(_:)`
