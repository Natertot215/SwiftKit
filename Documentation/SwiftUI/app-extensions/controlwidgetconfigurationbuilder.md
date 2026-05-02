---
url: https://developer.apple.com/documentation/swiftui/controlwidgetconfigurationbuilder
framework: SwiftUI
category: App extensions
title: ControlWidgetConfigurationBuilder
kind: struct
captured: 2026-05-02
---

# ControlWidgetConfigurationBuilder

A custom attribute that constructs a control widget’s body.

## Declaration

```swift
@resultBuilder struct ControlWidgetConfigurationBuilder
```

### Overview

The `@ControlWidgetConfigurationBuilder` attribute allows your control widget’s body closure to produce a control widget configuration after zero or more other statements:

```swift
struct GarageDoorOpener: ControlWidget {
    var body: some ControlWidgetConfiguration {
        let kind = "com.yourcompany.GarageDoorOpener"

        StaticControlConfiguration(
            kind: kind
        ) {
            ...
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
- `ControlWidgetTemplate`
- `EmptyControlWidgetTemplate`
- `ControlWidgetTemplateBuilder`
- `controlWidgetActionHint(_:)`
- `controlWidgetStatus(_:)`
