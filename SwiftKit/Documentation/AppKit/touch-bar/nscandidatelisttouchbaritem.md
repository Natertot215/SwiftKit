---
url: https://developer.apple.com/documentation/appkit/nscandidatelisttouchbaritem
framework: AppKit
category: Touch Bar
title: NSCandidateListTouchBarItem
kind: class
captured: 2026-05-02
---

# NSCandidateListTouchBarItem

A bar item that, along with its delegate, provides a list of textual suggestions for the current text view.

## Declaration

```swift
class NSCandidateListTouchBarItem<CandidateType> where CandidateType : AnyObject
```







## Relationships

**Inherits From**: `NSTouchBarItem`

**Conforms To**: `CVarArg`, `CustomDebugStringConvertible`, `CustomStringConvertible`, `Equatable`, `Hashable`, `NSCoding`, `NSObjectProtocol`, `Sendable`, `SendableMetatype`

## Availability

- macOS 10.12.2

## Topics

### Providing a client and a delegate

- `client`
- `delegate`
- `NSCandidateListTouchBarItemDelegate`

### Populating the candidate list

- `setCandidates(_:forSelectedRange:in:)`
- `candidates`
- `attributedStringForCandidate`
- `allowsTextInputContextCandidates`

### Handling collapsible behavior

- `allowsCollapsing`
- `isCollapsed`

### Managing candidate list visibility

- `isCandidateListVisible`
- `update(withInsertionPointVisibility:)`

### Configuring bar customization

- `customizationLabel`

## See Also

- `NSTouchBarItem`
- `NSColorPickerTouchBarItem`
- `NSCustomTouchBarItem`
- `NSGroupTouchBarItem`
- `NSPopoverTouchBarItem`
- `NSSharingServicePickerTouchBarItem`
- `NSSliderTouchBarItem`
- `NSStepperTouchBarItem`
- `NSUserInterfaceCompressionOptions`
- `NSButtonTouchBarItem`
- `NSPickerTouchBarItem`
- `NSPickerTouchBarItem.ControlRepresentation`
- `NSPickerTouchBarItem.SelectionMode`
