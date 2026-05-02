---
url: https://developer.apple.com/documentation/swiftui/menustyleconfiguration
framework: SwiftUI
category: View styles
title: MenuStyleConfiguration
kind: struct
captured: 2026-05-02
---

# MenuStyleConfiguration

A configuration of a menu.

## Declaration

```swift
struct MenuStyleConfiguration
```

### Overview

Use the `Menu/init(_:)` initializer of `Menu` to create an instance using the current menu style, which you can modify to create a custom style.

For example, the following code creates a new, custom style that adds a red border to the current menu style:

```swift
struct RedBorderMenuStyle: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .border(Color.red)
    }
}
```







## Availability

- iOS 14.0
- iPadOS 14.0
- Mac Catalyst 14.0
- macOS 11.0
- tvOS 17.0
- visionOS 1.0

## Topics

### Setting the label and content

- `MenuStyleConfiguration.Label`
- `MenuStyleConfiguration.Content`

## See Also

- `menuStyle(_:)`
- `MenuStyle`
