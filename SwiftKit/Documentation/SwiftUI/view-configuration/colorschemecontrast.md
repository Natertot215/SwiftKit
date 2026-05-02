---
url: https://developer.apple.com/documentation/swiftui/colorschemecontrast
framework: SwiftUI
category: View configuration
title: ColorSchemeContrast
kind: enum
captured: 2026-05-02
---

# ColorSchemeContrast

The contrast between the app’s foreground and background colors.

## Declaration

```swift
enum ColorSchemeContrast
```

### Overview

You receive a contrast value when you read the `EnvironmentValues/colorSchemeContrast` environment value. The value tells you if a standard or increased contrast currently applies to the view. SwiftUI updates the value whenever the contrast changes, and redraws views that depend on the value. For example, the following `Text` view automatically updates when the user enables increased contrast:

```swift
@Environment(\.colorSchemeContrast) private var colorSchemeContrast

var body: some View {
    Text(colorSchemeContrast == .standard ? "Standard" : "Increased")
}
```

The user sets the contrast by selecting the Increase Contrast option in Accessibility > Display in System Preferences on macOS, or Accessibility > Display & Text Size in the Settings app on iOS. Your app can’t override the user’s choice. For information about using color and contrast in your app, see `doc://com.apple.documentation/design/Human-Interface-Guidelines/accessibility#Color-and-effects` in the Human Interface Guidelines.





## Relationships

**Conforms To**: `CaseIterable`, `Copyable`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Getting contrast options

- `ColorSchemeContrast.standard`
- `ColorSchemeContrast.increased`

### Creating a color scheme contrast

- `init(_:)`

## See Also

- `colorSchemeContrast`
