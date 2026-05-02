---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/symbolvariants
framework: SwiftUI
category: Environment values
title: symbolVariants
kind: property
captured: 2026-05-02
---

# symbolVariants

The symbol variant to use in this environment.

## Declaration

```swift
var symbolVariants: SymbolVariants { get set }
```

### Discussion

You set this environment value indirectly by using the `View/symbolVariant(_:)` view modifier. However, you access the environment variable directly using the `View/environment(_:_:)` modifier. Do this when you want to use the `SymbolVariants/none` variant to ignore the value that’s already in the environment:

```swift
HStack {
    Image(systemName: "heart")
    Image(systemName: "heart")
        .environment(\.symbolVariants, .none)
}
.symbolVariant(.fill)
```







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `symbolVariant(_:)`
- `SymbolVariants`
