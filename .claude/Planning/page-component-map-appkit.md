# Page-Component Map — AppKit

## AppKit > NSOutlineView

- `NSOutlineView` — A view that uses a row-and-column format to display hierarchical data like directories and files that can be expanded and collapsed
- `NSOutlineViewDataSource` — A set of methods that an outline view calls to retrieve data and information about it from the data source delegate, and optionally to update data values
- `NSOutlineViewDelegate` — A set of optional methods implemented by delegates of NSOutlineView objects

## AppKit > NSBrowser

- `NSBrowser` — An interface that displays a hierarchically organized list of data items that can be navigated and selected
- `NSBrowserDelegate` — The delegate protocol for NSBrowser objects
- `NSBrowserCell` — The user interface of a browser
- `NSBrowser.ColumnResizingType` — Constants that specify the column-resizing behavior of a browser
- `NSBrowser.DropOperation` — Constants that specify the drop behavior of a browser

## AppKit > NSPathControl

- `NSPathControl` — A display of a file system path or virtual path information
- `NSPathControl.Style` — Constants that specify the presentation style of a path control
- `NSPathControlDelegate` — A set of methods that can be implemented by the delegate of a path control object to support dragging to and from the control
- `NSPathCell` — The user interface of a path control object
- `NSPathCellDelegate` — A set of methods that enable the delegate of a path cell object to customize the Open panel or pop-up menu of a path control
- `NSPathComponentCell` — A component of a path
- `NSPathControlItem` — An item in a path control

## AppKit > NSTokenField

- `NSTokenField` — A text field that converts text into visually distinct tokens
- `NSTokenField.TokenStyle` — Constants that specify the appearance of token objects in a token field
- `NSTokenFieldDelegate` — A set of optional methods implemented by delegates of NSTokenField objects
- `NSTokenFieldCell` — A text field cell subclass that enables tokenized editing of an array of objects
- `NSTokenFieldCellDelegate` — A set of optional methods implemented by delegates of NSTokenFieldCell objects to work with tokenized strings

## AppKit > NSDatePicker

- `NSDatePicker` — A display of a calendar date with controls for editing the date value
- `NSDatePicker.Style` — Constants that specify the appearance style of a date picker
- `NSDatePicker.Mode` — Constants that specify whether a date picker selects a single date or a range
- `NSDatePicker.ElementFlags` — Constants that specify which elements of a date picker are displayed
- `NSDatePickerCell` — An object that controls the behavior of a date picker, or of a single date picker cell in a matrix
- `NSDatePickerCellDelegate` — A set of optional methods implemented by delegates of NSDatePickerCell objects

---

## PROPOSED — needs Nathan approval

### AppKit > NSGlassEffectView

> This page is proposed and requires explicit Nathan approval before it enters the manifest.
> Rationale: macOS 26-exclusive Liquid Glass AppKit primitive. No SwiftUI equivalent at time of writing. Type-doc fully present. Directly relevant to Pommora's macOS 26 shell work.

- `NSGlassEffectView` — A view that embeds its content view in a dynamic glass effect
- `NSGlassEffectView.Style` — The style variants (clear, regular) available for a glass effect view
- `NSGlassEffectContainerView` — A view that efficiently merges descendant glass effect views together when they are within a specified proximity to each other

---

## Unmapped / Needs Decision

- `views-and-controls/nsbackgroundextensionview.md` — macOS 26, extends content to fill bounds under safe-area regions; no SwiftUI equivalent but behaves as a layout helper rather than a standalone user-visible component. Recommend deferral unless Nathan wants an AppKit layout-helpers page.
- `views-and-controls/nsvisualeffectview.md` — Translucency and vibrancy; SwiftUI material modifiers cover the common cases; AppKit version exposes additional blending modes not available in SwiftUI. Nathan should decide whether this warrants a tile in a future AppKit Materials page or stays deferred.
- `views-and-controls/nsglasseffectview.md` and `nsglasseffectcontainerview.md` — Routed to PROPOSED section above.
