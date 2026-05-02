---
url: https://developer.apple.com/documentation/swiftui/view/touchbarcustomizationlabel(_:)
framework: SwiftUI
category: Input events
title: touchBarCustomizationLabel(_:)
kind: method
captured: 2026-05-02
---

# touchBarCustomizationLabel(_:)

Sets a user-visible string that identifies the view’s functionality.

## Declaration

```swift
nonisolated func touchBarCustomizationLabel(_ label: Text) -> some View

```

### Return Value

A Touch Bar element with a set customization label.

### Discussion

This string is visible during user customization.

```swift
TextField("TouchBar Demo", text: $placeholder)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .focusable()
    .touchBar {
        Button("♥️", action: selectHearts)
            .touchBarCustomizationLabel(Text("Hearts"))
        Button("♣️", action: selectClubs)
            .touchBarCustomizationLabel(Text("Clubs"))
        Button("♠️", action: selectSpades)
            .touchBarCustomizationLabel(Text("Spades"))
        Button("♦️", action: selectDiamonds)
            .touchBarCustomizationLabel(Text("Diamonds"))
    }
```

## Parameters

- **label**: A `Text` view containing the customization label.





## Availability

- macOS 10.15



## See Also

- `touchBar(content:)`
- `touchBar(_:)`
- `touchBarItemPrincipal(_:)`
- `touchBarItemPresence(_:)`
- `TouchBar`
- `TouchBarItemPresence`
