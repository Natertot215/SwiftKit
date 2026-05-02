---
url: https://developer.apple.com/documentation/swiftui/view/sheet(item:ondismiss:content:)
framework: SwiftUI
category: Modal presentations
title: sheet(item:onDismiss:content:)
kind: method
captured: 2026-05-02
---

# sheet(item:onDismiss:content:)

Presents a sheet using a given item as a data source for the sheet's content.

## Declaration
```swift
nonisolated func sheet<Item, Content>(
    item: Binding<Item?>,
    onDismiss: (() -> Void)? = nil,
    @ViewBuilder content: @escaping (Item) -> Content
) -> some View
where Item: Identifiable, Content: View
```

## Parameters
- **item**: A binding to an optional source of truth for the sheet. When non-`nil`, the system passes the item's content to the closure. If `item` changes, the sheet is dismissed and replaced with a new one.
- **onDismiss**: The closure to execute when dismissing the sheet (optional).
- **content**: A closure returning the sheet's content, receiving the item as a parameter.

## Availability
- iOS 13.0+
- iPadOS 13.0+
- Mac Catalyst 13.0+
- macOS 10.15+
- tvOS 13.0+
- visionOS 1.0+
- watchOS 6.0+

## Example
```swift
struct ShowPartDetail: View {
    @State private var sheetDetail: InventoryItem?

    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "Z-1234A",
                quantity: 100,
                name: "Widget")
        }
        .sheet(item: $sheetDetail,
               onDismiss: didDismiss) { detail in
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
            }
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }

    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}
```

## Key Behaviors
- In vertically compact environments (e.g., iPhone landscape), sheets automatically adapt to full-screen covers
- Use `presentationCompactAdaptation(_:)` to override this behavior
- In visionOS, presentations include a breakthrough effect by default; customize with `presentationBreakthroughEffect(_:)`

## See Also
- `sheet(isPresented:onDismiss:content:)`
- `fullScreenCover(item:onDismiss:content:)`
- `popover(item:attachmentAnchor:arrowEdge:content:)`
