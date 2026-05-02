---
url: https://developer.apple.com/documentation/swiftui/widgetbundle
framework: SwiftUI
category: App extensions
title: WidgetBundle
kind: protocol
captured: 2026-05-02
---

# WidgetBundle

A container used to expose multiple widgets from a single widget extension.

## Declaration

```swift
@MainActor @preconcurrency protocol WidgetBundle
```

### Overview

To support multiple types of widgets, add the `@main` attribute to a structure that conforms to `WidgetBundle`. For example, a game might have one widget to display summary information about the game and a second widget to display detailed information about individual characters.

```swift
@main
struct GameWidgets: WidgetBundle {
   var body: some Widget {
       GameStatusWidget()
       CharacterDetailWidget()
   }
}
```







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- visionOS 1.0
- watchOS 9.0

## Topics

### Implementing a widget bundle

- `body`
- `Body`
- `WidgetBundleBuilder`

### Running a widget bundle

- `init()`
- `main()`

## See Also

- `Building Widgets Using WidgetKit and SwiftUI`
- `Creating a widget extension`
- `Keeping a widget up to date`
- `Making a configurable widget`
- `Widget`
- `LimitedAvailabilityConfiguration`
- `WidgetConfiguration`
- `EmptyWidgetConfiguration`
