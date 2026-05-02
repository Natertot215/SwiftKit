---
url: https://developer.apple.com/documentation/updates/appkit
framework: AppKit
category: Essentials
title: Updates to AppKit
kind: article
captured: 2026-05-01
---

# AppKit Updates

## Overview

This document outlines notable changes to AppKit across multiple release cycles.

---

## June 2025

### General

- **Control Size Metrics**: Use `NSView.prefersCompactControlSizeMetrics` to maintain control metrics consistent with macOS 15 and earlier.
- **Extra Large Control Size**: `NSControl.ControlSize` now includes a new `.extraLarge` size option.
- **Background Extension View**: Use `NSBackgroundExtensionView` to extend a view's content under sidebars and inspectors for seamless immersive visuals.
- **Liquid Glass Effects**:
  - Apply Liquid Glass effects using `NSGlassEffectView`
  - Use `NSGlassEffectContainerView` to efficiently merge glass effect views in proximity
  - Configure buttons with Liquid Glass by setting `NSButton.BezelStyle` to `.glass`

### Split Views

- Add top and bottom accessory views using `NSSplitViewItemAccessoryViewController` objects via:
  - `NSSplitViewItem.topAlignedAccessoryViewControllers`
  - `NSSplitViewItem.bottomAlignedAccessoryViewControllers`

### Toolbars

- **Prominent Toolbar Items**: Tint toolbar items by setting `NSToolbarItem.Style` to `.prominent` and configuring `NSToolbarItem.backgroundTintColor`

---

## April 2025

### macOS Pasteboard Privacy

Prepare for an upcoming feature that alerts users when apps programmatically read the general pasteboard (similar to iOS behavior).

**Key APIs**:
- New `detect` methods in `NSPasteboard` and `NSPasteboardItem` to examine pasteboard data types without triggering alerts
- `NSPasteboard.accessBehavior` property to determine access behavior (always allowed, never allowed, or prompts alert)

**Testing**: Enable the preview behavior with:
```bash
defaults write <your_app_bundle_id> EnablePasteboardPrivacyDeveloperPreview -bool yes
```

---

## June 2024

### General
- Window tiling support for organizing window display and layout

### Swift and SwiftUI
- Use `NSHostingMenu` for SwiftUI menus in AppKit
- Animate AppKit views using SwiftUI animations with `NSAnimationContext.animate(_:changes:completion:)`

### API Refinements
- Keyboard support for opening context menus on focused UI elements
- Symbol animation effects: repeat, wiggle, bounce, and rotate
- Format picker for `NSPanel` supporting predefined content types
- New `NSCursor` APIs: `FrameResizeDirection` and `FrameResizePosition`
- `NSToolbar.allowsDisplayModeCustomization` for controlling toolbar text display
- `NSTextField.suggestionsDelegate` for customized type-ahead suggestions

---

## June 2023

### Views and Controls
- `NSTableView.userCanChangeVisibilityOf` delegate method for column visibility toggling
- New `NSProgressIndicator` property for observing task progress
- `.automatic` bezel style for buttons that adapts based on content and hierarchy
- `NSSplitView` inspectors for contextual document information
- Enhanced `NSPopover` with toolbar item anchoring and full-size support
- New `NSMenu` features: section headers, horizontal item palettes, and badge counts

### Cooperative App Activation
- User-driven app activation preventing unexpected switches
- `NSApp.activate()` and `NSRunningApplication` support for cooperative activation

### Graphics
- **Path Interoperability**: `CGPath` and `NSBezierPath` are now interoperable
- `CADisplayLink` for synchronizing drawing with display refresh
- Standard system fill colors: `.systemFill`, `.secondarySystemFill`, `.tertiarySystemFill`, `.quaternarySystemFill`, `.quinarySystemFill`
- `NSView.clipsToBounds` default changed (views no longer clip by default)
- `NSImageView.addSymbolEffect()` for symbol animations (bounce, pulse, variable color, scale, appear, disappear, replace)
- HDR image support

### Swift and SwiftUI
- `Sendable` types: `NSColor`, `NSColorSpace`, `NSGradient`, `NSShadow`, `NSTouch`
- `Transferable` types: `NSImage`, `NSColor`, `NSSound`
- `#Preview` Swift macro for view previews
- SwiftUI modifiers (`toolbar`, `navigationTitle`) on `NSWindows`
- `@ViewLoading` and `@WindowLoading` attributes for view/window loading

### Text Improvements
- `NSTextInsertionIndicator` adapting to app accent color with cursor accessories
- `NSTextField.contentType` for AutoFill (contact info, birthdays, names, credit cards, addresses)
- Text styles on `NSFont.preferredFont`: `.body`, `.largeTitle`, `.headline`
- Improved hyphenation for non-English languages
- Dynamic line-height adjustments for vertical-space-requiring languages
- Localized symbol image variants
