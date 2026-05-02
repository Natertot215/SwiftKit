---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/documentconfiguration
framework: SwiftUI
category: Environment values
title: documentConfiguration
kind: property
captured: 2026-05-02
---

# documentConfiguration

The configuration of a document in a `DocumentGroup`.

## Declaration

```swift
var documentConfiguration: DocumentConfiguration? { get }
```

### Discussion

The value is `nil` for views that are not enclosed in a `DocumentGroup`.

For example, if the app shows the document path in the footer of each document, it can get the URL from the environment:

```swift
struct ContentView: View {
    @Binding var document: TextDocument
    @Environment(\.documentConfiguration) private var configuration: DocumentConfiguration?

    var body: some View {
        …
        Label(
            configuration?.fileURL?.path ??
                "", systemImage: "folder.circle"
        )
    }
}
```







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- visionOS 1.0



## See Also

- `DocumentConfiguration`
