---
url: https://developer.apple.com/documentation/swiftui/pastebutton
framework: SwiftUI
category: Controls and indicators
title: PasteButton
kind: struct
captured: 2026-05-02
---

# PasteButton

A system button that reads items from the pasteboard and delivers it to a closure.

## Declaration

```swift
@MainActor @preconcurrency struct PasteButton
```

### Overview

Use a paste button when you want to provide a button for pasting items from the system pasteboard into your app. The system provides a button appearance and label appropriate to the current environment. However, you can use view modifiers like `View/buttonBorderShape(_:)`, `View/labelStyle(_:)`, and `View/tint(_:)` to customize the button in some contexts.

You declare what type of items your app will accept; use a type that conforms to the `Transferable` protocol. When the user taps or clicks the button, your closure receives the pasteboard items in the specified type.

In the following example, a paste button declares that it accepts a string. When the user taps or clicks the button, the sample’s closure receives an array of strings and sets the first as the value of `pastedText`, which updates a nearby `Text` view.

```swift
@State private var pastedText: String = ""

var body: some View {
    HStack {
        PasteButton(payloadType: String.self) { strings in
            pastedText = strings[0]
        }
        Divider()
        Text(pastedText)
        Spacer()
    }
}
```

A paste button automatically validates and invalidates based on changes to the pasteboard on iOS, but not on macOS.





## Relationships

**Conforms To**: `View`

## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0
- macOS 10.15
- visionOS 1.0

## Topics

### Creating a paste button

- `init(supportedContentTypes:payloadAction:)`
- `init(payloadType:onPaste:)`

### Deprecated initializers

- `init(supportedTypes:payloadAction:)`
- `init(supportedTypes:validator:payloadAction:)`
- `init(supportedContentTypes:validator:payloadAction:)`

## See Also

- `EditButton`
- `RenameButton`
