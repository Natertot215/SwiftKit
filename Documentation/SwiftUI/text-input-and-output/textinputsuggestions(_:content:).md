---
url: https://developer.apple.com/documentation/swiftui/view/textinputsuggestions(_:content:)
framework: SwiftUI
category: Text input and output
title: textInputSuggestions(_:content:)
kind: method
captured: 2026-05-02
---

# textInputSuggestions(_:content:)

Configures the text input suggestions for this view.

## Declaration

```swift
nonisolated func textInputSuggestions<Data, Content>(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) -> some View where Data : RandomAccessCollection, Content : View, Data.Element : Identifiable

```

### Discussion

You can suggest text completions during a text input operation by providing data to this modifier. The interface presents the suggestion views as a list of choices when someone activates the text editing interface.

Associate a string with each suggestion view by adding the `View/textInputCompletion(_:)` modifier to the view.

Use `Label` to get platform-standard visual representations of suggestion text accompanied with images, and `Section` for labelled sections of results.

## Parameters

- **data**: The data that is used to create views dynamically.
- **content**: The view builder that creates views dynamically.





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
- `textInputCompletion(_:)`
- `textInputSuggestions(_:)`
- `textInputSuggestions(_:id:content:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `textContentType(_:)`
- `TextInputFormattingControlPlacement`
