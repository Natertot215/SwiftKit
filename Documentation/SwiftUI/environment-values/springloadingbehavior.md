---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/springloadingbehavior
framework: SwiftUI
category: Environment values
title: springLoadingBehavior
kind: property
captured: 2026-05-02
---

# springLoadingBehavior

The behavior of spring loaded interactions for the views associated with this environment.

## Declaration

```swift
var springLoadingBehavior: SpringLoadingBehavior { get }
```

### Discussion

Spring loading refers to a view being activated during a drag and drop interaction. On iOS this can occur when pausing briefly on top of a view with dragged content. On macOS this can occur with similar brief pauses or on pressure-sensitive systems by “force clicking” during the drag. This has no effect on tvOS or watchOS.

This is commonly used with views that have a navigation or presentation effect, allowing the destination to be revealed without pausing the drag interaction. For example, a button that reveals a list of folders that a dragged item can be dropped onto.

A value of `enabled` means that a view should support spring loaded interactions if it is able, and `disabled` means it should not. A value of `automatic` means that a view should follow its default behavior, such as a `TabView` automatically allowing spring loading, but a `Picker` with `segmented` style would not.







## Availability

- iOS 17.0
- iPadOS 17.0
- Mac Catalyst 17.0
- macOS 14.0
- tvOS 17.0
- visionOS 1.0
- watchOS 10.0



## See Also

- `springLoadingBehavior(_:)`
- `SpringLoadingBehavior`
