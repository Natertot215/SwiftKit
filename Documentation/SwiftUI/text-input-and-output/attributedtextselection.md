---
url: https://developer.apple.com/documentation/swiftui/attributedtextselection
framework: SwiftUI
category: Text input and output
title: AttributedTextSelection
kind: struct
captured: 2026-05-02
---

# AttributedTextSelection

Represents a selection of attributed text.

## Declaration

```swift
struct AttributedTextSelection
```

### Overview

A selection is either an insertion point (e.g. a cursor in the text), or spans over a range of characters. While that range is always visually contiguous, it may not be logically contiguous in the text storage. Specifically, a single selection value cannot represent multiple cursors.

This is frequently used to represent selection of text in a `TextEditor`. The following example shows a text editor that leverages text selection to offer live suggestions based on the current selection.

```swift
struct SuggestionTextEditor: View {
    @State var text: AttributedString = ""
    @State var selection = AttributedTextSelection()

    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)
            // A helper view that offers live suggestions based on selection.
            SuggestionsView(substrings: getSubstrings(
                text: text, indices: selection.indices(in: text))
        }
    }

    private func getSubstrings(
        text: String, indices: AttributedTextSelection.Indices
    ) -> [Substring] {
        // Resolve substrings representing the current selection...
    }
}

struct SuggestionsView: View { ... }
```

You can also use the `View/textSelectionAffinity(_:)` modifier to specify a selection affinity on the given hierarchy:

```swift
struct SuggestionTextEditor: View {
    @State var text: AttributedString = ""
    @State var selection = AttributedTextSelection()

    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)
            // A helper view that offers live suggestions based on selection.
            SuggestionsView(substrings: getSubstrings(
                text: text, indices: selection.indices(in: text))
        }
        .textSelectionAffinity(.upstream)
    }

    private func getSubstrings(
        text: String, indices: AttributedTextSelection.Indices
    ) -> [Substring] {
        // Resolve substrings representing the current selection...
    }
}

struct SuggestionsView: View { ... }
```

> **NOTE:** `TextSelectionAffinity`, `TextEditor`





## Relationships

**Conforms To**: `Equatable`, `Sendable`, `SendableMetatype`

## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- tvOS 26.0
- visionOS 26.0
- watchOS 26.0

## Topics

### Structures

- `AttributedTextSelection.Attributes`

### Initializers

- `init()`
- `init(insertionPoint:typingAttributes:)`
- `init(range:)`
- `init(ranges:)`

### Instance Methods

- `affinity(in:)`
- `attributes(in:)`
- `indices(in:)`
- `typingAttributes(in:)`

### Enumerations

- `AttributedTextSelection.Indices`

## See Also

- `textSelection(_:)`
- `TextSelectability`
- `TextSelection`
- `textSelectionAffinity(_:)`
- `textSelectionAffinity`
- `TextSelectionAffinity`
