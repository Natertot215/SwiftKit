---
url: https://developer.apple.com/documentation/swiftui/timelineviewdefaultcontext
framework: SwiftUI
category: Animations
title: TimelineViewDefaultContext
kind: typealias
captured: 2026-05-02
---

# TimelineViewDefaultContext

Information passed to a timeline view’s content callback.

## Declaration

```swift
typealias TimelineViewDefaultContext = TimelineView<EveryMinuteTimelineSchedule, Never>.Context
```

### Discussion

The context includes both the date from the schedule that triggered the callback, and a cadence that you can use to customize the appearance of your view. For example, you might choose to display the second hand of an analog clock only when the cadence is `TimelineView/Context/Cadence-swift.enum/seconds` or faster.

> **NOTE:** This type alias uses a specific concrete instance of `TimelineView/Context` that all timeline views can use. It does this to prevent introducing an unnecessary generic parameter dependency on the context type.







## Availability

- iOS 15.0
- iPadOS 15.0
- Mac Catalyst 15.0
- macOS 12.0
- tvOS 15.0
- visionOS 1.0
- watchOS 8.0



## See Also

- `Updating watchOS apps with timelines`
- `TimelineView`
- `TimelineSchedule`
