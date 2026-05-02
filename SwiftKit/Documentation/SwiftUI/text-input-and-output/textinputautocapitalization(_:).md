---
url: https://developer.apple.com/documentation/swiftui/view/textinputautocapitalization(_:)
framework: SwiftUI
category: Text input and output
title: textInputAutocapitalization(_:)
kind: method
captured: 2026-05-02
---

# textInputAutocapitalization(_:)

Sets how often the shift key in the keyboard is automatically enabled.

## Declaration

```swift
nonisolated func textInputAutocapitalization(_ autocapitalization: TextInputAutocapitalization?) -> some View

```

### Discussion

Use `textInputAutocapitalization(_:)` when you need to automatically capitalize words, sentences, or other text like proper nouns.

In example below, as the user enters text the shift key is automatically enabled before every word:

```swift
TextField("Last, First", text: $fullName)
    .textInputAutocapitalization(.words)
```

The `TextInputAutocapitalization` struct defines the available autocapitalizing behavior. Providing `nil` to  this view modifier does not change the autocapitalization behavior. The default is `TextInputAutocapitalization.sentences`.

## Parameters

- **autocapitalization**: One of the capitalizing behaviors defined in the `TextInputAutocapitalization` struct or nil.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `autocorrectionDisabled(_:)`
- `autocorrectionDisabled`
- `keyboardType(_:)`
- `scrollDismissesKeyboard(_:)`
- `textContentType(_:)`
- `TextInputAutocapitalization`
- `textInputCompletion(_:)`
- `textInputSuggestions(_:)`
- `textInputSuggestions(_:content:)`
- `textInputSuggestions(_:id:content:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `TextInputFormattingControlPlacement`
