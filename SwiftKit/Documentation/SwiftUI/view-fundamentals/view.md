---
url: https://developer.apple.com/documentation/swiftui/view
framework: SwiftUI
category: View fundamentals
title: View
kind: protocol
captured: 2026-05-01
---

# View Protocol

## Declaration

```swift
@MainActor @preconcurrency protocol View
```

## Abstract

A type that represents part of your app's user interface and provides modifiers that you use to configure views.

## Overview

You create custom views by declaring types that conform to the `View` protocol. Implement the required `body` computed property to provide the content for your custom view.

```swift
struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

Assemble the view's body by combining one or more of the built-in views provided by SwiftUI, like the `Text` instance in the example above, plus other custom views that you define, into a hierarchy of views. For more information about creating custom views, see [Declaring a Custom View](doc://com.apple.SwiftUI/documentation/SwiftUI/Declaring-a-Custom-View).

The `View` protocol provides a set of modifiers — protocol methods with default implementations — that you use to configure views in the layout of your app. Modifiers work by wrapping the view instance on which you call them in another view with the specified characteristics. For example, adding the `opacity(_:)` modifier to a text view returns a new view with some amount of transparency:

```swift
Text("Hello, World!")
    .opacity(0.5) // Display partially transparent text.
```

The complete list of default modifiers provides a large set of controls for managing views. For example, you can fine tune [View Layout](doc://com.apple.SwiftUI/documentation/SwiftUI/View-Layout), add [Accessibility](doc://com.apple.SwiftUI/documentation/SwiftUI/View-Accessibility) information, and respond to [Input and Events](doc://com.apple.SwiftUI/documentation/SwiftUI/View-Input-and-Events). You can also collect groups of default modifiers into new, custom view modifiers for easy reuse.

A type conforming to this protocol inherits `@preconcurrency @MainActor` isolation from the protocol if the conformance is declared in its original declaration. Isolation to the main actor is the default, but it's not required. Declare the conformance in an extension to opt-out the isolation.

## Availability

| Platform | Version |
|----------|---------|
| iOS | 13.0+ |
| iPadOS | 13.0+ |
| Mac Catalyst | 13.0+ |
| macOS | 10.15+ |
| tvOS | 13.0+ |
| visionOS | 1.0+ |
| watchOS | 6.0+ |

## See Also

- [Declaring a Custom View](doc://com.apple.SwiftUI/documentation/SwiftUI/Declaring-a-Custom-View)
- [ViewBuilder](doc://com.apple.SwiftUI/documentation/SwiftUI/ViewBuilder)
