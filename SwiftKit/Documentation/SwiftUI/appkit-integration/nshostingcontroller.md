---
url: https://developer.apple.com/documentation/swiftui/nshostingcontroller
framework: SwiftUI
category: AppKit integration
title: NSHostingController
kind: class
captured: 2026-05-02
---

# NSHostingController

An AppKit view controller that hosts SwiftUI view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency class NSHostingController<Content> where Content : View
```

### Overview

Create an `NSHostingController` object when you want to integrate SwiftUI views into an AppKit view hierarchy. At creation time, specify the SwiftUI view you want to use as the root view for this view controller; you can change that view later using the `NSHostingController/rootView` property. Use the hosting controller like you would any other view controller, by presenting it or embedding it as a child view controller in your interface.





## Relationships

**Inherits From**: `NSViewController`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSEditor`, `NSExtensionRequestHandling`, `NSObjectProtocol`, `NSSeguePerforming`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`

## Availability

- macOS 10.15

## Topics

### Creating a hosting controller object

- `init(rootView:)`
- `init(coder:rootView:)`
- `init(coder:)`

### Getting the root view

- `rootView`
- `identifier`

### Configuring the controller

- `sizeThatFits(in:)`
- `preferredContentSize`
- `sizingOptions`
- `safeAreaRegions`
- `sceneBridgingOptions`

## See Also

- `Unifying your app’s animations`
- `NSHostingView`
- `NSHostingMenu`
- `NSHostingSizingOptions`
- `NSHostingSceneRepresentation`
- `NSHostingSceneBridgingOptions`
