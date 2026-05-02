---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/authorizationcontroller
framework: SwiftUI
category: Environment values
title: authorizationController
kind: property
captured: 2026-05-02
---

# authorizationController

A value provided in the SwiftUI environment that views can use to perform authorization requests.

## Declaration

```swift
var authorizationController: AuthorizationController { get }
```

### Discussion

For example, you can perform authorization requests when the user taps a button:

```swift
struct AuthorizationControllerExample: View {
    @Environment(\.authorizationController) private var authorizationController

    var body: some View {
        Button("Sign In") {
            Task {
                do {
                    async let requests = authorizationRequests() // defined elsewhere
                    let result = try await authorizationController
                        .performRequests(requests)

                    switch result {
                    // code to handle the authorization result
                    }
                } catch {
                    // code to handle the authorization error
                }
            }
        }
    }
}
```







## Availability

- iOS 16.4
- iPadOS 16.4
- Mac Catalyst 16.4
- macOS 13.3
- tvOS 16.4
- watchOS 9.4



## See Also

- `LocalAuthenticationView`
- `SignInWithAppleButton`
- `signInWithAppleButtonStyle(_:)`
- `webAuthenticationSession`
