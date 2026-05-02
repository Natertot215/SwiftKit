---
url: https://developer.apple.com/documentation/swiftui/view/textcontenttype(_:)-ufdv
framework: SwiftUI
category: Text input and output
title: textContentType(_:)
kind: method
captured: 2026-05-02
---

# textContentType(_:)

Sets the text content type for this view, which the system uses to offer suggestions while the user enters text on an iOS or tvOS device.

## Declaration

```swift
nonisolated func textContentType(_ textContentType: UITextContentType?) -> some View

```

### Discussion

Use this method to set the content type for input text. For example, you can configure a `TextField` for the entry of email addresses:

```swift
TextField("Enter your email", text: $emailAddress)
    .textContentType(.emailAddress)
```

## Parameters

- **textContentType**: One of the content types available in the `UITextContentType` structure that identify the semantic meaning expected for a text-entry area. These include support for email addresses, location names, URLs, and telephone numbers, to name just a few.





## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- tvOS 13.0
- visionOS 1.0



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
