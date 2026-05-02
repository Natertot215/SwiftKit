---
url: https://developer.apple.com/documentation/swiftui/scene/dialogsuppressiontoggle(issuppressed:)
framework: SwiftUI
category: Modal presentations
title: dialogSuppressionToggle(isSuppressed:)
kind: method
captured: 2026-05-02
---

# dialogSuppressionToggle(isSuppressed:)

Enables user suppression of an alert with a custom suppression message.

## Declaration

```swift
nonisolated func dialogSuppressionToggle(isSuppressed: Binding<Bool>) -> some Scene

```

### Discussion

Applying dialog suppression adds a toggle to dialogs on macOS, which allows the user to request the alert not be displayed again. Typically whether a dialog is suppressed is stored in `AppStorage` and used to decide whether to present the dialog in the future.

The following example configures an alert with a suppression toggle. The toggle’s state is stored in `AppStorage` and used to determine whether or not to show the dialog when the “Delete Items” button is pressed.

```swift
struct MyApp: App {
    @State private var isShowingDialog = false
    @AppStorage("suppressEraseItemAlert")
    private var suppressAlert = false

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
        .dialogSuppressionToggle(
            "Do not ask about erasing items again",
            isSuppressed: $suppressAlert)
    }
}
```

## Parameters

- **isSuppressed**: Whether the suppression toggle is on or off in the dialog.





## Availability

- macOS 15.0



## See Also

- `dialogIcon(_:)`
- `dialogIcon(_:)`
- `dialogSeverity(_:)`
- `dialogSeverity(_:)`
- `dialogSuppressionToggle(isSuppressed:)`
- `dialogSuppressionToggle(_:isSuppressed:)`
- `dialogSuppressionToggle(_:isSuppressed:)`
