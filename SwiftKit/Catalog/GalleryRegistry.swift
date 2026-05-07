import SwiftUI

/// Aggregates every `GalleryItem` declared by a gallery page.
///
/// **Reading:** the sidebar (`SidebarView`) reads `byFramework`; selection
/// resolution (`RootView`) reads `item(forID:)`. Those are the only two
/// public entry points — both derive from `allItems`.
///
/// **Writing a new page:**
/// 1. Author the SwiftUI view under `Pages/<framework>/<folder>/`.
/// 2. Declare `static let item: GalleryItem` in an extension on the view.
/// 3. Append `<PageStruct>.item` to `allItems` below, in the appropriate
///    framework + folder section.
///
/// Keep `allItems` a flat array literal (no nested computed sections) to
/// satisfy L-011 — large nested SwiftUI trees blow up SwiftUI type-checking.
@MainActor
enum GalleryRegistry {
    /// All gallery items registered so far. Sidebar groups by `folder`.
    static let allItems: [GalleryItem] = [
        // Shapes & Drawing — Phase A pilot
        AnyShapeGalleryPage.item,
        CapsuleGalleryPage.item,
        CircleGalleryPage.item,
        EllipseGalleryPage.item,
        RectangleGalleryPage.item,
        RoundedRectangleGalleryPage.item,
        UnevenRoundedRectangleGalleryPage.item,

        // Modal Presentations — Phase B2
        AlertGalleryPage.item,
        ConfirmationDialogGalleryPage.item,
        DialogSuppressionGalleryPage.item,
        DismissalConfirmationDialogGalleryPage.item,
        FileImporterGalleryPage.item,
        FullScreenCoverGalleryPage.item,
        InspectorGalleryPage.item,
        PopoverGalleryPage.item,
        SheetGalleryPage.item,

        // Animations — Phase B2
        AnimatableGalleryPage.item,
        AnimatableModifierGalleryPage.item,
        AnimationGalleryPage.item,
        AnyTransitionGalleryPage.item,
        ContentTransitionGalleryPage.item,
        CustomAnimationGalleryPage.item,
        GeometryEffectGalleryPage.item,
        GeometryGroupGalleryPage.item,
        KeyframeAnimatorGalleryPage.item,
        MatchedGeometryEffectGalleryPage.item,
        MatchedTransitionSourceGalleryPage.item,
        NamespaceGalleryPage.item,
        NavigationTransitionGalleryPage.item,
        PhaseAnimatorGalleryPage.item,
        PlaceholderContentViewGalleryPage.item,
        SpringGalleryPage.item,
        TimelineViewGalleryPage.item,
        TransactionGalleryPage.item,
        TransitionGalleryPage.item,
        UnitCurveGalleryPage.item,

        // Text Input And Output — Phase B2
        AttributedTextFormattingGalleryPage.item,
        BoldGalleryPage.item,
        BuildingRichSwiftUITextExperiencesGalleryPage.item,
        DynamicTypeSizeGalleryPage.item,
        FontGalleryPage.item,
        ItalicGalleryPage.item,
        LabelGalleryPage.item,
        LineLayoutGalleryPage.item,
        LocalizedStringKeyGalleryPage.item,
        MonospacedGalleryPage.item,
        SecureFieldGalleryPage.item,
        StrikethroughGalleryPage.item,
        SystemFormatStyleGalleryPage.item,
        TextCaseGalleryPage.item,
        TextEditorGalleryPage.item,
        TextFieldGalleryPage.item,
        TextGalleryPage.item,
        TextInputDictationGalleryPage.item,
        TextInputGalleryPage.item,
        TextMetricsGalleryPage.item,
        TextRendererGalleryPage.item,
        TextScaleGalleryPage.item,
        TextSelectionGalleryPage.item,
        TextVariantPreferenceGalleryPage.item,
        TypesettingLanguageGalleryPage.item,
        UnderlineGalleryPage.item,
        WritingToolsBehaviorGalleryPage.item,

        // Drawing And Graphics — Phase B2
        AddRichGraphicsGalleryPage.item,
        AnchorGalleryPage.item,
        AngleGalleryPage.item,
        AxisGalleryPage.item,
        BlendModeGalleryPage.item,
        BlurGalleryPage.item,
        BorderGalleryPage.item,
        CanvasGalleryPage.item,
        ClippingGalleryPage.item,
        ColorEffectsGalleryPage.item,
        ColorGalleryPage.item,
        CompositingGroupGalleryPage.item,
        CompositorContentGalleryPage.item,
        CoordinateSpaceGalleryPage.item,
        GeometryReaderGalleryPage.item,
        GradientGalleryPage.item,
        GraphicsContextGalleryPage.item,
        MaterialActiveAppearanceGalleryPage.item,
        PhysicalMetricGalleryPage.item,
        RotationEffectGalleryPage.item,
        ScaleEffectGalleryPage.item,
        ShaderGalleryPage.item,
        ShadowStyleGalleryPage.item,
        ShapeStyleGalleryPage.item,
        TransformEffectGalleryPage.item,
        UnitPointGalleryPage.item,
        VisualEffectGalleryPage.item,

        // Windows — Phase B3
        ControlActiveStateGalleryPage.item,
        DismissWindowGalleryPage.item,
        OpenWindowGalleryPage.item,
        SceneLaunchBehaviorGalleryPage.item,
        SceneRestorationBehaviorGalleryPage.item,
        UtilityWindowGalleryPage.item,
        VolumeViewpointGalleryPage.item,
        WindowGalleryPage.item,
        WindowGroupGalleryPage.item,
        WindowInteractionBehaviorGalleryPage.item,
        WindowLevelGalleryPage.item,
        WindowManagerRoleGalleryPage.item,
        WindowPlacementGalleryPage.item,
        WindowSizingGalleryPage.item,
        WindowStyleGalleryPage.item,
        WindowToolbarStyleGalleryPage.item,
        WindowVisibilityToggleGalleryPage.item,

        // Navigation — Phase B3
        HSplitViewGalleryPage.item,
        NavigationBarItemGalleryPage.item,
        NavigationDestinationGalleryPage.item,
        NavigationLinkGalleryPage.item,
        NavigationPathGalleryPage.item,
        NavigationSplitViewGalleryPage.item,
        NavigationStackGalleryPage.item,
        NavigationTitleGalleryPage.item,
        NavigationViewGalleryPage.item,
        SidebarRowSizeGalleryPage.item,
        TabViewGalleryPage.item,
        VSplitViewGalleryPage.item,

        // Toolbars — Phase B3
        OrnamentGalleryPage.item,
        ToolbarCustomizationGalleryPage.item,
        ToolbarGalleryPage.item,
        ToolbarRoleGalleryPage.item,

        // Search — Phase B3
        SearchableGalleryPage.item,

        // Lists — Phase B3
        BadgeGalleryPage.item,
        DisclosureGroupGalleryPage.item,
        EditableListGalleryPage.item,
        ForEachGalleryPage.item,
        ListGalleryPage.item,
        OutlineGroupGalleryPage.item,
        RefreshableGalleryPage.item,
        SelectionDisabledGalleryPage.item,
        SwipeActionsGalleryPage.item,

        // Scroll Views — Phase B3
        DefaultScrollAnchorGalleryPage.item,
        ScrollBounceBehaviorGalleryPage.item,
        ScrollClipDisabledGalleryPage.item,
        ScrollContentBackgroundGalleryPage.item,
        ScrollDisabledGalleryPage.item,
        ScrollDismissesKeyboardModeGalleryPage.item,
        ScrollEdgeEffectGalleryPage.item,
        ScrollGeometryGalleryPage.item,
        ScrollIndicatorsGalleryPage.item,
        ScrollInputBehaviorGalleryPage.item,
        ScrollPhaseGalleryPage.item,
        ScrollPositionGalleryPage.item,
        ScrollTargetBehaviorGalleryPage.item,
        ScrollTransitionGalleryPage.item,
        ScrollViewGalleryPage.item,
        ScrollViewReaderGalleryPage.item,
        ScrollVisibilityGalleryPage.item,

        // Input Events — Phase B3
        CommandActionsGalleryPage.item,
        ContentShapeGalleryPage.item,
        DigitalCrownAccessoryGalleryPage.item,
        DigitalCrownRotationGalleryPage.item,
        HandPointerBehaviorGalleryPage.item,
        HoverEffectGalleryPage.item,
        HoverGalleryPage.item,
        KeyboardInputGalleryPage.item,
        OnCameraCaptureEventGalleryPage.item,
        OnSubmitGalleryPage.item,
        PointerStyleGalleryPage.item,
        TouchBarGalleryPage.item,

        // Scenes — Phase B4
        MenuBarExtraGalleryPage.item,
        OpenSettingsActionGalleryPage.item,
        SceneBuilderGalleryPage.item,
        SceneGalleryPage.item,
        ScenePhaseGalleryPage.item,
        SettingsGalleryPage.item,
        SettingsLinkGalleryPage.item,
        WKNotificationSceneGalleryPage.item,

        // Immersive Spaces — Phase B4
        DismissImmersiveSpaceGalleryPage.item,
        ImmersionStyleGalleryPage.item,
        ImmersiveContentBrightnessGalleryPage.item,
        ImmersiveEnvironmentBehaviorGalleryPage.item,
        ImmersiveEnvironmentPickerGalleryPage.item,
        ImmersiveSpaceContentBuilderGalleryPage.item,
        ImmersiveSpaceDisplacementGalleryPage.item,
        ImmersiveSpaceGalleryPage.item,
        OnImmersionChangeGalleryPage.item,
        OpenImmersiveSpaceGalleryPage.item,
        ProgressiveImmersionAspectRatioGalleryPage.item,
        RemoteDeviceIdentifierGalleryPage.item,
        RemoteImmersiveSpaceGalleryPage.item,
        UpperLimbVisibilityGalleryPage.item,

        // View Fundamentals — Phase B4
        EquatableViewGalleryPage.item,
        IDGalleryPage.item,
        ManipulableGalleryPage.item,
        OnAppearGalleryPage.item,
        OnDisappearGalleryPage.item,
        SubscriptionViewGalleryPage.item,
        TagGalleryPage.item,
        ViewBuilderGalleryPage.item,
        ViewGalleryPage.item,
        ViewModifierGalleryPage.item,

        // View Configuration — Phase B4
        BreakthroughEffectGalleryPage.item,
        ColorSchemeGalleryPage.item,
        DisabledGalleryPage.item,
        HelpGalleryPage.item,
        HiddenGalleryPage.item,
        InteractionActivityTrackingTagGalleryPage.item,
        InvalidatableContentGalleryPage.item,
        IsSceneCapturedGalleryPage.item,
        LabelsVisibilityGalleryPage.item,
        OpacityGalleryPage.item,
        PersistentSystemOverlaysGalleryPage.item,
        PrivacySensitiveGalleryPage.item,
        RedactedGalleryPage.item,
        StatusBarHiddenGalleryPage.item,
        SurroundingsEffectGalleryPage.item,
        VisibilityGalleryPage.item,

        // View Styles — Phase B4
        DisclosureGroupStyleGalleryPage.item,
        GlassEffectGalleryPage.item,
        GroupBoxStyleGalleryPage.item,
        IndexViewStyleGalleryPage.item,
        LabelStyleGalleryPage.item,
        ListStyleGalleryPage.item,
        NavigationSplitViewStyleGalleryPage.item,
        PresentedWindowToolbarStyleGalleryPage.item,
        SignInWithAppleButtonStyleGalleryPage.item,
        TabViewStyleGalleryPage.item,
        ToggleStyleGalleryPage.item,

        // Images — Phase B4
        AsyncImageGalleryPage.item,
        FittingImagesIntoAvailableSpaceGalleryPage.item,
        ImageGalleryPage.item,
        ImageRendererGalleryPage.item,
        SymbolColorRenderingModeGalleryPage.item,
        SymbolEffectGalleryPage.item,
        SymbolRenderingModeGalleryPage.item,
        SymbolVariableValueModeGalleryPage.item,
        SymbolVariantsGalleryPage.item,

        // Controls And Indicators — Phase B4
        ButtonGalleryPage.item,
        ColorPickerGalleryPage.item,
        ContentUnavailableViewGalleryPage.item,
        ControlSizeGalleryPage.item,
        DatePickerGalleryPage.item,
        EditButtonGalleryPage.item,
        GaugeGalleryPage.item,
        HelpLinkGalleryPage.item,
        LinkGalleryPage.item,
        MultiDatePickerGalleryPage.item,
        PasteButtonGalleryPage.item,
        PickerGalleryPage.item,
        ProgressViewGalleryPage.item,
        SensoryFeedbackGalleryPage.item,
        ShareLinkGalleryPage.item,
        SliderGalleryPage.item,
        StepperGalleryPage.item,
        TextFieldLinkGalleryPage.item,
        ToggleGalleryPage.item,

        // Menus And Commands — Phase B4
        CommandsGalleryPage.item,
        ContextMenuGalleryPage.item,
        DividerGalleryPage.item,
        MenuButtonGalleryPage.item,
        MenuGalleryPage.item,
        PullDownButtonGalleryPage.item,

        // Layout (merged) — Phase B4
        AlignmentGalleryPage.item,
        AlignmentGuideGalleryPage.item,
        AnyLayoutGalleryPage.item,
        BackgroundOverlayGalleryPage.item,
        EdgeGalleryPage.item,
        EdgeInsetsGalleryPage.item,
        FixedSizeGalleryPage.item,
        FrameGalleryPage.item,
        GridGalleryPage.item,
        LayoutDirectionGalleryPage.item,
        LayoutGalleryPage.item,
        LayoutPriorityGalleryPage.item,
        LazyGridGalleryPage.item,
        LazyStackGalleryPage.item,
        OffsetGalleryPage.item,
        PaddingGalleryPage.item,
        PinnedScrollableViewsGalleryPage.item,
        PositionGalleryPage.item,
        SafeAreaGalleryPage.item,
        SpacerGalleryPage.item,
        SpatialContainerGalleryPage.item,
        StacksGalleryPage.item,
        UserInterfaceSizeClassGalleryPage.item,
        ViewDimensionsGalleryPage.item,
        ViewThatFitsGalleryPage.item,

        // Tables — Phase B4 (consolidated: Table family in one page)
        TableGalleryPage.item,

        // View Groupings — Phase B4
        ContainerValuesGalleryPage.item,
        ControlGroupGalleryPage.item,
        DynamicViewContentGalleryPage.item,
        FormGalleryPage.item,
        GroupBoxGalleryPage.item,
        GroupGalleryPage.item,
        LabeledContentGalleryPage.item,
        SectionGalleryPage.item,
        SubviewGalleryPage.item,

        // Gestures — Phase B4
        AnyGestureGalleryPage.item,
        DefersSystemGesturesGalleryPage.item,
        DragGestureGalleryPage.item,
        ExclusiveGestureGalleryPage.item,
        GestureGalleryPage.item,
        HandGestureShortcutGalleryPage.item,
        HighPriorityGestureGalleryPage.item,
        LongPressGestureGalleryPage.item,
        MagnifyGestureGalleryPage.item,
        PencilGesturesGalleryPage.item,
        RotateGesture3DGalleryPage.item,
        RotateGestureGalleryPage.item,
        SequenceGestureGalleryPage.item,
        SimultaneousGestureGalleryPage.item,
        SpatialEventGestureGalleryPage.item,
        SpatialTapGestureGalleryPage.item,
        TapGestureGalleryPage.item,
        WindowDragGestureGalleryPage.item,

        // Drag And Drop — Phase B4
        DraggableGalleryPage.item,

        // Accessibility (merged) — Phase B4
        AccessibilityActionGalleryPage.item,
        AccessibilityActivationPointGalleryPage.item,
        AccessibilityAdjustableActionGalleryPage.item,
        AccessibilityChartDescriptorGalleryPage.item,
        AccessibilityCustomContentGalleryPage.item,
        AccessibilityDirectTouchGalleryPage.item,
        AccessibilityDragPointGalleryPage.item,
        AccessibilityDropPointGalleryPage.item,
        AccessibilityFocusedGalleryPage.item,
        AccessibilityHeadingGalleryPage.item,
        AccessibilityHintGalleryPage.item,
        AccessibilityIgnoresInvertColorsGalleryPage.item,
        AccessibilityInputLabelsGalleryPage.item,
        AccessibilityLabelGalleryPage.item,
        AccessibilityLabeledPairGalleryPage.item,
        AccessibilityLinkedGroupGalleryPage.item,
        AccessibilityQuickActionGalleryPage.item,
        AccessibilityRespondsToUserInteractionGalleryPage.item,
        AccessibilityRotorGalleryPage.item,
        AccessibilityScrollActionGalleryPage.item,
        AccessibilityShowsLargeContentViewerGalleryPage.item,
        AccessibilitySortPriorityGalleryPage.item,
        AccessibilityTextContentTypeGalleryPage.item,
        AccessibilityTraitsGalleryPage.item,
        AccessibilityValueGalleryPage.item,
        AccessibilityZoomActionGalleryPage.item,
        AssistiveAccessGalleryPage.item,
        LegibilityWeightGalleryPage.item,
        SpeechGalleryPage.item,

        // Appkit Integration — Phase B4
        NSGestureRecognizerRepresentableGalleryPage.item,
        NSHostingControllerGalleryPage.item,
        NSHostingMenuGalleryPage.item,
        NSHostingSceneBridgingOptionsGalleryPage.item,
        NSHostingSceneRepresentationGalleryPage.item,
        NSHostingSizingOptionsGalleryPage.item,
        NSHostingViewGalleryPage.item,
        NSViewControllerRepresentableGalleryPage.item,
        NSViewRepresentableGalleryPage.item,

        // Technology Specific Views — Phase B4
        AppStoreOverlayGalleryPage.item,
        ApplePayGalleryPage.item,
        AutomatedDeviceEnrollmentGalleryPage.item,
        CameraAnchorGalleryPage.item,
        ContactAccessButtonGalleryPage.item,
        ContactAccessPickerGalleryPage.item,
        ContinuityDevicePickerGalleryPage.item,
        CurrentEntitlementTaskGalleryPage.item,
        FamilyActivityPickerGalleryPage.item,
        HandlesGameControllerEventsGalleryPage.item,
        HealthDataAccessRequestGalleryPage.item,
        InAppPurchaseOptionsGalleryPage.item,
        JournalingSuggestionsPickerGalleryPage.item,
        LiveActivityGalleryPage.item,
        ManageSubscriptionsSheetGalleryPage.item,
        ManagedContentStyleGalleryPage.item,
        MapGalleryPage.item,
        MusicSubscriptionOfferGalleryPage.item,
        OfferCodeRedemptionGalleryPage.item,
        PayLaterViewGalleryPage.item,
        PhotosPickerGalleryPage.item,
        PopoverTipGalleryPage.item,
        ProductViewGalleryPage.item,
        QuickLookPreviewGalleryPage.item,
        RealityViewCameraControlsGalleryPage.item,
        RefundRequestSheetGalleryPage.item,
        StoreButtonGalleryPage.item,
        StoreProductTaskGalleryPage.item,
        SubscriptionStatusTaskGalleryPage.item,
        SubscriptionStoreViewGalleryPage.item,
        TabletopGameGalleryPage.item,
        TipViewGalleryPage.item,
        TransactionPickerGalleryPage.item,
        TransactionTaskGalleryPage.item,
        TranslationPresentationGalleryPage.item,
        TranslationTaskGalleryPage.item,
        WalletButtonStyleGalleryPage.item,
        WebViewGalleryPage.item,
        WorkoutPreviewGalleryPage.item,

        // Reference seed — Phase B2
        MaterialsGalleryPage.item,
        MotionGalleryPage.item,
        ReferenceColorGalleryPage.item,
        SFSymbolsGalleryPage.item,
        TypographyGalleryPage.item,

        // AppKit · Accessibility for AppKit — Phase B5
        NSAccessibilityPage.item,

        // AppKit · Animation — Phase B5
        NSAnimationContextPage.item,

        // AppKit · Color — Phase B5
        NSColorPage.item,

        // AppKit · Drawing — Phase B5
        NSDrawingPage.item,

        // AppKit · Fonts — Phase B5
        NSFontPage.item,

        // AppKit · Images and PDF — Phase B5
        NSImageRepPage.item,

        // AppKit · Menus, cursors, and the Dock — Phase B5
        NSCursorPage.item,
        NSMenuPage.item,

        // AppKit · Text display — Phase B5
        NSTextDisplayPage.item,

        // AppKit · TextKit — Phase B5
        NSTextKitPage.item,

        // AppKit · Touch Bar — Phase B5
        NSScrubberPage.item,
        NSTouchBarPage.item,

        // AppKit · View layout — Phase B5
        NSViewLayoutPage.item,

        // AppKit · Views and controls — Phase B5
        NSButtonPage.item,
        NSRuleEditorPage.item,
        NSTableViewPage.item,
        NSTextFieldPage.item,
        NSTextViewPage.item,
        NSToolbarPage.item,

        // AppKit · Windows, panels, and screens — Phase B5
        NSAlertPage.item,
        NSPopoverPage.item,
        NSSavePanelPage.item,
        NSWindowPage.item,

        // AppKit · Writing Tools — Phase B5
        NSWritingToolsPage.item,
    ]

    /// Items grouped first by framework (Reference / SwiftUI / AppKit), then by
    /// folder within each framework, in declaration order. The sidebar uses this
    /// shape directly to render the 3-tier disclosure (framework → folder → item).
    static let byFramework: [(framework: Framework, folders: [(folder: String, items: [GalleryItem])])] = {
        let frameworks: [Framework] = [.reference, .swiftUI, .appKit]
        return frameworks.compactMap { framework in
            let frameworkItems = allItems.filter { $0.framework == framework }
            guard !frameworkItems.isEmpty else { return nil }
            return (framework, groupByFolder(items: frameworkItems))
        }
    }()

    /// Returns the item with the given id, or nil. Used by selection-resolution
    /// when the sidebar emits a gallery-item ID like `"item:swiftui.shapes.circle"`.
    static func item(forID id: String) -> GalleryItem? {
        idToItem[id]
    }

    // MARK: Derived indexes

    /// Derived index from gallery-item id to item.
    private static let idToItem: [String: GalleryItem] = {
        var map: [String: GalleryItem] = [:]
        for item in allItems {
            map[item.id] = item
        }
        return map
    }()

    private static func groupByFolder(items: [GalleryItem]) -> [(folder: String, items: [GalleryItem])] {
        var orderedFolders: [String] = []
        var grouped: [String: [GalleryItem]] = [:]
        for item in items {
            if grouped[item.folder] == nil {
                orderedFolders.append(item.folder)
            }
            grouped[item.folder, default: []].append(item)
        }
        return orderedFolders.map { ($0, grouped[$0] ?? []) }
    }
}

// MARK: - Framework display

extension Framework {
    /// User-facing label shown in the sidebar's top-level disclosure.
    var displayName: String {
        switch self {
        case .reference: return "Reference"
        case .swiftUI: return "SwiftUI"
        case .appKit:  return "AppKit"
        }
    }

    /// SF Symbol used for the framework's sidebar row.
    var sidebarSymbolName: String {
        switch self {
        case .reference: return "book.closed"
        case .swiftUI: return "swift"
        case .appKit:  return "square.grid.2x2"
        }
    }
}
