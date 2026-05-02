---
url: https://developer.apple.com/documentation/swiftui/view/privacysensitive(_:)
framework: SwiftUI
category: View configuration
title: privacySensitive(_:)
kind: method
captured: 2026-05-02
---

# privacySensitive(_:)

Marks the view as containing sensitive, private user data.

## Declaration

```swift
nonisolated func privacySensitive(_ sensitive: Bool = true) -> some View

```

### Discussion

SwiftUI redacts views marked with this modifier when you apply the `RedactionReasons/privacy` redaction reason.

```swift
struct BankAccountView: View {
    var body: some View {
        VStack {
            Text("Account #")

            Text(accountNumber)
                .font(.headline)
                .privacySensitive() // Hide only the account number.
        }
    }
}
```







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Designing your app for the Always On state`
- `redacted(reason:)`
- `unredacted()`
- `redactionReasons`
- `isSceneCaptured`
- `RedactionReasons`
