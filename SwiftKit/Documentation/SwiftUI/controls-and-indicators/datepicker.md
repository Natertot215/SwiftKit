---
url: https://developer.apple.com/documentation/swiftui/datepicker
framework: SwiftUI
category: Controls and indicators
title: DatePicker
kind: struct
captured: 2026-05-01
---

# DatePicker

## Declaration

```swift
struct DatePicker<Label> where Label : View
```

## Abstract

A control for selecting an absolute date.

## Overview

Use a `DatePicker` when you want to provide a view that allows the user to select a calendar date, and optionally a time. The view binds to a [`Date`](https://developer.apple.com/documentation/Foundation/Date) instance.

The following example creates a basic `DatePicker`, which appears on iOS as text representing the date. This example limits the display to only the calendar date, not the time. When the user taps or clicks the text, a calendar view animates in, from which the user can select a date. When the user dismisses the calendar view, the view updates the bound `Date`.

```swift
@State private var date = Date()

var body: some View {
    DatePicker(
        "Start Date",
        selection: $date,
        displayedComponents: [.date]
    )
}
```

For cases where adding a subtitle to the label is desired, use a view builder that creates multiple `Text` views where the first text represents the title and the second text represents the subtitle:

```swift
@State private var date = Date()

var body: some View {
    DatePicker(selection: $date) {
        Text("Start Date")
        Text("Select the starting date for the event")
    }
}
```

You can limit the `DatePicker` to specific ranges of dates, allowing selections only before or after a certain date, or between two dates. The following example shows a date-and-time picker that only permits selections within the year 2021 (in the `UTC` time zone).

```swift
@State private var date = Date()
let dateRange: ClosedRange<Date> = {
    let calendar = Calendar.current
    let startComponents = DateComponents(year: 2021, month: 1, day: 1)
    let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
    return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
}()

var body: some View {
    DatePicker(
        "Start Date",
         selection: $date,
         in: dateRange,
         displayedComponents: [.date, .hourAndMinute]
    )
}
```

### Styling date pickers

To use a different style of date picker, use the [`datePickerStyle(_:)`](https://developer.apple.com/documentation/swiftui/view/datepickerstyle(_:)) view modifier. The following example shows the graphical date picker style.

```swift
@State private var date = Date()

var body: some View {
    DatePicker(
        "Start Date",
        selection: $date,
        displayedComponents: [.date]
    )
    .datePickerStyle(.graphical)
}
```

## Availability

- **iOS** 13.0+
- **iPadOS** 13.0+
- **Mac Catalyst** 13.0+
- **macOS** 10.15+
- **visionOS** 1.0+
- **watchOS** 10.0+

## See Also

- [`View.datePickerStyle(_:)`](https://developer.apple.com/documentation/swiftui/view/datepickerstyle(_:))
- [`MultiDatePicker`](https://developer.apple.com/documentation/swiftui/multidatepicker)
- [`EnvironmentValues.calendar`](https://developer.apple.com/documentation/swiftui/environmentvalues/calendar)
- [`EnvironmentValues.timeZone`](https://developer.apple.com/documentation/swiftui/environmentvalues/timezone)
