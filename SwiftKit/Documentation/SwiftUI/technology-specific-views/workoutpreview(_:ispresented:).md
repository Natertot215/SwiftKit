---
url: https://developer.apple.com/documentation/swiftui/view/workoutpreview(_:ispresented:)
framework: SwiftUI
category: Technology-specific views
title: workoutPreview(_:isPresented:)
kind: method
captured: 2026-05-02
---

# workoutPreview(_:isPresented:)

Presents a preview of the workout contents as a modal sheet

## Declaration

```swift
nonisolated func workoutPreview(_ workout: WorkoutPlan, isPresented: Binding<Bool>) -> some View

```

### Discussion

```swift
struct WorkoutPreviewer: View {
    let workout: WorkoutPlan
    @State var presented: Bool = false
    var body: some View {
        Button {
            isPresented = true
        } label: {
            WorkoutContainerView(workout)
        }
        .workoutPreview(workout, isPresented: $presented)
    }
}
```

## Parameters

- **workout**: The `WorkoutContainer` the preview displays
- **isPresented**: A binding to a Boolean value that determines whether to present the preview





## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 18.0
- macOS 15.0
- watchOS 11.0



## See Also

- `healthDataAccessRequest(store:objectType:predicate:trigger:completion:)`
- `healthDataAccessRequest(store:readTypes:trigger:completion:)`
- `healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:)`
