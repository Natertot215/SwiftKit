---
url: https://developer.apple.com/documentation/swiftui/enhancing-your-app-content-with-tab-navigation
framework: SwiftUI
category: Navigation
title: Enhancing Your App's Content with Tab Navigation
kind: article
captured: 2026-05-01
---

# Enhancing Your App's Content with Tab Navigation

## Abstract

Keep your app content front and center while providing quick access to navigation using the tab bar.

## Overview

The Destination Video sample adopts the `sidebarAdaptable` tab view style, which optimizes the content browsing experience for each platform.

Starting in iPadOS 18, the tab bar appears on the top of the screen floating over your content. Tab bars provide top-level navigation. Implementing a sidebar makes it easier to navigate a detailed information hierarchy.

## Creating a Tab Bar

```swift
@State private var selectedTab: Tabs = .watchNow

var body: some View {
    TabView(selection: $selectedTab) {
        Tab("Watch Now", systemImage: "play", value: .watchNow) {
            WatchNowView()
        }
        // More tabs...
    }
}
```

```swift
enum Tabs: Equatable, Hashable, Identifiable {
    case watchNow
    case library
    case new
    case favorites
    case search
}
```

> **Note:** When using symbol images for your tabs, use the outline variant. The system automatically selects the filled variant when it appears in a tab bar.

### Search Tab Role

```swift
Tab(value: .search, role: .search) {
    // ...
}
```

The search tab gets default title "search", default magnifying glass symbol, and is automatically pinned at the trailing edge.

## Building Hierarchy in Tab View

```swift
TabView(selection: $selectedTab) {
    Tab("Watch Now", systemImage: "play", value: .watchNow) {
        WatchNowView()
    }

    TabSection {
        Tab("Cinematic Shots", systemImage: "list.and.film", value: .collections(.cinematic)) {
            // ...
        }
    } header: {
        Label("Collections", systemImage: "folder")
    }
}
```

```swift
TabSection {
    ForEach(Category.collectionsList) { collection in
        Tab(collection.name, systemImage: collection.icon, value: Tabs.collections(collection)) {
            // ..
        }
    }
} header: {
    Label("Collections", systemImage: "folder")
}
```

## Making the Tab Bar Adaptable

```swift
TabView(selection: $selectedTab) {
    // Tabs
}
.tabViewStyle(.sidebarAdaptable)
```

A `TabView` with the `sidebarAdaptable` style appears differently per platform:
- **iPadOS:** top tab bar that becomes a sidebar
- **iOS:** bottom tab bar
- **macOS:** sidebar
- **tvOS:** sidebar that collapses into a floating pill
- **visionOS:** ornament

## Enabling Customization

```swift
@AppStorage("sidebarCustomizations") var tabViewCustomization: TabViewCustomization
@State private var selectedTab: Tabs = .watchNow

TabView(selection: $selectedTab) {
    Tab("Watch Now", systemImage: "play", value: .watchNow) {
        WatchNowView()
    }
    .customizationID(Tabs.watchNow.customizationID)
    // More tabs...
}
.tabViewCustomization($tabViewCustomization)
```

```swift
Tab("Watch Now", systemImage: "play", value: .watchNow) {
    WatchNowView()
}
.customizationBehavior(.disabled, for: .sidebar, .tabBar)
```

## Setting Default Visibility

```swift
TabSection {
    // Tabs
} header {
    // Section header
}
.defaultVisibility(.hidden, for: .tabBar)
```

## Availability

iOS 18.0+, iPadOS 18.0+, Mac Catalyst 18.0+, macOS 15.0+, tvOS 18.0+, visionOS 2.0+
