---
url: https://developer.apple.com/documentation/swiftui/view/contactaccesspicker(ispresented:completionhandler:)
framework: SwiftUI
category: Technology-specific views
title: contactAccessPicker(isPresented:completionHandler:)
kind: method
captured: 2026-05-02
---

# contactAccessPicker(isPresented:completionHandler:)

Modally present UI which allows the user to select which contacts your app has access to.

## Declaration

```swift
@MainActor @preconcurrency func contactAccessPicker(isPresented: Binding<Bool>, completionHandler: @escaping ([String]) -> Void = { _ in }) -> some View

```

### Discussion

This API should only be used when your app has “Limited” authorization.  See `CNAuthorizationStatus` and `CNContactStore/authorizationStatus(for:)`.  The completion handler will be invoked with an empty result if your app doesn’t have the correct authorization status.

Your completion handler will receive an array of contact identifiers that were newly granted to your app.  Contacts which your app lost access to are not listed.  The newly-available contacts can be accessed using `CNContactStore`.

Parameters:

- isPresented: The binding to whether the contact picker should be shown.
- completionHandler: A function to invoke when the management UI is dismissed.  Receives an array containing contact identifiers of newly-available contacts.







## Availability

- iOS 18.0
- iPadOS 18.0
- Mac Catalyst 18.0



## See Also

- `contactAccessButtonCaption(_:)`
- `contactAccessButtonStyle(_:)`
