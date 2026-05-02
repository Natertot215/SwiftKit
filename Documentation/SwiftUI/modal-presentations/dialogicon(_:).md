---
url: https://developer.apple.com/documentation/swiftui/scene/dialogicon(_:)
framework: SwiftUI
category: Modal presentations
title: dialogIcon(_:)
kind: method
captured: 2026-05-02
---

# dialogIcon(_:)

Configures the icon used by alerts.

## Declaration

```swift
nonisolated func dialogIcon(_ icon: Image?) -> some Scene

```

### Discussion

In macOS, this icon replaces the default icon of the app.

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
        .dialogIcon(Image(Trash.png))
    }
}
```

## Parameters

- **icon**: The custom icon to use for the alert. Passing `nil` will use the default app icon.





## Availability

- macOS 15.0



## See Also

- `dialogIcon(_:)`
- `dialogSeverity(_:)`
- `dialogSeverity(_:)`
- `dialogSuppressionToggle(isSuppressed:)`
- `dialogSuppressionToggle(isSuppressed:)`
- `dialogSuppressionToggle(_:isSuppressed:)`
- `dialogSuppressionToggle(_:isSuppressed:)`
