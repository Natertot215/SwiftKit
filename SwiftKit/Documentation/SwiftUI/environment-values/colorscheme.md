---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/colorscheme
framework: SwiftUI
category: Environment values
title: colorScheme
kind: property
captured: 2026-05-02
---

# colorScheme

The color scheme of this environment.

## Declaration

```swift
var colorScheme: ColorScheme { get set }
```

### Discussion

Read this environment value from within a view to find out if SwiftUI is currently displaying the view using the `ColorScheme/light` or `ColorScheme/dark` appearance. The value that you receive depends on whether the user has enabled Dark Mode, possibly superseded by the configuration of the current presentation’s view hierarchy.

```swift
@Environment(\.colorScheme) private var colorScheme

var body: some View {
    Text(colorScheme == .dark ? "Dark" : "Light")
}
```

You can set the `colorScheme` environment value directly, but that usually isn’t what you want. Doing so changes the color scheme of the given view and its child views but *not*not the views above it in the view hierarchy. Instead, set a color scheme using the `View/preferredColorScheme(_:)` modifier, which also propagates the value up through the view hierarchy to the enclosing presentation, like a sheet or a window.

When adjusting your app’s user interface to match the color scheme, consider also checking the `EnvironmentValues/colorSchemeContrast` property, which reflects a system-wide contrast setting that the user controls. For information, see `doc://com.apple.documentation/design/Human-Interface-Guidelines/accessibility#Color-and-effects` in the Human Interface Guidelines.

> **NOTE:** If you only need to provide different colors or images for different color scheme and contrast settings, do that in your app’s Asset Catalog. See `asset-management`.







## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0



## See Also

- `preferredColorScheme(_:)`
- `ColorScheme`
