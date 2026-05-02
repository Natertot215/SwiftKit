---
url: https://developer.apple.com/documentation/swiftui/restoring-your-app-s-state-with-swiftui
framework: SwiftUI
category: Persistent storage
title: Restoring Your App's State with SwiftUI
kind: article
captured: 2026-05-01
---

# Restoring Your App's State with SwiftUI

## Abstract
Provide app continuity for users by preserving their current activities.

## Overview

This SwiftUI sample project demonstrates how to preserve your app's state information and restore the app to that previous state on subsequent launches. During a subsequent launch, restoring your interface to the previous interaction point provides continuity for the user, and lets them finish active tasks quickly.

When using your app, the user performs actions that affect the user interface. For example, the user might view a specific page of information, and after the user leaves the app, the operating system might terminate it to free up the resources it holds. The user can return to where they left off — and UI state restoration is a core part of making that experience seamless.

This sample app demonstrates the use of state preservation and restoration for scenarios where the system interrupts the app. The sample project manages a set of products. Each product has a title, an image, and other metadata you can view and edit. The project shows how to preserve and restore a product in its `DetailView`.

## Configure the Sample Code Project

In Xcode, select your development team on the iOS target's Signing and Capabilities tab.

## Enable State Preservation and Restoration

This sample code project uses SwiftUI's `Scene` to manage the app's user interface with its life cycle managed by the system. On iOS, state restoration is especially important at the window or scene level, because windows come and go frequently. It's necessary to save and restore state associated with each one.

To support state preservation and restoration, this sample uses `NSUserActivity` objects. For each user activity, the app must supply an activity type defined in its `Info.plist`.

## Use Scene Storage

SwiftUI has the concept of "storing scene data" or `SceneStorage`. Operating similar to `State`, scene storage is a property wrapper type that consists of a key/value pair. The key makes it possible for the system to save and restore the value correctly. The value is required to be of a `plist` type, so the system can save and restore it correctly.

Each view that needs its own state preservation implements a `@SceneStorage` property wrapper. For example `ContentView` uses one to restore the selected product:

```swift
@SceneStorage("ContentView.selectedProduct") private var selectedProduct: String?
```

`DetailView` uses one to restore its current selected tab:

```swift
@SceneStorage("DetailView.selectedTab") private var selectedTab = Tabs.detail
```

> **Note:** Each scene storage key must be unique, and properly scoped to the area or use within the app. Because this scene storage is local to the app, it's not necessary to prefix it with the app's bundle identifier. Use some disambiguating prefix where needed to ensure its uniqueness.

## Restore the App State with an Activity Object

An `NSUserActivity` object captures the app's state at the current moment in time. For example, include information about the data the app is currently displaying. The system saves the provided object and returns it to the app the next time it launches. The sample creates a new `NSUserActivity` object when the user closes the app or the app enters the background.

Each SwiftUI view that wants to advertise an `NSUserActivity` for handoff, Spotlight, etc. must specify a `userActivity(_:isActive:_:)` view modifier to advertise the `NSUserActivity`. The `activityType` parameter is the user activity's type, the `isActive` parameter indicates whether a user activity of the specified type is advertised (this parameter defaults to `true`), and whether it uses the specified handler to fill in the user-activity contents.

Each SwiftUI view that wants to handle incoming `NSUserActivities` must specify a `onContinueUserActivity(_:perform:)` view modifier. This takes the `NSUserActivity` type and a handler to invoke when the view receives the specified activity type for the scene or window in which the view is.

```swift
.onContinueUserActivity(DetailView.productUserActivityType) { userActivity in
    if let product = try? userActivity.typedPayload(Product.self) {
        selectedProduct = product.id.uuidString
    }
}
```

## Test State Restoration

This sample restores the following user interface:

- **Detail View Controller** — Tap a product in the collection view to open its detail information. The app restores the selected product and selected tab.
- **Detail View Controller's Edit State** — In the detail view, tap Edit. The app restores the edit view and its content.
- **Secondary Window** — (iPad only) Drag a product from the collection view over to the left or right of the device screen to create a second scene window. The app restores that scene and its product.

State restoration can be tested both on the device and Simulator. When debugging the sample project, the system automatically deletes its preserved state when the user force quits the app.

To test the sample app's ability to restore the sample's state, don't use the app switcher to force quit it during debugging. Instead, use Xcode to stop the app or stop the app programmatically. Another technique is to suspend the sample app using the Home button, and then stop the debugger in Xcode.

## See Also

### Saving State Across App Launches

- `defaultAppStorage(_:)`
- `AppStorage`
- `SceneStorage`
