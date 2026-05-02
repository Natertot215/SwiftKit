---
url: https://developer.apple.com/documentation/appkit/restoring-your-app-s-state-with-appkit
framework: AppKit
category: Windows, panels, and screens
title: Restoring Your App's State with AppKit
kind: article
captured: 2026-05-01
---

# Restoring Your App's State with AppKit

## Abstract
Provide continuity for people using your app by preserving current activities on macOS.

## Overview

This sample app demonstrates how to preserve your app's state information and restore the app to that previous state on subsequent launches. During a subsequent launch, restoring your interface to the previous interaction point provides continuity for your app, and lets people finish active tasks quickly.

When using your app, people perform actions that update and alter the user interface. For example, someone might view a specific page of information, and after they leave the app, the operating system might terminate it to free up the resources it holds. The person should be able to return to where they left off—and window state restoration is a core part of making that experience seamless.

This sample app demonstrates the use of state preservation and restoration for a macOS app. The sample app manages a set of products. Each product has a title, an image, and other metadata you can view and edit. The project shows how to preserve and restore product selection, tab state, editor state, and multiple windows using the `NSWindowRestoration` protocol in AppKit.

The state restoration system in AppKit uses three key mechanisms working together:

- Window registration with a restoration class
- Encoding state into an `NSCoder` archive
- Restoring windows on relaunch through the `restoreWindow(withIdentifier:state:completionHandler:)` protocol method

## Configure the Sample Code Project

In Xcode, select your development team on the macOS target's Signing & Capabilities tab.

## Enable Window State Restoration

To enable window state restoration, each window must be configured with a unique identifier, a frame autosave name, and a restoration class. The restoration class conforms to the `NSWindowRestoration` protocol and is responsible for recreating the window during restoration.

```swift
window.identifier = NSUserInterfaceItemIdentifier("MainWindow")
window.setFrameAutosaveName("MainWindow")
window.restorationClass = WindowRestorationHandler.self
window.isRestorable = true
```

The app delegate must also declare support for secure restorable state:

```swift
func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
}
```

## Restore Windows with the NSWindowRestoration Protocol

The `WindowRestorationHandler` class conforms to `NSWindowRestoration` and implements the static `restoreWindow(withIdentifier:state:completionHandler:)` method. AppKit calls this method at launch for each window that was open when the app last quit. The method creates the appropriate window controller based on the window identifier and passes the window back through the completion handler; otherwise, ignores the window and any errors by passing `nil`.

```swift
@MainActor
class WindowRestorationHandler: NSObject, NSWindowRestoration {
    static func restoreWindow(
        withIdentifier identifier: NSUserInterfaceItemIdentifier,
        state: NSCoder,
        completionHandler: @escaping (NSWindow?, Error?) -> Void
    ) {
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
            completionHandler(nil, nil)
            return
        }

        switch identifier.rawValue {
        case WindowIdentifiers.mainWindow:
            let controller = MainWindowController()
            appDelegate.mainWindowController = controller
            completionHandler(controller.window, nil)
        case WindowIdentifiers.imageWindow:
            let controller = ImageWindowController()
            appDelegate.imageWindowControllers.append(controller)
            completionHandler(controller.window, nil)
        default:
            completionHandler(nil, nil)
        }
    }
}
```

After AppKit creates each window through this method, it calls `restoreState(with:)` on the window controller to decode the saved state.

## Encode and Decode Window State

Each window controller overrides `encodeRestorableState(with:)` to save its state, and `restoreState(with:)` to read it back.

```swift
override func encodeRestorableState(with coder: NSCoder) {
    super.encodeRestorableState(with: coder)

    if let product = splitViewController?.selectedProduct {
        coder.encode(product.identifier.uuidString, forKey: RestorationKeys.productIdentifier)
    }
    if let tabIndex = splitViewController?.selectedTabIndex {
        coder.encode(tabIndex, forKey: RestorationKeys.selectedTab)
    }
    if let editorState = splitViewController?.editorState {
        coder.encode(true, forKey: RestorationKeys.presentedEditor)
        coder.encode(editorState.title, forKey: RestorationKeys.editorTitle)
        coder.encode(editorState.price, forKey: RestorationKeys.editorPrice)
        coder.encode(editorState.year, forKey: RestorationKeys.editorYear)
    } else {
        coder.encode(false, forKey: RestorationKeys.presentedEditor)
    }
}
```

```swift
override func restoreState(with coder: NSCoder) {
    super.restoreState(with: coder)

    if let productId = coder.decodeObject(forKey: RestorationKeys.productIdentifier) as? String,
       let product = DataModelManager.sharedInstance.product(fromIdentifier: productId) {
        splitViewController?.selectProduct(product)
    }
    let tabIndex = coder.decodeInteger(forKey: RestorationKeys.selectedTab)
    splitViewController?.restoreTabIndex(tabIndex)

    if coder.decodeBool(forKey: RestorationKeys.presentedEditor) {
        let title = coder.decodeObject(forKey: RestorationKeys.editorTitle) as? String
        let price = coder.decodeObject(forKey: RestorationKeys.editorPrice) as? String
        let year = coder.decodeObject(forKey: RestorationKeys.editorYear) as? String
        splitViewController?.restoreEditor(title: title, price: price, year: year)
    }
}
```

## Invalidate Restorable State on Changes

Whenever someone makes a change that should be preserved—selecting a product, switching tabs, or editing fields—the window controller calls `invalidateRestorableState()`. This tells AppKit that the saved state is out of date and needs to be re-encoded before the app terminates.

```swift
splitViewController.onProductSelected = { [weak self] product in
    self?.invalidateRestorableState()
}
splitViewController.onTabChanged = { [weak self] in
    self?.invalidateRestorableState()
}
```

## Restore Multiple Windows

The sample app supports multiple windows. The main window displays a split view with a product collection in the sidebar and a detail pane. Additional standalone image windows can be opened for any product. Each window type has its own window controller and encodes its own state independently.

```swift
override func encodeRestorableState(with coder: NSCoder) {
    super.encodeRestorableState(with: coder)
    if let product = product {
        coder.encode(product.identifier.uuidString, forKey: RestorationKeys.productIdentifier)
    }
}
```

AppKit restores all open windows on relaunch. The `WindowRestorationHandler` class routes each window to the correct controller based on its identifier.

## Test State Restoration

To test state restoration, quit the app normally (Command-Q or through the app menu). Do not force quit the app, as macOS discards saved state when a person force quits. Relaunch the app, and AppKit initiates the window restoration process, recreating each window in its previous state.

## See Also

- `NSWindowRestoration` - A set of methods that restoration classes must implement to handle the recreation of windows
- `NSUserInterfaceItemIdentification` - A set of methods used to associate a unique identifier with objects in your user interface
