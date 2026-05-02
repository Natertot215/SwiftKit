---
url: https://developer.apple.com/documentation/swiftui/view/copyable(_:)
framework: SwiftUI
category: Clipboard
title: copyable(_:)
kind: article
captured: 2026-05-01
---

# copyable(_:)

## Declaration

```swift
nonisolated func copyable<T>(_ payload: @autoclosure @escaping () -> [T]) -> some View where T : Transferable
```

## Abstract

Specifies a list of items to copy in response to the system's Copy command.

## Discussion

Use this modifier to specify one or more items that the system copies to the Clipboard when someone issues a Copy command while the modified view has focus. People issue a Copy command by choosing Edit > Copy from the app's menu, or by using the Command-C keyboard shortcut. The system enables the Copy command for your app when it detects copyable content.

For example, the following code enables people to copy all of the strings that they select in a `List`:

```swift
struct CopyableExample: View {
    let strings = ["Alpha", "Beta", "Gamma"]
    @State private var selection: Set<String> = []

    var body: some View {
        List(strings, id: \.self, selection: $selection) {
            Text($0)
        }
        .copyable(Array(selection))
    }
}
```

The command copies each item's representation as specified by the item's conformance to the `Transferable` protocol. The above example records selection using each list item's corresponding string, and strings conform to the `Transferable` protocol by default.

For more complex cases, you can define custom transfer representations:

```swift
struct Item: Identifiable, Transferable {
    let color: Color
    let name: String
    let id = UUID()

    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.name)
    }
}

struct CopyableIDExample: View {
    let items: [Item] = [
        Item(color: .red, name: "red"),
        Item(color: .green, name: "green"),
        Item(color: .blue, name: "blue")
    ]

    @State private var selection: Set<Item.ID> = []

    var body: some View {
        List(items, selection: $selection) { item in
            item.color
        }
        .copyable(items.filter { selection.contains($0.id) })
    }
}
```

> **Note:** To enable people to copy using a custom action — like from a context menu item — rather than using the system Copy command, update the Clipboard directly using an `NSPasteboard` or a `UIPasteboard` instance.

## Parameters

- **payload**: A closure that returns an array of items to copy to the Clipboard when someone issues a Copy command. The items in the array must conform to the `Transferable` protocol.

## Return Value

A view that adds one or more items to the Clipboard in response to a Copy command.

## Availability

- **macOS** 13.0+

## See Also

- `cuttable(for:action:)` — Specifies an action that moves items to the Clipboard in response to the system's Cut command.
- `pasteDestination(for:action:validator:)` — Specifies an action that adds validated items to a view in response to the system's Paste command.
