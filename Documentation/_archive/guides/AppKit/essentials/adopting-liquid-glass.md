---
url: https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass
framework: AppKit
category: Essentials
title: Adopting Liquid Glass
kind: article
captured: 2026-05-01
---

# Adopting Liquid Glass

## Overview

This guide provides comprehensive instructions for adopting Liquid Glass, a new dynamic material that combines optical properties of glass with fluidity, into your existing Apple platform apps.

## Key Principles

### 1. Visual Refresh with Liquid Glass

Liquid Glass is a new material available across iOS, iPadOS, macOS, tvOS, and watchOS that:
- Combines optical properties of glass with a sense of fluidity
- Forms a distinct functional layer for controls and navigation elements
- Adapts in response to various factors to bring focus to underlying content

**Best Practice:** Leverage system frameworks to adopt Liquid Glass automatically through standard components like bars, sheets, popovers, and controls.

### 2. Reducing Custom Backgrounds

Remove custom backgrounds in controls and navigation elements that might interfere with Liquid Glass effects:

**Affected Elements:**
- **SwiftUI:** NavigationStack, NavigationSplitView, WindowStyle, toolbar
- **UIKit:** UINavigationBar, UITabBar, UIToolbar, UISplitViewController
- **AppKit:** NSToolbar, NSSplitView

### 3. Testing Across Settings

- Test with various display and accessibility settings
- Verify behavior with reduced transparency and motion preferences
- Test custom elements, colors, and animations with different configurations

### 4. Avoiding Overuse

Apply Liquid Glass effects sparingly to custom controls. Overuse can distract from content rather than highlight it.

**Custom Implementation APIs:**
- **SwiftUI:** `View.glassEffect(_:in:)`
- **UIKit:** `UIGlassEffect`
- **AppKit:** `NSGlassEffectView`

---

## App Icons

App icons now feature dynamic, layered designs that respond to lighting and visual effects.

### Design Principles

1. **Provide visually consistent, optically balanced designs** across platforms
2. **Use simplified designs** with solid, filled, overlapping semi-transparent shapes
3. **Let the system handle** masking, blurring, and other visual effects

### Implementation Steps

**Design using layers:** Create separate layers for foreground, middle, and background elements in your design application.

**Use Icon Composer:**
- Available in latest Xcode and at Apple Design Resources
- Drag and drop layers directly into Icon Composer
- Adjust opacity and layer attributes
- Preview with system effects and appearances

**Preview against updated grids:** Download grid templates from Apple Design Resources to test how your icon appears with system masking (rounded rectangle for iOS/iPadOS/macOS, circular for watchOS).

---

## Controls

Controls feature a refreshed look with Liquid Glass effects during interaction.

### Review Updates

Standard controls automatically adopt changes when rebuilt with the latest Xcode:

**SwiftUI Controls:**
```swift
Button, Toggle, Slider, Stepper, Picker, TextField
```

**UIKit Controls:**
```swift
UIButton, UISwitch, UISlider, UIStepper, UISegmentedControl, UITextField
```

**AppKit Controls:**
```swift
NSButton, NSSwitch, NSSlider, NSStepper, NSSegmentedControl, NSTextField
```

### Color Guidelines

Use system colors or define custom colors with light/dark variants and increased contrast options.

### Spacing

Prefer standard spacing metrics; avoid overcrowding or layering Liquid Glass elements.

### Scroll Edge Effect

Optimize legibility when content scrolls beneath controls:

**SwiftUI:**
```swift
View.safeAreaBar(edge:alignment:spacing:content:)
```

**UIKit:**
```swift
UIScrollEdgeElementContainerInteraction
```

### Concentric Shapes

Maintain visual continuity with rounded corners aligned to containers:

**SwiftUI:**
```swift
Shape.rect(corners:isUniform:)
ConcentricRectangle
```

**UIKit:**
```swift
UIView.cornerConfiguration
UICornerConfiguration
```

### Glass Button Styles

Instead of custom Liquid Glass effects, use built-in button styles:

**SwiftUI:**
```swift
.buttonStyle(.glass)
.buttonStyle(.glassProminent)
.buttonStyle(.glass(_:))
```

**UIKit:**
```swift
UIButton.Configuration.glass()
UIButton.Configuration.prominentGlass()
UIButton.Configuration.clearGlass()
UIButton.Configuration.prominentClearGlass()
```

**AppKit:**
```swift
NSButton.BezelStyle.glass
```

---

## Navigation

Liquid Glass applies to the topmost navigation layer, helping focus on underlying content.

### Navigation Hierarchy

Establish clear separation between navigation elements (tab bars, sidebars) and content.

### Tab Bar to Sidebar Adaptation

Allow automatic adaptation based on context:

**SwiftUI:**
```swift
.tabViewStyle(.sidebarAdaptable)
```

**UIKit:**
```swift
UITabBarController.Mode.tabSidebar
```

### Split Views for Layouts

Use standard APIs for sidebar and inspector layouts:

**SwiftUI:**
```swift
NavigationSplitView
View.inspector(isPresented:content:)
```

**UIKit:**
```swift
UISplitViewController
UISplitViewController.Column.inspector
```

**AppKit:**
```swift
NSSplitViewController
NSSplitViewItem(inspectorWithViewController:)
```

### Background Extension Effect

Extend content beneath sidebars and inspectors:

**SwiftUI:**
```swift
View.backgroundExtensionEffect()
```

**UIKit:**
```swift
UIBackgroundExtensionView
```

**AppKit:**
```swift
NSBackgroundExtensionView
```

### Tab Bar Minimize Behavior

Configure tab bar to recede when scrolling:

**SwiftUI:**
```swift
TabView {
    // ...
}
.tabBarMinimizeBehavior(.onScrollDown)
```

**UIKit:**
```swift
tabBarMinimizeBehavior = .onScrollDown
```

---

## Menus and Toolbars

### Standard Icons in Menus

Use system selectors for menu items to automatically adopt icons:
- Cut, Copy, Paste
- And other standard actions

### Match Swipe Actions

Ensure top menu actions correspond to swipe actions for consistency.

### Toolbar Grouping

Group items performing similar actions or affecting the same interface area.

**Fixed Spacers for Grouping:**

**SwiftUI:**
```swift
SpacerSizing.fixed
ToolbarSpacer
```

**UIKit:**
```swift
UIBarButtonItem.fixedSpace(_:)
```

**AppKit:**
```swift
NSToolbarItem.Identifier.space
```

### Icon Representation

Use standard icons for common actions to declutter the interface.

### Accessibility Labels

Always provide accessibility labels for every icon.

### Toolbar Item Visibility

Hide entire toolbar items, not just their content:

**SwiftUI:**
```swift
ToolbarContent.hidden(_:)
```

**UIKit:**
```swift
UIBarButtonItem.isHidden
```

**AppKit:**
```swift
NSToolbarItem.isHidden
```

---

## Windows and Modals

### Arbitrary Window Sizes

Support continuous fluid resizing of windows down to a minimum size.

### Split Views for Fluid Resizing

Use standard split view APIs for automatic column reflow:

**SwiftUI:**
```swift
NavigationSplitView
```

**UIKit:**
```swift
UISplitViewController
```

**AppKit:**
```swift
NSSplitViewController
```

### Sheets and Modals

- **Sheets:** Feature increased corner radius; half sheets are inset to show peeking content
- **Action Sheets:** Originate from the initiating element instead of the bottom edge

**Specify Action Sheet Source:**

**SwiftUI:**
```swift
View.confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)
```

**UIKit:**
```swift
UIPopoverPresentationController.sourceView
UIPopoverPresentationController.sourceItem
```

**AppKit:**
```swift
NSAlert.beginSheetModal(for:completionHandler:)
```

---

## Organization and Layout

### List-Based Layouts

Lists, tables, and forms now feature:
- Larger row height and padding
- Increased corner radius for sections
- Title-style capitalization for headers

### Section Headers

Update section headers to title-style capitalization to match system conventions.

### Forms

Use grouped form style for automatic layout updates:

**SwiftUI:**
```swift
FormStyle.grouped
```

---

## Search

Implement search according to platform conventions:

**Keyboard Layout:** Test that search fields move smoothly with keyboard appearance.

**Semantic Search Tabs:** Use standard APIs for search tabs:

**SwiftUI:**
```swift
Tab(role: .search) {
    // ...
}
```

**UIKit:**
```swift
UISearchTab { _ in 
    // ...
}
```

---

## Platform Considerations

### watchOS

Adopt standard button styles and toolbar APIs from watchOS 10.

### tvOS

Adopt standard focus APIs for consistency with system experience on Apple TV 4K (2nd generation) and newer:

**SwiftUI:**
```swift
View.focusable(_:)
EnvironmentValues.isFocused
```

**UIKit:**
```swift
UIFocusItem
UIControl.State.focused
```

### Performance Optimization

Combine custom Liquid Glass effects for better rendering:

**SwiftUI:**
```swift
GlassEffectContainer
```

### General Performance Testing

Profile your app across platforms and review improving your app's performance documentation.

---

## Backward Compatibility

To maintain previous appearance while building with latest SDKs, add to your Info plist:

```
UIDesignRequiresCompatibility
```
