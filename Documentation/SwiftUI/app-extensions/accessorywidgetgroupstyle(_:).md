---
url: https://developer.apple.com/documentation/swiftui/view/accessorywidgetgroupstyle(_:)
framework: SwiftUI
category: App extensions
title: accessoryWidgetGroupStyle(_:)
kind: method
captured: 2026-05-02
---

# accessoryWidgetGroupStyle(_:)

The view modifier that can be applied to `AccessoryWidgetGroup` to specify the shape the three content views will be masked with. The value of `style` is set to `.automatic`, which is `.circular` by default.

## Declaration

```swift
@MainActor @preconcurrency func accessoryWidgetGroupStyle(_ style: AccessoryWidgetGroupStyle = .automatic) -> some View

```



## Parameters

- **style**: The shape with which the content views are masked. The available shapes are circle and rounded square.





## Availability

- watchOS 11.0
