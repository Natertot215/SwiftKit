---
url: https://developer.apple.com/documentation/swiftui/environmentvalues
framework: SwiftUI
category: Environment values
title: EnvironmentValues
kind: struct
captured: 2026-05-02
---

# EnvironmentValues

A collection of environment values propagated through a view hierarchy.

## Declaration

```swift
struct EnvironmentValues
```

### Overview

SwiftUI exposes a collection of values to your app’s views in an `EnvironmentValues` structure. To read a value from the structure, declare a property using the `Environment` property wrapper and specify the value’s key path. For example, you can read the current locale:

```swift
@Environment(\.locale) var locale: Locale
```

Use the property you declare to dynamically control a view’s layout. SwiftUI automatically sets or updates many environment values, like `EnvironmentValues/pixelLength`, `EnvironmentValues/scenePhase`, or `EnvironmentValues/locale`, based on device characteristics, system state, or user settings. For others, like `EnvironmentValues/lineLimit`, SwiftUI provides a reasonable default value.

You can set or override some values using the `View/environment(_:_:)` view modifier:

```swift
MyView()
    .environment(\.lineLimit, 2)
```

The value that you set affects the environment for the view that you modify — including its descendants in the view hierarchy — but only up to the point where you apply a different environment modifier.

SwiftUI provides dedicated view modifiers for setting some values, which typically makes your code easier to read. For example, rather than setting the `EnvironmentValues/lineLimit` value directly, as in the previous example, you should instead use the `View/lineLimit(_:)` modifier:

```swift
MyView()
    .lineLimit(2)
```

In some cases, using a dedicated view modifier provides additional functionality. For example, you must use the `View/preferredColorScheme(_:)` modifier rather than setting `EnvironmentValues/colorScheme` directly to ensure that the new value propagates up to the presenting container when presenting a view like a popover:

```swift
MyView()
    .popover(isPresented: $isPopped) {
        PopoverContent()
            .preferredColorScheme(.dark)
    }
```

Create a custom environment value by declaring a new property in an extension to the environment values structure and applying the `Entry()` macro to the variable declaration:

```swift
extension EnvironmentValues {
    @Entry var myCustomValue: String = "Default value"
}

extension View {
    func myCustomValue(_ myCustomValue: String) -> some View {
        environment(\.myCustomValue, myCustomValue)
    }
}
```

Clients of your value then access the value in the usual way, reading it with the `Environment` property wrapper, and setting it with the `myCustomValue` view modifier.





## Relationships

**Conforms To**: `CustomStringConvertible`

## Availability

- iOS 13.0
- iPadOS 13.0
- Mac Catalyst 13.0
- macOS 10.15
- tvOS 13.0
- visionOS 1.0
- watchOS 6.0

## Topics

### Creating and accessing values

- `init()`
- `subscript(_:)`
- `description`

### Accessibility

- `accessibilityAssistiveAccessEnabled`
- `accessibilityDimFlashingLights`
- `accessibilityDifferentiateWithoutColor`
- `accessibilityEnabled`
- `accessibilityInvertColors`
- `accessibilityLargeContentViewerEnabled`
- `accessibilityPlayAnimatedImages`
- `accessibilityPrefersHeadAnchorAlternative`
- `accessibilityQuickActionsEnabled`
- `accessibilityReduceMotion`
- `accessibilityReduceTransparency`
- `accessibilityShowButtonShapes`
- `accessibilitySwitchControlEnabled`
- `accessibilityVoiceOverEnabled`
- `legibilityWeight`

### Actions

- `dismiss`
- `dismissSearch`
- `dismissWindow`
- `openImmersiveSpace`
- `dismissImmersiveSpace`
- `newDocument`
- `openDocument`
- `openURL`
- `openWindow`
- `pushWindow`
- `purchase`
- `refresh`
- `rename`
- `resetFocus`
- `openSettings`

### Authentication

- `authorizationController`
- `webAuthenticationSession`

### Controls and input

- `buttonRepeatBehavior`
- `controlSize`
- `defaultWheelPickerItemHeight`
- `keyboardShortcut`
- `menuIndicatorVisibility`
- `menuOrder`
- `searchSuggestionsPlacement`
- `preferredPencilDoubleTapAction`
- `preferredPencilSqueezeAction`

### Display characteristics

- `appearsActive`
- `colorScheme`
- `colorSchemeContrast`
- `displayScale`
- `horizontalSizeClass`
- `imageScale`
- `pixelLength`
- `sidebarRowSize`
- `verticalSizeClass`
- `immersiveSpaceDisplacement`
- `labelsVisibility`
- `materialActiveAppearance`
- `TabBarPlacement`
- `toolbarLabelStyle`

### Global objects

- `calendar`
- `documentConfiguration`
- `locale`
- `managedObjectContext`
- `modelContext`
- `timeZone`
- `undoManager`

### Scrolling

- `isScrollEnabled`
- `horizontalScrollIndicatorVisibility`
- `verticalScrollIndicatorVisibility`
- `scrollDismissesKeyboardMode`
- `horizontalScrollBounceBehavior`
- `verticalScrollBounceBehavior`

### State

- `editMode`
- `isActivityFullscreen`
- `isEnabled`
- `isFocused`
- `isFocusEffectEnabled`
- `isHoverEffectEnabled`
- `isLuminanceReduced`
- `isPresented`
- `isSceneCaptured`
- `isSearching`
- `isTabBarShowingSections`
- `scenePhase`
- `supportsMultipleWindows`

### StoreKit configuration

- `displayStoreKitMessage`
- `requestReview`

### Text styles

- `allowsTightening`
- `autocorrectionDisabled`
- `dynamicTypeSize`
- `font`
- `layoutDirection`
- `lineLimit`
- `lineSpacing`
- `minimumScaleFactor`
- `multilineTextAlignment`
- `textCase`
- `truncationMode`
- `textSelectionAffinity`

### View attributes

- `allowedDynamicRange`
- `backgroundMaterial`
- `backgroundProminence`
- `backgroundStyle`
- `badgeProminence`
- `contentTransition`
- `contentTransitionAddsDrawingGroup`
- `defaultMinListHeaderHeight`
- `defaultMinListRowHeight`
- `headerProminence`
- `physicalMetrics`
- `realityKitScene`
- `realityViewCameraControls`
- `redactionReasons`
- `springLoadingBehavior`
- `symbolRenderingMode`
- `symbolVariants`
- `worldTrackingLimitations`

### Widgets

- `showsWidgetContainerBackground`
- `showsWidgetLabel`
- `widgetFamily`
- `widgetRenderingMode`
- `widgetContentMargins`

### Deprecated environment values

- `disableAutocorrection`
- `sizeCategory`
- `presentationMode`
- `PresentationMode`
- `complicationRenderingMode`
- `controlActiveState`

### Instance Properties

- `accessibilityReduceHighlightingEffects`
- `accessibilityShowBorders`
- `activityFamily`
- `askPermission`
- `buttonSizing`
- `credentialDataManager`
- `credentialExportManager`
- `credentialImportManager`
- `devicePickerSupports`
- `findContext`
- `fontResolutionContext`
- `imagePlaygroundAllowedGenerationStyles`
- `imagePlaygroundOptions`
- `imagePlaygroundPersonalizationPolicy`
- `imagePlaygroundSelectedGenerationStyle`
- `isActivityUpdateReduced`
- `isUserAuthenticationEnabled`
- `labelIconToTitleSpacing`
- `labelReservedIconWidth`
- `levelOfDetail`
- `lineHeight`
- `navigationLinkIndicatorVisibility`
- `remoteDeviceIdentifier`
- `requestAgeRange`
- `requestAppDeletion`
- `showSignificantUpdateAcknowledgment`
- `supportedActivityFamilies`
- `supportsImagePlayground`
- `supportsRemoteScenes`
- `surfaceSnappingInfo`
- `symbolColorRenderingMode`
- `symbolVariableValueMode`
- `tabBarPlacement`
- `tabViewBottomAccessoryPlacement`
- `windowClippingMargins`
- `writingToolsBehavior`

## See Also

- `Environment`
