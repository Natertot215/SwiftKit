---
url: https://developer.apple.com/documentation/swiftui/view/onreceive(_:perform:)
framework: SwiftUI
category: Model data
title: onReceive(_:perform:)
kind: method
captured: 2026-05-02
---

# onReceive(_:perform:)

Adds an action to perform when this view detects data emitted by the given publisher.

## Declaration

```swift
nonisolated func onReceive<P>(_ publisher: P, perform action: @escaping (P.Output) -> Void) -> some View where P : Publisher, P.Failure == Never

```

### Return Value

A view that triggers `action` when `publisher` emits an event.

## Parameters

- **publisher**: The publisher to subscribe to.
- **action**: The action to perform when an event is emitted by `publisher`. The event emitted by publisher is passed as a parameter to `action`.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `onChange(of:initial:_:)`
