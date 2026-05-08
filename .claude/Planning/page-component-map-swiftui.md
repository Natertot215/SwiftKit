# Page-Component Map — SwiftUI

<!-- Classifier gate per framework.md: kind: method/property/instance method/instance-method/init/func/var/case → tile only, never page. struct/class/enum/protocol/macro/typealias → page or tile based on user-recognizability. sampleCode → case-by-case (Phase 0c update; this manifest deferred all 13; reconsider during Phase 1 review). article/collectionGroup/framework/_index/HIG → excluded entirely (already archived). -->

---

## SwiftUI > App Structure > App and Scenes

- `App` — The entry point for a SwiftUI app; defines the app's behavior and scene structure.
- `Scene` — A part of an app's user interface, managed by the system.
- `ScenePhase` — An indication of a scene's operational state.
- `SceneBuilder` — A result builder for composing scenes.
- `WindowGroup` — A scene that presents a group of identically structured windows.
- `Window` — A scene that presents its content in a single, unique window.
- `Settings` — A scene that generates an interface for presenting app settings.
- `SettingsLink` — A view that opens the Settings scene.
- `OpenSettingsAction` — An action that opens the app's settings scene.
- `MenuBarExtra` — A scene that renders persistent controls in the system menu bar.
- `MenuBarExtraStyle` — A specification for the appearance and behavior of a menu bar extra.
- `commands(content:)` — Adds commands to the scene.
- `menuBarExtraStyle(_:)` — Sets the style for menu bar extras in the scene.
- `windowStyle(_:)` — Sets the style for windows created by this scene.
- `NSApplicationDelegateAdaptor` — A property wrapper that provides an AppKit app-delegate to a SwiftUI app.
- `UIApplicationDelegateAdaptor` — A property wrapper that provides a UIKit app-delegate to a SwiftUI app.
- `WKApplicationDelegateAdaptor` — A property wrapper that provides a WatchKit app-delegate to a SwiftUI app.
- `WorldRecenterPhase` — The phase of a world recentering operation.

## SwiftUI > App Structure > WindowGroup

- `WindowGroup` — A scene that presents a group of identically structured windows.
- `Window` — A scene that presents its content in a single, unique window.
- `UtilityWindow` — A scene that presents a utility window.
- `WindowStyle` — A specification for the appearance of a window.
- `WindowToolbarStyle` — A specification for the appearance and behavior of a window's toolbar.
- `WindowResizability` — The resizability of a window.
- `WindowLevel` — The level of a window in the window hierarchy.
- `WindowManagerRole` — The role of a window in window management.
- `WindowProxy` — A proxy for programmatic interaction with a window.
- `WindowLayoutRoot` — The root of a window's layout hierarchy.
- `WindowIdealSize` — The ideal size for a window.
- `WindowInteractionBehavior` — The interaction behavior for a window.
- `WindowPlacement` — A description of a window's placement on screen.
- `WindowPlacementContext` — Context passed to a window placement callback.
- `WindowToolbarFullScreenVisibility` — The visibility of a window toolbar in full-screen mode.
- `WindowVisibilityToggle` — A control that toggles a window's visibility.
- `DisplayProxy` — A proxy representing a physical display.
- `SceneLaunchBehavior` — The launch behavior of a scene.
- `SceneRestorationBehavior` — The restoration behavior for a scene.
- `DismissWindowAction` — An action that dismisses a window.
- `OpenWindowAction` — An action that opens a window.
- `PushWindowAction` — An action that pushes a window onto the navigation stack.
- `DismissAction` — An action that dismisses a presentation.
- `DismissBehavior` — Programmatic dismissal behavior options for a presentation.
- `ControlActiveState` — The active state of a control.
- `SurfaceSnappingInfo` — Information about how a window snaps to screen edges.
- `defaultSize(_:)` — Sets the default size of a window.
- `defaultPosition(_:)` — Sets the default position of a window.
- `windowResizability(_:)` — Sets the resizability of windows created by a scene.
- `windowStyle(_:)` — Sets the style for windows created by a scene.
- `windowLevel(_:)` — Sets the level of a window.
- `windowFullScreenBehavior(_:)` — Sets the full-screen behavior for a window.
- `windowMinimizeBehavior(_:)` — Sets the minimize behavior for a window.
- `windowDismissBehavior(_:)` — Sets the dismiss behavior for a window.
- `windowBackgroundDragBehavior(_:)` — Sets the drag behavior for the window background.
- `windowResizeBehavior(_:)` — Sets the resize behavior for a window.
- `windowManagerRole(_:)` — Sets the role of a window in window management.
- `windowIdealSize(_:)` — Sets the ideal size for a window.
- `windowIdealPlacement(_:)` — Sets the ideal placement for a window.
- `windowToolbarStyle(_:)` — Sets the style for a window's toolbar.
- `windowToolbarFullScreenVisibility(_:)` — Sets the toolbar's full-screen visibility.
- `windowToolbarLabelStyle(_:)` — Sets the label style for toolbar items in the window.
- `defaultWindowPlacement(_:)` — Sets a callback that determines the default placement for new windows.
- `defaultLaunchBehavior(_:)` — Sets the launch behavior for this scene.
- `restorationBehavior(_:)` — Sets the restoration behavior for a scene.
- `presentedWindowStyle(_:)` — Sets the style for presented windows.
- `presentedWindowToolbarStyle(_:)` — Sets the toolbar style for presented windows.
- `persistentSystemOverlays(_:)` — Sets the preferred visibility of the system's non-transient overlays.

## SwiftUI > App Structure > Document

- `DocumentGroup` — A scene that enables document browsing and editing.
- `DocumentGroupLaunchScene` — A scene that displays a document launch experience.
- `DocumentLaunchView` — A view that presents a document launch experience.
- `DocumentLaunchGeometryProxy` — A proxy for the geometry of the document launch view.
- `DefaultDocumentGroupLaunchActions` — The default action buttons for a document group launch scene.
- `FileDocument` — A document model for reading and writing file contents.
- `ReferenceFileDocument` — A document that stores its contents as a reference type.
- `DocumentBaseBox` — A type that provides access to a document stored in a box.
- `FileDocumentConfiguration` — A binding to a document stored in a value-type container.
- `ReferenceFileDocumentConfiguration` — A binding to a document stored in a reference-type container.
- `FileDocumentReadConfiguration` — The configuration for reading a file document.
- `FileDocumentWriteConfiguration` — The configuration for writing a file document.
- `DocumentConfiguration` — Configuration information for a document.
- `NewDocumentAction` — An action that creates a new document.
- `OpenDocumentAction` — An action that opens a document.
- `RenameAction` — An action that activates a standard rename interaction.
- `RenameButton` — A button that triggers a standard rename action.
- `NewDocumentButton` — A button that creates a new document.
- `renameAction(_:)` — Activates the rename action provided by a parent view.
- `init(editing:contentType:editor:prepareDocument:)` — Creates a document group that opens and creates documents with an editor.
- `fileExporter(isPresented:document:contentType:defaultFilename:onCompletion:)` — Presents a system dialog for exporting a document.
- `fileImporter(isPresented:allowedContentTypes:allowsMultipleSelection:onCompletion:)` — Presents a system dialog for importing files.
- `fileMover(isPresented:file:onCompletion:)` — Presents a system dialog for moving an existing file.
- `fileDialogDefaultDirectory(_:)` — Sets the default directory for a file dialog.
- `fileDialogMessage(_:)` — Sets a message to display in a file dialog.
- `fileDialogConfirmationLabel(_:)` — Sets the label for the confirmation button in a file dialog.
- `fileDialogBrowserOptions(_:)` — Sets file browser options for a file dialog.
- `fileDialogCustomizationID(_:)` — Sets a customization ID for a file dialog.
- `fileDialogImportsUnresolvedAliases(_:)` — Sets whether a file import dialog imports unresolved aliases.
- `fileDialogURLEnabled(_:)` — Enables or disables URL input in a file dialog.
- `fileExporterFilenameLabel(_:)` — Sets the label for the filename field in a file exporter dialog.
- `FileDialogBrowserOptions` — Options that control the behavior of a file dialog.
- `handlesExternalEvents(matching:)` — Specifies the external events that a scene handles.
- `exportableToServices(_:)` — Makes the view's content exportable to macOS Services.
- `exportsItemProviders(_:onExport:)` — Makes the view's content exportable via item providers.
- `importableFromServices(for:action:)` — Makes the view's content importable from macOS Services.
- `importsItemProviders(_:onImport:)` — Makes the view's content importable via item providers.

## SwiftUI > App Structure > Environment

> ✅ Approved 2026-05-07 (Phase 1 checkpoint A1) — TRIMMED. Anchor types only; 162 individual environment property docs DEFERRED to post-V1.

- `EnvironmentValues` — A collection of environment values propagated through a view hierarchy.
- `Environment` — A property wrapper that reads a value from a view's environment.
- `EnvironmentKey` — A protocol for keys used to access values in the environment.

## SwiftUI > App Structure > State and Bindings

> ✅ Approved 2026-05-07 (Phase 1 checkpoint A2). 11 tiles from `model-data/`.

- `State` — A property wrapper that stores a value managed by SwiftUI.
- `Binding` — A property wrapper that creates a two-way binding between a property and a view.
- `Bindable` — A property wrapper that supports creating bindings to mutable Observable types.
- `ObservedObject` — A property wrapper for subscribing to an observable object.
- `StateObject` — A property wrapper that instantiates an observable object.
- `EnvironmentObject` — A property wrapper that reads a shared object from the environment.
- `DynamicProperty` — A protocol for properties that update from external sources.
- `Environment` — A property wrapper that reads a value from a view's environment. *(Cross-listed; primary tile lives on Environment page.)*
- `environmentObject(_:)` — Supplies an observable object to a view subhierarchy.
- `onChange(of:initial:_:)` — Performs an action when a value changes.
- `onReceive(_:perform:)` — Performs an action when a publisher emits a value.

## SwiftUI > App Structure > AppKit Integration

> ✅ Approved 2026-05-07 (Phase 1 checkpoint A4). 13 tiles from `appkit-integration/`.

- `NSViewRepresentable` — A wrapper for an AppKit view that integrates into a SwiftUI hierarchy.
- `NSViewRepresentableContext` — Contextual information about the state of an NSViewRepresentable.
- `NSViewControllerRepresentable` — A wrapper for an AppKit view controller that integrates into a SwiftUI hierarchy.
- `NSViewControllerRepresentableContext` — Contextual information about the state of an NSViewControllerRepresentable.
- `NSHostingView` — An AppKit view that hosts a SwiftUI view hierarchy.
- `NSHostingController` — An AppKit view controller that hosts a SwiftUI view hierarchy.
- `NSHostingMenu` — An AppKit menu that hosts SwiftUI menu content.
- `NSHostingSizingOptions` — Options that control how a hosting view computes its size.
- `NSHostingSceneBridgingOptions` — Options that control how a hosting view bridges scene activity.
- `NSHostingSceneRepresentation` — A representation of a SwiftUI scene in AppKit.
- `NSGestureRecognizerRepresentable` — A wrapper for an AppKit gesture recognizer that integrates into SwiftUI.
- `NSGestureRecognizerRepresentableContext` — Contextual information for an NSGestureRecognizerRepresentable.
- `NSGestureRecognizerRepresentableCoordinateSpaceConverter` — Converts coordinates between gesture-recognizer and SwiftUI coordinate spaces.

## SwiftUI > App Structure > View Fundamentals

> ✅ Approved 2026-05-07 (Phase 1 checkpoint A5) — minimal leaf. 5 tiles: 2 with live render, 3 description-only.

- `AnyView` — A type-erased view. *(Live render — wrapper demo.)*
- `EmptyView` — A view that doesn't contain any content. *(Live render.)*
- `View` — A type that represents part of your app's user interface. *(Description-only — protocol.)*
- `ViewModifier` — A modifier you apply to a view or another view modifier. *(Description-only — protocol.)*
- `ViewBuilder` — A custom parameter attribute that constructs views from closures. *(Description-only — result builder.)*

---

## SwiftUI > Navigation > NavigationStack

- `NavigationStack` — A view that displays a root view and enables you to present additional views over the root.
- `NavigationView` — A view for presenting a stack of views that represents a visible path in a navigation hierarchy (deprecated).
- `NavigationLink` — A view that controls a navigation presentation.
- `NavigationPath` — A type-erased list of data representing the content of a navigation stack.
- `NavigationBarItem` — Configuration for a navigation bar item.
- `navigationDestination(for:destination:)` — Associates a destination view with a presented data type for use within a navigation stack.
- `navigationDestination(isPresented:destination:)` — Associates a destination view with a binding that can trigger the navigation.
- `navigationDestination(item:destination:)` — Associates a destination view with a bound value for use within a navigation stack.
- `navigationTitle(_:)` — Configures the view's title for navigation.
- `navigationSubtitle(_:)` — Configures the view's subtitle for navigation.
- `navigationDocument(_:)` — Configures the view's document for navigation.
- `navigationBarBackButtonHidden(_:)` — Hides the navigation bar back button.
- `navigationBarTitleDisplayMode(_:)` — Configures how the navigation bar displays its title.

## SwiftUI > Navigation > NavigationSplitView

- `NavigationSplitView` — A view that presents views in two or three columns.
- `NavigationSplitViewVisibility` — The visibility of columns in a navigation split view.
- `NavigationSplitViewColumn` — A type alias for a column in a navigation split view.
- `HSplitView` — A view that lays out its children in a horizontal line, allowing the user to resize them.
- `VSplitView` — A view that lays out its children in a vertical line, allowing the user to resize them.
- `navigationSplitViewStyle(_:)` — Sets the style for navigation split views within this view.
- `navigationSplitViewColumnWidth(_:)` — Sets the width of the column in a navigation split view.
- `NavigationSplitViewStyle` — A specification for the appearance and interaction of a navigation split view.

## SwiftUI > Navigation > TabView

- `TabView` — A view that switches between multiple child views using interactive user interface elements.
- `Tab` — A value that represents a tab in a tab view.
- `TabSection` — A container that groups tabs into sections within a tab view.
- `TabContentBuilder` — A result builder that creates tab view content.
- `TabCustomizationBehavior` — The customization behavior of a tab.
- `TabBarPlacement` — The placement of a tab bar.
- `TabBarMinimizeBehavior` — The minimize behavior for the tab bar.
- `TabViewCustomization` — A type that stores user customizations of a tab view.
- `TabRole` — The role of a tab.
- `TabPlacement` — The placement of a tab in a tab view.
- `TabViewBottomAccessoryPlacement` — The placement of a bottom accessory in a tab view.
- `AdaptableTabBarPlacement` — A tab bar placement that adapts to the current context.
- `AnyTabContent` — A type-erased tab content value.
- `TabContent` — A type that you can use as the content of a tab.
- `tabItem(_:)` — Sets the tab bar item associated with this view.
- `tabViewStyle(_:)` — Sets the style for tab views within this view.
- `tabViewCustomization(_:)` — Configures the customization behavior of the tab view.
- `tabViewSidebarHeader(content:)` — Adds a header to the sidebar of a tab view.
- `tabViewSidebarFooter(content:)` — Adds a footer to the sidebar of a tab view.
- `tabViewSidebarBottomBar(content:)` — Adds a bottom bar to the sidebar of a tab view.
- `defaultAdaptableTabBarPlacement(_:)` — Sets the default adaptable tab bar placement.
- `TabViewStyle` — A specification for the appearance and interaction of a tab view.

## SwiftUI > Navigation > Sidebar

- `SidebarCommands` — A group of commands for manipulating sidebar.
- `SidebarRowSize` — The size of the rows in a sidebar.
- `sectionActions(content:)` — Adds custom actions to section headers in a list.

## SwiftUI > Navigation > Searchable

- `searchable(text:placement:prompt:)` — Marks the view as searchable, which configures the display of a search field.
- `searchable(text:tokens:placement:prompt:token:)` — Marks the view as searchable with a token text field.
- `searchable(text:editableTokens:placement:prompt:token:)` — Marks the view as searchable with editable tokens.
- `searchable(text:isPresented:placement:prompt:)` — Marks the view as searchable with programmatic presentation control.
- `searchScopes(_:scopes:)` — Configures the search scopes for this view.
- `searchScopes(_:activation:_:)` — Configures the search scopes with custom activation behavior.
- `searchSuggestions(_:)` — Configures the search suggestions for this view.
- `searchSuggestions(_:for:)` — Configures search suggestions for a specific placement.
- `searchCompletion(_:)` — Associates a fully formed string with the value of this view.
- `searchPresentationToolbarBehavior(_:)` — Configures the toolbar behavior when search is presented.
- `findNavigator(isPresented:)` — Programmatically presents or dismisses the find and replace interface.
- `findDisabled(_:)` — Prevents find and replace operations in this view.
- `replaceDisabled(_:)` — Prevents replace operations in the find and replace interface.
- `SearchFieldPlacement` — The placement of a search field in a view.
- `SearchScopeActivation` — The activation behavior for a search scope.
- `SearchSuggestionsPlacement` — The placement for search suggestions.
- `SearchPresentationToolbarBehavior` — The toolbar behavior when search is presented.
- `DismissSearchAction` — An action that dismisses the current search interaction.
- `FindContext` — A type that controls find and replace interactions.

## SwiftUI > Navigation > Inspector

- `inspector(isPresented:content:)` — Presents an inspector view.
- `inspectorColumnWidth(_:)` — Sets the preferred width of the inspector column.
- `inspectorColumnWidth(min:ideal:max:)` — Sets the column width constraints for the inspector.
- `InspectorCommands` — A group of commands for manipulating inspectors.

---

## SwiftUI > Layout > Stacks

- `VStack` — A view that arranges its subviews in a vertical line.
- `HStack` — A view that arranges its subviews in a horizontal line.
- `ZStack` — A view that overlays its subviews, aligning them in both axes.
- `LazyVStack` — A view that arranges its subviews in a vertical line, creating each when needed.
- `LazyHStack` — A view that arranges its subviews in a horizontal line, creating each when needed.
- `Spacer` — A flexible space that expands along the major axis of its containing stack.
- `ViewThatFits` — A view that adapts to the available space by providing the first child view that fits.

## SwiftUI > Layout > Grid

- `Grid` — A container view that arranges other views in a two-dimensional layout.
- `GridRow` — A view that arranges its children in a horizontal line.
- `GridItem` — A description of a row or a column in a lazy grid.
- `gridCellColumns(_:)` — Tells a view that acts as a cell in a grid layout to span the specified number of columns.
- `gridCellAnchor(_:)` — Specifies a custom alignment anchor for a view that acts as a grid cell.
- `gridCellUnsizedAxes(_:)` — Asks grid layouts not to offer the view extra size in the specified axes.
- `gridColumnAlignment(_:)` — Overrides the default horizontal alignment of the grid column that this view is in.

## SwiftUI > Layout > LazyGrid

- `LazyVGrid` — A container view that arranges its child views in a grid that grows vertically.
- `LazyHGrid` — A container view that arranges its child views in a grid that grows horizontally.
- `GridItem` — A description of a row or a column in a lazy grid.
- `PinnedScrollableViews` — A set of view types to pin to the edges of a scrollable view.

## SwiftUI > Layout > ScrollView

- `ScrollView` — A scrollable view.
- `ScrollViewProxy` — A proxy value allowing the scrollable views within a view hierarchy to be scrolled programmatically.
- `ScrollViewReader` — A view whose child is defined as a function of a `ScrollViewProxy`.
- `ScrollPosition` — A type that defines the scroll position of a scroll view.
- `ScrollGeometry` — A type that describes the geometry of a scroll view.
- `ScrollTarget` — A value that describes the scroll target.
- `ScrollTargetBehavior` — A type that defines the scroll behavior of a scroll view.
- `AnyScrollTargetBehavior` — A type-erased scroll target behavior.
- `PagingScrollTargetBehavior` — A scroll target behavior that aligns to page boundaries.
- `ViewAlignedScrollTargetBehavior` — A scroll target behavior that aligns to view boundaries.
- `ScrollTargetBehaviorContext` — Context passed to a scroll target behavior.
- `ScrollBounceBehavior` — The scroll bounce behavior for a scroll view.
- `ScrollIndicatorVisibility` — The visibility of scroll indicators.
- `ScrollEdgeEffectStyle` — The visual effect applied at the scroll edge.
- `ScrollDismissesKeyboardMode` — The way a scroll view dismisses the keyboard.
- `ScrollInputBehavior` — The input behavior of a scroll view.
- `ScrollInputKind` — The kind of input used to scroll a scroll view.
- `ScrollPhase` — The phase of a scroll interaction.
- `ScrollTransitionPhase` — The phase of a scroll transition.
- `ScrollPhaseChangeContext` — Context passed to a scroll phase change callback.
- `ScrollTransitionConfiguration` — The configuration for a scroll transition.
- `ScrollContentOffsetAdjustmentBehavior` — The adjustment behavior for scroll content offset.
- `ScrollAnchorRole` — Specifies the role of a scroll anchor.
- `ScrollTargetBehaviorProperties` — A description of the scroll target behavior.
- `defaultScrollAnchor(_:)` — Sets the scroll anchor point for scroll views in this view hierarchy.
- `scrollBounceBehavior(_:axes:)` — Sets the scroll bounce behavior for a scroll view.
- `scrollClipDisabled(_:)` — Disables or re-enables clipping of scroll views.
- `scrollContentBackground(_:)` — Specifies the visibility of the background for scrollable views within this view.
- `scrollDisabled(_:)` — Disables scrolling in scroll views within this view.
- `scrollIndicators(_:axes:)` — Sets the visibility of scroll indicators within this view.
- `scrollIndicatorsFlash(onAppear:)` — Flashes the scroll indicators when a scroll view first appears.
- `scrollIndicatorsFlash(trigger:)` — Flashes the scroll indicators whenever a value changes.
- `scrollPosition(_:anchor:)` — Associates a binding to a scroll position with a scroll view.
- `scrollTargetBehavior(_:)` — Sets the scroll target behavior for scroll views in this view hierarchy.
- `scrollTargetLayout(isEnabled:)` — Configures the outermost layout as a scroll target.
- `scrollTransition(_:axis:transition:)` — Applies the given transition, animating between the phases of the transition.
- `onScrollGeometryChange(for:of:action:)` — Reads a value from the scroll view's geometry and performs an action when it changes.
- `onScrollPhaseChange(_:)` — Performs an action when the scroll view's scroll phase changes.
- `scrollEdgeEffectHidden(_:for:)` — Hides the scroll edge effect for the specified edges.
- `scrollEdgeEffectStyle(_:for:)` — Sets the scroll edge effect style for the specified edges.
- `scrollInputBehavior(_:for:)` — Sets the scroll input behavior for this view.
- `safeAreaBar(edge:alignment:spacing:content:)` — Adds a fixed-size bar that insets the safe area.

## SwiftUI > Layout > GeometryReader

- `GeometryReader` — A container view that defines its content as a function of its own size and coordinate space.
- `GeometryProxy` — A proxy for access to the size and coordinate space of the container view.
- `GeometryProxy3D` — A proxy for access to the size and coordinate space of a 3D container.
- `GeometryReader3D` — A container view that defines its content as a function of its own size and coordinate space in 3D.
- `GeometryProxyCoordinateSpace3D` — A coordinate space proxy for 3D geometry.
- `CoordinateSpace` — A resolved coordinate space.
- `CoordinateSpaceProtocol` — A named coordinate space.
- `Anchor` — An opaque value derived from an anchor source and a particular view.
- `UnitPoint` — A normalized 2D point.
- `UnitPoint3D` — A normalized 3D point.
- `onGeometryChange(for:of:action:)` — Performs an action when geometry derived from this view changes.
- `coordinateSpace(_:)` — Assigns a name to the view's coordinate space.

## SwiftUI > Layout > Frame and Padding

- `frame(width:height:alignment:)` — Positions this view within an invisible frame with the specified size.
- `frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)` — Positions this view within an invisible frame with the specified constraints.
- `padding(_:)` — Adds an equal padding amount to specific edges of this view.
- `padding(_:_:)` — Adds a specific padding amount to the specified edges of this view.
- `fixedSize()` — Fixes this view at its ideal size.
- `fixedSize(horizontal:vertical:)` — Fixes this view at its ideal size in the specified dimensions.
- `offset(_:)` — Offset this view by the specified horizontal and vertical distances.
- `offset(x:y:)` — Offset this view by the specified horizontal and vertical amounts.
- `position(_:)` — Positions the center of this view at the specified point.
- `position(x:y:)` — Positions the center of this view at the specified coordinates.
- `containerRelativeFrame(_:alignment:)` — Proposes a size for each dimension, measured in the coordinate space of the container.
- `containerRelativeFrame(_:count:span:spacing:alignment:)` — Proposes a size for this view based on grid-like slots.
- `scenePadding(_:)` — Adds padding in the scene's coordinate space.
- `safeAreaInset(edge:alignment:spacing:content:)` — Shows the specified content beside the modified view.
- `safeAreaPadding(_:)` — Adds safe-area padding to the specified edges.
- `ignoresSafeArea(_:edges:)` — Expands the view out of its safe area on the specified edges.
- `layoutPriority(_:)` — Sets the priority by which a parent layout should apportion space to this child.
- `EdgeInsets` — The inset distances for a view's edges.
- `SafeAreaRegions` — A set of safe area regions.
- `ScenePadding` — A padding value appropriate for the current scene.
- `ContentMarginPlacement` — The placement of content margins.

## SwiftUI > Layout > Alignment

- `Alignment` — An alignment in both axes.
- `HorizontalAlignment` — An alignment position along the horizontal axis.
- `VerticalAlignment` — An alignment position along the vertical axis.
- `Alignment3D` — An alignment in all three axes.
- `DepthAlignment` — An alignment position along the depth axis.
- `DepthAlignmentID` — A type used to compute an anchor for depth alignment.
- `AlignmentID` — A type that you use to create custom alignment guides.
- `ViewDimensions` — A view's size and alignment guides in its own coordinate space.
- `ViewDimensions3D` — A view's size and alignment guides in its own 3D coordinate space.
- `alignmentGuide(_:computeValue:)` — Sets the view's horizontal alignment to the guide's value.
- `LayoutDirection` — The direction of the layout.
- `LayoutDirectionBehavior` — The behavior of a layout regarding its layout direction.
- `HorizontalEdge` — An edge on the horizontal axis.
- `VerticalEdge` — An edge on the vertical axis.
- `Edge` — An enumeration to indicate one edge of a rectangle.
- `Edge3D` — An edge in three-dimensional space.
- `UserInterfaceSizeClass` — A set of values that indicate the visual size available to the view.
- `layoutDirectionBehavior(_:)` — Sets the layout direction behavior for this view.

## SwiftUI > Layout > SafeArea

- `ignoresSafeArea(_:edges:)` — Expands the view out of its safe area on the specified edges.
- `safeAreaInset(edge:alignment:spacing:content:)` — Shows the specified content beside the modified view.
- `safeAreaPadding(_:)` — Adds safe area padding to a view.
- `SafeAreaRegions` — A set of safe area regions.
- `EdgeInsets` — The inset distances for the edges of a rectangle.

## SwiftUI > Layout > Custom Layout

> ✅ Approved 2026-05-07 (Phase 1 checkpoint A3). 13 tiles from `custom-layout/` (14 source docs; the 1 sampleCode `composing-custom-layouts-with-swiftui` deferred per C11 — Phase 3 may cite it in tile descriptions).

- `Layout` — A type that defines the geometry of a collection of views.
- `AnyLayout` — A type-erased instance of the Layout protocol.
- `LayoutProperties` — Layout-specific properties of a layout container.
- `LayoutSubview` — A proxy that represents one subview of a layout.
- `LayoutSubviews` — A collection of proxy values that represent the subviews of a layout view.
- `LayoutValueKey` — A protocol for keys used to access layout-specific values.
- `ProposedViewSize` — A proposal for the size of a view.
- `ViewSpacing` — A collection of the geometric spacing preferences of a view.
- `HStackLayout` — A horizontal container that you can use in conditional layouts.
- `VStackLayout` — A vertical container that you can use in conditional layouts.
- `ZStackLayout` — An overlaying container that you can use in conditional layouts.
- `GridLayout` — A grid that you can use in conditional layouts.
- `layoutValue(key:value:)` — Associates a value with a custom layout property.

---

## SwiftUI > Containers > List

- `List` — A container that presents rows of data arranged in a single column.
- `ForEach` — A structure that computes views on demand from an underlying collection of identified data.
- `OutlineGroup` — A structure that computes views and disclosure groups on demand from an underlying collection of tree-structured, identified data.
- `DisclosureGroup` — A view that shows or hides another content view, based on the state of a disclosure control.
- `EditActions` — A set of edit actions on a collection of data that a list can offer to a user.
- `EditableCollectionContent` — An opaque wrapper view that adds editing capabilities to a row in a list.
- `IndexedIdentifierCollection` — A collection wrapper that iterates over the indices and identifiers of a base collection.
- `RefreshAction` — An action that initiates a refresh operation.
- `ListItemTint` — The list item tint configuration.
- `ListSectionSpacing` — The spacing between sections in a list.
- `BackgroundProminence` — The prominence of backgrounds underneath other views.
- `BadgeProminence` — The prominence of a badge.
- `AlternatingRowBackgroundBehavior` — The alternating background behavior of a list.
- `EditMode` — A mode indicating whether the user can edit a view's content.
- `Prominence` — A level of prominence to apply to a view.
- `swipeActions(edge:allowsFullSwipe:content:)` — Adds custom swipe actions to a row in a list.
- `listRowBackground(_:)` — Places a custom background view behind a list row item.
- `listRowInsets(_:)` — Applies an inset to the rows in a list.
- `listRowSeparator(_:edges:)` — Sets the display mode for the separator associated with this specific row.
- `listRowSeparatorTint(_:edges:)` — Sets the tint color associated with a row separator.
- `listRowSpacing(_:)` — Sets the vertical spacing between two adjacent rows in a list.
- `listRowHoverEffect(_:)` — Requests that the containing list row use the provided hover effect.
- `listSectionSeparator(_:edges:)` — Sets whether to hide the separator associated with a list section.
- `listSectionSeparatorTint(_:edges:)` — Sets the tint color associated with a section separator.
- `listSectionSpacing(_:)` — Sets the spacing between adjacent sections in a list.
- `listSectionMargins(_:_:)` — Sets the margins for sections in a list.
- `listSectionIndexVisibility(_:)` — Controls the visibility of the section index list for list views.
- `listItemTint(_:)` — Sets the tint effect applied to content in a list.
- `headerProminence(_:)` — Sets the header prominence for this view.
- `badge(_:)` — Generates a badge for the view from an integer value.
- `badgeProminence(_:)` — Specifies the prominence of badges created by this view.
- `alternatingRowBackgrounds(_:)` — Overrides whether lists and tables in this view use alternating row backgrounds.
- `refreshable(action:)` — Marks this view as refreshable.
- `selectionDisabled(_:)` — Disables the ability to select the view in a list.
- `deleteDisabled(_:)` — Disables the delete functionality in list cells.
- `moveDisabled(_:)` — Disables the move functionality in list cells.
- `sectionIndexLabel(_:)` — Associates a label with the section for purposes of section index lists.

## SwiftUI > Containers > Table

- `Table` — A container that presents rows of data arranged in columns.
- `TableColumn` — A column that displays a view for each row in a table.
- `TableRow` — A row in a table.
- `DisclosureTableRow` — A table row that can be expanded and collapsed to reveal or hide child rows.
- `TableColumnContent` — A type used to define a `TableColumn`'s content.
- `TableRowContent` — A type of table row content.
- `DynamicTableRowContent` — A type of table row content that generates table rows from an underlying collection of data.
- `TableColumnBuilder` — A result builder that creates table column content from clauses.
- `TableRowBuilder` — A result builder that creates table row content from clauses.
- `TableColumnCustomization` — A representation of the state of the columns in a table.
- `TableColumnCustomizationBehavior` — A set of customization behaviors of a column.
- `TableColumnAlignment` — The alignment of a column in a table.
- `TableForEachContent` — Table row content that generates its rows from an underlying collection of data.
- `TableColumnForEach` — A structure that creates table column content from a collection of identified data.
- `TableHeaderRowContent` — A table row that shows column headers.
- `TableOutlineGroupContent` — Table row content that expands groups from an underlying collection of tree-structured data.
- `TupleTableRowContent` — A type that creates table row content from a tuple of table row content types.
- `EmptyTableRowContent` — A table row content that doesn't produce any rows.
- `tableColumnHeaders(_:)` — Configures whether this view shows column headers.
- `tableStyle(_:)` — Sets the style for tables within this view.
- `TableStyle` — A specification for the appearance and behavior of a table.
- `TableStyleConfiguration` — The properties of a table.

## SwiftUI > Containers > Form

- `Form` — A container for grouping controls used for data entry.
- `FormStyle` — A specification for the appearance and behavior of a form.
- `FormStyleConfiguration` — The properties of a form.
- `formStyle(_:)` — Sets the style for forms within this view.
- `LabeledContent` — A container for attaching a label to a value-bearing view.
- `LabeledContentStyle` — A type that specifies the appearance and behavior of a labeled content instance.
- `LabeledContentStyleConfiguration` — The properties of a labeled content instance.
- `labeledContentStyle(_:)` — Sets the labeled content style for this view.

## SwiftUI > Containers > GroupBox

- `GroupBox` — A stylized view, with an optional label, that visually collects a logical grouping of content.
- `GroupBoxStyle` — A type that specifies the appearance and behavior of a group box.
- `GroupBoxStyleConfiguration` — The properties of a group box instance.
- `groupBoxStyle(_:)` — Sets the style for group boxes within this view.
- `ControlGroup` — A container view that displays semantically-related controls in a visually appropriate manner for the context.
- `ControlGroupStyle` — A specification for the appearance and behavior of a control group.
- `ControlGroupStyleConfiguration` — The properties of a control group.
- `controlGroupStyle(_:)` — Sets the style for control groups within this view.

## SwiftUI > Containers > Section

- `Section` — A container view that you can use to add hierarchy within certain SwiftUI views.
- `SectionConfiguration` — A description of a section.
- `SectionCollection` — A collection of sections in a view.
- `ForEachSectionCollection` — A collection that iterates over section configurations.
- `Subview` — A proxy representation of a subview in a custom container.
- `SubviewsCollection` — A collection of subview proxies.
- `SubviewsCollectionSlice` — A slice of a subviews collection.
- `Group` — A type that collects multiple instances of a content type into a single unit.
- `GroupElementsOfContent` — A type that iterates over elements of a container's content.
- `GroupSectionsOfContent` — A type that iterates over sections of a container's content.
- `ContainerValues` — Values that you can read from custom container views.
- `ContainerValueKey` — A key for a container value.
- `containerValue(_:_:)` — Sets the container value for the specified key path.

## SwiftUI > Containers > DisclosureGroup

- `DisclosureGroup` — A view that shows or hides another content view, based on the state of a disclosure control.
- `DisclosureGroupStyle` — A type that specifies the appearance and behavior of a disclosure group.
- `disclosureGroupStyle(_:)` — Sets the style for disclosure groups within this view.
- `OutlineGroup` — A structure that computes views and disclosure groups on demand from an underlying collection of tree-structured, identified data.

---

## SwiftUI > Controls > Button

- `Button` — A control that initiates an action.
- `ButtonRole` — A value that describes the purpose of a button.
- `ButtonBorderShape` — A shape used to draw a button's border.
- `ButtonRepeatBehavior` — The options for controlling the repeatability of button actions.
- `ButtonSizing` — The sizing behavior of buttons and button-like controls.
- `DefaultButtonLabel` — The default label used for a Button.
- `EditButton` — A button that toggles the edit mode of the current edit scope.
- `HelpLink` — A control that opens a help URL.
- `PasteButton` — A system button that reads items from the pasteboard and delivers them to a closure.
- `buttonStyle(_:)` — Sets the button style for buttons within this view.
- `buttonBorderShape(_:)` — Sets the border shape for bordered buttons within this view.
- `buttonRepeatBehavior(_:)` — Sets whether buttons in this view should repeatedly trigger their actions.
- `ButtonStyle` — A type that applies standard interaction behavior and a custom appearance to all buttons within a view.
- `PrimitiveButtonStyle` — A type that applies custom interaction behavior and a custom appearance to all buttons within a view.
- `ButtonStyleConfiguration` — The properties of a button.
- `PrimitiveButtonStyleConfiguration` — The properties of a button.
- `GlassButtonStyle` — A button style with a glass appearance.
- `GlassProminentButtonStyle` — A prominent button style with a glass appearance.

## SwiftUI > Controls > Toggle

- `Toggle` — A control that toggles between on and off states.
- `ToggleStyle` — A specification for the appearance and interaction of a toggle.
- `ToggleStyleConfiguration` — The properties of a toggle instance.
- `toggleStyle(_:)` — Sets the style for toggles in a view hierarchy.

## SwiftUI > Controls > Picker

- `Picker` — A control for selecting from a set of mutually exclusive values.
- `PickerStyle` — A specification for the appearance and interaction of a picker.
- `pickerStyle(_:)` — Sets the style for pickers within this view.
- `paletteSelectionEffect(_:)` — Specifies the selection effect to apply to a palette item.
- `horizontalRadioGroupLayout()` — Sets the style for radio group style pickers within this view to be horizontally positioned.
- `defaultWheelPickerItemHeight(_:)` — Sets the default wheel-style picker item height.
- `PaletteSelectionEffect` — The selection effect to apply to a palette item.

## SwiftUI > Controls > DatePicker

- `DatePicker` — A control for selecting an absolute date.
- `MultiDatePicker` — A control for picking multiple dates.
- `DatePickerStyle` — A type that specifies the appearance and interaction of all date pickers within a view hierarchy.
- `DefaultDateProgressLabel` — The default label for a date progress indicator.
- `datePickerStyle(_:)` — Sets the style for date pickers within this view.

## SwiftUI > Controls > ColorPicker

- `ColorPicker` — A control used to select a color from the system color picker UI.

## SwiftUI > Controls > Slider

- `Slider` — A control for selecting a value from a bounded linear range of values.

## SwiftUI > Controls > Stepper

- `Stepper` — A control that performs increment and decrement actions.

## SwiftUI > Controls > ProgressView

- `ProgressView` — A view that shows the progress toward completion of a task.
- `ProgressViewStyle` — A type that applies standard interaction behavior to all progress views within a view hierarchy.
- `ProgressViewStyleConfiguration` — The properties of a progress view instance.
- `progressViewStyle(_:)` — Sets the style for progress views within this view.
- `ContentUnavailableView` — A interface for indicating empty or no content states in a view.

## SwiftUI > Controls > Gauge

- `Gauge` — A view that shows a value within a range.
- `GaugeStyle` — Defines the implementation of all gauge instances within a view hierarchy.
- `GaugeStyleConfiguration` — The properties of a gauge instance.
- `gaugeStyle(_:)` — Sets the style for gauges within this view.

## SwiftUI > Controls > Menu

- `Menu` — A control for presenting a menu of actions.
- `MenuStyle` — A specification for the appearance and behavior of a menu.
- `MenuStyleConfiguration` — The properties of a menu.
- `menuStyle(_:)` — Sets the style for menus in this view.
- `menuIndicator(_:)` — Sets the visibility of a menu indicator in controls within this view.
- `menuActionDismissBehavior(_:)` — Tells a menu whether to dismiss after performing an action.
- `menuOrder(_:)` — Sets the preferred order of items in menus and control groups.
- `MenuActionDismissBehavior` — Options for menu action dismissal behavior.
- `MenuOrder` — A type that describes the ordering of the elements within a menu.
- `MenuButton` — A button that presents a menu of actions when clicked (deprecated).
- `ShareLink` — A control you add to a view to offer standard share behavior.
- `SharePreview` — A representation of a share sheet item for display purposes.
- `Link` — A control for navigating to a URL.
- `TextFieldLink` — A view that opens a text input dialog when activated.
- `SensoryFeedback` — A type that describes sensory feedback for an event.
- `controlSize(_:)` — Sets the size for controls within this view.
- `ControlSize` — The size classes, like regular or small, that you can apply to controls within a view.

---

## SwiftUI > Text and Input > Text

- `Text` — A view that displays one or more lines of read-only text.
- `Font` — An environment-dependent font.
- `LocalizedStringKey` — The key used to look up an entry in a strings file or strings dictionary file.
- `ScaledMetric` — A dynamic property that scales a numeric value.
- `DynamicTypeSize` — A Dynamic Type size, which specifies how large scalable content should be.
- `ContentSizeCategory` — The dynamic type content size category.
- `TextAlignment` — An alignment position for text along the horizontal axis.
- `font(_:)` — Sets the default font for text in this view.
- `fontDesign(_:)` — Sets the font design of the text in this view.
- `fontWeight(_:)` — Sets the font weight of the text in this view.
- `fontWidth(_:)` — Sets the font width of the text in this view.
- `bold(_:)` — Applies a bold font weight to the text in this view.
- `italic(_:)` — Applies italics to the text in this view.
- `monospaced(_:)` — Modifies the fonts of all child views to use fixed-width digits.
- `monospacedDigit()` — Modifies the fonts of all child views to use fixed-width digits, while leaving other characters proportionally spaced.
- `strikethrough(_:pattern:color:)` — Applies a strikethrough to the text in this view.
- `underline(_:pattern:color:)` — Applies an underline to the text in this view.
- `kerning(_:)` — Sets the spacing, or kerning, between characters.
- `tracking(_:)` — Sets the tracking for the text in this view.
- `baselineOffset(_:)` — Sets the vertical offset for the text relative to its baseline.
- `lineSpacing(_:)` — Sets the amount of space between lines of text in this view.
- `lineLimit(_:)` — Sets the maximum number of lines that text can occupy in this view.
- `minimumScaleFactor(_:)` — Sets the minimum amount that text in this view scales down to fit the available space.
- `allowsTightening(_:)` — Sets whether text in this view can compress the space between characters.
- `truncationMode(_:)` — Sets the truncation mode for lines of text that are too long to fit in the available space.
- `textCase(_:)` — Sets a transform for the case of the text contained in this view.
- `textScale(_:isEnabled:)` — Sets the text scale for this view.
- `multilineTextAlignment(_:)` — Sets the alignment of multiline text in this view.
- `flipsForRightToLeftLayoutDirection(_:)` — Sets whether this view mirrors its contents horizontally when the layout direction is right-to-left.
- `dynamicTypeSize(_:)` — Limits the Dynamic Type size within the view to the given range.
- `typesettingLanguage(_:isEnabled:)` — Specifies the language for typesetting.
- `TextProxy` — A proxy that represents the Text view.
- `TimeDataSource` — A data source that binds to a specific time or interval.
- `SystemFormatStyle` — A format style for system values.

## SwiftUI > Text and Input > TextField

- `TextField` — A control that displays an editable text interface.
- `SecureField` — A control into which the user securely enters private text.
- `TextFieldStyle` — A specification for the appearance and interaction of a text field.
- `textFieldStyle(_:)` — Sets the style for text fields within this view.
- `autocorrectionDisabled(_:)` — Sets whether to disable autocorrection for this view.
- `keyboardType(_:)` — Sets the keyboard type for this view.
- `textInputAutocapitalization(_:)` — Sets how often the shift key in the keyboard is automatically enabled.
- `textContentType(_:)` — Sets the text content type for this view.
- `submitLabel(_:)` — Sets a label for the submit action in the soft keyboard.
- `onSubmit(of:_:)` — Adds an action to perform when the user submits a value to this view.
- `submitScope(_:)` — Prevents submission triggers originating inside this view from activating submission actions in any containing views.
- `textInputCompletion(_:)` — Configures the view's text input to use a specific completion value.
- `textInputSuggestions(_:)` — Configures the text input view suggestions to use.
- `writingToolsBehavior(_:)` — Configures the Writing Tools behavior for this view.
- `searchDictationBehavior(_:)` — Sets dictation behavior when the search field is focused.
- `scrollDismissesKeyboard(_:)` — Configures the behavior in which scrollable content interacts with the software keyboard.
- `TextInputAutocapitalization` — The auto-capitalization behavior of a text input.
- `TextInputDictationActivation` — Describes when the dictation indicator shows in text fields.
- `TextInputDictationBehavior` — Describes the interaction of the microphone dictation interface.
- `TextInputFormattingControlPlacement` — The placement of formatting controls in a text input view.
- `SubmitLabel` — A semantic label describing the label of submission for a text input view.
- `SubmitTriggers` — A type that defines various triggers that result in the firing of a submission action.
- `WritingToolsBehavior` — The behavior options for Writing Tools text input behaviors.

## SwiftUI > Text and Input > TextEditor

- `TextEditor` — A view that can display and edit long-form text.
- `TextEditorStyle` — A specification for the appearance and interaction of a text editor.
- `TextEditorStyleConfiguration` — The configuration properties of a text editor.
- `textEditorStyle(_:)` — Sets the style for text editors within this view.
- `TextSelection` — A selection of text within a view.
- `AttributedTextSelection` — A selection of attributed text within a view.
- `TextSelectionAffinity` — The direction of text selection cursor movement relative to a line break.
- `textSelection(_:)` — Controls whether people can select text within this view.
- `textSelectionAffinity(_:)` — Specifies the direction that the selection cursor moves.
- `TextSelectability` — A type that describes the ability to select text within a view.
- `typeSelectEquivalent(_:)` — Sets a keyboard shortcut for type selection in the view.

## SwiftUI > Text and Input > Label

- `Label` — A standard label for user interface items, consisting of an icon with a title.
- `LabelStyle` — A type that applies a custom appearance to all labels within a view.
- `LabelStyleConfiguration` — The properties of a label.
- `labelStyle(_:)` — Sets the label style for labels within this view.

## SwiftUI > Text and Input > AttributedString

- `AttributedTextFormatting` — The formatting attributes of an attributed text range.
- `AttributedTextFormattingDefinition` — A type that declares the formatting attributes for a text attribute.
- `AttributedTextValueConstraint` — A constraint on the value of a text attribute.
- `TextAttribute` — A type used to define custom text attributes.
- `TextRenderer` — A protocol that allows you to replace the default rendering of a text view.
- `TextVariantPreference` — A type that describes your preferred variant of a text view.
- `FixedTextVariant` — A specific text variant.
- `SizeDependentTextVariant` — A text variant that changes based on available size.
- `textRenderer(_:)` — Returns a new view that renders text using the specified renderer.

---

## SwiftUI > Images and Shapes > Image

- `Image` — A view that displays an image.
- `AsyncImage` — A view that asynchronously loads and displays an image.
- `AsyncImagePhase` — The current phase of the asynchronous image loading operation.
- `Image.Orientation` — The orientation of the image.
- `Image.ResizingMode` — The modes that SwiftUI uses to resize an image to fit within its containing view.
- `Image.Scale` — A scale to apply to vector images relative to text.
- `ImageRenderer` — An object that creates images from SwiftUI views.
- `imageScale(_:)` — Scales images within the view according to one of the relative sizes available.
- `symbolEffect(_:options:isActive:)` — Adds a persistent symbol effect to the view.
- `symbolEffect(_:options:value:)` — Adds a discrete symbol effect to the view.
- `symbolEffectsRemoved(_:)` — Returns a new view with its inherited symbol image effects either removed or left unchanged.
- `symbolRenderingMode(_:)` — Sets the rendering mode for symbol images within this view.
- `symbolVariant(_:)` — Makes symbols within the view show a particular variant.
- `SymbolRenderingMode` — A rendering mode for symbol images.
- `SymbolColorRenderingMode` — A rendering mode for symbol images.
- `SymbolVariants` — Options that make symbol images more dynamic and contextual.
- `SymbolVariableValueMode` — The rendering mode for the variable value layer of a symbol image.
- `SymbolEffectTransition` — A transition that applies a symbol effect to the view when appearing or disappearing.

## SwiftUI > Images and Shapes > AsyncImage *(removed — folded into Image)*

✅ Locked 2026-05-07 (Phase 1 checkpoint A6). `AsyncImage` and `AsyncImagePhase` tiles live on the Image page above; this leaf does not exist in the final manifest.

## SwiftUI > Images and Shapes > Shapes

- `Shape` — A 2D shape that you can use when drawing a view.
- `InsettableShape` — A shape type that is able to inset itself to produce another shape.
- `ShapeView` — A view that provides a shape that you can use for drawing operations.
- `AnyShape` — A type-erased shape value.
- `Circle` — A circle centered on the frame of the view containing it.
- `Ellipse` — An ellipse aligned inside the frame of the view containing it.
- `Capsule` — A capsule shape aligned inside the frame of the view containing it.
- `Rectangle` — A rectangular shape aligned inside the frame of the view containing it.
- `RoundedRectangle` — A rectangular shape with rounded corners, aligned inside the frame of the view containing it.
- `UnevenRoundedRectangle` — A rectangular shape with uneven rounded corners, aligned inside the frame of the view containing it.
- `ContainerRelativeShape` — A shape that is replaced by an inset version of the current container shape.
- `ConcentricRectangle` — A shape that draws a rectangle that is centered on the frame and grows toward its edges.
- `OffsetShape` — A shape offset by a geometric vector.
- `RotatedShape` — A shape with a rotation transform applied to it.
- `ScaledShape` — A shape with a scale transform applied to it.
- `TransformedShape` — A shape with an affine transform applied to it.
- `Path` — The outline of a 2D shape.
- `FillStyle` — A style for rasterizing vector shapes.
- `StrokeStyle` — The characteristics of a stroke that traces a path.
- `FillShapeView` — A shape view that fills its shape with a paint style.
- `StrokeShapeView` — A shape view that strokes its shape with a paint style.
- `StrokeBorderShapeView` — A shape view that strokes the border of its shape with a paint style.
- `RectangleCornerRadii` — Describes the corner radius values of a rounded rectangle.
- `RectangleCornerInsets` — Describes the corner inset values of an uneven rounded rectangle.
- `RoundedCornerStyle` — Defines the shape of a rounded rectangle's corners.
- `ShapeRole` — Ways of styling a shape.
- `RoundedRectangularShape` — A type that describes shapes with rounded corners in a rectangular region.
- `RoundedRectangularShapeCorners` — A set of corners.
- `containerShape(_:)` — Defines the shape SwiftUI uses for the current container.

## SwiftUI > Images and Shapes > Gradient

- `Gradient` — A color gradient represented as an array of color stops.
- `AnyGradient` — A color gradient that you can use anywhere SwiftUI uses a `ShapeStyle`.
- `LinearGradient` — A linear gradient that maps a color function along an axis between start and end points.
- `RadialGradient` — A radial gradient that maps a color function as the distance from a center point, scaled between start and end radii.
- `AngularGradient` — A conic gradient that maps a color function as the angle changes relative to a center point and start/end angles.
- `MeshGradient` — A two-dimensional gradient defined by a 2D grid of positioned colors.
- `Glass` — A shape style that renders a glass effect.
- `ShadowStyle` — A style to use when rendering shadows.
- `ShapeStyle` — A color or pattern to use when rendering a shape.
- `AnyShapeStyle` — A type-erased ShapeStyle value.
- `Color` — A representation of a color that adapts to a given context.
- `ColorMatrix` — A matrix to use in an RGBA color transformation.
- `ColorRenderingMode` — The set of possible working color spaces for color-compositing operations.
- `BlendMode` — Modes for compositing a view with overlapping content.
- `foregroundStyle(_:)` — Sets a view's foreground elements to use a given style.
- `backgroundStyle(_:)` — Sets the specified style to render backgrounds within the view.
- `tint(_:)` — Sets the tint within this view.

> ✅ B10 closed 2026-05-07: `LinearGradient`, `RadialGradient`, `AngularGradient` recaptured to `Documentation/SwiftUI/drawing-and-graphics/{lineargradient,radialgradient,angulargradient}.md` and tiled here in source-order with the existing concrete `*Gradient` types. 14 tiles → 17 tiles.

---

## SwiftUI > Presentation > Sheet

- `sheet(isPresented:onDismiss:content:)` — Presents a sheet using the given item as a data source for the sheet's content.
- `sheet(item:onDismiss:content:)` — Presents a sheet using the given item as a data source for the sheet's content.
- `interactiveDismissDisabled(_:)` — Conditionally prevents interactive dismissal of a popover or a sheet.
- `presentationDetents(_:)` — Sets the available detents for the enclosing sheet.
- `presentationDetents(_:selection:)` — Sets the available detents for the enclosing sheet, giving you programmatic control of the currently selected detent.
- `presentationDragIndicator(_:)` — Sets the visibility of the drag indicator on top of a sheet.
- `presentationBackground(_:)` — Sets the presentation background of the enclosing sheet using a shape style.
- `presentationBackgroundInteraction(_:)` — Sets whether the enclosing view scrolls with the value of the scroll view in its background.
- `presentationCornerRadius(_:)` — Requests that the presentation have a specific corner radius.
- `presentationSizing(_:)` — Sets a fixed size for a sheet presentation.
- `presentationContentInteraction(_:)` — Configures the behavior of swipe gestures on a presentation.
- `presentationCompactAdaptation(_:)` — Specifies how to adapt a presentation to compact size classes.
- `PresentationDetent` — A type that represents a height where a sheet naturally rests.
- `CustomPresentationDetent` — A custom detent for a sheet.
- `PresentationSizing` — A type that describes a sheet presentation size.
- `PresentationSizingContext` — The context for computing a custom presentation size.
- `PresentationSizingRoot` — A proxy for the root view of a sheet presentation.
- `PresentationAdaptation` — Strategies for adapting a presentation to a different size class.
- `PresentationBackgroundInteraction` — The ways that a presentation can respond to swipes on the background view below it.
- `PresentationContentInteraction` — A behavior that you can use to influence how a presentation responds to swipe gestures.
- `dismissalConfirmationDialog(_:shouldPresent:actions:)` — Presents a confirmation dialog when the system tries to dismiss the enclosing view.
- `AlertScene` — A scene that presents an alert when a binding becomes true.
- `fullScreenCover(isPresented:onDismiss:content:)` — Presents a modal view that covers as much of the screen as possible. *(Folded from FullScreenCover per A7.)*
- `fullScreenCover(item:onDismiss:content:)` — Presents a modal view that covers as much of the screen as possible using the given item as a data source. *(Folded from FullScreenCover per A7.)*

## SwiftUI > Presentation > Popover

- `popover(isPresented:attachmentAnchor:arrowEdge:content:)` — Presents a popover when a given condition is true.
- `popover(item:attachmentAnchor:arrowEdge:content:)` — Presents a popover using the given item as a data source for the popover's content.
- `PopoverAttachmentAnchor` — An anchor for a popover.

## SwiftUI > Presentation > Alert

- `alert(_:isPresented:actions:)` — Presents an alert when a given condition is true.
- `alert(_:isPresented:actions:message:)` — Presents an alert with a message when a given condition is true.
- `alert(_:isPresented:presenting:actions:)` — Presents an alert with actions when a given condition is true, using a data value to produce the content.
- `alert(isPresented:error:actions:)` — Presents an alert when an error is present.
- `Alert` — A representation of an alert presentation.
- `ActionSheet` — A representation of an action sheet presentation (deprecated).
- `dialogSeverity(_:)` — Sets the severity for alerts within this view.
- `dialogIcon(_:)` — Sets the icon to use for alerts within this view.
- `dialogSuppressionToggle(_:isSuppressed:)` — Configures the suppression toggle in an alert.
- `DialogSeverity` — The severity of an alert dialog.

## SwiftUI > Presentation > ConfirmationDialog

- `confirmationDialog(_:isPresented:titleVisibility:actions:)` — Presents a confirmation dialog when a given condition is true.
- `confirmationDialog(_:isPresented:titleVisibility:actions:message:)` — Presents a confirmation dialog with a message when a given condition is true.
- `confirmationDialog(_:isPresented:titleVisibility:presenting:actions:)` — Presents a confirmation dialog with actions when a given condition is true, using a data value to produce the content.

## SwiftUI > Presentation > FullScreenCover *(removed — folded into Sheet)*

✅ Locked 2026-05-07 (Phase 1 checkpoint A7). `fullScreenCover(isPresented:onDismiss:content:)` and `fullScreenCover(item:onDismiss:content:)` tiles relocated to the Sheet page above; this leaf does not exist in the final manifest.

---

## SwiftUI > Toolbars and Menus > Toolbar

- `ToolbarItem` — A model that represents an item which can be placed in the toolbar or navigation bar.
- `ToolbarItemGroup` — A model that represents a group of ToolbarItems which can be placed in the toolbar or navigation bar.
- `ToolbarItemPlacement` — A structure that defines the placement of a toolbar item.
- `ToolbarPlacement` — The placement of a toolbar.
- `ToolbarContentBuilder` — Constructs a toolbar item set from multi-expression closures.
- `ToolbarContent` — Conforming types represent items that can be placed in various locations in a toolbar.
- `CustomizableToolbarContent` — Conforming types represent toolbar items that can be used in a customizable toolbar.
- `ToolbarCustomizationBehavior` — Defines the customization behavior of a toolbar item.
- `ToolbarCustomizationOptions` — The user customization options for a toolbar item.
- `ToolbarRole` — The purpose of content that populates the toolbar.
- `ToolbarDefaultItemKind` — A kind of toolbar item that can be used in the default toolbar.
- `DefaultToolbarItem` — The default toolbar item for a particular toolbar item kind.
- `ToolbarTitleMenu` — A menu associated with the current toolbar title item.
- `ToolbarSpacer` — A spacer that can be used in toolbars.
- `ToolbarLabelStyle` — A specification for the appearance of a toolbar label.
- `SpacerSizing` — The sizing of a spacer in a toolbar.
- `SearchToolbarBehavior` — The toolbar behavior when search is presented.
- `OrnamentAttachmentAnchor` — An anchor for an ornament attachment.
- `ContentToolbarPlacement` — The placement of a content toolbar item.
- `toolbar(content:)` — Populates the toolbar or navigation bar with the views you provide.
- `toolbar(_:for:)` — Specifies the visibility of a bar managed by SwiftUI.
- `toolbar(removing:)` — Removes a toolbar item.
- `toolbar(id:content:)` — Populates the toolbar or navigation bar with the specified items, allowing for user customization.
- `toolbarBackground(_:for:)` — Specifies the preferred shape style of the background of a bar managed by SwiftUI.
- `toolbarBackgroundVisibility(_:for:)` — Specifies the preferred visibility of backgrounds on a bar managed by SwiftUI.
- `toolbarColorScheme(_:for:)` — Specifies the preferred color scheme of a bar managed by SwiftUI.
- `toolbarForegroundStyle(_:for:)` — Specifies the preferred foreground style of bars managed by SwiftUI.
- `toolbarRole(_:)` — Configures the semantic role for the content populating the toolbar.
- `toolbarTitleDisplayMode(_:)` — Configures the toolbar title display mode for this view.
- `toolbarTitleMenu(content:)` — Configures the toolbar title menu for this view.
- `toolbarVisibility(_:for:)` — Specifies the preferred visibility of a bar managed by SwiftUI.
- `ornament(visibility:attachmentAnchor:contentAlignment:ornament:)` — Presents an ornament.

## SwiftUI > Toolbars and Menus > ContextMenu

- `contextMenu(menuItems:)` — Adds a context menu to a view.
- `contextMenu(menuItems:preview:)` — Adds a context menu with a preview to a view.
- `contextMenu(forSelectionType:menu:primaryAction:)` — Adds a context menu to the view with a contextual primary action.
- `ContextMenu` — A container for views that you present as menu items in a contextual menu.
- `Divider` — A visual element that can be used to separate other content.

## SwiftUI > Toolbars and Menus > Commands

- `commands(content:)` — Adds commands to the scene.
- `commandsRemoved()` — Removes all commands defined by the modified app or scene.
- `commandsReplaced(content:)` — Replaces all commands defined by the modified app or scene with the commands from the builder.
- `CommandGroup` — Represents a group of related commands.
- `CommandGroupPlacement` — Defines standard locations in a command menu for a command group.
- `CommandMenu` — Represents a top-level command menu.
- `CommandsBuilder` — Constructs command sets from multi-expression closures.
- `Commands` — Conforming types represent a group of related commands that can be exposed to the user via the main menu on macOS and key commands on iOS.
- `EmptyCommands` — An empty group of commands.
- `SidebarCommands` — A group of commands that manipulate the sidebar.
- `TextEditingCommands` — A group of standard editing commands for use in text editing contexts.
- `TextFormattingCommands` — A group of commands that manipulate and transform text selections.
- `ToolbarCommands` — A group of commands for manipulating toolbars.
- `ImportFromDevicesCommands` — A group of commands that initiates an import from a device.
- `InspectorCommands` — A group of commands for manipulating inspectors.
- `PullDownButton` — A typealias for a menu (deprecated).

---

## SwiftUI > Animation and Effects > Animation

- `Animation` — The way a view changes over time to create a smooth visual transition.
- `Spring` — A representation of a spring's motion.
- `UnitCurve` — A function defined by a two-dimensional curve.
- `AnimationContext` — Contextual values that a custom animation can use to manage state and access a view's environment.
- `AnimationState` — A container that stores the state for a custom animation.
- `AnimationStateKey` — A key for accessing animation state values.
- `AnimationCompletionCriteria` — A criterion that determines when an animation completes.
- `AnimatablePair` — A pair of animatable values.
- `AnimatableValues` — A type that represents animatable values of an animation.
- `EmptyAnimatableData` — An empty type for animatable data.
- `Animatable` — A type that describes how to animate a property of a view.
- `AnimatableModifier` — A modifier that can animate.
- `VectorArithmetic` — A type that can serve as the animatable data of an animatable type.
- `CustomAnimation` — A protocol that defines a custom animation.
- `Transaction` — The context of the current state-processing update.
- `TransactionKey` — A key for accessing transaction values.
- `withAnimation(_:_:)` — Returns the result of recomputing the view's body with the provided animation.
- `withTransaction(_:_:)` — Returns the result of recomputing the view's body with the provided transaction.
- `animation(_:value:)` — Applies the given animation to this view when the specified value changes.
- `animation(_:body:)` — Applies the given animation to all animatable values within the closure.
- `transaction(_:)` — Applies the given transaction mutation function to all animations used within the view.
- `transaction(value:_:)` — Applies the given mutation function to the transaction applied to the view.
- `geometryGroup()` — Isolates the geometry of the view from its parent view.
- `TimelineView` — A view that updates according to a schedule that you provide.
- `TimelineSchedule` — A type that provides a sequence of dates for use as a schedule.
- `TimelineViewDefaultContext` — Information passed to a timeline view's content callback.

## SwiftUI > Animation and Effects > Transition

- `AnyTransition` — A type-erased transition.
- `Transition` — A description of view changes to apply when a view is added to or removed from the hierarchy.
- `TransitionProperties` — The properties a transition can have.
- `TransitionPhase` — An indication of which the current stage of a transition.
- `AsymmetricTransition` — A composite Transition that uses a different transition for insertion versus removal.
- `ContentTransition` — A kind of transition that applies to the content within a single view, rather than to the insertion or removal of a view.
- `transition(_:)` — Associates a transition with the view.
- `contentTransition(_:)` — Modifies the view to use a given transition as its method of animating changes to the contents of its views.
- `navigationTransition(_:)` — Sets the transition to use when pushing or popping a NavigationStack.
- `NavigationTransition` — A protocol for navigation transitions.
- `GlassEffectTransition` — A transition that applies a glass effect.
- `SymbolEffectTransition` — A transition that applies a symbol effect.

## SwiftUI > Animation and Effects > MatchedGeometry

- `matchedGeometryEffect(id:in:properties:anchor:isSource:)` — Defines a group of views with synchronized geometry using an identifier and namespace.
- `matchedTransitionSource(id:in:)` — Marks this view as the source of a matched geometry transition.
- `matchedTransitionSource(id:in:configuration:)` — Marks this view as the source of a matched geometry transition with configuration.
- `MatchedGeometryProperties` — A set of view properties that may be synchronized between views.
- `MatchedTransitionSourceConfiguration` — A configuration for a matched transition source.
- `EmptyMatchedTransitionSourceConfiguration` — An empty configuration for a matched transition source.
- `Namespace` — A dynamic property allowing access to a namespace.
- `KeyframeAnimator` — A view that animates its content with keyframes.
- `PhaseAnimator` — A container that animates its content by cycling through a series of phases.
- `KeyframeTimeline` — A description of the trajectory of a value over time.
- `KeyframeTrack` — A sequence of keyframes animating a single property of a root type.
- `KeyframeTrackContentBuilder` — A builder that combines keyframe content values into a single value.
- `KeyframesBuilder` — A builder that combines keyframe content values into a single value.
- `CubicKeyframe` — A keyframe that uses a cubic curve to smoothly interpolate between values.
- `LinearKeyframe` — A keyframe that uses simple linear interpolation.
- `MoveKeyframe` — A keyframe that immediately moves to the given value without interpolating.
- `SpringKeyframe` — A keyframe that uses a spring function to smoothly interpolate to the given value.
- `KeyframeTrackContent` — A group of keyframes that define an interpolation curve of an animatable value.
- `Keyframes` — A protocol that defines the implementation of all keyframe animations within a view hierarchy.
- `keyframeAnimator(initialValue:repeating:content:keyframes:)` — Loops the given keyframe animation indefinitely.
- `phaseAnimator(_:content:animation:)` — Animates effects that you apply to a view over a sequence of phases.

## SwiftUI > Animation and Effects > Canvas

- `Canvas` — A view type that supports immediate mode drawing.
- `GraphicsContext` — An immediate mode drawing destination, and its current state.
- `Shader` — A reference to a function in a Metal shader library, along with its bound uniform argument values.
- `ShaderFunction` — A reference to a function in a Metal shader library.
- `ShaderLibrary` — A Metal shader library.
- `visualEffect(_:)` — Applies effects to this view, while providing access to layout information via a geometry proxy.
- `visualEffect3D(_:)` — Applies 3D effects to this view.
- `colorEffect(_:isEnabled:)` — Returns a new view that applies shader to self as a filter effect on the color of each pixel.
- `distortionEffect(_:maxSampleOffset:isEnabled:)` — Returns a new view that applies shader to self as a geometric distortion effect on the location of each pixel.
- `layerEffect(_:maxSampleOffset:isEnabled:)` — Returns a new view that applies shader to self as a filter that acts on each layer as it is rendered.
- `VisualEffect` — Visual effects that you can apply to a view.
- `EmptyVisualEffect` — An empty visual effect.
- `drawingGroup(opaque:colorMode:)` — Composites this view's contents into an offscreen image before final display.
- `compositingGroup()` — Wraps this view in a compositing group.
- `blendMode(_:)` — Sets the blend mode for compositing this view with overlapping views.
- `blur(radius:opaque:)` — Applies a Gaussian blur to this view.
- `shadow(color:radius:x:y:)` — Adds a shadow to this view.
- `brightness(_:)` — Brightens this view by the specified amount.
- `contrast(_:)` — Sets the contrast and separation between similar colors in this view.
- `colorInvert()` — Inverts the colors in this view.
- `colorMultiply(_:)` — Adds a color multiplication effect to this view.
- `grayscale(_:)` — Adds a grayscale effect to this view.
- `hueRotation(_:)` — Applies a hue rotation effect to this view.
- `luminanceToAlpha()` — Adds a luminance to alpha effect to this view.
- `saturation(_:)` — Adjusts the color saturation of this view.
- `scaleEffect(_:anchor:)` — Scales this view's rendered output by the given amount in both the horizontal and vertical directions.
- `rotationEffect(_:anchor:)` — Rotates a view's rendered output in two dimensions around the specified point.
- `rotation3DEffect(_:anchor:)` — Rotates the view's content by the specified 3D rotation value.
- `transformEffect(_:)` — Applies an affine transformation to this view's rendered output.
- `projectionEffect(_:)` — Applies a projection transformation to this view's rendered output.
- `perspectiveRotationEffect(_:axis:anchor:anchorZ:perspective:)` — Rotates this view's rendered output around the specified axis.
- `ProjectionTransform` — A matrix for a 3D projection.
- `Angle` — A geometric angle whose value you access in either radians or degrees.
- `Axis` — The horizontal or vertical dimension in a 2D coordinate system.
- `ContentMode` — Constants that define how a view's content fills the available space.
- `aspectRatio(_:contentMode:)` — Constrains this view's dimensions to the specified aspect ratio.
- `scaledToFit()` — Scales this view to fit its parent.
- `scaledToFill()` — Scales this view to fill its parent.
- `clipShape(_:style:)` — Sets a clipping shape for this view.
- `clipped(antialiased:)` — Clips this view to its bounding frame.
- `mask(alignment:_:)` — Masks this view using the alpha channel of the given view.
- `border(_:width:)` — Adds a border to this view with the specified style and width.
- `materialActiveAppearance(_:)` — Sets the material active appearance for views within this view.
- `MaterialActiveAppearance` — A value that determines whether material-backed views appear active or inactive.

---

## SwiftUI > Accessibility > Labels and Descriptions

- `accessibilityLabel(_:)` — Adds a label to the view that describes its contents.
- `accessibilityLabel(_:isEnabled:)` — Conditionally adds an accessibility label to the view.
- `accessibilityLabel(content:)` — Adds an accessibility label to the view using a view builder.
- `accessibilityHint(_:)` — Communicates to the user what happens after performing the view's action.
- `accessibilityHint(_:isEnabled:)` — Conditionally communicates what happens after performing the view's action.
- `accessibilityValue(_:)` — Adds a textual description of the value that the view contains.
- `accessibilityValue(_:isEnabled:)` — Conditionally adds an accessibility value to the view.
- `accessibilityIdentifier(_:)` — Uses the specified string to identify the view.
- `accessibilityIdentifier(_:isEnabled:)` — Conditionally uses the specified string to identify the view.
- `accessibilityInputLabels(_:)` — Sets alternate input labels with which users identify a view.
- `accessibilityInputLabels(_:isEnabled:)` — Conditionally sets alternate input labels.
- `accessibilityHeading(_:)` — Sets the accessibility heading level for the view.
- `accessibilityTextContentType(_:)` — Sets an accessibility text content type to the view.
- `accessibilityCustomContent(_:_:importance:)` — Adds accessibility custom content to the view.
- `accessibilityLabeledPair(role:id:in:)` — Pairs an accessibility element representing a label with the element for the matching content.
- `speechAlwaysIncludesPunctuation(_:)` — Sets whether VoiceOver should always speak all punctuation in the text view.
- `speechSpellsOutCharacters(_:)` — Sets whether VoiceOver should speak the contents of the text view character by character.
- `speechAdjustedPitch(_:)` — Raises or lowers the pitch of spoken text.
- `speechAnnouncementsQueued(_:)` — Controls whether to queue pending announcements behind existing speech.
- `AccessibilityCustomContentKey` — A key for storing accessible custom content.
- `AccessibilityTextContentType` — Defines the semantic meaning for a text accessibility element.
- `AccessibilityHeadingLevel` — The level of accessibility provided by the text.
- `AccessibilityLabeledPairRole` — The role of an accessibility element in a labeled pair.
- `AXChartDescriptorRepresentable` — A type to generate an accessibility chart descriptor.
- `accessibilityChartDescriptor(_:)` — Adds a chart descriptor to a view for accessibility use cases.

## SwiftUI > Accessibility > Actions and Behavior

- `accessibilityAction(_:_:)` — Adds an accessibility action to the view.
- `accessibilityAction(named:_:)` — Adds an accessibility action to the view named by a localized string.
- `accessibilityAction(intent:label:)` — Adds an accessibility action with an App Intents action.
- `accessibilityActions(_:)` — Adds multiple accessibility actions to the view.
- `accessibilityAdjustableAction(_:)` — Adds an accessibility adjustable action to the view.
- `accessibilityScrollAction(_:)` — Adds an accessibility scroll action to the view.
- `accessibilityZoomAction(_:)` — Adds an accessibility zoom action to the view.
- `accessibilityActivationPoint(_:)` — Specifies the point where activating a view will occur.
- `accessibilityDragPoint(_:description:)` — Adds an accessibility drag operation.
- `accessibilityDropPoint(_:description:)` — Adds an accessibility drop operation.
- `accessibilityDirectTouch(_:options:)` — Specifies that the view should accept direct touch input for accessibility users.
- `accessibilityQuickAction(style:content:)` — Adds a quick accessibility action to the view.
- `accessibilityRespondsToUserInteraction(_:)` — Sets whether this view should be exposed to accessibility as an interactive element.
- `accessibilityFocused(_:)` — Modifies the accessibility focus behavior of the view.
- `accessibilityFocused(_:equals:)` — Modifies the accessibility focus behavior of the view.
- `AccessibilityFocusState` — A property wrapper type that you can use to read and write an accessibility focus state.
- `AccessibilityActionKind` — The type of accessibility action.
- `AccessibilityActionCategory` — The category for an accessibility action.
- `AccessibilityAdjustmentDirection` — Directions that an accessible view can be adjusted.
- `AccessibilityDirectTouchOptions` — Options for the direct touch accessibility feature.
- `AccessibilityZoomGestureAction` — An action that describes the orientation and direction of a zoom gesture.
- `AccessibilityQuickActionStyle` — A protocol for accessibility quick action styles.
- `accessibilityElement(children:)` — Replaces one or more accessibility elements for this view with a new accessibility element.
- `accessibilityHidden(_:)` — Specifies whether to hide this view from system accessibility features.
- `accessibilityChildren(children:)` — Replaces the existing accessibility element's children with a new accessibility element generated from a closure.
- `accessibilityRepresentation(representation:)` — Replaces the accessibility element generated by this view with a custom accessibility element.
- `accessibilityAddTraits(_:)` — Adds the given traits to the view.
- `accessibilityRemoveTraits(_:)` — Removes the given traits from this view.
- `AccessibilityTraits` — Accessibility traits that describe how an element behaves.
- `AccessibilityChildBehavior` — Behaviors that describe how an accessibility element behaves.
- `AccessibilityAttachmentModifier` — A modifier you apply to a view to describe the role of the view in accessibility.
- `AccessibilityTechnologies` — The structure that defines the types of assistive technologies available to the user.

## SwiftUI > Accessibility > Custom Content

- `accessibilityRotor(_:entries:)` — Adds a custom accessibility rotor entry to the view.
- `accessibilityRotor(_:textRanges:)` — Adds an accessibility rotor to the view.
- `accessibilityRotorEntry(id:in:)` — Adds a closure to provide a custom accessibility rotor entry for this view.
- `accessibilityLinkedGroup(id:in:)` — Specifies that the view should be grouped with another view for accessibility.
- `accessibilitySortPriority(_:)` — Sets the sort priority order for accessibility.
- `AccessibilityRotorEntry` — A type used to create multiple, discrete values for a specific rotors in an accessibility element's rotor.
- `AccessibilitySystemRotor` — Designates a Rotor that replaces one of the system-provided Rotors.
- `AccessibilityRotorContent` — Content within an accessibility rotor.
- `AccessibilityRotorContentBuilder` — A result builder for accessibility rotor content.
- `accessibilityIgnoresInvertColors(_:)` — Sets whether this view should always accept system invert-colors.
- `accessibilityShowsLargeContentViewer()` — Specifies whether to show the large content viewer for this view.
- `accessibilityShowsLargeContentViewer(_:)` — Conditionally shows the large content viewer for this view.
- `LegibilityWeight` — The weight to apply to text.
- `AssistiveAccess` — Describes settings related to Assistive Access.

---

## SwiftUI > Gestures and Input > Gestures

- `TapGesture` — A gesture that recognizes one or more taps.
- `SpatialTapGesture` — A gesture that recognizes one or more taps and reports their location.
- `LongPressGesture` — A gesture that succeeds when the user performs a long press.
- `DragGesture` — A dragging motion that invokes an action as the drag-event sequence changes.
- `MagnifyGesture` — A gesture that recognizes a magnification motion and tracks the amount of magnification.
- `MagnificationGesture` — A gesture that recognizes a magnification motion (deprecated).
- `RotateGesture` — A gesture that recognizes a rotation motion and tracks the angle of the rotation.
- `RotateGesture3D` — A gesture that recognizes 3D rotation motion.
- `RotationGesture` — A gesture that recognizes a rotation motion (deprecated).
- `SpatialEventGesture` — A gesture that provides information about ongoing spatial events.
- `SpatialEventCollection` — A collection of spatial events.
- `WindowDragGesture` — A gesture that recognizes a drag motion on a window.
- `SequenceGesture` — A gesture that's a sequence of two gestures.
- `SimultaneousGesture` — A gesture containing two gestures that can happen at the same time.
- `ExclusiveGesture` — A gesture that contains two gestures, where only one of them can succeed at a time.
- `AnyGesture` — A type-erased gesture value.
- `Gesture` — An instance that matches a sequence of events to a gesture.
- `GestureState` — A property wrapper type that updates a property while the user performs a gesture.
- `GestureStateGesture` — A gesture that updates the state provided by a gesture state property.
- `GestureMask` — Options that control how adding a gesture to a view affects other gestures recognized by the view and its subviews.
- `gesture(_:)` — Attaches a gesture to the view.
- `highPriorityGesture(_:including:)` — Attaches a gesture to the view with a higher precedence than gestures defined by the view.
- `simultaneousGesture(_:including:)` — Attaches a gesture to the view, making it process simultaneously with gestures defined by the view.
- `onTapGesture(count:coordinateSpace:perform:)` — Adds an action to perform when this view recognizes a tap gesture.
- `onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:)` — Adds an action to perform when this view recognizes a long-press gesture.

## SwiftUI > Gestures and Input > FocusState

- `FocusState` — A property wrapper type that can read and write a value that SwiftUI updates as the placement of focus within the scene changes.
- `FocusedValue` — A property wrapper for observing values from the focused view or one of its ancestors.
- `FocusedBinding` — A convenience property wrapper for observing and automatically unwrapping state bindings.
- `FocusedObject` — A property wrapper type for an observable object supplied by the focused view or one of its ancestors.
- `FocusedValues` — A collection of state exported by the focused view and its ancestors.
- `FocusedValueKey` — A protocol for identifier types used when publishing and observing focused values.
- `ResetFocusAction` — An action that requests the focus system to reevaluate default focus.
- `DefaultFocusEvaluationPriority` — A priority that determines the focus order for a focus scope if no explicit focus is set.
- `FocusInteractions` — A set of view types that may become focused.
- `AccessibilityFocusState` — A property wrapper type for accessibility focus state.
- `focused(_:)` — Modifies this view by binding its focus state to the given state value.
- `focused(_:equals:)` — Modifies this view by binding its focus state to the given state value.
- `focusable(_:)` — Specifies if the view is focusable.
- `focusable(_:interactions:)` — Specifies whether the view is focusable and, if so, what focus interactions it supports.
- `focusEffectDisabled(_:)` — Sets whether the view participates in focus effects.
- `focusScope(_:)` — Creates a focus scope for the view.
- `focusSection()` — Indicates that the view's frame and cohort of focusable descendants should be used to guide focus movement.
- `defaultFocus(_:_:priority:)` — Defines a region of the window in which default focus is evaluated by assigning a value to a given focus state binding.
- `focusedValue(_:)` — Specifies a modifier to indicate the modified view exports a value and accepts updates to an optional value from the focused view hierarchy.
- `focusedValue(_:_:)` — Specifies a modifier to indicate the modified view exports a value and accepts updates to the value from the focused view hierarchy.
- `focusedSceneValue(_:)` — Specifies a modifier to indicate the modified view exports a value and accepts updates from the focused view hierarchy while in the active scene.
- `focusedSceneValue(_:_:)` — Specifies a modifier to indicate the modified view exports a value and accepts updates from the focused view hierarchy while in the active scene.
- `focusedSceneObject(_:)` — Creates a new view that exposes the provided object to other views whose state depends on the focused scene.
- `focusedObject(_:)` — Creates a new view that exposes the provided object to other views whose state depends on the active focus.
- `prefersDefaultFocus(_:in:)` — Indicates that the view should receive focus by default for a given namespace.
- `searchFocused(_:)` — Modifies this view by binding its focus state to a search field's focus state.

## SwiftUI > Gestures and Input > Keyboard

- `KeyboardShortcut` — Combinations of keys on a keyboard that the user can press in order to activate a button or toggle.
- `KeyEquivalent` — Key equivalents consist of a letter, punctuation, or function key combinable with optional modifier keys.
- `EventModifiers` — A set of key modifiers that you can add to a gesture.
- `KeyPress` — A value that describes a keyboard input to a focused view.
- `keyboardShortcut(_:)` — Assigns a keyboard shortcut to the modified control.
- `keyboardShortcut(_:modifiers:)` — Assigns a keyboard shortcut to the modified control.
- `onKeyPress(_:action:)` — Performs an action if the user presses a key on a hardware keyboard.
- `onKeyPress(keys:phases:action:)` — Performs an action if the user presses one of a set of keys on a hardware keyboard.
- `onCommand(_:perform:)` — Adds an action to perform in response to the given selector.
- `onDeleteCommand(perform:)` — Adds an action to perform in response to the system's Delete command.
- `onMoveCommand(perform:)` — Adds an action to perform in response to a move command.
- `onExitCommand(perform:)` — Sets up an action that triggers in response to receiving the exit command while the view has focus.
- `copyable(_:)` — Adds the provided items to the clipboard when the view is copied.
- `cuttable(for:action:)` — Enables the cut command to cut the items you provide from the view.
- `pasteDestination(for:action:validator:)` — Enables the view to receive paste commands.
- `onCopyCommand(perform:)` — Adds an action to perform in response to the system's Copy command.
- `onCutCommand(perform:)` — Adds an action to perform in response to the system's Cut command.
- `onPasteCommand(of:perform:)` — Adds an action to perform in response to the system's Paste command.

---

## Resolution log (locked 2026-05-07)

Phase 1 checkpoint resolutions for the previously-unmapped folders:

- **`environment-values/` (165 docs)** — ✅ A1 RESOLVED: TRIMMED. Environment leaf added with 3 anchor tiles (`EnvironmentValues`, `Environment`, `EnvironmentKey`); 162 individual environment property docs DEFERRED to post-V1.
- **`model-data/` (11 docs)** — ✅ A2 RESOLVED: State and Bindings leaf added (11 tiles).
- **`custom-layout/` (14 docs)** — ✅ A3 RESOLVED: Custom Layout leaf added (14 tiles).
- **`appkit-integration/` (13 docs)** — ✅ A4 RESOLVED: AppKit Integration leaf added (13 tiles).
- **`view-fundamentals/` (25 docs)** — ✅ A5 RESOLVED: minimal View Fundamentals leaf added (5 tiles: `AnyView`, `EmptyView`, plus description-only `View`, `ViewModifier`, `ViewBuilder`); other 20 docs DEFERRED.
- **`view-styles/` (73 docs)** — ✅ A8 RESOLVED: NO Glass Effects page. macOS 26 Liquid Glass APIs (`GlassBackgroundEffect`, `GlassEffectContainer`, `GlassEffectTransition`, `GlassButtonStyle`, `GlassProminentButtonStyle`) stay scattered as tiles on Button / Canvas / etc. Other style protocols + configuration structs route as tiles to existing control pages (Button, Toggle, Picker, etc.).
- **`view-configuration/` (25 docs)** — Route as tiles onto host control pages. No standalone page (per pre-checkpoint sort).
- **`accessible-appearance/` (5 docs)** — Route `LegibilityWeight`, `AssistiveAccess` as tiles to Accessibility > Custom Content (already routed pre-checkpoint).

Deferred entirely (D acknowledged):

- **`technology-specific-views/` (112 docs)** — MapKit/StoreKit/HealthKit/PhotosPicker/TipKit/WebKit/Wallet integration; out-of-scope for a macOS SwiftUI primitive gallery.
- **`uikit-integration/` (14 docs)** — UIKit bridges; non-macOS stack.
- **`watchkit-integration/` (4 docs)** — WatchKit only.
- **`immersive-spaces/` (22 docs)** — visionOS only.
- **`previews-in-xcode/` (22 docs)** — Developer tooling.
- **`app-extensions/` (19 docs)** — Widget/ControlWidget extension infrastructure.
- **`system-events/` (17 docs)** — Background tasks, URL handling, NSUserActivity — non-visual.
- **`persistent-storage/` (8 docs)** — `AppStorage`, `SceneStorage`, `FetchRequest`. Data layer, not UI.
- **`preferences/` (11 docs)** — Internal layout preference protocol.

Other / open:

- **`essentials/` (1 sampleCode doc)** — C11 controller pass evaluates.
- `CaptionTextFormat`, `DragState`, `TransferRepresentation`, `Transferable` — No type-doc in mirror; DEFERRED.
- `LinearGradient`, `RadialGradient`, `AngularGradient` — ✅ B10 CLOSED 2026-05-07. Captured to `Documentation/SwiftUI/drawing-and-graphics/{lineargradient,radialgradient,angulargradient}.md`; 3 tiles added to Gradient page (14 → 17). See manifest section above.
- **13 SwiftUI `kind: sampleCode` docs** — ✅ C11 controller pass evaluates each on merit (Phase 0c rule). Outcomes appended to `sort-decisions-swiftui.md`.
