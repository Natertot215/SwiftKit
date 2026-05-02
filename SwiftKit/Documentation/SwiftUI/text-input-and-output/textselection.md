---
url: https://developer.apple.com/documentation/swiftui/textselection
framework: SwiftUI
category: Text input and output
title: TextSelection
kind: struct
captured: 2026-05-02
---

# TextSelection

Represents a selection of text.

## Declaration

```swift
struct TextSelection
```

### Overview

A selection is either an insertion point (e.g. a cursor in the text), a selection over a range of text or on macOS, multiple selections.

This is frequently used to represent selection of text in a `TextField` or `TextEditor`. The following example shows a text editor that leverages text selection to offer live suggestions based on the current selection.

```swift
struct SuggestionTextEditor: View {
    @State var text: String = ""
    @State var selection: TextSelection? = nil

    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)
            // A helper view that offers live suggestions based on selection.
            SuggestionsView(
                substrings: getSubstrings(text: text, indices: selection?.indices))
        }
    }

    private func getSubstrings(
        text: String, indices: TextSelection.Indices?
    ) -> [Substring] {
        // Resolve substrings representing the current selection...
    }
}

struct SuggestionsView: View { ... }
```

You can also use the `View/textSelectionAffinity(_:)` modifier to specify a selection affinity on the given hierarchy:

```swift
struct SuggestionTextEditor: View {
    @State var text: String = ""
    @State var selection: TextSelection? = nil

    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)
            // A helper view that offers live suggestions based on selection.
            SuggestionsView(
                substrings: getSubstrings(text: text, indices: selection?.indices))
        }
        .textSelectionAffinity(.upstream)
    }

    private func getSubstrings(
        text: String, indices: TextSelection.Indices?
    ) -> [Substring] {
        // Resolve substrings representing the current selection...
    }
}

struct SuggestionsView: View { ... }
```





## Relationships

**Conforms To**: `Equatable`, `Hashable`

## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0
- macOS 15.0
- tvOS 18.0
- visionOS 2.0
- watchOS 11.0

## Topics

### Initializers

- `init(insertionPoint:)`
- `init(range:)`
- `init(ranges:)`

### Instance Properties

- `affinity`
- `indices`
- `isInsertion`

### Enumerations

- `TextSelection.Indices`

## See Also

- `textSelection(_:)`
- `TextSelectability`
- `textSelectionAffinity(_:)`
- `textSelectionAffinity`
- `TextSelectionAffinity`
- `AttributedTextSelection`
