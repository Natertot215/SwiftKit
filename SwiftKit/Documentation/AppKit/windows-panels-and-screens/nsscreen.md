---
url: https://developer.apple.com/documentation/appkit/nsscreen
framework: AppKit
category: Windows, panels, and screens
title: NSScreen
kind: class
captured: 2026-05-01
---

# NSScreen

## Declaration

```swift
class NSScreen
```

## Abstract

An object that describes the attributes of a computer's monitor or screen.

## Overview

An app may use an `NSScreen` object to retrieve information about a screen and use this information to decide what to display on that screen. For example, an app may use the `deepest` method to find out which of the available screens can best represent color and then might choose to display all of its windows on that screen.

Create the application object before you use the methods in this class, so that the application object can make the necessary connection to the window system. You can make sure the application object exists by invoking the `NSApplication.shared` method of `NSApplication`. If you created your app with Xcode, the application object is automatically created for you during initialization.

> **Note:** The `NSScreen` class is only for getting information about the available displays. If you need additional information or want to change the attributes relating to a display, you must use Quartz Services.

## Inheritance

Inherits from `NSObject`

## Conformances

- `CVarArg`
- `CustomDebugStringConvertible`
- `CustomStringConvertible`
- `Equatable`
- `Hashable`
- `NSObjectProtocol`

## Topics

### Getting Screen Objects
- `main` - Returns the screen object containing the window with the keyboard focus.
- `deepest` - Returns a screen object representing the screen that can best represent color.
- `screens` - Returns an array of screen objects representing all of the screens available on the system.

### Getting Screen Information
- `depth` - The current bit depth and colorspace information of the screen.
- `frame` - The dimensions and location of the screen.
- `supportedWindowDepths` - A zero-terminated array of the window depths supported by the screen.
- `deviceDescription` - The device dictionary for the screen.
- `colorSpace` - The color space of the screen.
- `localizedName` - The localized name of the display.
- `canRepresent(_:)` - A Boolean value indicating whether the color space of the screen is capable of representing the specified display gamut.
- `screensHaveSeparateSpaces` - Returns a Boolean value indicating whether each screen can have its own set of spaces.

### Converting Between Screen and Backing Coordinates
- `backingAlignedRect(_:options:)` - Converts a rectangle in global screen coordinates to a pixel aligned rectangle.
- `backingScaleFactor` - The backing store pixel scale factor for the screen.
- `convertRectFromBacking(_:)` - Converts the rectangle from the device pixel aligned coordinates system of a screen.
- `convertRectToBacking(_:)` - Converts the rectangle to the device pixel aligned coordinates system of a screen.

### Getting the Visible Portion of the Screen
- `visibleFrame` - The current location and dimensions of the visible screen.
- `safeAreaInsets` - The distances from the screen's edges at which content isn't obscured.
- `auxiliaryTopLeftArea` - The unobscured portion of the top-left corner of the screen.
- `auxiliaryTopRightArea` - The unobscured portion of the top-right corner of the screen.

### Getting Extended Dynamic Range Details
- `maximumPotentialExtendedDynamicRangeColorComponentValue` - The maximum possible color component value for the screen when it's in extended dynamic range (EDR) mode.
- `maximumExtendedDynamicRangeColorComponentValue` - The current maximum color component value for the screen.
- `maximumReferenceExtendedDynamicRangeColorComponentValue` - The current maximum color component value for reference rendering to the screen.

### Getting Variable Refresh Rate Details
- `maximumFramesPerSecond` - The maximum number of frames per second that the screen supports.
- `minimumRefreshInterval` - The shortest refresh interval that the screen supports.
- `maximumRefreshInterval` - The largest refresh interval that the screen supports.
- `displayUpdateGranularity` - The number of seconds between the screen's supported update rates.
- `lastDisplayUpdateTimestamp` - The time of the last framebuffer update.

### Receiving Screen-Related Notifications
- `colorSpaceDidChangeNotification` - Posted when the color space of the screen has changed.

### Synchronizing with the display's refresh rate
- `displayLink(target:selector:)` - Returns a new display link whose callback will be invoked in-sync with the display the screen is on.

### Instance Properties
- `cgDirectDisplayID` - The CGDirectDisplayID for this screen.

## Availability

- **macOS** (available)
