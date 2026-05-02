---
url: https://developer.apple.com/documentation/swiftui/alertscene
framework: SwiftUI
category: Modal presentations
title: AlertScene
kind: struct
captured: 2026-05-02
---

# AlertScene

A scene that renders itself as a standalone alert dialog.

## Declaration

```swift
struct AlertScene<Actions, Message> where Actions : View, Message : View
```

### Overview

Alert scenes are not attached to any particular window, and present themselves in the center of the current display. The dialog must be dismissed before any further interaction with the app is permitted.

```swift
@main
struct MyApp: App {
    @State var showLoginAlert = true
    @State var loggedIn = false

    var body: some Scene {
        Window("Welcome User Window", id:"WelcomeWindow") {
            ...
        }
        .defaultLaunchBehavior(loggedIn ? .presented : .suppressed)

        AlertScene("Login Required", isPresented: $showLoginAlert) {
            Button("OK") {
                ...
            }
        }
    }
}
```

All actions present in the ViewBuilder will dismiss the alert. Like the alert modifier, you can determine the role of the buttons with `.cancel` or `.destructive`. If no actions are present, we will automatically include an OK button for dismissal.





## Relationships

**Conforms To**: `Scene`

## Availability

- macOS 15.0

## Topics

### Initializers

- `init(_:isPresented:actions:)`
- `init(_:isPresented:actions:message:)`
- `init(_:isPresented:presenting:actions:)`
- `init(_:isPresented:presenting:actions:message:)`

## See Also

- `alert(_:isPresented:actions:)`
- `alert(_:isPresented:presenting:actions:)`
- `alert(isPresented:error:actions:)`
- `alert(_:isPresented:actions:message:)`
- `alert(_:isPresented:presenting:actions:message:)`
- `alert(isPresented:error:actions:message:)`
