---
url: https://developer.apple.com/documentation/swiftui/view/textinputcompletion(_:)
framework: SwiftUI
category: Text input and output
title: textInputCompletion(_:)
kind: method
captured: 2026-05-02
---

# textInputCompletion(_:)

Associates a fully formed string with the value of this view when used as a text input suggestion

## Declaration

```swift
nonisolated func textInputCompletion(_ completion: String) -> some View

```

### Discussion

Use this method to associate a fully formed string with a view that is within a text input suggestion list context. The system uses this value when the view is selected to replace the partial text being currently edited of the associated text field.

```swift
TextField("Location", text: $addressText)
    .textInputSuggestions(isEnabled: true) {
        Text("The Fillmore")
            .textInputCompletion("1805 Geary Blvd, San Francisco")
        Text("The Catalyst")
            .textInputCompletion("1011 Pacific Ave, Santa Cruz")
        Text("Rio Theatre")
            .textInputCompletion("1205 Soquel Ave, Santa Cruz")
    }
```

## Parameters

- **completion**: A string to use as the view’s completion.





## Availability

- macOS 15.0



## See Also

- `autocorrectionDisabled(_:)`
- `autocorrectionDisabled`
- `keyboardType(_:)`
- `scrollDismissesKeyboard(_:)`
- `textContentType(_:)`
- `textInputAutocapitalization(_:)`
- `TextInputAutocapitalization`
- `textInputSuggestions(_:)`
- `textInputSuggestions(_:content:)`
- `textInputSuggestions(_:id:content:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `TextInputFormattingControlPlacement`
