---
url: https://developer.apple.com/documentation/swiftui/view/controlwidgetactionhint(_:)
framework: SwiftUI
category: App extensions
title: controlWidgetActionHint(_:)
kind: method
captured: 2026-05-02
---

# controlWidgetActionHint(_:)

The action hint of the control described by the modified label.

## Declaration

```swift
@MainActor @preconcurrency func controlWidgetActionHint(_ hint: LocalizedStringResource) -> some View

```

### Discussion

This text will appear next to the Action Button to describe what your control will do when activated. By default, a control’s action hint is derived from its display name, the type of control, and value text, if any:

// Action Hint: “Hold for ‘Ping My Watch’” struct PingMyWatchButton: Control { static let displayName: LocalizedStringResource = “Ping My Watch” … }

// When this button’s action conforms to `OpenIntent`: // Action Hint: “Hold to Open Notes” struct NotesLauncher: Control { static let displayName: LocalizedStringResource = “Notes” … }

// Action Hint: “Hold to Turn On ‘Silent Mode’” / “Hold to Turn Off ‘Silent Mode’” struct SilentModeToggle: Control { static let displayName: LocalizedStringResource = “Silent Mode” … }

// Action Hint: “Hold for Silent” / “Hold for Ring” ControlWidgetToggle(…) { isOn in Label( isOn ? “Silent” : “Ring”, systemImage: isOn ? “bell.slash” : “bell” ) }

When the default action hint is insufficiently descriptive, you can customize the hint by applying this modifier to the control’s label. For instance, we can describe what the user will use our `NotesLauncher` control to do, “Compose a Note”, instead of the default “Hold to Open Notes” hint, like this:

ControlWidgetButton(…) { Image(systemName: “note.text”) .controlWidgetActionHint(“Compose a Note”) }

## Parameters

- **hint**: The localized string resource to display.





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
- `controlWidgetStatus(_:)`
