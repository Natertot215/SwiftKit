# Describe-page bundle plan — 2026-05-03

## Summary

- Total describe leaves: 256
- Unique bundle pages: 22
- Standalone pages: 9
- Total pages to author: 31

---

## Bundle pages

### ScenesFamilyDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/ScenesFamilyDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.scenes.building-and-customizing-the-menu-bar-with-swiftui`
- `swiftui.scenes.commands(content:)`
- `swiftui.scenes.menubarextra`
- `swiftui.scenes.menubarextrastyle(_:)`
- `swiftui.scenes.menubarextrastyle`
- `swiftui.scenes.opensettings`
- `swiftui.scenes.opensettingsaction`
- `swiftui.scenes.scene`
- `swiftui.scenes.scenebuilder`
- `swiftui.scenes.scenephase`
- `swiftui.scenes.scenephase.type`
- `swiftui.scenes.settings`
- `swiftui.scenes.wknotificationscene`

**Page-level title:** "Scene-Level APIs"
**Page-level blurb:** These types and modifiers operate at the `App.body` or `Scene` scope — one level above any individual view. `Scene`, `SceneBuilder`, and `Settings` define the structural blocks of a SwiftUI app; `ScenePhase` and `openSettings` / `OpenSettingsAction` are environment values read by scene-resident views; `MenuBarExtra` / `MenuBarExtraStyle` and `commands(content:)` attach to a `WindowGroup` or `DocumentGroup`. None can be instantiated or demonstrated inside a child `View`. `WKNotificationScene` is watchOS-only.

---

### VisionOSVolumesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/VisionOSVolumesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.windows.defaultworldscaling(_:)`
- `swiftui.windows.onvolumeviewpointchange(updatestrategy:initial:_:)`
- `swiftui.windows.squareazimuth`
- `swiftui.windows.supportedvolumeviewpoints(_:)`
- `swiftui.windows.surfacesnappinginfo`
- `swiftui.windows.viewpoint3d`
- `swiftui.windows.volumeworldalignment(_:)`
- `swiftui.windows.volumeviewpointupdatestrategy`
- `swiftui.windows.worldalignmentbehavior`
- `swiftui.windows.worldscalingbehavior`
- `swiftui.windows.worldscalingcompensation`
- `swiftui.windows.worldtrackinglimitation`
- `swiftui.windows.worldtrackinglimitations`

**Page-level title:** "visionOS Volumetric Window APIs"
**Page-level blurb:** This cluster covers visionOS-specific volume and world-tracking APIs: `Viewpoint3D`, `SquareAzimuth`, `SurfaceSnappingInfo`, `VolumeViewpointUpdateStrategy`, `WorldAlignmentBehavior`, `WorldScalingBehavior`, `WorldScalingCompensation`, and the environment value `worldTrackingLimitations`. The Scene-level modifiers `defaultWorldScaling(_:)`, `volumeWorldAlignment(_:)`, and the View modifiers `onVolumeViewpointChange(...)`, `supportedVolumeViewpoints(_:)` configure how a volumetric window behaves in space. All are visionOS-only and have no macOS rendering surface.

---

### ImmersiveSpacesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/ImmersiveSpacesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.immersive-spaces.dismissimmersivespace`
- `swiftui.immersive-spaces.dismissimmersivespaceaction`
- `swiftui.immersive-spaces.full`
- `swiftui.immersive-spaces.immersionchangecontext`
- `swiftui.immersive-spaces.immersionstyle`
- `swiftui.immersive-spaces.immersionstyle(selection:in:)`
- `swiftui.immersive-spaces.immersivecontentbrightness`
- `swiftui.immersive-spaces.immersivecontentbrightness(_:)`
- `swiftui.immersive-spaces.immersiveenvironmentbehavior`
- `swiftui.immersive-spaces.immersiveenvironmentpicker(content:)`
- `swiftui.immersive-spaces.immersivespace`
- `swiftui.immersive-spaces.immersivespacecontentbuilder`
- `swiftui.immersive-spaces.immersivespacedisplacement`
- `swiftui.immersive-spaces.mixed`
- `swiftui.immersive-spaces.onimmersionchange(initial:_:)`
- `swiftui.immersive-spaces.openimmersivespace`
- `swiftui.immersive-spaces.openimmersivespaceaction`
- `swiftui.immersive-spaces.progressive`
- `swiftui.immersive-spaces.progressiveimmersionaspectratio`
- `swiftui.immersive-spaces.remotedeviceidentifier`
- `swiftui.immersive-spaces.remoteimmersivespace`
- `swiftui.immersive-spaces.upperlimbvisibility(_:)`
- `swiftui.immersive-spaces.upperlimbvisibility(_:).modifier`

**Page-level title:** "Immersive Space APIs"
**Page-level blurb:** The immersive-space cluster is visionOS's mechanism for presenting a fully spatial environment. `ImmersiveSpace` is a Scene-level type; `ImmersionStyle` (and its cases `.full`, `.mixed`, `.progressive`) is a protocol applied via `immersionStyle(selection:in:)`. `OpenImmersiveSpaceAction` and `DismissImmersiveSpaceAction` are environment actions that trigger scene transitions. `ImmersiveContentBrightness`, `ImmersiveEnvironmentBehavior`, `ProgressiveImmersionAspectRatio`, and `RemoteImmersiveSpace` are supporting configuration types. `ImmersionChangeContext` is a context struct delivered to `onImmersionChange`. Everything here is visionOS-only or Scene-scoped; none renders in a macOS child view.

---

### iOSNavigationTypesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/iOSNavigationTypesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.navigation.adaptabletabbarplacement`
- `swiftui.navigation.defaultadaptabletabbarplacement(_:)`
- `swiftui.navigation.istabbarshowingsections`
- `swiftui.navigation.navigationbarbackbuttonhidden(_:)`
- `swiftui.navigation.navigationbaritem`
- `swiftui.navigation.navigationbartitledisplaymode(_:)`
- `swiftui.navigation.tabbarminimizebehavior`
- `swiftui.navigation.tabbarplacement`
- `swiftui.navigation.tabbarplacement.type`
- `swiftui.navigation.tabviewbottomaccessoryplacement`

**Page-level title:** "iOS / iPadOS Navigation Types"
**Page-level blurb:** These navigation APIs are iOS- or iPadOS-specific. `NavigationBarItem`, `navigationBarTitleDisplayMode(_:)`, and `navigationBarBackButtonHidden(_:)` are tied to UIKit's navigation bar, which doesn't exist on macOS. `AdaptableTabBarPlacement`, `defaultAdaptableTabBarPlacement(_:)`, `TabBarPlacement`, `TabBarMinimizeBehavior`, `TabViewBottomAccessoryPlacement`, and the `isTabBarShowingSections` environment value all govern the adaptive tab-bar behavior introduced for iPad multitasking — none map to macOS behavior. They compile on macOS but have no visible effect.

---

### ToolbarTypesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/ToolbarTypesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.toolbars.toolbaritemplacement`
- `swiftui.toolbars.toolbarcontent`
- `swiftui.toolbars.toolbarcontentbuilder`
- `swiftui.toolbars.customizabletoolbarcontent`
- `swiftui.toolbars.toolbarcustomizationbehavior`
- `swiftui.toolbars.toolbarcustomizationoptions`
- `swiftui.toolbars.searchtoolbarbehavior`
- `swiftui.toolbars.toolbarplacement`
- `swiftui.toolbars.contenttoolbarplacement`
- `swiftui.toolbars.toolbarrole`
- `swiftui.toolbars.toolbarforegroundstyle(_:for:)`
- `swiftui.toolbars.toolbarlabelstyle`
- `swiftui.toolbars.toolbarlabelstyle.type`
- `swiftui.toolbars.spacersizing`
- `swiftui.toolbars.toolbartitledisplaymode`
- `swiftui.toolbars.toolbartitlemenu`
- `swiftui.toolbars.ornament(visibility:attachmentanchor:contentalignment:ornament:)`
- `swiftui.toolbars.ornamentattachmentanchor`
- `swiftui.toolbars.toolbardefaultitemkind`

**Page-level title:** "Toolbar Supporting Types"
**Page-level blurb:** SwiftUI's toolbar API is built from a family of value/protocol types that configure items rather than render them. `ToolbarItemPlacement` specifies where in the toolbar an item appears (semantic: `.primaryAction`, `.principal`, `.navigation`; positional: iOS-only). `ToolbarContent` and `ToolbarContentBuilder` are the protocol/result-builder pair behind `toolbar(content:)`. `CustomizableToolbarContent`, `ToolbarCustomizationBehavior`, and `ToolbarCustomizationOptions` govern per-item customizability for `toolbar(id:content:)`. `ToolbarPlacement`, `ContentToolbarPlacement`, and `ToolbarRole` describe the structural role of the bar itself. `ToolbarLabelStyle` and `ToolbarTitleDisplayMode` are environment/enum values that style existing toolbar content. `SpacerSizing` controls `ToolbarSpacer` sizing. `ToolbarTitleMenu` is toolbar-only content, not a standalone view. `OrnamentAttachmentAnchor` and `ornament(...)` are visionOS-only. `toolbarForegroundStyle` is watchOS-only. `ToolbarDefaultItemKind` identifies built-in items like the sidebar toggle.

---

### SearchEnvironmentDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/SearchEnvironmentDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.search.issearching`
- `swiftui.search.dismisssearch`
- `swiftui.search.dismisssearchaction`
- `swiftui.search.searchsuggestionsplacement`
- `swiftui.search.searchscopeactivation`
- `swiftui.search.searchpresentationtoolbarbehavior`
- `swiftui.search.findcontext`

**Page-level title:** "Search Environment Values & Supporting Types"
**Page-level blurb:** These supporting types travel through the environment alongside `.searchable(text:)`. `isSearching` is a `Bool` environment value that becomes `true` while the search field is active. `dismissSearch` is an environment action that programmatically hides the search UI; `DismissSearchAction` is its action struct. `SearchSuggestionsPlacement` controls where suggestion rows appear (`.menu`, `.content`). `SearchScopeActivation` determines when scope buttons appear (`.automatic`, `.onSearchActivation`, `.onTextEntry`). `SearchPresentationToolbarBehavior` describes how the toolbar collapses when search is active. `FindContext` is an environment value for custom text editor implementors to integrate with system Find. None of these types are renderable views; all are read from or injected into the environment.

---

### AnimationProtocolsDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/AnimationProtocolsDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.animations.animatable`
- `swiftui.animations.controlling-the-timing-and-movements-of-your-animations`
- `swiftui.animations.customanimation`
- `swiftui.animations.vectorarithmetic`

**Page-level title:** "Animation Protocols"
**Page-level blurb:** `Animatable`, `CustomAnimation`, and `VectorArithmetic` are the three foundational protocols that power SwiftUI's animation engine. `Animatable` marks a type whose `animatableData` property (of type `VectorArithmetic`) SwiftUI can interpolate between two states. Conforming to `CustomAnimation` lets you fully replace the built-in curve logic — implementing `animate(value:time:context:)` and returning a `Double` at each frame. `VectorArithmetic` defines the scalar-multiplication and addition operations that make linear interpolation possible across any numeric type. None of these protocols are renderable views; they are conformance targets implemented on your own types. The article "Controlling the timing and movements of your animations" provides worked examples.

---

### iOSTextInputDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/iOSTextInputDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.text-input-and-output.keyboardtype(_:)`
- `swiftui.text-input-and-output.textinputautocapitalization(_:)`
- `swiftui.text-input-and-output.textinputautocapitalization`
- `swiftui.text-input-and-output.searchdictationbehavior(_:)`
- `swiftui.text-input-and-output.textinputdictationactivation`
- `swiftui.text-input-and-output.textinputdictationbehavior`
- `swiftui.text-input-and-output.textcontenttype(_:)-4dqqb`
- `swiftui.text-input-and-output.textcontenttype(_:)-ufdv`
- `swiftui.controls-and-indicators.editbutton`
- `swiftui.controls-and-indicators.textfieldlink`
- `swiftui.controls-and-indicators.defaultwheelpickeritemheight(_:)`
- `swiftui.controls-and-indicators.multidatepicker`

**Page-level title:** "iOS / watchOS Text Input & Controls"
**Page-level blurb:** This cluster groups text input and control modifiers that are unavailable on macOS. `keyboardType(_:)` and `textInputAutocapitalization(_:)` configure the software keyboard — a concept that doesn't exist on macOS. The dictation-behavior APIs (`searchDictationBehavior`, `TextInputDictationActivation`, `TextInputDictationBehavior`) are iOS/Mac Catalyst only. The `textContentType(_:)` overloads documented here target watchOS and tvOS content-type categories respectively. `EditButton` is an iOS/visionOS convenience that wraps `EditMode` toggling — macOS uses toolbar items instead. `TextFieldLink` is a watchOS-specific control that opens the keyboard from the Digital Crown. `defaultWheelPickerItemHeight(_:)` and `MultiDatePicker` are watchOS and iOS/visionOS respectively.

---

### TextArticlesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/TextArticlesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.text-input-and-output.building-rich-swiftui-text-experiences`
- `swiftui.text-input-and-output.applying-custom-fonts-to-text`
- `swiftui.text-input-and-output.creating-visual-effects-with-swiftui`
- `swiftui.text-input-and-output.preparing-views-for-localization`
- `swiftui.images.fitting-images-into-available-space`
- `swiftui.menus-and-commands.building-and-customizing-the-menu-bar-with-swiftui`
- `swiftui.menus-and-commands.populating-swiftui-menus-with-adaptive-controls`
- `swiftui.drawing-and-graphics.add-rich-graphics-to-your-swiftui-app`
- `swiftui.drag-and-drop.adopting-drag-and-drop-using-swiftui`
- `swiftui.drag-and-drop.making-a-view-into-a-drag-source`
- `swiftui.appkit-integration.unifying-your-app-s-animations`

**Page-level title:** "Apple Developer Articles"
**Page-level blurb:** These entries are Apple developer documentation articles rather than individual API symbols. They provide conceptual framing and code examples that cross multiple primitives: "Building rich SwiftUI text experiences", "Applying custom fonts to text", "Creating visual effects with SwiftUI", "Preparing views for localization", "Fitting images into available space", "Building and customizing the menu bar with SwiftUI", "Populating SwiftUI menus with adaptive controls", "Add rich graphics to your SwiftUI app", "Adopting drag and drop using SwiftUI", "Making a view into a drag source", and "Unifying your app's animations". Each article lives in the local `Documentation/` mirror. No single API is rendered; instead this page links to the local paths.

---

### CommandsFamilyDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/CommandsFamilyDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.menus-and-commands.commands(content:)`
- `swiftui.menus-and-commands.commandsremoved()`
- `swiftui.menus-and-commands.commandsreplaced(content:)`
- `swiftui.menus-and-commands.commands`
- `swiftui.menus-and-commands.commandmenu`
- `swiftui.menus-and-commands.commandgroup`
- `swiftui.menus-and-commands.commandsbuilder`
- `swiftui.menus-and-commands.commandgroupplacement`
- `swiftui.menus-and-commands.sidebarcommands`
- `swiftui.menus-and-commands.texteditingcommands`
- `swiftui.menus-and-commands.textformattingcommands`
- `swiftui.menus-and-commands.toolbarcommands`
- `swiftui.menus-and-commands.importfromdevicescommands`
- `swiftui.menus-and-commands.inspectorcommands`
- `swiftui.menus-and-commands.emptycommands`

**Page-level title:** "Scene Commands"
**Page-level blurb:** SwiftUI's command system lets you populate and modify the macOS menu bar from a Scene scope. `Commands` is the protocol; `CommandsBuilder` is its result builder. `CommandMenu` adds a new top-level menu; `CommandGroup` inserts content relative to an existing system group identified by `CommandGroupPlacement`. The Scene modifiers `commands(content:)`, `commandsRemoved()`, and `commandsReplaced(content:)` wire these into an `App`. Apple ships a set of ready-made `Commands`-conforming types: `SidebarCommands`, `TextEditingCommands`, `TextFormattingCommands`, `ToolbarCommands`, `ImportFromDevicesCommands`, `InspectorCommands`, and `EmptyCommands`. All of these live at Scene scope and cannot be instantiated or rendered inside a child view.

---

### DeprecatedMenuTypesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/DeprecatedMenuTypesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.menus-and-commands.contextmenu`
- `swiftui.menus-and-commands.menubutton`

**Page-level title:** "Deprecated Menu Types"
**Page-level blurb:** `ContextMenu` (the struct) and `MenuButton` were both deprecated in macOS 26.5. `ContextMenu` has been replaced by the `View/contextMenu(menuItems:)` modifier family. `MenuButton` has been replaced by `Menu`. Both remain in the SDK for source compatibility but should not be used in new code; SwiftKit documents them here for historical reference rather than authoring new gallery pages.

---

### VisionOS3DTypesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/VisionOS3DTypesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.drawing-and-graphics.geometryreader3d`
- `swiftui.drawing-and-graphics.geometryproxy3d`
- `swiftui.drawing-and-graphics.physicalmetric`
- `swiftui.drawing-and-graphics.physicalmetricsconverter`
- `swiftui.drawing-and-graphics.unitpoint3d`
- `swiftui.drawing-and-graphics.depthalignmentid`
- `swiftui.drawing-and-graphics.alignment3d`
- `swiftui.drawing-and-graphics.geometryproxycoordinatespace3d`
- `swiftui.drawing-and-graphics.visualeffect3d(_:)`
- `swiftui.drawing-and-graphics.transform3deffect(_:)`
- `swiftui.drawing-and-graphics.rotation3deffect(_:anchor:)`
- `swiftui.drawing-and-graphics.rotation3deffect(_:axis:anchor:)`
- `swiftui.drawing-and-graphics.perspectiverotationeffect(_:axis:anchor:anchorz:perspective:)`
- `swiftui.drawing-and-graphics.scaleeffect(x:y:z:anchor:)`
- `swiftui.layout-adjustments.depthalignment`
- `swiftui.layout-adjustments.edge3d`
- `swiftui.layout-adjustments.edgeinsets3d`
- `swiftui.layout-adjustments.frame(depth:alignment:)`
- `swiftui.layout-adjustments.frame(mindepth:idealdepth:maxdepth:alignment:)`
- `swiftui.layout-adjustments.layoutrotationunarylayout`
- `swiftui.layout-adjustments.offset(z:)`
- `swiftui.layout-adjustments.padding3d(_:)`
- `swiftui.layout-adjustments.padding3d(_:_:)`
- `swiftui.layout-adjustments.spatialcontainer`
- `swiftui.layout-adjustments.viewdimensions3d`

**Page-level title:** "visionOS 3D Geometry & Effects"
**Page-level blurb:** SwiftUI extends its 2D geometry model with a full 3D axis for visionOS. `UnitPoint3D`, `Alignment3D`, `DepthAlignmentID`, and `DepthAlignment` are the 3D equivalents of `UnitPoint` and `Alignment`. `EdgeInsets3D` and `Edge3D` extend edge-and-inset semantics to depth. `GeometryReader3D` / `GeometryProxy3D` and `GeometryProxyCoordinateSpace3D` provide 3D size and coordinate access. `PhysicalMetric` and `PhysicalMetricsConverter` translate SwiftUI points to physical meters in a visionOS volume. `ViewDimensions3D` and `SpatialContainer` are 3D layout helpers. The view modifiers `visualEffect3D(_:)`, `transform3DEffect(_:)`, `rotation3DEffect(_:anchor:)`, `rotation3DEffect(_:axis:anchor:)`, `perspectiveRotationEffect(...)`, `scaleEffect(x:y:z:anchor:)`, `frame(depth:alignment:)`, `frame(minDepth:...)`, `offset(z:)`, `padding3D(_:)`, and `LayoutRotationUnaryLayout` all target visionOS spatial layouts. None are available on macOS.

---

### NonMacGesturesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/NonMacGesturesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.gestures.handactivationbehavior`
- `swiftui.gestures.onlongpressgesture(minimumduration:perform:onpressingchanged:)`
- `swiftui.gestures.onlongtouchgesture(minimumduration:perform:ontouchingchanged:)`
- `swiftui.gestures.onpencildoubletap(perform:)`
- `swiftui.gestures.onpencilsqueeze(perform:)`
- `swiftui.gestures.rotategesture3d`
- `swiftui.gestures.deferssystemgestures(on:)`

**Page-level title:** "Platform-Specific Gestures"
**Page-level blurb:** Several gesture APIs are locked to non-macOS platforms. `onPencilDoubleTap(perform:)` and `onPencilSqueeze(perform:)` respond to Apple Pencil hardware — iOS/iPadOS only. `onLongPressGesture(minimumDuration:perform:onPressingChanged:)` at the tvOS overload is a remote-surface API (tvOS 14.0). `onLongTouchGesture(minimumDuration:perform:onTouchingChanged:)` is the tvOS 16.0 Siri Remote gesture. `RotateGesture3D` requires visionOS hand tracking. `HandActivationBehavior` controls visionOS hand-input gesture recognition. `defersSystemGestures(on:)` suppresses system swipe gestures on iOS edge regions. None are available on macOS 26.

---

### HoverEffectFamilyDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/HoverEffectFamilyDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.input-events.contenthovereffect`
- `swiftui.input-events.customhovereffect`
- `swiftui.input-events.defaulthovereffect(_:)`
- `swiftui.input-events.emptyhovereffectcontent`
- `swiftui.input-events.grouphovereffect`
- `swiftui.input-events.handpointerbehavior(_:)`
- `swiftui.input-events.handpointerbehavior`
- `swiftui.input-events.hovereffect`
- `swiftui.input-events.hovereffect(_:)`
- `swiftui.input-events.hovereffect(_:in:isenabled:)`
- `swiftui.input-events.hovereffect(_:isenabled:)`
- `swiftui.input-events.hovereffect(in:isenabled:body:)`
- `swiftui.input-events.hovereffectcontent`
- `swiftui.input-events.hovereffectdisabled(_:)`
- `swiftui.input-events.hovereffectgroup`
- `swiftui.input-events.hovereffectgroup()`
- `swiftui.input-events.hovereffectgroup(_:)`
- `swiftui.input-events.hovereffectgroup(id:in:behavior:)`
- `swiftui.input-events.hovereffectphaseoverride`
- `swiftui.input-events.ornamenthovercontenteffect`
- `swiftui.input-events.ornamenthovereffect`

**Page-level title:** "HoverEffect Family (iOS / visionOS)"
**Page-level blurb:** SwiftUI's HoverEffect system provides visual feedback when a pointer or hand hovers over a view. On iOS 13.4+ with a pointer device, `hoverEffect(_:)` applies standard highlight, lift, or automatic effects. The richer visionOS 2.0 API adds `CustomHoverEffect`, `HoverEffectContent`, `HoverEffectGroup`, `EmptyHoverEffectContent`, and the view-body form `hoverEffect(in:isEnabled:body:)` for building multi-view coordinated effects. `OrnamentHoverEffect` and `OrnamentHoverContentEffect` style ornament overlays in visionOS 26. `HandPointerBehavior` / `handPointerBehavior(_:)` fine-tunes how a spatial hand pointer targets elements. `HoverEffectPhaseOverride` (visionOS 26) lets you lock the hover phase for testing. `defaultHoverEffect(_:)` and `hoverEffectDisabled(_:)` are iOS/visionOS only. **None of these APIs are available on macOS 26.**

---

### DigitalCrownDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/DigitalCrownDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.input-events.digitalcrownaccessory(_:)`
- `swiftui.input-events.digitalcrownaccessory(content:)`
- `swiftui.input-events.digitalcrownrotation(_:)`
- `swiftui.input-events.digitalcrownrotation(_:from:through:by:sensitivity:iscontinuous:ishapticfeedbackenabled:)`
- `swiftui.input-events.digitalcrownrotation(_:from:through:sensitivity:iscontinuous:ishapticfeedbackenabled:onchange:onidle:)`
- `swiftui.input-events.digitalcrownrotation(_:onchange:onidle:)`
- `swiftui.input-events.digitalcrownrotation(detent:from:through:by:sensitivity:iscontinuous:ishapticfeedbackenabled:onchange:onidle:)`
- `swiftui.input-events.digitalcrownevent`
- `swiftui.input-events.digitalcrownrotationalsensitivity`

**Page-level title:** "Digital Crown APIs (watchOS)"
**Page-level blurb:** The Digital Crown is the physical rotating knob on Apple Watch. SwiftUI exposes it through a family of `digitalCrownRotation(_:...)` view modifiers that bind crown rotation to a `@State` value, with control over range, step, sensitivity, haptic feedback, and idle callbacks. `DigitalCrownEvent` carries the rotation delta in each callback. `DigitalCrownRotationalSensitivity` sets how much physical rotation maps to value change. `digitalCrownAccessory(_:)` / `digitalCrownAccessory(content:)` adds a view to the watchOS crown indicator. All of these APIs are watchOS-only; they have no effect on macOS.

---

### WatchOSAccessibilityDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/WatchOSAccessibilityDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.accessible-controls.accessibilityquickaction(style:content:)`
- `swiftui.accessible-controls.accessibilityquickaction(style:isactive:content:)`
- `swiftui.accessible-controls.accessibilityquickactionstyle`

**Page-level title:** "watchOS Accessibility Quick Actions"
**Page-level blurb:** Accessibility Quick Actions are a watchOS 9.0 feature that lets users trigger common view actions through a squeeze-and-hold gesture. `accessibilityQuickAction(style:content:)` and its `isActive:` variant register a button to appear in the quick-action overlay. `AccessibilityQuickActionStyle` (`.prompt` and `.outline`) controls how the overlay renders. These APIs are watchOS-only and have no macOS equivalent.

---

### CameraCaptureDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/CameraCaptureDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.input-events.oncameracaptureevent(isenabled:action:)`
- `swiftui.input-events.oncameracaptureevent(isenabled:primaryaction:secondaryaction:)`

**Page-level title:** "Camera Capture Button Events (iOS)"
**Page-level blurb:** `onCameraCaptureEvent(isEnabled:action:)` and its two-action variant respond to the hardware Camera Control button introduced on iPhone 15 Pro (iOS 18.0). The single-action form fires on any button press; the two-action form separates primary (half-press) from secondary (full-press) events. Both are iOS-only and have no macOS equivalent.

---

### VisionOSPlayPauseDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/VisionOSPlayPauseDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.input-events.pagecommand(value:in:step:)`
- `swiftui.input-events.onplaypausecommand(perform:)`

**Page-level title:** "tvOS / visionOS Remote Commands"
**Page-level blurb:** `pageCommand(value:in:step:)` drives a paging value from the visionOS Digital Crown or tvOS remote (visionOS-only). `onPlayPauseCommand(perform:)` responds to the play/pause button on the Siri Remote or visionOS virtual remote (tvOS/visionOS only). Neither has a macOS equivalent.

---

### TableSupportTypesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/TableSupportTypesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.tables.dynamictablerowcontent`
- `swiftui.tables.emptytablerowcontent`
- `swiftui.tables.tablecolumncustomizationbehavior`
- `swiftui.tables.tablecolumnalignment`
- `swiftui.tables.tablecolumnbuilder`
- `swiftui.tables.tablecolumncontent`
- `swiftui.tables.tablecolumnforeach`
- `swiftui.tables.tablecolumnheaders(_:)`
- `swiftui.tables.tableforeachcontent`
- `swiftui.tables.tableheaderrowcontent`
- `swiftui.tables.tableoutlinegroupcontent`
- `swiftui.tables.tablerow`
- `swiftui.tables.tablerowbuilder`
- `swiftui.tables.tablerowcontent`
- `swiftui.tables.tupletablerowcontent`

**Page-level title:** "Table Supporting Types"
**Page-level blurb:** SwiftUI's `Table` is built on a rich set of supporting protocols, result builders, and internal container types. `TableColumnContent`, `TableRowContent`, `TableHeaderRowContent`, and `DynamicTableRowContent` are protocols — never instantiated directly, they define what `Table` accepts in its column and row builders. `TableColumnBuilder` and `TableRowBuilder` are the result builders that make the table DSL work. `TableRow`, `EmptyTableRowContent`, `TableForEachContent`, `TupleTableRowContent`, and `TableOutlineGroupContent` are system-generated container types SwiftUI constructs internally. `TableColumnCustomizationBehavior` (`.automatic`, `.disabled`, `.reorderable`) and `TableColumnAlignment` are enum/value types passed to column modifiers. `tableColumnHeaders(_:)` is a View modifier that hides/shows the header row. None of these types have standalone rendering — they are meaningful only inside a `Table { }` closure.

---

### iOSListModifiersDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/iOSListModifiersDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.lists.listsectionspacing(_:)`
- `swiftui.lists.listsectionmargins(_:_:)`
- `swiftui.lists.listrowhovereffect(_:)`
- `swiftui.lists.listrowhovereffectdisabled(_:)`
- `swiftui.lists.listrowspacing(_:)`

**Page-level title:** "iOS / visionOS List Modifiers"
**Page-level blurb:** These list modifiers are unavailable on macOS. `listRowSpacing(_:)` and `listSectionSpacing(_:)` control inter-row and inter-section gaps in iOS/iPadOS list layouts. `listSectionMargins(_:_:)` adjusts per-section leading and trailing margins on iOS/visionOS. `listRowHoverEffect(_:)` and `listRowHoverEffectDisabled(_:)` apply visionOS hover-effect styling to individual rows. All compile on macOS but have no visible effect; the platform-checked versions are documented in the main `List` gallery page.

---

### iOSTechPickersDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/iOSTechPickersDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.technology-specific-views.activitybackgroundtint(_:)`
- `swiftui.technology-specific-views.activitysystemactionforegroundcolor(_:)`
- `swiftui.technology-specific-views.addordertowalletbuttonstyle(_:)`
- `swiftui.technology-specific-views.addpasstowalletbuttonstyle(_:)`
- `swiftui.technology-specific-views.appstoreoverlay(ispresented:configuration:)`
- `swiftui.technology-specific-views.automateddeviceenrollmentaddition(ispresented:)`
- `swiftui.technology-specific-views.contactaccessbuttoncaption(_:)`
- `swiftui.technology-specific-views.contactaccessbuttonstyle(_:)`
- `swiftui.technology-specific-views.contactaccesspicker(ispresented:completionhandler:)`
- `swiftui.technology-specific-views.continuitydevicepicker(ispresented:ondidconnect:)`
- `swiftui.technology-specific-views.familyactivitypicker(ispresented:selection:)`
- `swiftui.technology-specific-views.familyactivitypicker(headertext:footertext:ispresented:selection:)`
- `swiftui.technology-specific-views.handlesgamecontrollerevents(matching:)`
- `swiftui.technology-specific-views.journalingsuggestionspicker(ispresented:oncompletion:)`
- `swiftui.technology-specific-views.lookaroundviewer(ispresented:scene:allowsnavigation:showsroadlabels:pointsofinterest:ondismiss:)`
- `swiftui.technology-specific-views.lookaroundviewer(ispresented:initialscene:allowsnavigation:showsroadlabels:pointsofinterest:ondismiss:)`
- `swiftui.technology-specific-views.managesubscriptionssheet(ispresented:)`
- `swiftui.technology-specific-views.managesubscriptionssheet(ispresented:subscriptiongroupid:)`
- `swiftui.technology-specific-views.mapfeatureselectionaccessory(_:)`
- `swiftui.technology-specific-views.mapfeatureselectioncontent(content:)`
- `swiftui.technology-specific-views.mapfeatureselectiondisabled(_:)`
- `swiftui.technology-specific-views.paylaterviewaction(_:)`
- `swiftui.technology-specific-views.paylaterviewdisplaystyle(_:)`
- `swiftui.technology-specific-views.transactionpicker(ispresented:selection:)`
- `swiftui.technology-specific-views.transactiontask(_:action:)`
- `swiftui.technology-specific-views.verifyidentitywithwalletbuttonstyle(_:)`

**Page-level title:** "iOS-Only Technology Pickers & Framework Views"
**Page-level blurb:** This page collects SwiftUI view modifiers that wrap iOS-specific frameworks and hardware features: Live Activities styling (`activityBackgroundTint`, `activitySystemActionForegroundColor`), Wallet button styles (`addOrderToWalletButtonStyle`, `addPassToWalletButtonStyle`, `verifyIdentityWithWalletButtonStyle`, `payLaterViewAction`, `payLaterViewDisplayStyle`), App Store Overlay, Automated Device Enrollment, Contacts access pickers, Continuity Camera picker, Family Controls / Screen Time (`familyActivityPicker`), Game Controller events, Journaling Suggestions, Maps Look Around viewer and feature selection, manage subscriptions sheets, and transaction pickers. All require iOS hardware or iOS-specific frameworks and are unavailable on macOS 26.

---

### VisionOSScenesDescribePage
**Page file:** `SwiftKit/Pages/SwiftUI/_Describe/VisionOSScenesDescribePage.swift`

**Symbols served (via PageRegistry alias):**
- `swiftui.technology-specific-views.cameraanchor(isactive:)`
- `swiftui.technology-specific-views.tabletopgame(_:parent:automaticupdate:)`
- `swiftui.technology-specific-views.tabletopgame(_:parent:automaticupdate:interaction:)`

**Page-level title:** "visionOS Scene Anchors & Tabletop"
**Page-level blurb:** `cameraAnchor(isActive:)` (visionOS 2.0) marks a view as the anchor for a visionOS camera-based spatial anchoring session, used in ARKit-backed experiences. `tabletopGame(_:parent:automaticUpdate:)` and its `interaction:` variant integrate a `TabletopKit` game entity into a visionOS scene, linking SwiftUI layout to the physical tabletop surface. Both are visionOS 2.0-only; there is no macOS counterpart.

---

## Standalone pages

| Leaf id | Page file | API |
|---|---|---|
| swiftui.text-input-and-output.textselectability | `SwiftKit/Pages/SwiftUI/_Describe/TextSelectabilityDescribePage.swift` | TextSelectability |
| swiftui.text-input-and-output.contentsizecategory | `SwiftKit/Pages/SwiftUI/_Describe/ContentSizeCategoryDescribePage.swift` | ContentSizeCategory (deprecated) |
| swiftui.controls-and-indicators.sensoryfeedback | `SwiftKit/Pages/SwiftUI/_Describe/SensoryFeedbackDescribePage.swift` | SensoryFeedback |
| swiftui.drawing-and-graphics.shapestyle | `SwiftKit/Pages/SwiftUI/_Describe/ShapeStyleDescribePage.swift` | ShapeStyle |
| swiftui.view-groupings.creating-custom-container-views | `SwiftKit/Pages/SwiftUI/_Describe/CreatingCustomContainerViewsDescribePage.swift` | Article — Creating custom container views |
| swiftui.view-groupings.dynamicviewcontent | `SwiftKit/Pages/SwiftUI/_Describe/DynamicViewContentDescribePage.swift` | DynamicViewContent |
| swiftui.accessible-appearance.assistiveaccess | `SwiftKit/Pages/SwiftUI/_Describe/AssistiveAccessDescribePage.swift` | AssistiveAccess |
| swiftui.technology-specific-views.offercoderedemption(ispresented:oncompletion:) | `SwiftKit/Pages/SwiftUI/_Describe/OfferCodeRedemptionDescribePage.swift` | offerCodeRedemption (StoreKit sheet) |
| swiftui.technology-specific-views.managedcontentstyle(_:) | `SwiftKit/Pages/SwiftUI/_Describe/ManagedContentStyleDescribePage.swift` | managedContentStyle (macOS 26.4 future) |

---

## Verification checklist for authoring agents

Before authoring any page in this plan:

1. Confirm the leaf id appears in `Catalog+SwiftUI.swift` with `.placeholder` (not `.real`).
2. Check `PageRegistry.swift` to verify no entry already exists for this symbol.
3. All files go in `SwiftKit/Pages/SwiftUI/_Describe/` — create the folder if it doesn't exist yet.
4. Use `DescribePage` from `SwiftKit/Pages/SwiftUI/_Shared/DescribePage.swift` as the rendering component.
5. Wire PageRegistry aliases after all pages in a bundle are authored (one pass per bundle).
