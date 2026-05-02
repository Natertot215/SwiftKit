---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/credentialexportmanager
framework: SwiftUI
category: Environment values
title: credentialExportManager
kind: property
captured: 2026-05-02
---

# credentialExportManager

This environment variable is for SwiftUI clients of the credential exchange API. An example usage might look like:

## Declaration

```swift
var credentialExportManager: ASCredentialExportManager { get }
```

### Discussion

```swift
struct CredentialExchangeManagerExample: View {
    @Environment(\.credentialExchangeManager) private var credentialExchangeManager

    var body: some View {
        Button("Export Credentials") {
            Task {
                do {
                    let credentialData = getCredentialData() // defined elsewhere
                    try await credentialExchangeManager.exportCredentials(credentialData)
                } catch {
                    // code to handle the export error
                }
            }
        }
    }
}
```







## Availability

- iOS 26.0
- iPadOS 26.0
- Mac Catalyst 26.0
- macOS 26.0
- visionOS 26.0
