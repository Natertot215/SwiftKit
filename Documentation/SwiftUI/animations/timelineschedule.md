---
url: https://developer.apple.com/documentation/swiftui/timelineschedule
framework: SwiftUI
category: Animations
title: TimelineSchedule
kind: protocol
captured: 2026-05-02
---

# TimelineSchedule

A type that provides a sequence of dates for use as a schedule.

## Declaration

```swift
protocol TimelineSchedule
```

### Overview

Types that conform to this protocol implement a particular kind of schedule by defining an `TimelineSchedule/entries(from:mode:)` method that returns a sequence of dates. Use a timeline schedule type when you initialize a `TimelineView`. For example, you can create a timeline view that updates every second, starting from some `startDate`, using a periodic schedule returned by `TimelineSchedule/periodic(from:by:)`:

```swift
TimelineView(.periodic(from: startDate, by: 1.0)) { context in
    // View content goes here.
}
```

You can also create custom timeline schedules. The timeline view updates its content according to the sequence of dates produced by the schedule.





## Relationships

**Conforming Types**: `AnimationTimelineSchedule`, `EveryMinuteTimelineSchedule`, `ExplicitTimelineSchedule`, `PeriodicTimelineSchedule`

## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0

## Topics

### Getting built-in schedules

- `animation`
- `animation(minimumInterval:paused:)`
- `everyMinute`
- `explicit(_:)`
- `periodic(from:by:)`

### Getting a sequence of dates

- `entries(from:mode:)`
- `Entries`

### Specifying a mode

- `TimelineSchedule.Mode`
- `TimelineScheduleMode`

### Supporting types

- `AnimationTimelineSchedule`
- `EveryMinuteTimelineSchedule`
- `ExplicitTimelineSchedule`
- `PeriodicTimelineSchedule`

## See Also

- `Updating watchOS apps with timelines`
- `TimelineView`
- `TimelineViewDefaultContext`
