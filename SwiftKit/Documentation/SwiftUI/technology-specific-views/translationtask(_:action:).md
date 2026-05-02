---
url: https://developer.apple.com/documentation/swiftui/view/translationtask(_:action:)
framework: SwiftUI
category: Technology-specific views
title: translationTask(_:action:)
kind: method
captured: 2026-05-02
---

# translationTask(_:action:)

Adds a task to perform before this view appears or when the translation configuration changes.

## Declaration

```swift
nonisolated func translationTask(_ configuration: TranslationSession.Configuration?, action: @escaping (TranslationSession) async -> Void) -> some View

```

### Discussion

This task provides an instance of `TranslationSession` to use in translations. Whenever `TranslationSession/Configuration`  changes and isn’t `nil`, the closure `action` runs, providing a session instance to perform one or more translations.

For example, you can create a configuration in response to a button press to initiate the translation:

```swift
struct ContentView: View {
    @State private var sourceText = "Hallo, Welt!"
    var sourceLanguage: Locale.Language?
    var targetLanguage: Locale.Language?

    @State private var targetText: String?
    @State private var configuration: TranslationSession.Configuration?

    var body: some View {
        VStack {
            Text(targetText ?? sourceText)
            Button("Translate") {
                guard configuration == nil else {
                    configuration?.invalidate()
                    return
                }

                 configuration = TranslationSession.Configuration(
                    source: sourceLanguage,
                    target: targetLanguage)
            }
            .translationTask(configuration) { session in
                Task { @MainActor in
                    do {
                        let response = try await session.translate(sourceText)
                        targetText = response.targetText
                    } catch {
                        // Handle any errors.
                    }
                }
            }
        }
    }
}
```

The system throws a `fatalError` if you use a `TranslationSession` instance after the attached view disappears or if you use it after changing the configuration. This causes the `action` closure to provide a new session instance.

## Parameters

- **configuration**: A configuration for a `TranslationSession`. When this configuration is non-`nil` and changes, the `action` runs providing an instance of the session to perform translations.
- **action**: This closure runs when the `TranslationSession/Configuration` is non-`nil` and changes. If the configuration is initially non-`nil`, it calls the action closure when the view appears and provides a session to perform one or more translations.





## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 26.0
- macOS 15.0



## See Also

- `translationPresentation(isPresented:text:attachmentAnchor:arrowEdge:replacementAction:)`
- `translationTask(source:target:action:)`
- `translationTask(source:target:preferredStrategy:action:)`
