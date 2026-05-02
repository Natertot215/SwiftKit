---
url: https://developer.apple.com/documentation/swiftui/view/autocorrectiondisabled(_:)
framework: SwiftUI
category: Text input and output
title: autocorrectionDisabled(_:)
kind: method
captured: 2026-05-02
---

# autocorrectionDisabled(_:)

Sets whether to disable autocorrection for this view.

## Declaration

```swift
nonisolated func autocorrectionDisabled(_ disable: Bool = true) -> some View

```

### Discussion

Use this method when the effect of autocorrection would make it more difficult for the user to input information. The entry of proper names and street addresses are examples where autocorrection can negatively affect the user’s ability complete a data entry task.

The example below configures a `TextField` with the default keyboard. Disabling autocorrection allows the user to enter arbitrary text without the autocorrection system offering suggestions or attempting to override their input.

```swift
TextField("1234 Main St.", text: $address)
    .keyboardType(.default)
    .autocorrectionDisabled(true)
```

## Parameters

- **disable**: A Boolean value that indicates whether autocorrection is disabled for this view. The default value is `true`.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `autocorrectionDisabled`
- `keyboardType(_:)`
- `scrollDismissesKeyboard(_:)`
- `textContentType(_:)`
- `textInputAutocapitalization(_:)`
- `TextInputAutocapitalization`
- `textInputCompletion(_:)`
- `textInputSuggestions(_:)`
- `textInputSuggestions(_:content:)`
- `textInputSuggestions(_:id:content:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `TextInputFormattingControlPlacement`
