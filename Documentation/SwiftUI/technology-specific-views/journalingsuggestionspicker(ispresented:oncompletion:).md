---
url: https://developer.apple.com/documentation/swiftui/view/journalingsuggestionspicker(ispresented:oncompletion:)
framework: SwiftUI
category: Technology-specific views
title: journalingSuggestionsPicker(isPresented:onCompletion:)
kind: method
captured: 2026-05-02
---

# journalingSuggestionsPicker(isPresented:onCompletion:)

Presents a visual picker interface that contains events and images that a person can select to retrieve more information.

## Declaration

```swift
@MainActor @preconcurrency func journalingSuggestionsPicker(isPresented: Binding<Bool>, onCompletion: @escaping (JournalingSuggestion) async -> Void) -> some View

```

### Discussion

For more information about the Journaling Suggestions picker, see: doc:presenting-the-suggestions-picker-and-processing-a-selection.

## Parameters

- **isPresented**: A binding to a `Bool` value that determines whether to show the picker.
- **onCompletion**: Code that you supply, which processes any suggestions that a person may choose in the picker.





## Availability

- iOS 17.2
- iPadOS 17.2
- Mac Catalyst 17.2
