---
url: https://developer.apple.com/documentation/swiftui/uigesturerecognizerrepresentablecoordinatespaceconverter
framework: SwiftUI
category: UIKit integration
title: UIGestureRecognizerRepresentableCoordinateSpaceConverter
kind: struct
captured: 2026-05-02
---

# UIGestureRecognizerRepresentableCoordinateSpaceConverter

A proxy structure used to convert locations to/from coordinate spaces in the hierarchy of the SwiftUI view associated with a `UIGestureRecognizerRepresentable`.

## Declaration

```swift
struct UIGestureRecognizerRepresentableCoordinateSpaceConverter
```









## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0

## Topics

### Instance Properties

- `localLocation`
- `localTranslation`
- `localVelocity`

### Instance Methods

- `convert(globalPoint:to:)`
- `location(in:)`
- `translation(in:)`
- `velocity(in:)`

## See Also

- `UIGestureRecognizerRepresentable`
- `UIGestureRecognizerRepresentableContext`
