---
url: https://developer.apple.com/documentation/swiftui/view/familyactivitypicker(headertext:footertext:ispresented:selection:)
framework: SwiftUI
category: Technology-specific views
title: familyActivityPicker(headerText:footerText:isPresented:selection:)
kind: method
captured: 2026-05-02
---

# familyActivityPicker(headerText:footerText:isPresented:selection:)

Presents an activity picker view as a sheet.

## Declaration

```swift
@MainActor @preconcurrency func familyActivityPicker(headerText: String? = nil, footerText: String? = nil, isPresented: Binding<Bool>, selection: Binding<FamilyActivitySelection>) -> some View

```

### Discussion

Use this view modifier to present a `FamilyControls/FamilyActivityPicker`.

## Parameters

- **headerText**: An optional string that provides text for the header of the picker view.
- **footerText**: An optional string that provides text for the footer of the picker view.
- **isPresented**: A binding that indicates whether the app presents the picker view.
- **selection**: A binding that manages the user-selected categories, apps, and web domains.





## Availability

- iOS 16.0
- iPadOS 16.0



## See Also

- `FamilyActivityPicker`
- `familyActivityPicker(isPresented:selection:)`
