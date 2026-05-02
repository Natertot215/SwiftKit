---
url: https://developer.apple.com/documentation/swiftui/openurlaction
framework: SwiftUI
category: System events
title: OpenURLAction
kind: struct
captured: 2026-05-02
---

# OpenURLAction

An action that opens a URL.

## Declaration

```swift
@MainActor @preconcurrency struct OpenURLAction
```

### Overview

Read the `EnvironmentValues/openURL` environment value to get an instance of this structure for a given `Environment`. Call the instance to open a URL. You call the instance directly because it defines a `OpenURLAction/callAsFunction(_:)` method that Swift calls when you call the instance.

For example, you can open a web site when the user taps a button:

```swift
struct OpenURLExample: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "https://www.example.com") {
                openURL(url)
            }
        } label: {
            Label("Get Help", systemImage: "person.fill.questionmark")
        }
    }
}
```

If you want to know whether the action succeeds, add a completion handler that takes a Boolean value. In this case, Swift implicitly calls the `OpenURLAction/callAsFunction(_:completion:)` method instead. That method calls your completion handler after it determines whether it can open the URL, but possibly before it finishes opening the URL. You can add a handler to the example above so that it prints the outcome to the console:

```swift
openURL(url) { accepted in
    print(accepted ? "Success" : "Failure")
}
```

The system provides a default open URL action with behavior that depends on the contents of the URL. For example, the default action opens a Universal Link in the associated app if possible, or in the user’s default web browser if not.

You can also set a custom action using the `View/environment(_:_:)` view modifier. Any views that read the action from the environment, including the built-in `Link` view and `Text` views with markdown links, or links in attributed strings, use your action. Initialize an action by calling the `OpenURLAction/init(handler:)` initializer with a handler that takes a URL and returns an `OpenURLAction/Result`:

```swift
Text("Visit [Example Company](https://www.example.com) for details.")
    .environment(\.openURL, OpenURLAction { url in
        handleURL(url) // Define this method to take appropriate action.
        return .handled
    })
```

SwiftUI translates the value that your custom action’s handler returns into an appropriate Boolean result for the action call. For example, a view that uses the action declared above receives `true` when calling the action, because the handler always returns `OpenURLAction/Result/handled`.





## Relationships

**Conforms To**: `Sendable`, `SendableMetatype`

## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Creating the action

- `init(handler:)`
- `OpenURLAction.Result`

### Calling the action

- `callAsFunction(_:)`
- `callAsFunction(_:completion:)`

### Instance Methods

- `callAsFunction(_:prefersInApp:)`

## See Also

- `openURL`
- `onOpenURL(perform:)`
