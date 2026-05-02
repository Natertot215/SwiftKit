---
url: https://developer.apple.com/documentation/swiftui/view/cuttable(for:action:)
framework: SwiftUI
category: Clipboard
title: cuttable(for:action:)
kind: article
captured: 2026-05-01
---

# cuttable(for:action:)

## Declaration

```swift
nonisolated func cuttable<T>(
    for payloadType: T.Type = T.self,
    action: @escaping () -> [T]
) -> some View where T : Transferable
```

## Abstract

Specifies an action that moves items to the Clipboard in response to the system's Cut command.

## Discussion

Use this modifier to remove one or more items from a collection of items and then move the items to the Clipboard when someone issues a Cut command. People issue a Cut command by choosing Edit > Cut from the app's menu, or by using the Command-X keyboard shortcut. The system enables the Cut command for your app when it detects cuttable content.

For example, the following code enables people to remove bird names from a list of birds:

```swift
struct CuttableExample: View {
    @State private var birds = ["owl", "parrot", "swift"]
    @State private var selection: Set<String> = []

    var body: some View {
        List(birds, id: \.self, selection: $selection) {
            Text($0)
        }
        .cuttable(for: String.self) {
            for bird in selection {
                birds.removeAll(where: { $0 == bird })
            }
            return Array(selection)
        }
    }
}
```

When someone selects "owl" and issues a Cut command, the `action` closure removes the selected item from the list and returns it. In response, SwiftUI moves it to the Clipboard. If you want to copy the item without removing it, use the `copyable(_:)` modifier instead.

> **Note:** To enable people to cut using a custom action — like from a context menu item — rather than using the system Cut command, update the Clipboard directly using an `NSPasteboard` or a `UIPasteboard` instance.

## Parameters

- **payloadType**: The type of items to cut.
- **action**: A closure that you implement to delete the selected items from the collection, and return them for addition to the Clipboard. The items must conform to the `Transferable` protocol.

## Return Value

A view that sends one or more items to the Clipboard in response to a Cut command.

## Availability

- **macOS** 13.0+

## See Also

- `copyable(_:)` — Specifies a list of items to copy in response to the system's Copy command.
- `pasteDestination(for:action:validator:)` — Specifies an action that adds validated items to a view in response to the system's Paste command.
