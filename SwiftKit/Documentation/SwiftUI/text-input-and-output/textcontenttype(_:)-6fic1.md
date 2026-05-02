---
url: https://developer.apple.com/documentation/swiftui/view/textcontenttype(_:)-6fic1
framework: SwiftUI
category: Text input and output
title: textContentType(_:)
kind: method
captured: 2026-05-02
---

# textContentType(_:)

Sets the text content type for this view, which the system uses to offer suggestions while the user enters text on macOS.

## Declaration

```swift
nonisolated func textContentType(_ textContentType: NSTextContentType?) -> some View

```

### Discussion

Use this method to set the content type for input text. For example, you can configure a `TextField` for the entry of a username:

```swift
TextField("Enter your username", text: $username)
    .textContentType(.username)
```

## Parameters

- **textContentType**: One of the content types available in the `NSTextContentType` structure that identify the semantic meaning expected for a text-entry area.





## Availability

- macOS 11.0



## See Also

- `autocorrectionDisabled(_:)`
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
- `TextInputFormattingControlPlacement`
