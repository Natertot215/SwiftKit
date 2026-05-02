---
url: https://developer.apple.com/documentation/appkit/organize-your-user-interface-with-a-stack-view
framework: AppKit
category: Views and controls
title: Organize Your User Interface with a Stack View
kind: article
captured: 2026-05-01
---

# Organize Your User Interface with a Stack View

## Abstract
Group individual views in your app's user interface into a scrollable stack view.

## Overview

`NSStackView` simplifies the process of stacking arbitrary views together in one place. You embed a stack view inside an `NSScrollView` object, making the stack's content scrollable when the user resizes the window. This sample shows how to use `NSStackView` with each individual view either disclosed (expanded) or hidden (collapsed).

The sample's architecture uses the following protocols:

- **`StackItemHeader`** - Represents the header's view and its ability to expand and collapse its corresponding stack item body.
- **`StackItemBody`** - Represents the stack item's primary interface.
- **`StackItemContainer`** - Represents each stack item, combining both the header view and the body view.
- **`StackItemHost`** - Discloses each stack item container.

### StackItemContainer Class

```swift
class StackItemContainer {
    // Disclosure state of this container.
    var state: NSControl.StateValue

    let header: StackItemHeader
    let body: StackItemBody

    init(header: StackItemHeader, body: StackItemBody) {
        self.header = header
        self.body = body
        self.state = .on
    }
}
```

This design simplifies adding stack items as view controllers. When you adopt these protocols, all stack items behave the same way and follow the same management rules.

## Key Features

### State Restoration
The sample uses `NSWindowRestoration` protocol to restore the stack view's window on relaunch. The disclosure states of all stack view containers are also restored. Add `NSRestorableState` to each item's view controller.

Example for `FormViewController`:

```swift
/// Encode state. Helps save the restorable state of this view controller.
override func encodeRestorableState(with coder: NSCoder) {
    coder.encode(textField.stringValue, forKey: FormViewController.formTextKey)
    super.encodeRestorableState(with: coder)
}

/// Decode state. Helps restore any previously stored state.
override func restoreState(with coder: NSCoder) {
    super.restoreState(with: coder)
    if let restoredText = coder.decodeObject(forKey: FormViewController.formTextKey) as? String {
        textField.stringValue = restoredText
    }
}
```

### Disclosure Appearance Options
- Triangle (using `NSButton` disclosure style)
- Rounded button with up and down arrows (`roundedDisclosure` style)

## Availability
- **macOS**: 10.13+
- **Xcode**: 13.0+

## See Also
- NSStackView
- NSTabView
- NSSplitView
- Grid View
- Scroll View
- Localization-friendly layouts in macOS
