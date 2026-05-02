---
url: https://developer.apple.com/documentation/appkit/nsgesturerecognizer
framework: AppKit
category: Gestures
title: NSGestureRecognizer
kind: class
captured: 2026-05-02
---

# NSGestureRecognizer

An object that monitors events and calls its action method when a predefined sequence of events occur.

## Declaration

```swift
@MainActor class NSGestureRecognizer
```

### Overview

A gesture recognizer might recognize a single click, a click and drag, or a sequence of events that imply rotation. You do not create instances of this class directly. This class is an abstract base class that defines the common behavior for all gesture recognizers. When using a gesture recognizer in your app, create an instance of one of the concrete subclasses.

The concrete subclasses of `NSGestureRecognizer` are the following:

- `NSClickGestureRecognizer`
- `NSMagnificationGestureRecognizer`
- `NSPanGestureRecognizer`
- `NSPressGestureRecognizer`
- `NSRotationGestureRecognizer`

A gesture recognizer operates on events in a specific view (or in any of that view’s subviews). After creating a gesture recognizer, attach it to one of your views using the `NSView/addGestureRecognizer(_:)` method. Events received by your app are forwarded automatically to any relevant gesture recognizers before they are sent to the corresponding view. The gesture recognizer can delay the further progression of the events until recognition is complete or allow the events to be delivered normally.

A gesture recognizer can detect gestures that are either discrete or continuous in nature. A click gesture is discrete because it involves a mouse-down and mouse-up event without any mouse movements in between. By contrast, a pan or rotation gesture is continuous because it involves tracking mouse movements over a period of time.

During the gesture recognition process, a gesture recognizer calls the action method of its associated target object to report the state of the recognition process. For discrete gestures, the action method is typically called only once when the gesture is recognized. For continuous gestures, it may be called multiple times depending on the current state of the gesture recognizer. In that situation, you can use your action method to perform appropriate tasks, such as creating animations for any mouse-related movements, in addition to handling the final results of the gesture recognition process.

A gesture recognizer has only one action method and one target object, and the method must conform to one of the following signatures:

When your code needs additional information about the particulars of a gesture, define your action method to include the gesture recognizer parameter. You almost always want the gesture recognizer object when handling continuous gestures. For example, for a rotation gesture, you would use the gesture recognizer object to get the updated rotation value. You can also use the gesture recognizer object to get the location of where the gesture occurred.

#### State Transitions

Gesture recognizers operate within a predefined state machine, transitioning from state to state as they handle events. All gesture recognizers begin in the Possible (`NSGestureRecognizer/State-swift.enum/possible`) state, but the possible transitions differ for continuous and discrete gestures.

Discrete gestures transition from the Possible state directly to the Recognized (`NSGestureRecognizer/State-swift.enum/recognized`) or Failed (`NSGestureRecognizer/State-swift.enum/failed`) state, depending on whether they successfully interpret the gesture. When a discrete gesture recognizer transitions to the Recognized state, it calls the action method of its target object.

For continuous gestures, the state transitions are as follows:

- Possible —> Began —> [Changed] —> Cancelled
- Possible —> Began —> [Changed] —> Ended

The Changed state is optional and may occur multiple times before the Cancelled or Ended state is reached. Many state transitions cause the gesture recognizer to call its action method. Setting the `NSGestureRecognizer/state-swift.property` property to `NSGestureRecognizer/State-swift.enum/changed` while monitoring events also calls the action method. You can use these calls to update the state of your app or update any custom animations.

For a list of possible states, see the constants in `NSGestureRecognizer/State-swift.enum`.

#### Subclassing Notes

You may create a subclass of `NSGestureRecognizer` that recognizes a distinctive gesture—for example, a “check mark” gesture. A custom gesture recognizer implements any appropriate event-related methods to detect its gesture along with a few other methods for managing state information.

All gesture recognizers must update the value in the state property at appropriate times. Specifically, you must update it for all state transitions. For more information about the possible state transitions of a gesture recognizer, see `NSGestureRecognizer#State-Transitions`.

> **NOTE:**  `NSGestureRecognizer` does not support handing off event tracking to other non-gesture recognizer mechanisms (for example drag and drop and pop-up menus).

##### Methods to Override

When creating your own gesture recognizer subclass:

- Implement the `NSGestureRecognizer/reset()` method and any other relevant methods in Methods for Subclasses.
- Override the `NSGestureRecognizer/location(in:)` method as needed to specify an appropriate point for your gesture.

AppKit waits for a mouse-down event, magnify event, or rotation event to occur before starting the gesture recognition process. A gesture recognizer that used only key-down events to recognize its gesture would not have its `NSGestureRecognizer/keyDown(with:)` method called until a mouse-down, magnify, or rotation event started the recognition process.

##### Alternatives to Subclassing

The `NSGestureRecognizer` class defines the common behaviors that can be configured for all concrete gesture recognizers. It also supports a delegate—an object that adopts the `NSGestureRecognizerDelegate` protocol—for handling finer-grained customization of some behaviors without the need for subclassing. For example, you can use the delegate to create dependencies between specific gesture recognizer objects.

For more information about using the delegate to control the behavior of your gesture recognizers, see `NSGestureRecognizerDelegate`.





## Relationships

**Inherits From**: `NSObject`

**Inherited By**: `NSClickGestureRecognizer`, `NSMagnificationGestureRecognizer`, `NSPanGestureRecognizer`, `NSPressGestureRecognizer`, `NSRotationGestureRecognizer`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`

## Availability

- macOS 10.10

## Topics

### Initializing a Gesture Recognizer

- `init(target:action:)`

### Accessing the Target and Action

- `action`
- `target`

### Getting the Location of Events

- `location(in:)`

### Accessing the Recognizer’s State

- `state`
- `view`
- `isEnabled`

### Delaying Events

- `delaysPrimaryMouseButtonEvents`
- `delaysSecondaryMouseButtonEvents`
- `delaysOtherMouseButtonEvents`
- `delaysKeyEvents`
- `delaysMagnificationEvents`
- `delaysRotationEvents`

### Accessing the Delegate

- `delegate`

### Methods for Subclasses

- `reset()`
- `mouseDown(with:)`
- `mouseDragged(with:)`
- `mouseUp(with:)`
- `otherMouseDown(with:)`
- `otherMouseDragged(with:)`
- `otherMouseUp(with:)`
- `rightMouseDown(with:)`
- `rightMouseDragged(with:)`
- `rightMouseUp(with:)`
- `magnify(with:)`
- `rotate(with:)`
- `canBePrevented(by:)`
- `canPrevent(_:)`
- `shouldBeRequiredToFail(by:)`
- `shouldRequireFailure(of:)`
- `keyDown(with:)`
- `keyUp(with:)`
- `tabletPoint(with:)`
- `flagsChanged(with:)`
- `pressureChange(with:)`

### Configuring Pressure

- `pressureConfiguration`

### Constants

- `NSGestureRecognizer.State`

### Initializers

- `init(coder:)`

### Instance Properties

- `allowedTouchTypes`
- `modifierFlags`
- `name`

### Instance Methods

- `touchesBegan(with:)`
- `touchesCancelled(with:)`
- `touchesEnded(with:)`
- `touchesMoved(with:)`
- `mouseCancelled(with:)`

## See Also

- `NSGestureRecognizerDelegate`
