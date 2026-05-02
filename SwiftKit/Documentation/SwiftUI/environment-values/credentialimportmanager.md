---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/credentialimportmanager
framework: SwiftUI
category: Environment values
title: credentialImportManager
kind: property
captured: 2026-05-02
---

# credentialImportManager

This environment variable is for SwiftUI clients of the credential exchange API. An example usage might look like:

## Declaration

```swift
var credentialImportManager: ASCredentialImportManager { get }
```

### Discussion

```swift
struct CredentialImportManagerExample: View {
    @Environment(\.credentialImportManager) private var credentialImportManager

    var body: some View {
        content // defined elsewhere
            .onContinueUserActivity(ASCredentialExchangeActivityType) { activity in
                Task {
                    do {
                        guard let token = activity.userInfo?[ASCredentialImportToken] as? UUID else { return }
                        let credentialData = try await credentialImportManager.importCredentials(token: token)
                        // do something with the data
                    } catch {
                        // code to handle the import error
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
