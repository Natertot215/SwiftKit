---
url: https://developer.apple.com/documentation/swiftui/scene/dialogseverity(_:)
framework: SwiftUI
category: Modal presentations
title: dialogSeverity(_:)
kind: method
captured: 2026-05-02
---

# dialogSeverity(_:)

Sets the severity for alerts.

## Declaration

```swift
nonisolated func dialogSeverity(_ severity: DialogSeverity) -> some Scene

```

### Discussion

The following example configures an alert for erasing some number of items. Since this operation is destructive and non-recoverable, a `.critical` severity is used.

```swift
struct MyApp: App {
    @State private var isShowingDialog = false

    var body: some Scene {
        Window(...) {
            Button("Delete items") {
                isShowingDialog = true
            }
        }

        AlertScene(
            "Are you sure you want to erase these items?",
            isPresented: $isShowingDialog
        ) {
            Button("Erase", role: .destructive) {
                // Handle item deletion.
            }
            Button("Cancel", role: .cancel) {
                // Handle cancellation
            }
        }
        .dialogSeverity(.critical)
    }
}
```

## Parameters

- **severity**: The severity to use for alerts.





## Availability

- macOS 15.0



## See Also

- `dialogIcon(_:)`
- `dialogIcon(_:)`
- `dialogSeverity(_:)`
- `dialogSuppressionToggle(isSuppressed:)`
- `dialogSuppressionToggle(isSuppressed:)`
- `dialogSuppressionToggle(_:isSuppressed:)`
- `dialogSuppressionToggle(_:isSuppressed:)`
