---
url: https://developer.apple.com/documentation/swiftui/uihostingcontroller
framework: SwiftUI
category: UIKit integration
title: UIHostingController
kind: class
captured: 2026-05-02
---

# UIHostingController

A UIKit view controller that manages a SwiftUI view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency class UIHostingController<Content> where Content : View
```

### Overview

Create a `UIHostingController` object when you want to integrate SwiftUI views into a UIKit view hierarchy. At creation time, specify the SwiftUI view you want to use as the root view for this view controller; you can change that view later using the `UIHostingController/rootView` property. Use the hosting controller like you would any other view controller, by presenting it or embedding it as a child view controller in your interface.





## Relationships

**Inherits From**: `UIViewController`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSCoding`, `NSExtensionRequestHandling`, `NSObjectProtocol`, `NSTouchBarProvider`, `UIActivityItemsConfigurationProviding`, `UIContentContainer`, `UIFocusEnvironment`, `UIKit.UIAppearanceContainer`, `UIPasteConfigurationSupporting`, `UIResponderStandardEditActions`, `UIStateRestoring`, `UITraitChangeObservable`, `UITraitEnvironment`, `UIUserActivityRestoring`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- tvOS 13.0
- visionOS 1.0

## Topics

### Creating a hosting controller object

- `init(rootView:)`
- `init(coder:rootView:)`
- `init(coder:)`

### Responding to view-related events

- `loadView()`
- `viewWillAppear(_:)`
- `viewDidAppear(_:)`
- `viewWillDisappear(_:)`
- `viewDidDisappear(_:)`
- `willMove(toParent:)`
- `didMove(toParent:)`
- `viewWillTransition(to:with:)`
- `viewWillLayoutSubviews()`
- `target(forAction:withSender:)`
- `rootView`

### Checking for modality

- `isModalInPresentation`

### Managing the size

- `sizingOptions`
- `preferredContentSizeDidChange(forChildContentContainer:)`
- `sizeThatFits(in:)`
- `safeAreaRegions`

### Configuring the status bar

- `preferredStatusBarStyle`
- `preferredStatusBarUpdateAnimation`
- `prefersStatusBarHidden`
- `childForStatusBarStyle`
- `childForStatusBarHidden`

### Configuring the home indicator

- `prefersHomeIndicatorAutoHidden`
- `childForHomeIndicatorAutoHidden`

### Configuring the interface appearance

- `preferredUserInterfaceStyle`
- `preferredScreenEdgesDeferringSystemGestures`
- `childForScreenEdgesDeferringSystemGestures`

### Accessing the available key commands

- `keyCommands`

### Managing undo

- `undoManager`

### Instance Properties

- `childViewControllerForPreferredContainerBackgroundStyle`
- `preferredContainerBackgroundStyle`

### Instance Methods

- `addChild(_:)`

## See Also

- `Using SwiftUI with UIKit`
- `Unifying your app’s animations`
- `UIHostingControllerSizingOptions`
- `UIHostingConfiguration`
- `UIHostingSceneDelegate`
