---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/controlactivestate
framework: SwiftUI
category: Environment values
title: controlActiveState
kind: property
captured: 2026-05-02
---

# controlActiveState

The active appearance expected of controls in a window.

## Declaration

```swift
var controlActiveState: ControlActiveState { get set }
```

### Discussion

`ControlActiveState` and `EnvironmentValues.controlActiveState` are deprecated, use `EnvironmentValues.appearsActive` instead.

Starting with macOS 15.0, the value of this environment property is strictly mapped to and from `EnvironmentValues.appearsActive` as follows:

- `appearsActive == true`, `controlActiveState` returns `.key`
- `appearsActive == false`, `controlActiveState` returns `.inactive`
- `controlActiveState` is set to `.key` or `.active`, `appearsActive` will be set to `true`.
- `controlActiveState` is set to `.inactive`, `appearsActive` will be set to `false`.







## Availability

- macOS 10.15 (deprecated 26.5)



## See Also

- `disableAutocorrection`
- `sizeCategory`
- `presentationMode`
- `PresentationMode`
- `complicationRenderingMode`
