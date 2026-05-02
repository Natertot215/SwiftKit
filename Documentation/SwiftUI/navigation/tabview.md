---
url: https://developer.apple.com/documentation/swiftui/tabview
framework: SwiftUI
category: Navigation
title: TabView
kind: struct
captured: 2026-05-01
---

# TabView

## Declaration

```swift
struct TabView<SelectionValue, Content>
where SelectionValue : Hashable, Content : View
```

## Abstract

A view that switches between multiple child views using interactive user interface elements.

## Overview

To create a user interface with tabs, place `Tab`s in a `TabView`. On iOS, you can also use one of the badge modifiers, like `badge(_:)`, to assign a badge to each of the tabs.

### Basic Example

```swift
TabView {
    Tab("Received", systemImage: "tray.and.arrow.down.fill") {
        ReceivedView()
    }
    .badge(2)

    Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
        SentView()
    }

    Tab("Account", systemImage: "person.crop.circle.fill") {
        AccountView()
    }
    .badge("!")
}
```

### Programmatic Selection

```swift
TabView(selection: $selection) {
    Tab("Received", systemImage: "tray.and.arrow.down.fill", value: 0) {
        ReceivedView()
    }
    Tab("Sent", systemImage: "tray.and.arrow.up.fill", value: 1) {
        SentView()
    }
    Tab("Account", systemImage: "person.crop.circle.fill", value: 2) {
        AccountView()
    }
}
```

### Page Style

```swift
TabView {
    ForEach(cities) { city in
        TemperatureView(city)
    }
}
.tabViewStyle(.page)
```

### Tab Sections

```swift
TabView {
    Tab("Requests", systemImage: "paperplane") { RequestsView() }
    Tab("Account", systemImage: "person.crop.circle.fill") { AccountView() }

    TabSection("Messages") {
        Tab("Received", systemImage: "tray.and.arrow.down.fill") { ReceivedView() }
        Tab("Sent", systemImage: "tray.and.arrow.up.fill") { SentView() }
        Tab("Drafts", systemImage: "pencil") { DraftsView() }
    }
}
.tabViewStyle(.sidebarAdaptable)
```

### Customization

```swift
@AppStorage
private var customization: TabViewCustomization

TabView {
    Tab("Home", systemImage: "house") { MyHomeView() }
        .customizationID("com.myApp.home")
    // ...
}
.tabViewStyle(.sidebarAdaptable)
.tabViewCustomization($customization)
```

## Initializers

- `init(content:)`
- `init(selection:content:)`

## Conforms To

- `View`

## Availability

- iOS 13.0+, iPadOS 13.0+, Mac Catalyst 13.0+, macOS 10.15+, tvOS 13.0+, visionOS 1.0+, watchOS 7.0+

## See Also

- Enhancing your app's content with tab navigation
- `Tab`, `TabRole`, `TabSection`
- `View/tabViewStyle(_:)`
