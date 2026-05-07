---
url: https://developer.apple.com/documentation/updates/swiftui
framework: SwiftUI
category: Essentials
title: SwiftUI Updates
kind: article
captured: 2026-05-02
---

# SwiftUI Updates

## Overview

Browse notable changes in [SwiftUI](doc://com.apple.documentation/documentation/SwiftUI).

---

## June 2025

### General

- Apply Liquid Glass effects to views using [`glassEffect(_:in:)`](doc://com.apple.documentation/documentation/SwiftUI/View/glassEffect(_:in:)).

- Use [`PrimitiveButtonStyle.glass`](doc://com.apple.documentation/documentation/SwiftUI/PrimitiveButtonStyle/glass) with the [`buttonStyle(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/buttonStyle(_:)-66fbx) modifier to apply Liquid Glass to instances of `Button`.

- [`ToolbarSpacer`](doc://com.apple.documentation/documentation/SwiftUI/ToolbarSpacer) creates a visual break between items in toolbars containing Liquid Glass.

- Use [`scrollEdgeEffectStyle(_:for:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scrollEdgeEffectStyle(_:for:)) to configure the scroll edge effect style for scroll views.

- [`backgroundExtensionEffect()`](doc://com.apple.documentation/documentation/SwiftUI/View/backgroundExtensionEffect()) duplicates, mirrors, and blurs views placed around edges with available safe areas.

- Set behavior for tab bar minimization with [`tabBarMinimizeBehavior(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/tabBarMinimizeBehavior(_:)).

- Set the [`TabRole.search`](doc://com.apple.documentation/documentation/SwiftUI/TabRole/search) role on a tab to take someone to a search tab and have a search field take the place of the tab bar.

- Adjust the content of accessory views based on the placement in a tab view with [`TabViewBottomAccessoryPlacement`](doc://com.apple.documentation/documentation/SwiftUI/TabViewBottomAccessoryPlacement).

- Connect a [`WebView`](doc://com.apple.documentation/documentation/WebKit/WebView-swift.struct) with a [`WebPage`](doc://com.apple.documentation/documentation/WebKit/WebPage) to fully control the browsing experience in your app.

- Drag multiple items using the [`draggable(containerItemID:containerNamespace:)`](doc://com.apple.documentation/documentation/SwiftUI/View/draggable(containerItemID:containerNamespace:)) modifier. Make a view a container for draggable views using the [`dragContainer(for:itemID:in:_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/dragContainer(for:itemID:in:_:)) modifier.

- Use the [`Animatable()`](doc://com.apple.documentation/documentation/SwiftUI/Animatable()) macro to have SwiftUI synthesize custom animatable data properties.

- [`Slider`](doc://com.apple.documentation/documentation/SwiftUI/Slider) now supports tick marks. Tick marks appear automatically when initializing a `Slider` with the `step` parameter.

- Use [`windowResizeAnchor(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/windowResizeAnchor(_:)) to set the window anchor point when a window must resize.

### Text

- [`TextEditor`](doc://com.apple.documentation/documentation/SwiftUI/TextEditor) now supports [`AttributedString`](doc://com.apple.documentation/documentation/Foundation/AttributedString).

- Handle text selection with attributed text using [`AttributedTextSelection`](doc://com.apple.documentation/documentation/SwiftUI/AttributedTextSelection).

- [`AttributedTextFormattingDefinition`](doc://com.apple.documentation/documentation/SwiftUI/AttributedTextFormattingDefinition) defines how text can be styled in specific contexts.

- Use [`FindContext`](doc://com.apple.documentation/documentation/SwiftUI/FindContext) to create a find navigator in views that support text editing.

### Accessibility

- Support Assistive Access in iOS and iPadOS scenes with [`AssistiveAccess`](doc://com.apple.documentation/documentation/SwiftUI/AssistiveAccess).

### HDR

- [`Color.ResolvedHDR`](doc://com.apple.documentation/documentation/SwiftUI/Color/ResolvedHDR) is a set of RGBA values that represent a color that can be shown, including HDR headroom information.

### UIKit and AppKit Integration

- Host and present SwiftUI scenes in UIKit with [`UIHostingSceneDelegate`](doc://com.apple.documentation/documentation/SwiftUI/UIHostingSceneDelegate) and in AppKit with [`NSHostingSceneRepresentation`](doc://com.apple.documentation/documentation/SwiftUI/NSHostingSceneRepresentation).

- Incorporate gesture recognizers in SwiftUI views from AppKit with [`NSGestureRecognizerRepresentable`](doc://com.apple.documentation/documentation/SwiftUI/NSGestureRecognizerRepresentable).

### Immersive Spaces

- Manipulate views using common hand gestures with [`manipulable(coordinateSpace:operations:inertia:isEnabled:onChanged:)`](doc://com.apple.documentation/documentation/SwiftUI/View/manipulable(coordinateSpace:operations:inertia:isEnabled:onChanged:)).

- Snap volumes to horizontal surfaces and windows to vertical surfaces using [`SurfaceSnappingInfo`](doc://com.apple.documentation/documentation/SwiftUI/SurfaceSnappingInfo).

- Use [`RemoteImmersiveSpace`](doc://com.apple.documentation/documentation/SwiftUI/RemoteImmersiveSpace) to render stereo content from your Mac app on Apple Vision Pro.

- Use [`SpatialContainer`](doc://com.apple.documentation/documentation/SwiftUI/SpatialContainer) to create a layout container that aligns overlapping content in 3D space.

- Depth-based variants of modifiers allow easier volumetric layouts in SwiftUI. For example, [`aspectRatio3D(_:contentMode:)`](doc://com.apple.documentation/documentation/SwiftUI/View/aspectRatio3D(_:contentMode:)), [`rotation3DLayout(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/rotation3DLayout(_:)), and [`Layout.depthAlignment(_:)`](doc://com.apple.documentation/documentation/SwiftUI/Layout/depthAlignment(_:)).

---

## June 2024

### Volumes

- Specify the alignment of a volume when moved in the world using the [`volumeWorldAlignment(_:)`](doc://com.apple.documentation/documentation/SwiftUI/Scene/volumeWorldAlignment(_:)) scene modifier.

- Specify the default world scaling behavior of your scene using the [`defaultWorldScaling(_:)`](doc://com.apple.documentation/documentation/SwiftUI/Scene/defaultWorldScaling(_:)) scene modifier.

- Adjust the visibility of a volume's baseplate using the [`volumeBaseplateVisibility(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/volumeBaseplateVisibility(_:)) view modifier.

- Define a custom action to execute when the viewpoint of a volume changes using the [`onVolumeViewpointChange(updateStrategy:initial:_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/onVolumeViewpointChange(updateStrategy:initial:_:)) view modifier.

### Windows

- Change the default initial size and position of a window using the [`defaultWindowPlacement(_:)`](doc://com.apple.documentation/documentation/SwiftUI/Scene/defaultWindowPlacement(_:)) modifier.

- Change the default behavior for how windows behave when performing a zoom using [`WindowIdealSize`](doc://com.apple.documentation/documentation/SwiftUI/WindowIdealSize) and provide the placement for the zoomed window with the [`windowIdealPlacement(_:)`](doc://com.apple.documentation/documentation/SwiftUI/Scene/windowIdealPlacement(_:)) modifier.

- Create utility windows in SwiftUI using the new [`UtilityWindow`](doc://com.apple.documentation/documentation/SwiftUI/UtilityWindow) scene type and toggle the window's visibility using the [`WindowVisibilityToggle`](doc://com.apple.documentation/documentation/SwiftUI/WindowVisibilityToggle).

- Customize the style of a window using the new window container background placement, the [`toolbar(removing:)`](doc://com.apple.documentation/documentation/SwiftUI/View/toolbar(removing:)) view modifier, and the [`WindowStyle.plain`](doc://com.apple.documentation/documentation/SwiftUI/WindowStyle/plain) window style.

- Set the default launch behavior for a scene using the [`defaultLaunchBehavior(_:)`](doc://com.apple.documentation/documentation/SwiftUI/Scene/defaultLaunchBehavior(_:)) modifier.

- Replace one scene with another using the [`pushWindow`](doc://com.apple.documentation/documentation/SwiftUI/EnvironmentValues/pushWindow) method.

### Immersive Spaces

- Add an action to perform when the state of the immersion changes using the [`onImmersionChange(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/onImmersionChange(_:)) modifier.

- Apply a custom color or dim a passthrough video in an immersive space using the `SurroundingsEffect.colorMultiply(_:)` and [`dim(intensity:)`](doc://com.apple.documentation/documentation/SwiftUI/SurroundingsEffect/dim(intensity:)) initializers.

### Documents

- Customize the launch experience of document-based applications using [`DocumentGroupLaunchScene`](doc://com.apple.documentation/documentation/SwiftUI/DocumentGroupLaunchScene) and [`NewDocumentButton`](doc://com.apple.documentation/documentation/SwiftUI/NewDocumentButton).

### Navigation

- Specify the appearance and interaction of [`TabView`](doc://com.apple.documentation/documentation/SwiftUI/TabView) with the [`tabViewStyle(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/tabViewStyle(_:)) modifier using values like [`TabViewStyle.sidebarAdaptable`](doc://com.apple.documentation/documentation/SwiftUI/TabViewStyle/sidebarAdaptable), [`TabViewStyle.tabBarOnly`](doc://com.apple.documentation/documentation/SwiftUI/TabViewStyle/tabBarOnly), and [`TabViewStyle.grouped`](doc://com.apple.documentation/documentation/SwiftUI/TabViewStyle/grouped).

- Build hierarchy by nesting tabs as a tab item within [`TabSection`](doc://com.apple.documentation/documentation/SwiftUI/TabSection).

- Enable people to customize a [`TabView`](doc://com.apple.documentation/documentation/SwiftUI/TabView) using the [`tabViewCustomization(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/tabViewCustomization(_:)) modifier and persist customization state in [`AppStorage`](doc://com.apple.documentation/documentation/SwiftUI/AppStorage) with [`TabViewCustomization`](doc://com.apple.documentation/documentation/SwiftUI/TabViewCustomization).

### Modal Presentations

- Use built-in presentation sizes for sheets like [`PresentationSizing.form`](doc://com.apple.documentation/documentation/SwiftUI/PresentationSizing/form) or [`PresentationSizing.page`](doc://com.apple.documentation/documentation/SwiftUI/PresentationSizing/page) with the [`presentationSizing(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/presentationSizing(_:)) modifier or create custom sized sheets using the [`PresentationSizing`](doc://com.apple.documentation/documentation/SwiftUI/PresentationSizing) protocol.

### Toolbars

- Specify the display mode of toolbars in macOS using the [`ToolbarLabelStyle`](doc://com.apple.documentation/documentation/SwiftUI/ToolbarLabelStyle) type.

- Configure the foreground style in the toolbar environment in watchOS using the [`toolbarForegroundStyle(_:for:)`](doc://com.apple.documentation/documentation/SwiftUI/View/toolbarForegroundStyle(_:for:)) view modifier.

- Anchor ornaments relative to the depth of your volume — in addition to the height and width — using the [`OrnamentAttachmentAnchor.scene(_:)`](doc://com.apple.documentation/documentation/SwiftUI/OrnamentAttachmentAnchor/scene(_:)-1l8wf) method that takes a [`UnitPoint3D`](doc://com.apple.documentation/documentation/SwiftUI/UnitPoint3D).

### Views

- Create custom container views like [`Picker`](doc://com.apple.documentation/documentation/SwiftUI/Picker), [`List`](doc://com.apple.documentation/documentation/SwiftUI/List), and [`TabView`](doc://com.apple.documentation/documentation/SwiftUI/TabView) using new [`Group`](doc://com.apple.documentation/documentation/SwiftUI/Group) and [`ForEach`](doc://com.apple.documentation/documentation/SwiftUI/ForEach) initializers, like [`Group.init(subviews:transform:)`](doc://com.apple.documentation/documentation/SwiftUI/Group/init(subviews:transform:)) and [`ForEach.init(subviews:content:)`](doc://com.apple.documentation/documentation/SwiftUI/ForEach/init(subviews:content:)).

- Declare a custom container value by defining a key that conforms to the [`ContainerValueKey`](doc://com.apple.documentation/documentation/SwiftUI/ContainerValueKey) protocol, and set the container value for a view using the [`containerValue(_:_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/containerValue(_:_:)) modifier.

- Create [`EnvironmentValues`](doc://com.apple.documentation/documentation/SwiftUI/EnvironmentValues), [`Transaction`](doc://com.apple.documentation/documentation/SwiftUI/Transaction), [`ContainerValues`](doc://com.apple.documentation/documentation/SwiftUI/ContainerValues), and [`FocusedValues`](doc://com.apple.documentation/documentation/SwiftUI/FocusedValues) entries by using the [`Entry()`](doc://com.apple.documentation/documentation/SwiftUI/Entry()) macro to the variable declaration.

### Animation

- Customize the transition when pushing a view onto a navigation stack or presenting a view with the [`navigationTransition(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/navigationTransition(_:)) view modifier.

- Add new symbols effects and configurations like [`SymbolEffect.wiggle`](doc://com.apple.documentation/documentation/Symbols/SymbolEffect/wiggle), [`SymbolEffect.rotate`](doc://com.apple.documentation/documentation/Symbols/SymbolEffect/rotate), and [`SymbolEffect.breathe`](doc://com.apple.documentation/documentation/Symbols/SymbolEffect/breathe) using the [`symbolEffect(_:options:value:)`](doc://com.apple.documentation/documentation/SwiftUI/View/symbolEffect(_:options:value:)) modifier.

### Text Input and Output

- Add text suggestions support to any text field using [`textInputSuggestions(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/textInputSuggestions(_:)) and [`textInputCompletion(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/textInputCompletion(_:)) view modifiers.

- Access and modify selected text using a new [`TextSelection`](doc://com.apple.documentation/documentation/SwiftUI/TextSelection) binding for [`TextField`](doc://com.apple.documentation/documentation/SwiftUI/TextField) and [`TextEditor`](doc://com.apple.documentation/documentation/SwiftUI/TextEditor).

- Bind to the focus state of an app's search field using the [`searchFocused(_:equals:)`](doc://com.apple.documentation/documentation/SwiftUI/View/searchFocused(_:equals:)) view modifier.

### Drawing and Graphics

- Precompile shaders at build time using the [`Shader.compile(as:)`](doc://com.apple.documentation/documentation/SwiftUI/Shader/compile(as:)) method.

- Create mesh gradients with a grid of points and colors using the new [`MeshGradient`](doc://com.apple.documentation/documentation/SwiftUI/MeshGradient) type.

- Extend SwiftUI Text views with custom rendering effects and interaction behaviors using [`TextAttribute`](doc://com.apple.documentation/documentation/SwiftUI/TextAttribute), [`Text.Layout`](doc://com.apple.documentation/documentation/SwiftUI/Text/Layout), and [`TextRenderer`](doc://com.apple.documentation/documentation/SwiftUI/TextRenderer).

- Create a new [`Color`](doc://com.apple.documentation/documentation/SwiftUI/Color) by mixing two colors using the [`Color.mix(with:by:in:)`](doc://com.apple.documentation/documentation/SwiftUI/Color/mix(with:by:in:)) method.

### Layout

- Enable custom spacing between views in a [`ZStack`](doc://com.apple.documentation/documentation/SwiftUI/ZStack) along the depth axis with the [`ZStack.init(alignment:spacing:content:)`](doc://com.apple.documentation/documentation/SwiftUI/ZStack/init(alignment:spacing:content:)) initializer.

### Scrolling

- Scroll to a view, offset, or edge in a scroll view using the [`scrollPosition(_:anchor:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scrollPosition(_:anchor:)) view modifier and specifying one of the [`ScrollPosition`](doc://com.apple.documentation/documentation/SwiftUI/ScrollPosition) values.

- Limit the number of views that can be scrolled by a single interaction using the limit behavior value [`ViewAlignedScrollTargetBehavior.LimitBehavior.alwaysByFew`](doc://com.apple.documentation/documentation/SwiftUI/ViewAlignedScrollTargetBehavior/LimitBehavior/alwaysByFew) or [`ViewAlignedScrollTargetBehavior.LimitBehavior.alwaysByOne`](doc://com.apple.documentation/documentation/SwiftUI/ViewAlignedScrollTargetBehavior/LimitBehavior/alwaysByOne).

- Add an action to be called when a view crosses a provided threshold using the [`onScrollVisibilityChange(threshold:_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/onScrollVisibilityChange(threshold:_:)) modifier.

- Access both the old and new values when a scroll view's phase changes by using the [`onScrollPhaseChange(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/onScrollPhaseChange(_:)-7mica) modifier.

### Gestures

- Conditionally disable a gesture using the `isEnabled` parameter in a modifier like [`gesture(_:isEnabled:)`](doc://com.apple.documentation/documentation/SwiftUI/View/gesture(_:isEnabled:)).

- Create extra drag areas of a window in macOS when you add a [`WindowDragGesture`](doc://com.apple.documentation/documentation/SwiftUI/WindowDragGesture) gesture.

- Create a hand gesture shortcut for Double Tap in watchOS using the [`HandGestureShortcut`](doc://com.apple.documentation/documentation/SwiftUI/HandGestureShortcut) structure.

- Enable whether gestures can handle events that activate the containing window using the [`allowsWindowActivationEvents(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/allowsWindowActivationEvents(_:)) view modifier.

### Input Events

- Create a group of hover effects that activate together using [`HoverEffectGroup`](doc://com.apple.documentation/documentation/SwiftUI/HoverEffectGroup) and apply them to a view using the [`hoverEffect(in:isEnabled:body:)`](doc://com.apple.documentation/documentation/SwiftUI/View/hoverEffect(in:isEnabled:body:)) view modifier.

- Customize the appearance of the system pointer in macOS, iPadOS, and visionOS with new pointer styles using [`pointerStyle(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/pointerStyle(_:)) or the visibility with the [`pointerVisibility(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/pointerVisibility(_:)) modifier.

- Access keyboard modifier flags using the [`onModifierKeysChanged(mask:initial:_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/onModifierKeysChanged(mask:initial:_:)).

- Replace the primary view with one or more alternative views when pressing a specified set of modifier keys using the [`modifierKeyAlternate(_:_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/modifierKeyAlternate(_:_:)) view modifier.

- Enable the hand pointer for custom drawing and markup applications using the [`handPointerBehavior(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/handPointerBehavior(_:)) modifier.

### Previews in Xcode

- Write dynamic properties inline in previews using the new [`Previewable()`](doc://com.apple.documentation/documentation/SwiftUI/Previewable()) macro.

- Inject shared environment objects, model containers, or other dependencies into previews using the [`PreviewModifier`](doc://com.apple.documentation/documentation/SwiftUI/PreviewModifier) protocol.

### Accessibility

- Specify that your accessibility element behaves as a tab bar using the [`AccessibilityTraits.isTabBar`](doc://com.apple.documentation/documentation/SwiftUI/AccessibilityTraits/isTabBar) accessibility trait with the [`accessibilityAddTraits(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/accessibilityAddTraits(_:)) modifier. In UIKit, use [`UIAccessibilityTraits.tabBar`](doc://com.apple.documentation/documentation/UIKit/UIAccessibilityTraits/tabBar).

- Generate a localized description of a color in a string interpolation by adding `accessibilityName:`, such as `"\(accessibilityName: myColor)"`. Pass that string to any accessibility modifier.

### Framework Interoperability

- Reuse existing UIKit gesture recognizer code in SwiftUI. In SwiftUI, create UIKit gesture recognizers using [`UIGestureRecognizerRepresentable`](doc://com.apple.documentation/documentation/SwiftUI/UIGestureRecognizerRepresentable). In UIKit, refer to SwiftUI gestures by name using [`UIGestureRecognizer.name`](doc://com.apple.documentation/documentation/UIKit/UIGestureRecognizer/name).

- Share menu content definitions between SwiftUI and AppKit by using the [`NSHostingMenu`](doc://com.apple.documentation/documentation/SwiftUI/NSHostingMenu) in your AppKit view hierarchy.

---

## June 2023, visionOS

### Scenes

- Create a volume that can display 3D models by applying the [`WindowStyle.volumetric`](doc://com.apple.documentation/documentation/SwiftUI/WindowStyle/volumetric) window style to an app's window.

- Make use of a Full Space by opening an [`ImmersiveSpace`](doc://com.apple.documentation/documentation/SwiftUI/ImmersiveSpace) scene. You can use the [`ImmersionStyle.mixed`](doc://com.apple.documentation/documentation/SwiftUI/ImmersionStyle/mixed) immersion style to place objects in a person's surroundings, or the [`ImmersionStyle.full`](doc://com.apple.documentation/documentation/SwiftUI/ImmersionStyle/full) style to completely control the visual experience.

- Display 3D models in a volume or a Full Space using RealityKit entities that you load with that framework's [`Model3D`](doc://com.apple.documentation/documentation/RealityKit/Model3D) or [`RealityView`](doc://com.apple.documentation/documentation/RealityKit/RealityView) structure.

### Toolbars and Ornaments

- Display a toolbar item in an ornament using the [`ToolbarItemPlacement.bottomOrnament`](doc://com.apple.documentation/documentation/SwiftUI/ToolbarItemPlacement/bottomOrnament) toolbar item placement.

- Add an ornament to a window directly using the [`ornament(visibility:attachmentAnchor:contentAlignment:ornament:)`](doc://com.apple.documentation/documentation/SwiftUI/View/ornament(visibility:attachmentAnchor:contentAlignment:ornament:)) view modifier.

### Drawing and Graphics

- Detect view geometry in three dimensions using a [`GeometryReader3D`](doc://com.apple.documentation/documentation/SwiftUI/GeometryReader3D).

- Add a 3D visual effect using the [`visualEffect3D(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/visualEffect3D(_:)) view modifier.

- Rotate or scale in three dimensions with view modifiers like [`rotation3DEffect(_:anchor:)`](doc://com.apple.documentation/documentation/SwiftUI/View/rotation3DEffect(_:anchor:)) and [`scaleEffect(x:y:z:anchor:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scaleEffect(x:y:z:anchor:)).

- Convert between display points and physical distances using a [`PhysicalMetricsConverter`](doc://com.apple.documentation/documentation/SwiftUI/PhysicalMetricsConverter).

### View Configuration

- Add a glass background effect to a view using the [`glassBackgroundEffect(displayMode:)`](doc://com.apple.documentation/documentation/SwiftUI/View/glassBackgroundEffect(displayMode:)) view modifier.

- Dim passthrough when appropriate by applying a [`preferredSurroundingsEffect(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/preferredSurroundingsEffect(_:)) modifier.

### View Layout

- Make 3D adjustments to layout with view modifiers like [`offset(z:)`](doc://com.apple.documentation/documentation/SwiftUI/View/offset(z:)), [`padding3D(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/padding3D(_:)-6bex4), and [`frame(depth:alignment:)`](doc://com.apple.documentation/documentation/SwiftUI/View/frame(depth:alignment:)).

### Gestures

- Enable people to rotate objects in three dimensions when you add a [`RotateGesture3D`](doc://com.apple.documentation/documentation/SwiftUI/RotateGesture3D) gesture.

---

## June 2023

### Scenes

- Close windows by their identifier using the [`dismissWindow`](doc://com.apple.documentation/documentation/SwiftUI/EnvironmentValues/dismissWindow) action stored in the environment.

- Enable people to open a settings window by presenting a [`SettingsLink`](doc://com.apple.documentation/documentation/SwiftUI/SettingsLink) button.

### Navigation

- Control views of a navigation split view or stack using a new overload of the [`navigationDestination(item:destination:)`](doc://com.apple.documentation/documentation/SwiftUI/View/navigationDestination(item:destination:)) view modifier.

- Manage column visibility of a navigation split view using new overloads of the view's initializer, like [`NavigationSplitView.init(columnVisibility:preferredCompactColumn:sidebar:content:detail:)`](doc://com.apple.documentation/documentation/SwiftUI/NavigationSplitView/init(columnVisibility:preferredCompactColumn:sidebar:content:detail:)).

### Modal Presentations

- Use new overloads of the file export, import, and move modifiers, like [`fileExporter(isPresented:document:contentTypes:defaultFilename:onCompletion:onCancellation:)`](doc://com.apple.documentation/documentation/SwiftUI/View/fileExporter(isPresented:document:contentTypes:defaultFilename:onCompletion:onCancellation:)-34bd6), to access new file management features. For example, you can:
  - Configure a file import or export dialog to open on a default directory, enable only certain file types, display hidden files, and so on.
  - Retain file interface configuration that a person chooses from one presentation to the next.
  - Export types that conform to the [`Transferable`](doc://com.apple.documentation/documentation/CoreTransferable/Transferable) protocol.

- Specify a dialog severity using the [`dialogSeverity(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/dialogSeverity(_:)) view modifier.

- Provide a custom icon for a dialog using the [`dialogIcon(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/dialogIcon(_:)) modifier.

- Enable people to suppress dialogs using one of the dialog suppression modifiers, like [`dialogSuppressionToggle(isSuppressed:)`](doc://com.apple.documentation/documentation/SwiftUI/View/dialogSuppressionToggle(isSuppressed:)).

### Toolbars

- Configure the toolbar title display size using the [`toolbarTitleDisplayMode(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/toolbarTitleDisplayMode(_:)) modifier.

### Search

- Present search programmatically using a binding to a new `isPresented` parameter available in some searchable view modifiers, like [`searchable(text:isPresented:placement:prompt:)`](doc://com.apple.documentation/documentation/SwiftUI/View/searchable(text:isPresented:placement:prompt:)-1hn4y).

- Create mutable search tokens by providing a binding to the input of the `token` closure in the applicable searchable view modifiers, like [`searchable(text:editableTokens:isPresented:placement:prompt:token:)`](doc://com.apple.documentation/documentation/SwiftUI/View/searchable(text:editableTokens:isPresented:placement:prompt:token:)-2ilmg).

### Data and Storage

- Bridge between SwiftUI environment keys and UIKit traits more easily using the [`UITraitBridgedEnvironmentKey`](doc://com.apple.documentation/documentation/SwiftUI/UITraitBridgedEnvironmentKey) protocol.

- Get better performance when you share data throughout your app by using the new [`Observable()`](doc://com.apple.documentation/documentation/Observation/Observable()) macro.

- Access both the old and new values of a value that changes when processing the completion closure of the [`onChange(of:initial:_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/onChange(of:initial:_:)-4psgg) view modifier.

### Views

- Display a standard interface when a resource, like search results or a network connection, isn't available using the [`ContentUnavailableView`](doc://com.apple.documentation/documentation/SwiftUI/ContentUnavailableView) view type.

- Display a standard inspector interface with a platform-appropriate appearance by applying the [`inspector(isPresented:content:)`](doc://com.apple.documentation/documentation/SwiftUI/View/inspector(isPresented:content:)) modifier.

### Animation

- Perform an action when an animation completes by specifying a completion closure to the [`withAnimation(_:completionCriteria:_:completion:)`](doc://com.apple.documentation/documentation/SwiftUI/withAnimation(_:completionCriteria:_:completion:)) view modifier.

- Define custom animation behaviors by creating a type that conforms to the [`CustomAnimation`](doc://com.apple.documentation/documentation/SwiftUI/CustomAnimation) protocol.

- Perform animations that progress through predefined phases using the [`PhaseAnimator`](doc://com.apple.documentation/documentation/SwiftUI/PhaseAnimator) structure, or according to a set of time-based keyframes by using the [`Keyframes`](doc://com.apple.documentation/documentation/SwiftUI/Keyframes) protocol.

- Specify information about a change in state — for example, to request a particular animation — using custom [`TransactionKey`](doc://com.apple.documentation/documentation/SwiftUI/TransactionKey) instances.

- Design custom animation curves using [`UnitCurve`](doc://com.apple.documentation/documentation/SwiftUI/UnitCurve).

- Apply streamlined spring parameters, now standardized across all Apple frameworks, using the new [`Animation.spring(duration:bounce:blendDuration:)`](doc://com.apple.documentation/documentation/SwiftUI/Animation/spring(duration:bounce:blendDuration:)) animation. You can also use the [`Spring`](doc://com.apple.documentation/documentation/SwiftUI/Spring) structure as a convenience to represent a spring's motion.

### Text Input and Output

- Indicate the language that appears in a specific [`Text`](doc://com.apple.documentation/documentation/SwiftUI/Text) view so that SwiftUI can help to avoid clipping and collision of text, and perform proper line breaking and hyphenation using the [`typesettingLanguage(_:isEnabled:)`](doc://com.apple.documentation/documentation/SwiftUI/View/typesettingLanguage(_:isEnabled:)-4ldzm) view modifier.

- Scale text semantically, for example by labeling it as having a secondary text scale, using the [`textScale(_:isEnabled:)`](doc://com.apple.documentation/documentation/SwiftUI/View/textScale(_:isEnabled:)) modifier.

### Shapes

- Apply more than one [`fill(_:style:)`](doc://com.apple.documentation/documentation/SwiftUI/Shape/fill(_:style:)-3y2ud) or [`stroke(_:style:antialiased:)`](doc://com.apple.documentation/documentation/SwiftUI/Shape/stroke(_:style:antialiased:)) modifier to a single [`Shape`](doc://com.apple.documentation/documentation/SwiftUI/Shape).

- Apply Boolean operations to both shapes and paths, like [`intersection(_:eoFill:)`](doc://com.apple.documentation/documentation/SwiftUI/Shape/intersection(_:eoFill:)) and [`union(_:eoFill:)`](doc://com.apple.documentation/documentation/SwiftUI/Shape/union(_:eoFill:)).

- Use predefined shape styles, like [`Shape.rect`](doc://com.apple.documentation/documentation/SwiftUI/Shape/rect), to simplify your code.

- Create rounded rectangles with uneven corners using [`Shape.rect(topLeadingRadius:bottomLeadingRadius:bottomTrailingRadius:topTrailingRadius:style:)`](doc://com.apple.documentation/documentation/SwiftUI/Shape/rect(topLeadingRadius:bottomLeadingRadius:bottomTrailingRadius:topTrailingRadius:style:)).

### Drawing and Graphics

- Create fully customizable, high-performance graphics by drawing with Metal shaders inside a SwiftUI app using a [`Shader`](doc://com.apple.documentation/documentation/SwiftUI/Shader) structure.

- Configure an image with a specific dynamic range by applying the [`allowedDynamicRange(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/allowedDynamicRange(_:)) view modifier.

- Compose effects that you apply to a view based on some aspect of the geometry of the view using the [`visualEffect(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/visualEffect(_:)) modifier. For example, you can apply a blur that varies depending on the view's position in the display.

### Layout

- Define custom coordinate spaces using the [`CoordinateSpaceProtocol`](doc://com.apple.documentation/documentation/SwiftUI/CoordinateSpaceProtocol) with new [`GeometryProxy`](doc://com.apple.documentation/documentation/SwiftUI/GeometryProxy) methods, like [`bounds(of:)`](doc://com.apple.documentation/documentation/SwiftUI/GeometryProxy/bounds(of:)) and [`frame(in:)`](doc://com.apple.documentation/documentation/SwiftUI/GeometryProxy/frame(in:)-68tks), to get the dimensions of containers.

- Create a frame for a view that lays out its content based on characteristics of the container view using [`containerRelativeFrame(_:alignment:)`](doc://com.apple.documentation/documentation/SwiftUI/View/containerRelativeFrame(_:alignment:)).

- Set the background of a container view using the [`containerBackground(_:for:)`](doc://com.apple.documentation/documentation/SwiftUI/View/containerBackground(_:for:)) view modifier.

### Lists and Tables

- Disable selectability of an item in a [`List`](doc://com.apple.documentation/documentation/SwiftUI/List) or [`Table`](doc://com.apple.documentation/documentation/SwiftUI/Table) by applying the [`selectionDisabled(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/selectionDisabled(_:)) modifier.

- Collapse or expand a [`Section`](doc://com.apple.documentation/documentation/SwiftUI/Section) of a list or table using the `isExpanded` binding in the section's initializer.

- Configure row or section spacing using the [`listRowSpacing(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/listRowSpacing(_:)) and `listSectionSpacing(_:)` modifiers, respectively.

- Set the prominence of a badge using the [`badgeProminence(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/badgeProminence(_:)) view modifier.

- Configure alternating row backgrounds using the [`alternatingRowBackgrounds(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/alternatingRowBackgrounds(_:)) modifier.

- Customize table column visibility and reordering using the [`TableColumnCustomization`](doc://com.apple.documentation/documentation/SwiftUI/TableColumnCustomization) structure.

- Add hierarchical rows to a table using the [`DisclosureTableRow`](doc://com.apple.documentation/documentation/SwiftUI/DisclosureTableRow) structure, or recursively hierarchical rows using the [`OutlineGroup`](doc://com.apple.documentation/documentation/SwiftUI/OutlineGroup) structure.

- Hide table column headers using the [`tableColumnHeaders(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/tableColumnHeaders(_:)) modifier.

### Scrolling

- Read the position of a scroll view using one of the scroll position modifiers, like [`scrollPosition(id:anchor:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scrollPosition(id:anchor:)).

- Flash scroll indicators programmatically using a view modifier, like [`scrollIndicatorsFlash(onAppear:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scrollIndicatorsFlash(onAppear:)).

- Clip scroll views in custom ways after disabling default clipping using the [`scrollClipDisabled(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scrollClipDisabled(_:)) modifier.

- Create paged scroll views, aligned to either page or view boundaries, using the [`scrollTargetBehavior(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scrollTargetBehavior(_:)) view modifier.

- Create custom scroll behaviors using the [`ScrollTargetBehavior`](doc://com.apple.documentation/documentation/SwiftUI/ScrollTargetBehavior) protocol.

- Control the insets of scrollable views using the [`safeAreaPadding(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/safeAreaPadding(_:)-5lh9p) and [`contentMargins(_:_:for:)`](doc://com.apple.documentation/documentation/SwiftUI/View/contentMargins(_:_:for:)-1lt8b) view modifiers.

- Add effects to views as they scroll on- and offscreen using one of the [`scrollTransition(_:axis:transition:)`](doc://com.apple.documentation/documentation/SwiftUI/View/scrollTransition(_:axis:transition:)) modifiers.

- Create a [`TabView`](doc://com.apple.documentation/documentation/SwiftUI/TabView) that supports vertical paging in watchOS by applying the [`TabViewStyle.verticalPage`](doc://com.apple.documentation/documentation/SwiftUI/TabViewStyle/verticalPage) tab view style.

### Gestures

- Make smoother transitions between gestures and animations by using a new [`DragGesture.Value.velocity`](doc://com.apple.documentation/documentation/SwiftUI/DragGesture/Value/velocity) property on the values associated with certain gestures and a [`Transaction.tracksVelocity`](doc://com.apple.documentation/documentation/SwiftUI/Transaction/tracksVelocity) property on [`Transaction`](doc://com.apple.documentation/documentation/SwiftUI/Transaction).

- Gain access to more information, including both velocity and position, by migrating to the new [`MagnifyGesture`](doc://com.apple.documentation/documentation/SwiftUI/MagnifyGesture) and [`RotateGesture`](doc://com.apple.documentation/documentation/SwiftUI/RotateGesture), which replace the now deprecated `MagnificationGesture` and `RotationGesture`.

### Input Events

- Enable a view that's in focus to react directly to keyboard input by applying one of the [`onKeyPress(_:action:)`](doc://com.apple.documentation/documentation/SwiftUI/View/onKeyPress(_:action:)) view modifiers.

- Enable people to choose from a compact collection of items in a [`Menu`](doc://com.apple.documentation/documentation/SwiftUI/Menu) by styling a [`Picker`](doc://com.apple.documentation/documentation/SwiftUI/Picker) with the [`PickerStyle.palette`](doc://com.apple.documentation/documentation/SwiftUI/PickerStyle/palette) style.

- Provide haptic or audio feedback in response to an event using one of the sensory feedback modifiers, like [`sensoryFeedback(_:trigger:)`](doc://com.apple.documentation/documentation/SwiftUI/View/sensoryFeedback(_:trigger:)).

- Create buttons and toggles that perform an [`AppIntent`](doc://com.apple.documentation/documentation/AppIntents/AppIntent) in a widget, Live Activity, and other places using new initializers like [`Button.init(_:intent:)`](doc://com.apple.documentation/documentation/SwiftUI/Button/init(_:intent:)-7urde) and [`Toggle.init(_:isOn:intent:)`](doc://com.apple.documentation/documentation/SwiftUI/Toggle/init(_:isOn:intent:)-4lsrf).

### Focus

- Distinguish between views for which focus serves different purposes, such as those that have a primary action like a button and those that take input like a text field, using the new [`focusable(_:interactions:)`](doc://com.apple.documentation/documentation/SwiftUI/View/focusable(_:interactions:)) view modifier.

- Manage the effect that receiving focus has on a view using the [`focusEffectDisabled(_:)`](doc://com.apple.documentation/documentation/SwiftUI/View/focusEffectDisabled(_:)) modifier.

### Previews in Xcode

- Reduce the amount of boilerplate that you need to create Xcode previews by using the new [`Preview(_:traits:_:body:)`](doc://com.apple.documentation/documentation/SwiftUI/Preview(_:traits:_:body:)) macro.
