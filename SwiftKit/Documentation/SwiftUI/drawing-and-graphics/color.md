---
url: https://developer.apple.com/documentation/swiftui/color
framework: SwiftUI
category: Drawing and graphics
title: Color
kind: struct
captured: 2026-05-02
---

# Color

A representation of a color that adapts to a given context.

## Declaration

```swift
@frozen struct Color
```

### Overview

You can create a color in one of several ways:

- Load a color from an Asset Catalog:

```swift
let aqua = Color("aqua") // Looks in your app's main bundle by default.
```
- Specify component values, like red, green, and blue; hue, saturation, and brightness; or white level:

```swift
let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
let lemonYellow = Color(hue: 0.1639, saturation: 1, brightness: 1)
let steelGray = Color(white: 0.4745)
```
- Create a color instance from another color, like a `UIColor` or an `NSColor`:

```swift
#if os(iOS)
let linkColor = Color(uiColor: .link)
#elseif os(macOS)
let linkColor = Color(nsColor: .linkColor)
#endif
```
- Use one of a palette of predefined colors, like `ShapeStyle/black`, `ShapeStyle/green`, and `ShapeStyle/purple`.

Some view modifiers can take a color as an argument. For example, `View/foregroundStyle(_:)` uses the color you provide to set the foreground color for view elements, like text or `doc://com.apple.documentation/design/Human-Interface-Guidelines/sf-symbols`:

```swift
Image(systemName: "leaf.fill")
    .foregroundStyle(Color.green)
```

Because SwiftUI treats colors as `View` instances, you can also directly add them to a view hierarchy. For example, you can layer a rectangle beneath a sun image using colors defined above:

```swift
ZStack {
    skyBlue
    Image(systemName: "sun.max.fill")
        .foregroundStyle(lemonYellow)
}
.frame(width: 200, height: 100)
```

A color used as a view expands to fill all the space it’s given, as defined by the frame of the enclosing `ZStack` in the above example:

SwiftUI only resolves a color to a concrete value just before using it in a given environment. This enables a context-dependent appearance for system defined colors, or those that you load from an Asset Catalog. For example, a color can have distinct light and dark variants that the system chooses from at render time.





## Relationships

**Conforms To**: `Copyable`, `CustomStringConvertible`, `Equatable`, `Escapable`, `Hashable`, `Sendable`, `SendableMetatype`, `ShapeStyle`, `Transferable`, `View`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating a color

- `init(_:bundle:)`
- `init(_:)`
- `resolve(in:)`

### Creating a color from component values

- `init(hue:saturation:brightness:opacity:)`
- `init(_:white:opacity:)`
- `init(_:red:green:blue:opacity:)`
- `Color.RGBColorSpace`

### Creating a color from another color

- `init(uiColor:)`
- `init(nsColor:)`
- `init(cgColor:)`

### Getting standard colors

- `black`
- `blue`
- `brown`
- `clear`
- `cyan`
- `gray`
- `green`
- `indigo`
- `mint`
- `orange`
- `pink`
- `purple`
- `red`
- `teal`
- `white`
- `yellow`

### Getting semantic colors

- `accentColor`
- `primary`
- `secondary`

### Modifying a color

- `opacity(_:)`
- `gradient`
- `mix(with:by:in:)`
- `exposureAdjust(_:)`
- `headroom(_:)`

### Working with high dynamic range (HDR) colors

- `resolveHDR(in:)`
- `Color.ResolvedHDR`

### Describing a color

- `description`

### Comparing colors

- `==(_:_:)`
- `hash(into:)`

### Deprecated symbols

- `cgColor`

### Default Implementations

- `ShapeStyle Implementations`
- `Transferable Implementations`

## See Also

- `tint(_:)`
