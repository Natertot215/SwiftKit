---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/keyboardshortcut
framework: SwiftUI
category: Environment values
title: keyboardShortcut
kind: property
captured: 2026-05-02
---

# keyboardShortcut

The keyboard shortcut that buttons in this environment will be triggered with.

## Declaration

```swift
var keyboardShortcut: KeyboardShortcut? { get }
```

### Discussion

This is particularly useful in button styles when a button’s appearance depends on the shortcut associated with it. On macOS, for example, when a button is bound to the Return key, it is typically drawn with a special emphasis. This happens automatically when using the built-in button styles, and can be implemented manually in custom styles using this environment key:

```swift
private struct MyButtonStyle: ButtonStyle {
    @Environment(\.keyboardShortcut)
    private var shortcut: KeyboardShortcut?

    func makeBody(configuration: Configuration) -> some View {
        let labelFont = Font.body
            .weight(shortcut == .defaultAction ? .bold : .regular)
        configuration.label
            .font(labelFont)
    }
}
```

If no keyboard shortcut has been applied to the view or its ancestor, then the environment value will be `nil`.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- visionOS 1.0



## See Also

- `keyboardShortcut(_:)`
- `keyboardShortcut(_:modifiers:)`
- `keyboardShortcut(_:modifiers:localization:)`
- `KeyboardShortcut`
- `KeyEquivalent`
- `EventModifiers`
