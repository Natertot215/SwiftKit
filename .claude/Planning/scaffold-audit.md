# Phase 2.5 — Scaffold Audit

Read-only verification that the 74 generated page-files match the approved Phase 1 manifest. Independent of the generator script — parses on-disk Swift and cross-checks against `Planning/page-component-map-{swiftui,appkit}.md`.

**Generated:** 2026-05-07 (post-Phase-2 commit `72c3f78`)  
**Total checked:** 74 leaves  
**Failures:** 0  
**Verdict:** ✅ PASS — Phase 3 unblocked

## Registry sanity checks

- No `PlaceholderGalleryPage` references in `GalleryRegistry.swift`: ✅
- No placeholder name strings (`Page X1`, `Folder N Sub`): ✅

## Per-leaf table

| Framework | Folder | Leaf | Tiles | Stable ID | Status | Notes |
|---|---|---|---|---|---|---|
| Reference | Reference | Materials | kept (full demos) | `reference.materials.materials` | ✅ | pre-existing |
| Reference | Reference | Motion | kept (full demos) | `reference.motion.motion` | ✅ | pre-existing |
| Reference | Reference | Color | kept (full demos) | `reference.color.color` | ✅ | pre-existing |
| Reference | Reference | SF Symbols | kept (full demos) | `reference.sfSymbols.sfSymbols` | ✅ | pre-existing |
| Reference | Reference | Typography | kept (full demos) | `reference.typography.typography` | ✅ | pre-existing |
| SwiftUI | App Structure | App and Scenes | 18 | `swiftui.appStructure.appAndScenes` | ✅ |  |
| SwiftUI | App Structure | WindowGroup | 48 | `swiftui.appStructure.windowGroup` | ✅ |  |
| SwiftUI | App Structure | Document | 37 | `swiftui.appStructure.document` | ✅ |  |
| SwiftUI | App Structure | Environment | 3 | `swiftui.appStructure.environment` | ✅ |  |
| SwiftUI | App Structure | State and Bindings | 11 | `swiftui.appStructure.stateAndBindings` | ✅ |  |
| SwiftUI | App Structure | AppKit Integration | 13 | `swiftui.appStructure.appkitIntegration` | ✅ |  |
| SwiftUI | App Structure | View Fundamentals | 5 | `swiftui.appStructure.viewFundamentals` | ✅ |  |
| SwiftUI | Navigation | NavigationStack | 13 | `swiftui.navigation.navigationStack` | ✅ |  |
| SwiftUI | Navigation | NavigationSplitView | 8 | `swiftui.navigation.navigationSplitView` | ✅ |  |
| SwiftUI | Navigation | TabView | 22 | `swiftui.navigation.tabView` | ✅ |  |
| SwiftUI | Navigation | Sidebar | 3 | `swiftui.navigation.sidebar` | ✅ |  |
| SwiftUI | Navigation | Searchable | 19 | `swiftui.navigation.searchable` | ✅ |  |
| SwiftUI | Navigation | Inspector | 4 | `swiftui.navigation.inspector` | ✅ |  |
| SwiftUI | Layout | Stacks | 7 | `swiftui.layout.stacks` | ✅ |  |
| SwiftUI | Layout | Grid | 7 | `swiftui.layout.grid` | ✅ |  |
| SwiftUI | Layout | LazyGrid | 4 | `swiftui.layout.lazyGrid` | ✅ |  |
| SwiftUI | Layout | ScrollView | 42 | `swiftui.layout.scrollView` | ✅ |  |
| SwiftUI | Layout | GeometryReader | 12 | `swiftui.layout.geometryReader` | ✅ |  |
| SwiftUI | Layout | Frame and Padding | 21 | `swiftui.layout.frameAndPadding` | ✅ |  |
| SwiftUI | Layout | Alignment | 18 | `swiftui.layout.alignment` | ✅ |  |
| SwiftUI | Layout | SafeArea | 5 | `swiftui.layout.safeArea` | ✅ |  |
| SwiftUI | Layout | Custom Layout | 13 | `swiftui.layout.customLayout` | ✅ |  |
| SwiftUI | Containers | List | 37 | `swiftui.containers.list` | ✅ |  |
| SwiftUI | Containers | Table | 22 | `swiftui.containers.table` | ✅ |  |
| SwiftUI | Containers | Form | 8 | `swiftui.containers.form` | ✅ |  |
| SwiftUI | Containers | GroupBox | 8 | `swiftui.containers.groupBox` | ✅ |  |
| SwiftUI | Containers | Section | 13 | `swiftui.containers.section` | ✅ |  |
| SwiftUI | Containers | DisclosureGroup | 4 | `swiftui.containers.disclosureGroup` | ✅ |  |
| SwiftUI | Controls | Button | 18 | `swiftui.controls.button` | ✅ |  |
| SwiftUI | Controls | Toggle | 4 | `swiftui.controls.toggle` | ✅ |  |
| SwiftUI | Controls | Picker | 7 | `swiftui.controls.picker` | ✅ |  |
| SwiftUI | Controls | DatePicker | 5 | `swiftui.controls.datePicker` | ✅ |  |
| SwiftUI | Controls | ColorPicker | 1 | `swiftui.controls.colorPicker` | ✅ |  |
| SwiftUI | Controls | Slider | 1 | `swiftui.controls.slider` | ✅ |  |
| SwiftUI | Controls | Stepper | 1 | `swiftui.controls.stepper` | ✅ |  |
| SwiftUI | Controls | ProgressView | 5 | `swiftui.controls.progressView` | ✅ |  |
| SwiftUI | Controls | Gauge | 4 | `swiftui.controls.gauge` | ✅ |  |
| SwiftUI | Controls | Menu | 17 | `swiftui.controls.menu` | ✅ |  |
| SwiftUI | Text and Input | Text | 34 | `swiftui.textAndInput.text` | ✅ |  |
| SwiftUI | Text and Input | TextField | 23 | `swiftui.textAndInput.textField` | ✅ |  |
| SwiftUI | Text and Input | TextEditor | 11 | `swiftui.textAndInput.textEditor` | ✅ |  |
| SwiftUI | Text and Input | Label | 4 | `swiftui.textAndInput.label` | ✅ |  |
| SwiftUI | Text and Input | AttributedString | 9 | `swiftui.textAndInput.attributedString` | ✅ |  |
| SwiftUI | Images and Shapes | Image | 18 | `swiftui.imagesAndShapes.image` | ✅ |  |
| SwiftUI | Images and Shapes | Shapes | 29 | `swiftui.imagesAndShapes.shapes` | ✅ |  |
| SwiftUI | Images and Shapes | Gradient | 17 | `swiftui.imagesAndShapes.gradient` | ✅ |  |
| SwiftUI | Presentation | Sheet | 24 | `swiftui.presentation.sheet` | ✅ |  |
| SwiftUI | Presentation | Popover | 3 | `swiftui.presentation.popover` | ✅ |  |
| SwiftUI | Presentation | Alert | 10 | `swiftui.presentation.alert` | ✅ |  |
| SwiftUI | Presentation | ConfirmationDialog | 3 | `swiftui.presentation.confirmationDialog` | ✅ |  |
| SwiftUI | Toolbars and Menus | Toolbar | 32 | `swiftui.toolbarsAndMenus.toolbar` | ✅ |  |
| SwiftUI | Toolbars and Menus | ContextMenu | 5 | `swiftui.toolbarsAndMenus.contextMenu` | ✅ |  |
| SwiftUI | Toolbars and Menus | Commands | 16 | `swiftui.toolbarsAndMenus.commands` | ✅ |  |
| SwiftUI | Animation and Effects | Animation | 26 | `swiftui.animationAndEffects.animation` | ✅ |  |
| SwiftUI | Animation and Effects | Transition | 12 | `swiftui.animationAndEffects.transition` | ✅ |  |
| SwiftUI | Animation and Effects | MatchedGeometry | 21 | `swiftui.animationAndEffects.matchedGeometry` | ✅ |  |
| SwiftUI | Animation and Effects | Canvas | 44 | `swiftui.animationAndEffects.canvas` | ✅ |  |
| SwiftUI | Accessibility | Labels and Descriptions | 25 | `swiftui.accessibility.labelsAndDescriptions` | ✅ |  |
| SwiftUI | Accessibility | Actions and Behavior | 32 | `swiftui.accessibility.actionsAndBehavior` | ✅ |  |
| SwiftUI | Accessibility | Custom Content | 14 | `swiftui.accessibility.customContent` | ✅ |  |
| SwiftUI | Gestures and Input | Gestures | 25 | `swiftui.gesturesAndInput.gestures` | ✅ |  |
| SwiftUI | Gestures and Input | FocusState | 26 | `swiftui.gesturesAndInput.focusState` | ✅ |  |
| SwiftUI | Gestures and Input | Keyboard | 18 | `swiftui.gesturesAndInput.keyboard` | ✅ |  |
| AppKit | NSOutlineView | NSOutlineView | 3 | `appkit.nsOutlineView.nsOutlineView` | ✅ |  |
| AppKit | NSBrowser | NSBrowser | 5 | `appkit.nsBrowser.nsBrowser` | ✅ |  |
| AppKit | NSPathControl | NSPathControl | 7 | `appkit.nsPathControl.nsPathControl` | ✅ |  |
| AppKit | NSTokenField | NSTokenField | 5 | `appkit.nsTokenField.nsTokenField` | ✅ |  |
| AppKit | NSDatePicker | NSDatePicker | 6 | `appkit.nsDatePicker.nsDatePicker` | ✅ |  |
| AppKit | NSGlassEffectView | NSGlassEffectView | 3 | `appkit.nsGlassEffectView.nsGlassEffectView` | ✅ |  |
