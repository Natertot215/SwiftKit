---
url: https://developer.apple.com/documentation/swiftui/controlwidgettemplatebuilder
framework: SwiftUI
category: App extensions
title: ControlWidgetTemplateBuilder
kind: struct
captured: 2026-05-02
---

# ControlWidgetTemplateBuilder

A custom attribute that constructs a control widget template’s body.

## Declaration

```swift
@resultBuilder struct ControlWidgetTemplateBuilder
```

### Overview

The `@ControlWidgetTemplateBuilder` attribute allows your control template’s body closure to produce a control template after zero or more other statements:

```swift
struct GarageDoorOpener: ControlWidget {
    var body: some ControlWidgetConfiguration {
        let kind = "com.yourcompany.GarageDoorOpener"

        StaticControlConfiguration(
            kind: kind
        ) {
            let isOpen = ...

            ControlWidgetToggle(
                "Garage Door",
                isOn: isOpen,
                action: ToggleGarageDoor()
            ) {
                Label(
                    $0 ? "Open" : "Closed",
                    systemImage: $0 ?
                        "door.garage.open" : "door.garage.closed"
                )
            }
        }
    }
}
```







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 26.0
- watchOS 26.0

## Topics

### Type Methods

- `buildBlock(_:)`
- `buildExpression(_:)`

## See Also

- `ControlWidget`
- `ControlWidgetConfiguration`
- `EmptyControlWidgetConfiguration`
- `ControlWidgetConfigurationBuilder`
- `ControlWidgetTemplate`
- `EmptyControlWidgetTemplate`
- `controlWidgetActionHint(_:)`
- `controlWidgetStatus(_:)`
