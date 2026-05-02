---
url: https://developer.apple.com/documentation/swiftui/progressview
framework: SwiftUI
category: Controls and indicators
title: ProgressView
kind: struct
captured: 2026-05-01
---

# ProgressView

## Declaration

```swift
struct ProgressView<Label, CurrentValueLabel> where Label : View, CurrentValueLabel : View
```

## Abstract

A view that shows the progress toward completion of a task.

## Overview

Use a progress view to show that a task is incomplete but advancing toward completion. A progress view can show both determinate (percentage complete) and indeterminate (progressing or not) types of progress.

Create a determinate progress view by initializing a `ProgressView` with a binding to a numeric value that indicates the progress, and a `total` value that represents completion of the task. By default, the progress is `0.0` and the total is `1.0`.

### Creating an Indeterminate Progress View

The simplest progress view shows indeterminate progress without a label:

```swift
var body: some View {
    ProgressView()
}
```

### Creating a Determinate Progress View

The example below uses the state property `progress` to show progress in a determinate `ProgressView`. The progress view uses its default total of `1.0`, and because `progress` starts with an initial value of `0.5`, the progress view begins half-complete:

```swift
struct LinearProgressDemoView: View {
    @State private var progress = 0.5

    var body: some View {
        VStack {
            ProgressView(value: progress)
            Button("More") { progress += 0.05 }
        }
    }
}
```

### Creating a Date Range Progress View

You can create a progress view that covers a closed range of `Date` values. As long as the current date is within the range, the progress view automatically updates:

```swift
struct DateRelativeProgressDemoView: View {
    let workoutDateRange = Date()...Date().addingTimeInterval(5*60)

    var body: some View {
         ProgressView(timerInterval: workoutDateRange) {
             Text("Workout")
         }
    }
}
```

## Styling Progress Views

You can customize the appearance and interaction of progress views by creating styles that conform to the `ProgressViewStyle` protocol. To set a specific style for all progress view instances within a view, use the `progressViewStyle(_:)` modifier.

SwiftUI provides two built-in progress view styles:
- **`linear`**: A progress view that visually indicates its progress using a horizontal bar
- **`circular`**: A progress view that uses a circular gauge to indicate partial completion

Example with circular style:

```swift
struct CircularProgressDemoView: View {
    @State private var progress = 0.6

    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(.circular)
        }
    }
}
```

## Availability

- **iOS** 14.0+
- **iPadOS** 14.0+
- **Mac Catalyst** 14.0+
- **macOS** 11.0+
- **tvOS** 14.0+
- **visionOS** 1.0+
- **watchOS** 7.0+

## See Also

### Indicating a value
- `Gauge`
- `View.gaugeStyle(_:)`
- `View.progressViewStyle(_:)`
- `DefaultDateProgressLabel`
- `DefaultButtonLabel`
