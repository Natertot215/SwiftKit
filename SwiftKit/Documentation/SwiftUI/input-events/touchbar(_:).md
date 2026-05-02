---
url: https://developer.apple.com/documentation/swiftui/view/touchbar(_:)
framework: SwiftUI
category: Input events
title: touchBar(_:)
kind: method
captured: 2026-05-02
---

# touchBar(_:)

Sets the Touch Bar content to be shown in the Touch Bar when applicable.

## Declaration

```swift
nonisolated func touchBar<Content>(_ touchBar: TouchBar<Content>) -> some View where Content : View

```

### Return Value

A view that contains the Touch Bar content.

### Discussion

Use `View/touchBar(_:)` to provide a static set of views that are displayed by the Touch Bar when appropriate, depending on whether the view has focus.

The example below provides Touch Bar content in-line, that creates the content the Touch Bar displays:

```swift
func selectHearts() {/* ... */ }
func selectClubs() { /* ... */ }
func selectSpades() { /* ... */ }
func selectDiamonds() { /* ... */ }

TextField("TouchBar Demo", text: $placeholder)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .focusable()
    .touchBar {
        Button("♥️ - Hearts", action: selectHearts)
        Button("♣️ - Clubs", action: selectClubs)
        Button("♠️ - Spades", action: selectSpades)
        Button("♦️ - Diamonds", action: selectDiamonds)
    }
```

## Parameters

- **touchBar**: A collection of views that the Touch Bar displays.





## Availability

- macOS 10.15



## See Also

- `touchBar(content:)`
- `touchBarItemPrincipal(_:)`
- `touchBarCustomizationLabel(_:)`
- `touchBarItemPresence(_:)`
- `TouchBar`
- `TouchBarItemPresence`
