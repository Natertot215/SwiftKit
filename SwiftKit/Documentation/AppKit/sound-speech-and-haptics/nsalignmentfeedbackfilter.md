---
url: https://developer.apple.com/documentation/appkit/nsalignmentfeedbackfilter
framework: AppKit
category: Sound, speech, and haptics
title: NSAlignmentFeedbackFilter
kind: class
captured: 2026-05-02
---

# NSAlignmentFeedbackFilter

An object that can filter the movement of an object and provides haptic feedback when alignment occurs.

## Declaration

```swift
class NSAlignmentFeedbackFilter
```

### Overview

With a Force Touch trackpad, apps can produce tactile feedback to complement user actions. If your app implements alignment features, you can use the `NSAlignmentFeedbackFilter` class to filter object movements and provide haptic feedback to the user at appropriate times. As the user drags objects into alignment with a guide or another object, the user actually feels a physical bump as the object snaps into place.

#### Implementing Alignment Feedback

To implement alignment feedback in your custom alignment controller class, set up the class to receive events for tracking the movement of an object. These can be events matching the `NSAlignmentFeedbackFilter/inputEventMask` value of an `NSAlignmentFeedbackFilter` object, or events from a gesture recognizer (`NSGestureRecognizer`). For each event received:

1. Create an instance of an `NSAlignmentFeedbackFilter` object. For example:

1. Inform the alignment feedback filter object about the event. To do this, call one of the following methods:

- `NSAlignmentFeedbackFilter/update(with:)`
- `NSAlignmentFeedbackFilter/update(withPanRecognizer:)`

1. Store the location of the object before it moves in response to the event. This is considered the *previous*previous location of the object.
2. Move the object to its new location in response to the event. This is the location where the object will reside if no alignment occurs.
3. Store the new location of the object. This is considered the *default*default location of the object.
4. Determine where the object will move to be aligned. This is considered the *aligned*aligned location of the object.
5. Request a feedback token based on the previous location, default location, and aligned location. To do this, call one of the following methods:

- `NSAlignmentFeedbackFilter/alignmentFeedbackTokenForMovement(in:previousPoint:alignedPoint:defaultPoint:)` - If the object will be moved both horizontally and vertically to become aligned.
- `NSAlignmentFeedbackFilter/alignmentFeedbackTokenForHorizontalMovement(in:previousX:alignedX:defaultX:)` - If the object will be moved horizontally only to become aligned.
- `NSAlignmentFeedbackFilter/alignmentFeedbackTokenForVerticalMovement(in:previousY:alignedY:defaultY:)` - If the object will be moved vertically only to become aligned.

1. If a feedback token is successfully prepared, call `NSAlignmentFeedbackFilter/performFeedback(_:performanceTime:)` to perform the haptic feedback. Then, move the object to the aligned location.

If a value of `null` is returned, rather than a feedback token, then the system has determined that alignment and feedback are not appropriate. Perhaps the cursor is moving too fast or the distance to the aligned location is not significant enough to produce a visual snap. Move the object to its default location.





## Relationships

**Inherits From**: `NSObject`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSObjectProtocol`

## Availability

- macOS 10.11

## Topics

### Determining Event Types for the Filter

- `inputEventMask`

### Informing the Filter About Events

- `update(with:)`
- `update(withPanRecognizer:)`

### Preparing Haptic Feedback for Alignment

- `alignmentFeedbackTokenForMovement(in:previousPoint:alignedPoint:defaultPoint:)`
- `alignmentFeedbackTokenForHorizontalMovement(in:previousX:alignedX:defaultX:)`
- `alignmentFeedbackTokenForVerticalMovement(in:previousY:alignedY:defaultY:)`

### Providing Feedback to the User

- `performFeedback(_:performanceTime:)`

## See Also

- `NSHapticFeedbackManager`
- `NSHapticFeedbackPerformer`
- `NSAlignmentFeedbackToken`
