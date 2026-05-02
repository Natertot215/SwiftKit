---
url: https://developer.apple.com/documentation/swiftui/view/keyboardtype(_:)
framework: SwiftUI
category: Text input and output
title: keyboardType(_:)
kind: method
captured: 2026-05-02
---

# keyboardType(_:)

Sets the keyboard type for this view.

## Declaration

```swift
nonisolated func keyboardType(_ type: UIKeyboardType) -> some View

```

### Discussion

Use `keyboardType(_:)` to specify the keyboard type to use for text entry. A number of different keyboard types are available to meet specialized input needs, such as entering email addresses or phone numbers.

The example below presents a `TextField` to input an email address. Setting the text field’s keyboard type to `.emailAddress` ensures the user can only enter correctly formatted email addresses.

```swift
TextField("someone@example.com", text: $emailAddress)
    .keyboardType(.emailAddress)
```

There are several different kinds of specialized keyboard types available though the `UIKeyboardType` enumeration. To specify the default system keyboard type, use `.default`.

## Parameters

- **type**: One of the keyboard types defined in the `UIKeyboardType` enumeration.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- tvOS 13.0
- visionOS 1.0



## See Also

- `autocorrectionDisabled(_:)`
- `autocorrectionDisabled`
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
