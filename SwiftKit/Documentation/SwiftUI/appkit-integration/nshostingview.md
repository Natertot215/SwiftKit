---
url: https://developer.apple.com/documentation/swiftui/nshostingview
framework: SwiftUI
category: AppKit integration
title: NSHostingView
kind: class
captured: 2026-05-02
---

# NSHostingView

An AppKit view that hosts a SwiftUI view hierarchy.

## Declaration

```swift
@MainActor @preconcurrency class NSHostingView<Content> where Content : View
```

### Overview

You use `NSHostingView` objects to integrate SwiftUI views into your AppKit view hierarchies. A hosting view is an `NSView` object that manages a single SwiftUI view, which may itself contain other SwiftUI views. Because it is an `NSView` object, you can integrate it into your existing AppKit view hierarchies to implement portions of your UI. For example, you can use a hosting view to implement a custom control.

A hosting view acts as a bridge between your SwiftUI views and your AppKit interface. During layout, the hosting view reports the content size preferences of your SwiftUI views back to the AppKit layout system so that it can size the view appropriately. The hosting view also coordinates event delivery.





## Relationships

**Inherits From**: `NSView`

**Conforms To**: `CVarArg`, `Copyable`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `NSAccessibilityElementProtocol`, `NSAccessibilityProtocol`, `NSAnimatablePropertyContainer`, `NSAppearanceCustomization`, `NSCoding`, `NSDraggingDestination`, `NSDraggingSource`, `NSObjectProtocol`, `NSStandardKeyBindingResponding`, `NSTouchBarProvider`, `NSUserActivityRestoring`, `NSUserInterfaceItemIdentification`, `NSUserInterfaceValidations`

## Availability

- macOS 10.15

## Topics

### Creating a hosting view

- `init(rootView:)`
- `init(coder:)`
- `prepareForReuse()`

### Getting the root view

- `rootView`

### Configuring the view layout behavior

- `requiresConstraintBasedLayout`
- `userInterfaceLayoutDirection`
- `isFlipped`
- `layerContentsRedrawPolicy`
- `updateConstraints()`
- `layout()`
- `safeAreaRegions`

### Managing keyboard interaction

- `keyDown(with:)`
- `keyUp(with:)`
- `performKeyEquivalent(with:)`
- `insertText(_:)`
- `didChangeValue(forKey:)`
- `makeTouchBar()`

### Responding to mouse events

- `mouseDown(with:)`
- `mouseUp(with:)`
- `otherMouseDown(with:)`
- `otherMouseUp(with:)`
- `rightMouseDown(with:)`
- `rightMouseUp(with:)`
- `mouseEntered(with:)`
- `mouseExited(with:)`
- `mouseDragged(with:)`
- `mouseMoved(with:)`
- `otherMouseDragged(with:)`
- `rightMouseDragged(with:)`
- `cursorUpdate(with:)`

### Responding to touch events

- `touchesBegan(with:)`
- `touchesCancelled(with:)`
- `touchesEnded(with:)`
- `touchesMoved(with:)`

### Responding to gestures

- `magnify(with:)`
- `rotate(with:)`
- `scrollWheel(with:)`

### Handling drag and drop

- `validRequestor(forSendType:returnType:)`

### Providing a context menu

- `menu(for:)`

### Responding to actions

- `responds(to:)`
- `forwardingTarget(for:)`
- `doCommand(by:)`

### Configuring the responder behavior

- `acceptsFirstResponder`
- `needsPanelToBecomeKey`

### Managing the view hierarchy

- `viewWillMove(toWindow:)`
- `viewDidMoveToWindow()`
- `viewDidChangeBackingProperties()`
- `viewDidChangeEffectiveAppearance()`

### Modifying the frame rectangle

- `intrinsicContentSize`
- `setFrameSize(_:)`
- `firstBaselineOffsetFromTop`
- `lastBaselineOffsetFromBottom`
- `sizingOptions`
- `firstTextLineCenter`

### Testing for hits

- `hitTest(_:)`

### Managing accessibility behaviors

- `accessibilityFocusedUIElement`
- `accessibilityChildren()`
- `accessibilityChildrenInNavigationOrder()`
- `accessibilityHitTest(_:)`
- `accessibilityRole()`
- `accessibilitySubrole()`
- `isAccessibilityElement()`

### Bridging with SwiftUI

- `sceneBridgingOptions`

### Initializers

- `init(coder:rootView:)`

### Instance Properties

- `clipsToBounds`

### Instance Methods

- `acceptsFirstMouse(for:)`
- `beginDocument()`
- `didAddSubview(_:)`
- `endDocument()`
- `observeValue(forKeyPath:of:change:context:)`
- `shouldDelayWindowOrdering(for:)`
- `showContextMenuForSelection(_:)`
- `viewDidEndLiveResize()`
- `viewWillStartLiveResize()`
- `willRemoveSubview(_:)`

## See Also

- `Unifying your app’s animations`
- `NSHostingController`
- `NSHostingMenu`
- `NSHostingSizingOptions`
- `NSHostingSceneRepresentation`
- `NSHostingSceneBridgingOptions`
