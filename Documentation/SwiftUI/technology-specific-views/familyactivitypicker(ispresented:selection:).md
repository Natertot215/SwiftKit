---
url: https://developer.apple.com/documentation/swiftui/view/familyactivitypicker(ispresented:selection:)
framework: SwiftUI
category: Technology-specific views
title: familyActivityPicker(isPresented:selection:)
kind: method
captured: 2026-05-02
---

# familyActivityPicker(isPresented:selection:)

Presents an activity picker view as a sheet.

## Declaration

```swift
@MainActor @preconcurrency func familyActivityPicker(isPresented: Binding<Bool>, selection: Binding<FamilyActivitySelection>) -> some View

```

### Discussion

Use this view modifier to present a `FamilyControls/FamilyActivityPicker`.

```swift
struct ExampleView: View {
    @State var selection = FamilyActivitySelection()
    @State var isPresented = false

   var body: some View {
       Button("Present FamilyActivityPicker") { isPresented = true }
       .familyActivityPicker(isPresented: $isPresented,
                             selection: $selection)
       .onChange(of: selection) { newSelection in
           let applications = selection.applications
           let categories = selection.categories
           let webDomains = selection.webDomains
       }
   }
}
```

## Parameters

- **isPresented**: A binding that indicates whether the app presents the picker view.
- **selection**: A binding that manages the user-selected categories, apps, and web domains.





## Availability

- iOS 15.0
- iPadOS 15.0



## See Also

- `FamilyActivityPicker`
- `familyActivityPicker(headerText:footerText:isPresented:selection:)`
