---
url: https://developer.apple.com/documentation/swiftui/colorscheme
framework: SwiftUI
category: View configuration
title: ColorScheme
kind: enum
captured: 2026-05-02
---

# ColorScheme

The possible color schemes, corresponding to the light and dark appearances.

## Declaration

```swift
enum ColorScheme
```

### Overview

You receive a color scheme value when you read the `EnvironmentValues/colorScheme` environment value. The value tells you if a light or dark appearance currently applies to the view. SwiftUI updates the value whenever the appearance changes, and redraws views that depend on the value. For example, the following `Text` view automatically updates when the user enables Dark Mode:

```swift
@Environment(\.colorScheme) private var colorScheme

var body: some View {
    Text(colorScheme == .dark ? "Dark" : "Light")
}
```

Set a preferred appearance for a particular view hierarchy to override the user’s Dark Mode setting using the `View/preferredColorScheme(_:)` view modifier.





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

### Getting color schemes

- `ColorScheme.light`
- `ColorScheme.dark`

### Creating a color scheme

- `init(_:)`

### Supporting types

- `PreferredColorSchemeKey`

## See Also

- `preferredColorScheme(_:)`
- `colorScheme`
