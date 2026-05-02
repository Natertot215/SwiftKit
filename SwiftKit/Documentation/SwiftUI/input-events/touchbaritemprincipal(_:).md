---
url: https://developer.apple.com/documentation/swiftui/view/touchbaritemprincipal(_:)
framework: SwiftUI
category: Input events
title: touchBarItemPrincipal(_:)
kind: method
captured: 2026-05-02
---

# touchBarItemPrincipal(_:)

Sets principal views that have special significance to this Touch Bar.

## Declaration

```swift
nonisolated func touchBarItemPrincipal(_ principal: Bool = true) -> some View

```

### Return Value

A Touch Bar view with one element centered in the Touch Bar row.

### Discussion

Use `touchBarItemPrincipal(_:)` to designate a view as a significant view in the Touch Bar. Currently, that view will be placed in the center of the row.

The example below sets the last button as the principal button for the Touch Bar view.

```swift
let touchBarItems = TouchBar(id: "myBarItems") {
    Button("♣️", action: {})
    Button("♥️", action: {})
    Button("♠️", action: {})
    Button("♦️", action: {})
       .touchBarItemPrincipal(true)
}

TextField("TouchBar Demo", text: $placeholder)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .focusable()
    .touchBar(touchBarItems)
```

> **NOTE:** Multiple visible bars may each specify a principal view, but the system only honors one of them.

## Parameters

- **principal**: A Boolean value that indicates whether to display this view prominently in the Touch Bar compared to other views.





## Availability

- macOS 10.15



## See Also

- `touchBar(content:)`
- `touchBar(_:)`
- `touchBarCustomizationLabel(_:)`
- `touchBarItemPresence(_:)`
- `TouchBar`
- `TouchBarItemPresence`
