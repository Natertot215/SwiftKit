---
url: https://developer.apple.com/documentation/swiftui/uigesturerecognizerrepresentable
framework: SwiftUI
category: UIKit integration
title: UIGestureRecognizerRepresentable
kind: protocol
captured: 2026-05-02
---

# UIGestureRecognizerRepresentable

A wrapper for a `UIGestureRecognizer` that you use to integrate that gesture recognizer into your SwiftUI hierarchy.

## Declaration

```swift
@MainActor @preconcurrency protocol UIGestureRecognizerRepresentable
```

### Overview

Use a `UIGestureRecognizerRepresentable` instance to create and manage a `UIGestureRecognizer` object in your SwiftUI interface.

To add your gesture recognizer to a SwiftUI view, create an instance of `UIGestureRecognizerRepresentable` and use the `View/gesture(_:)` modifier to attach it. The system calls the methods of your representable instance at appropriate times to create and update the gesture recognizer.

The following example shows the inclusion of a custom `MyGestureRecognizer` structure in the view hierarchy.

```swift
struct ContentView: View {
   var body: some View {
      VStack {
         Image("Mountain").gesture(MyGestureRecognizer())
      }
   }
}
```

Because your `UIGestureRecognizerRepresentable` is a struct, it can use the environment, have data dependencies, and is more similar to views in SwiftUI. The system will call the appropriate methods on your instance to propagate the latest data.

### Handling Gesture Recognizer Actions

SwiftUI automatically installs a target to handle the gesture recognizer’s action on your behalf. Implement the `handleUIGestureRecognizerAction` method to react to the gesture recognizing its action.

You can optionally include a coordinator object to forward delegate messages from your gesture recognizer or add additional targets.

### Coordinate Space Conversions

The gesture recognizer you create may not be attached to a `UIView` in the hierarchy, or it may return a view with different geometry than your SwiftUI view.

To handle this, use the converter on the context to perform coordinate space conversions from the global coordinate space. You can pass the gesture recognizer and a SwiftUI coordinate space to the converter to retrieve a final converted point. Passing the `CoordinateSpaceProtocol/local` coordinate space (the default) will provide the point in the SwiftUI view the gesture recognizer is attached to.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0

## Topics

### Associated Types

- `Coordinator`
- `UIGestureRecognizerType`

### Instance Methods

- `handleUIGestureRecognizerAction(_:context:)`
- `makeCoordinator(converter:)`
- `makeUIGestureRecognizer(context:)`
- `updateUIGestureRecognizer(_:context:)`

### Type Aliases

- `UIGestureRecognizerRepresentable.Context`
- `UIGestureRecognizerRepresentable.CoordinateSpaceConverter`

## See Also

- `UIGestureRecognizerRepresentableContext`
- `UIGestureRecognizerRepresentableCoordinateSpaceConverter`
