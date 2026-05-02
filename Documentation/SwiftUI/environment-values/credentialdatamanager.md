---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/credentialdatamanager
framework: SwiftUI
category: Environment values
title: credentialDataManager
kind: property
captured: 2026-05-02
---

# credentialDataManager

This environment variable is for SwiftUI clients of the ASCredentialDataManager API. An example usage might look like:

## Declaration

```swift
var credentialDataManager: CredentialDataManager { get }
```

### Discussion

```swift
struct CredentialDataManagerExample: View {
    @Environment(\.credentialDataManager) private var credentialDataManager

    var body: some View {
        Button("Save Credentials") {
            Task {
                do {
                    let credential = getCredential() // defined elsewhere
                    let scope = getScope()
                    try await credentialDataManager.save(credential: credential, for: scope)
                } catch {
                    // code to handle the save error
                }
            }
        }
    }
}
```







## Availability

- iOS 26.2
- iPadOS 26.2
- Mac Catalyst 26.2
- macOS 26.2
- visionOS 26.2
