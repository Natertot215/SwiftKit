---
url: https://developer.apple.com/documentation/swiftui/alert
framework: SwiftUI
category: Modal presentations
title: Alert
kind: struct
captured: 2026-05-02
---

# Alert

A representation of an alert presentation.

## Declaration

```swift
struct Alert
```

### Overview

Use an alert when you want the user to act in response to the state of the app or system. If you want the user to make a choice in response to their action, use an `ActionSheet` instead.

You show an alert by using the `View/alert(isPresented:content:)` view modifier to create an alert, which then appears whenever the bound `isPresented` value is `true`. The `content` closure you provide to this modifer produces a customized instance of the `Alert` type.

In the following example, a button presents a simple alert when tapped, by updating a local `showAlert` property that binds to the alert.

```swift
@State private var showAlert = false
var body: some View {
    Button("Tap to show alert") {
        showAlert = true
    }
    .alert(isPresented: $showAlert) {
        Alert(
            title: Text("Current Location Not Available"),
            message: Text("Your current location can’t be " +
                            "determined at this time.")
        )
    }
}
```

To customize the alert, add instances of the `Alert/Button` type, which provides standardized buttons for common tasks like canceling and performing destructive actions. The following example uses two buttons: a default button labeled “Try Again” that calls a `saveWorkoutData` method, and a “Delete” button that calls a destructive `deleteWorkoutData` method.

```swift
@State private var showAlert = false
var body: some View {
    Button("Tap to show alert") {
        showAlert = true
    }
    .alert(isPresented: $showAlert) {
        Alert(
            title: Text("Unable to Save Workout Data"),
            message: Text("The connection to the server was lost."),
            primaryButton: .default(
                Text("Try Again"),
                action: saveWorkoutData
            ),
            secondaryButton: .destructive(
                Text("Delete"),
                action: deleteWorkoutData
            )
        )
    }
}
```

The alert handles its own dismissal when the user taps one of the buttons in the alert, by setting the bound `isPresented` value back to `false`.







## Availability

- iOS 13.0 (deprecated 26.5)
- iPadOS 13.0 (deprecated 26.5)
- Mac Catalyst 13.0 (deprecated 26.5)
- macOS 10.15 (deprecated 26.5)
- tvOS 13.0 (deprecated 26.5)
- visionOS 1.0 (deprecated 26.5)
- watchOS 6.0 (deprecated 26.5)

## Topics

### Creating an alert

- `init(title:message:dismissButton:)`
- `init(title:message:primaryButton:secondaryButton:)`
- `sideBySideButtons(title:message:primaryButton:secondaryButton:)`

### Specifying the button type

- `Alert.Button`

## See Also

- `ActionSheet`
