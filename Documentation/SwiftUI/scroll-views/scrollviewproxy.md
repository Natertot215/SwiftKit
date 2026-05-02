---
url: https://developer.apple.com/documentation/swiftui/scrollviewproxy
framework: SwiftUI
category: Scroll views
title: ScrollViewProxy
kind: struct
captured: 2026-05-02
---

# ScrollViewProxy

A proxy value that supports programmatic scrolling of the scrollable views within a view hierarchy.

## Declaration

```swift
struct ScrollViewProxy
```

### Overview

You don’t create instances of `ScrollViewProxy` directly. Instead, your `ScrollViewReader` receives an instance of `ScrollViewProxy` in its `content` view builder. You use actions within this view builder, such as button and gesture handlers or the `View/onChange(of:perform:)` method, to call the proxy’s `ScrollViewProxy/scrollTo(_:anchor:)` method.







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 14.0
- visionOS 1.0
- watchOS 7.0

## Topics

### Performing scrolling

- `scrollTo(_:anchor:)`

## See Also

- `ScrollView`
- `ScrollViewReader`
