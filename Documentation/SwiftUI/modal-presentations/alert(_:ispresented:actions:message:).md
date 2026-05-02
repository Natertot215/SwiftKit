---
url: https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:message:)
framework: SwiftUI
category: Modal presentations
title: alert(_:isPresented:actions:message:)
kind: method
captured: 2026-05-02
---

# alert(_:isPresented:actions:message:)

Presents an alert with a message when a given condition is true using a text view as a title.

## Declaration

```swift
nonisolated func alert<A, M>(_ title: Text, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View

```

### Discussion

In the example below, a login form conditionally presents an alert by setting the `didFail` state variable. When the form sets the value to to `true`, the system displays an alert with an “OK” action.

```swift
struct Login: View {
    @State private var didFail = false
    let alertTitle: String = "Login failed."

    var body: some View {
        LoginForm(didFail: $didFail)
            .alert(
                Text(alertTitle),
                isPresented: $didFail
            ) {
                Button("OK") {
                    // Handle the acknowledgement.
                }
            } message: {
               Text("Please check your credentials and try again.")
            }
    }
}
```

All actions in an alert dismiss the alert after the action runs. The default button is shown with greater prominence.  You can influence the default button by assigning it the `KeyboardShortcut/defaultAction` keyboard shortcut.

The system may reorder the buttons based on their role and prominence.

If no actions are present, the system includes a standard “OK” action. No default cancel action is provided. If you want to show a cancel action, use a button with a role of `ButtonRole/cancel`.

On iOS, tvOS, and watchOS, alerts only support controls with labels that are `Text`. Passing any other type of view results in the content being omitted.

Only unstyled text is supported for the message.

## Parameters

- **title**: The title of the alert.
- **isPresented**: A binding to a Boolean value that determines whether to present the alert. When the user presses or taps one of the alert’s actions, the system sets this value to `false` and dismisses.
- **actions**: A `ViewBuilder` returning the alert’s actions.
- **message**: A `ViewBuilder` returning the message for the alert.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `AlertScene`
- `alert(_:isPresented:actions:)`
- `alert(_:isPresented:presenting:actions:)`
- `alert(isPresented:error:actions:)`
- `alert(_:isPresented:presenting:actions:message:)`
- `alert(isPresented:error:actions:message:)`
