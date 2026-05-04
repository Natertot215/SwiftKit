# Triage Part A — scenes / windows / immersive_spaces / navigation / modal_presentations

> Generated 2026-05-03. Covers Catalog+SwiftUI.swift lines 1-285.
> Already-wired leaves (pageBuilder: .real) are skipped — only .placeholder leaves are classified.
> modal_presentations: zero placeholder leaves; all are already wired — section omitted below.

---

## Implement

| Leaf id | API | Section |
|---|---|---|
| swiftui.navigation.tabitem(_:) | View/tabItem(_:) | navigation |
| swiftui.scenes.settingslink | SettingsLink | scenes |

---

## Describe

### scenes

| Leaf id | API | Reason |
|---|---|---|
| swiftui.scenes.building-and-customizing-the-menu-bar-with-swiftui | Building and customizing the menu bar with SwiftUI | article — no renderable component |
| swiftui.scenes.commands(content:) | Scene/commands(content:) | Scene-only modifier |
| swiftui.scenes.menubarextra | MenuBarExtra | Scene-only (App.body scope) |
| swiftui.scenes.menubarextrastyle(_:) | Scene/menuBarExtraStyle(_:) | Scene-only modifier |
| swiftui.scenes.menubarextrastyle | MenuBarExtraStyle | protocol, Scene-level |
| swiftui.scenes.opensettings | EnvironmentValues/openSettings | env-value |
| swiftui.scenes.opensettingsaction | OpenSettingsAction | action type, not a renderable view |
| swiftui.scenes.scene | Scene | protocol — App.body scope, not a child view |
| swiftui.scenes.scenebuilder | SceneBuilder | result-builder — App.body scope |
| swiftui.scenes.scenephase | EnvironmentValues/scenePhase | env-value |
| swiftui.scenes.scenephase.type | ScenePhase | enum type only, no rendering |
| swiftui.scenes.settings | Settings | Scene-only (App.body scope) |
| swiftui.scenes.wknotificationscene | WKNotificationScene | watchOS-only |

### windows

| Leaf id | API | Reason |
|---|---|---|
| swiftui.windows.defaultworldscaling(_:) | Scene/defaultWorldScaling(_:) | visionOS-only Scene modifier |
| swiftui.windows.onvolumeviewpointchange(updatestrategy:initial:_:) | View/onVolumeViewpointChange(updateStrategy:initial:_:) | visionOS-only |
| swiftui.windows.squareazimuth | SquareAzimuth | visionOS-only type |
| swiftui.windows.supportedvolumeviewpoints(_:) | View/supportedVolumeViewpoints(_:) | visionOS-only |
| swiftui.windows.surfacesnappinginfo | SurfaceSnappingInfo | visionOS-only type |
| swiftui.windows.viewpoint3d | Viewpoint3D | visionOS-only type |
| swiftui.windows.volumeworldalignment(_:) | Scene/volumeWorldAlignment(_:) | visionOS-only Scene modifier |
| swiftui.windows.volumeviewpointupdatestrategy | VolumeViewpointUpdateStrategy | visionOS-only type |
| swiftui.windows.worldalignmentbehavior | WorldAlignmentBehavior | visionOS-only type |
| swiftui.windows.worldscalingbehavior | WorldScalingBehavior | visionOS-only type |
| swiftui.windows.worldscalingcompensation | WorldScalingCompensation | visionOS-only type |
| swiftui.windows.worldtrackinglimitation | WorldTrackingLimitation | env/spatial type — not a renderable view |
| swiftui.windows.worldtrackinglimitations | EnvironmentValues/worldTrackingLimitations | env-value |

### immersive_spaces

| Leaf id | API | Reason |
|---|---|---|
| swiftui.immersive-spaces.dismissimmersivespace | EnvironmentValues/dismissImmersiveSpace | env-value |
| swiftui.immersive-spaces.dismissimmersivespaceaction | DismissImmersiveSpaceAction | action type, not a renderable view |
| swiftui.immersive-spaces.full | ImmersionStyle/full | spatial enum case — macOS 26 but non-renderable in child view |
| swiftui.immersive-spaces.immersionchangecontext | ImmersionChangeContext | spatial context struct — not a renderable view |
| swiftui.immersive-spaces.immersionstyle | ImmersionStyle | protocol — Scene-level |
| swiftui.immersive-spaces.immersionstyle(selection:in:) | Scene/immersionStyle(selection:in:) | Scene-only modifier |
| swiftui.immersive-spaces.immersivecontentbrightness | ImmersiveContentBrightness | visionOS-only type |
| swiftui.immersive-spaces.immersivecontentbrightness(_:) | Scene/immersiveContentBrightness(_:) | visionOS-only Scene modifier |
| swiftui.immersive-spaces.immersiveenvironmentbehavior | ImmersiveEnvironmentBehavior | visionOS-only type |
| swiftui.immersive-spaces.immersiveenvironmentpicker(content:) | View/immersiveEnvironmentPicker(content:) | visionOS-only |
| swiftui.immersive-spaces.immersivespace | ImmersiveSpace | visionOS-only Scene type |
| swiftui.immersive-spaces.immersivespacecontentbuilder | ImmersiveSpaceContentBuilder | result-builder — Scene-level |
| swiftui.immersive-spaces.immersivespacedisplacement | EnvironmentValues/immersiveSpaceDisplacement | visionOS-only env-value |
| swiftui.immersive-spaces.mixed | ImmersionStyle/mixed | visionOS-only enum case |
| swiftui.immersive-spaces.onimmersionchange(initial:_:) | View/onImmersionChange(initial:_:) | visionOS-only |
| swiftui.immersive-spaces.openimmersivespace | EnvironmentValues/openImmersiveSpace | env-value |
| swiftui.immersive-spaces.openimmersivespaceaction | OpenImmersiveSpaceAction | action type, not a renderable view |
| swiftui.immersive-spaces.progressive | ImmersionStyle/progressive | spatial enum case — non-renderable in child view |
| swiftui.immersive-spaces.progressiveimmersionaspectratio | ProgressiveImmersionAspectRatio | spatial struct — non-renderable |
| swiftui.immersive-spaces.remotedeviceidentifier | RemoteDeviceIdentifier | identifier struct — non-renderable |
| swiftui.immersive-spaces.remoteimmersivespace | RemoteImmersiveSpace | Scene-only (App.body scope) |
| swiftui.immersive-spaces.upperlimbvisibility(_:) | Scene/upperLimbVisibility(_:) | visionOS-only Scene modifier |
| swiftui.immersive-spaces.upperlimbvisibility(_:).modifier | View/upperLimbVisibility(_:) | visionOS-only |

### navigation

| Leaf id | API | Reason |
|---|---|---|
| swiftui.navigation.adaptabletabbarplacement | AdaptableTabBarPlacement | iOS-only type (paired modifier is iOS-only) |
| swiftui.navigation.defaultadaptabletabbarplacement(_:) | View/defaultAdaptableTabBarPlacement(_:) | iOS-only |
| swiftui.navigation.istabbarshowingsections | EnvironmentValues/isTabBarShowingSections | env-value |
| swiftui.navigation.navigationbarbackbuttonhidden(_:) | View/navigationBarBackButtonHidden(_:) | no visible effect on macOS (iOS nav bar concept) |
| swiftui.navigation.navigationbaritem | NavigationBarItem | iOS/visionOS-only type |
| swiftui.navigation.navigationbartitledisplaymode(_:) | View/navigationBarTitleDisplayMode(_:) | iOS/visionOS-only |
| swiftui.navigation.tabbarminimizebehavior | TabBarMinimizeBehavior | type only — not a renderable view |
| swiftui.navigation.tabbarplacement | EnvironmentValues/tabBarPlacement | env-value |
| swiftui.navigation.tabbarplacement.type | TabBarPlacement | type only — not a renderable view |
| swiftui.navigation.tabviewbottomaccessoryplacement | TabViewBottomAccessoryPlacement | type only — not a renderable view |

### modal_presentations

_No placeholder leaves — all items already wired in PageRegistry._
