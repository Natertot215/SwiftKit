---
url: https://developer.apple.com/documentation/swiftui/view/automateddeviceenrollmentaddition(ispresented:)
framework: SwiftUI
category: Technology-specific views
title: automatedDeviceEnrollmentAddition(isPresented:)
kind: method
captured: 2026-05-02
---

# automatedDeviceEnrollmentAddition(isPresented:)

Presents a modal view that enables users to add devices to their organization.

## Declaration

```swift
@MainActor @preconcurrency func automatedDeviceEnrollmentAddition(isPresented: Binding<Bool>) -> some View

```

### Return Value

The modal view that the system presents to the user.

### Discussion

Use this view modifier to present UI in your app for device administrators to add devices purchased outside of the official channel to their organization — Apple School Manager or Apple Business. The system requires sign in with a Managed Apple Account that includes device enrollment privileges.

The following code example shows one way to present this view to your users:

Example Usage:

```swift
import SwiftUI
import AutomatedDeviceEnrollment

struct ContentView: View {
    @State private var isAddingDevices: Bool = false

    var body: some View {
        Button("Add Devices to Automated Device Enrollment") {
            isAddingDevices = true
        }
        .automatedDeviceEnrollmentAddition(isPresented: $isAddingDevices)
        .onChange(of: isAddingDevices) {
            if !isAddingDevices {
                // Handle dismiss action
            }
        }
    }
}
```

## Parameters

- **isPresented**: A binding to a Boolean value that determines whether to present the view.





## Availability

- iOS 16.0
- iPadOS 16.0
- Mac Catalyst 16.0



## See Also

- `managedContentStyle(_:)`
