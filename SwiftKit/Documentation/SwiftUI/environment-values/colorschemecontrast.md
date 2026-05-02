---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/colorschemecontrast
framework: SwiftUI
category: Environment values
title: colorSchemeContrast
kind: property
captured: 2026-05-02
---

# colorSchemeContrast

The contrast associated with the color scheme of this environment.

## Declaration

```swift
var colorSchemeContrast: ColorSchemeContrast { get }
```

### Discussion

Read this environment value from within a view to find out if SwiftUI is currently displaying the view using `ColorSchemeContrast/standard` or `ColorSchemeContrast/increased` contrast. The value that you read depends entirely on user settings, and you can’t change it.

```swift
@Environment(\.colorSchemeContrast) private var colorSchemeContrast

var body: some View {
    Text(colorSchemeContrast == .standard ? "Standard" : "Increased")
}
```

When adjusting your app’s user interface to match the contrast, consider also checking the `EnvironmentValues/colorScheme` property to find out if SwiftUI is displaying the view with a light or dark appearance. For information, see `doc://com.apple.documentation/design/Human-Interface-Guidelines/accessibility#Color-and-effects` in the Human Interface Guidelines.

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

- `ColorSchemeContrast`
