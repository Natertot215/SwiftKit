---
url: https://developer.apple.com/documentation/swiftui/view/importablefromservices(for:action:)
framework: SwiftUI
category: System events
title: importableFromServices(for:action:)
kind: method
captured: 2026-05-02
---

# importableFromServices(for:action:)

Enables importing items from services, such as Continuity Camera on macOS.

## Declaration

```swift
nonisolated func importableFromServices<T>(for payloadType: T.Type = T.self, action: @escaping ([T]) -> Bool) -> some View where T : Transferable

```

### Discussion

```swift
@State private var title: String
var body: some View {
    Color.pink
        .frame(width: 400, height: 400)
        .importableFromServices(for: String.self) { titles
            title = titles.first ?? title
            return !titles.isEmpty
        }
}
```

## Parameters

- **payloadType**: The expected type of the imported models.
- **action**: A closure that will be called with the imported service item. Return `false` to indicate that there was a failure to receive the items.





## Availability

- macOS 13.0



## See Also

- `exportableToServices(_:)`
- `exportableToServices(_:onEdit:)`
