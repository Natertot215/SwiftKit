---
url: https://developer.apple.com/documentation/swiftui/view/submitlabel(_:)
framework: SwiftUI
category: Input events
title: submitLabel(_:)
kind: method
captured: 2026-05-02
---

# submitLabel(_:)

Sets the submit label for this view.

## Declaration

```swift
nonisolated func submitLabel(_ submitLabel: SubmitLabel) -> some View

```

### Discussion

```swift
Form {
    TextField("Username", $viewModel.username)
        .submitLabel(.continue)
    SecureField("Password", $viewModel.password)
        .submitLabel(.done)
}
```

## Parameters

- **submitLabel**: One of the cases specified in `SubmitLabel`.





## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `SubmitLabel`
