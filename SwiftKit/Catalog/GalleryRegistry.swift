import SwiftUI

/// Aggregates every `GalleryItem` declared by a gallery page.
///
/// **Reading:** the sidebar (`SidebarView`) reads `byFramework`; selection
/// resolution (`RootView`) reads `item(forID:)`. Those are the only two
/// public entry points — both derive from `allItems`.
///
/// **Authoring contract.** Every page file declares a `static let item: GalleryItem`
/// in an extension next to its `View` struct (see `Pages/Reference/` for the
/// canonical shape). The registry composes those `<PageStruct>.item` values
/// into `allItems` below — declaration order is sidebar order.
///
/// **Phase 2 Step 1 state — registry rebuilt from the approved Phase 1 manifest
/// (`Planning/page-component-map.md`).** The 5 Reference pages already declare
/// `static let item` extensions; the remaining 69 leaves are forward-references
/// to view types whose page files will be authored in Phase 2 Step 2. The build
/// is intentionally RED between Step 1 and Step 2 wrap; Phase 2.5 audits the
/// final green build before Phase 3 dispatches.
///
/// Stable IDs follow `<framework>.<folder>.<leaf>` (lower-camel). Folder uses
/// the manifest's grammatical folder name (e.g. `appStructure`, `imagesAndShapes`).
/// Reference and AppKit are flat — folder slug equals the leaf slug.
///
/// Keep `allItems` flat (single non-nested expression) to satisfy L-011 — large
/// nested SwiftUI trees blow up SwiftUI type-checking. The `+` concatenation
/// of per-folder arrays is a flat, single-pass expression.
@MainActor
enum GalleryRegistry {
    /// All gallery items registered, in sidebar order. Built imperatively with
    /// `+=` rather than a chained `+` expression — the latter forces the type
    /// checker to unify all 14 sub-array types in a single inference pass and
    /// trips the L-011 expression-complexity ceiling once the per-folder arrays
    /// reach this size.
    static let allItems: [GalleryItem] = {
        var items: [GalleryItem] = []
        items += referenceItems
        items += swiftUIAppStructureItems
        items += swiftUINavigationItems
        items += swiftUILayoutItems
        items += swiftUIContainersItems
        items += swiftUIControlsItems
        items += swiftUITextAndInputItems
        items += swiftUIImagesAndShapesItems
        items += swiftUIPresentationItems
        items += swiftUIToolbarsAndMenusItems
        items += swiftUIAnimationAndEffectsItems
        items += swiftUIAccessibilityItems
        items += swiftUIGesturesAndInputItems
        items += appKitItems
        return items
    }()

    // MARK: Reference (5 leaves, flat folder)

    private static let referenceItems: [GalleryItem] = [
        MaterialsGalleryPage.item,
        MotionGalleryPage.item,
        ReferenceColorGalleryPage.item,
        SFSymbolsGalleryPage.item,
        TypographyGalleryPage.item,
    ]

    // MARK: SwiftUI > App Structure (7 leaves)

    private static let swiftUIAppStructureItems: [GalleryItem] = [
        AppAndScenesGalleryPage.item,
        WindowGroupGalleryPage.item,
        DocumentGalleryPage.item,
        EnvironmentGalleryPage.item,
        StateAndBindingsGalleryPage.item,
        AppKitIntegrationGalleryPage.item,
        ViewFundamentalsGalleryPage.item,
    ]

    // MARK: SwiftUI > Navigation (6 leaves)

    private static let swiftUINavigationItems: [GalleryItem] = [
        NavigationStackGalleryPage.item,
        NavigationSplitViewGalleryPage.item,
        TabViewGalleryPage.item,
        SidebarGalleryPage.item,
        SearchableGalleryPage.item,
        InspectorGalleryPage.item,
    ]

    // MARK: SwiftUI > Layout (9 leaves)

    private static let swiftUILayoutItems: [GalleryItem] = [
        StacksGalleryPage.item,
        GridGalleryPage.item,
        LazyGridGalleryPage.item,
        ScrollViewGalleryPage.item,
        GeometryReaderGalleryPage.item,
        FrameAndPaddingGalleryPage.item,
        AlignmentGalleryPage.item,
        SafeAreaGalleryPage.item,
        CustomLayoutGalleryPage.item,
    ]

    // MARK: SwiftUI > Containers (6 leaves)

    private static let swiftUIContainersItems: [GalleryItem] = [
        ListGalleryPage.item,
        TableGalleryPage.item,
        FormGalleryPage.item,
        GroupBoxGalleryPage.item,
        SectionGalleryPage.item,
        DisclosureGroupGalleryPage.item,
    ]

    // MARK: SwiftUI > Controls (10 leaves)

    private static let swiftUIControlsItems: [GalleryItem] = [
        ButtonGalleryPage.item,
        ToggleGalleryPage.item,
        PickerGalleryPage.item,
        DatePickerGalleryPage.item,
        ColorPickerGalleryPage.item,
        SliderGalleryPage.item,
        StepperGalleryPage.item,
        ProgressViewGalleryPage.item,
        GaugeGalleryPage.item,
        MenuGalleryPage.item,
    ]

    // MARK: SwiftUI > Text and Input (5 leaves)

    private static let swiftUITextAndInputItems: [GalleryItem] = [
        TextGalleryPage.item,
        TextFieldGalleryPage.item,
        TextEditorGalleryPage.item,
        LabelGalleryPage.item,
        AttributedStringGalleryPage.item,
    ]

    // MARK: SwiftUI > Images and Shapes (3 leaves; AsyncImage folded into Image per A6)

    private static let swiftUIImagesAndShapesItems: [GalleryItem] = [
        ImageGalleryPage.item,
        ShapesGalleryPage.item,
        GradientGalleryPage.item,
    ]

    // MARK: SwiftUI > Presentation (4 leaves; FullScreenCover folded into Sheet per A7)

    private static let swiftUIPresentationItems: [GalleryItem] = [
        SheetGalleryPage.item,
        PopoverGalleryPage.item,
        AlertGalleryPage.item,
        ConfirmationDialogGalleryPage.item,
    ]

    // MARK: SwiftUI > Toolbars and Menus (3 leaves)

    private static let swiftUIToolbarsAndMenusItems: [GalleryItem] = [
        ToolbarGalleryPage.item,
        ContextMenuGalleryPage.item,
        CommandsGalleryPage.item,
    ]

    // MARK: SwiftUI > Animation and Effects (4 leaves; Glass Effects scattered per A8)

    private static let swiftUIAnimationAndEffectsItems: [GalleryItem] = [
        AnimationGalleryPage.item,
        TransitionGalleryPage.item,
        MatchedGeometryGalleryPage.item,
        CanvasGalleryPage.item,
    ]

    // MARK: SwiftUI > Accessibility (3 leaves)

    private static let swiftUIAccessibilityItems: [GalleryItem] = [
        LabelsAndDescriptionsGalleryPage.item,
        ActionsAndBehaviorGalleryPage.item,
        CustomContentGalleryPage.item,
    ]

    // MARK: SwiftUI > Gestures and Input (3 leaves)

    private static let swiftUIGesturesAndInputItems: [GalleryItem] = [
        GesturesGalleryPage.item,
        FocusStateGalleryPage.item,
        KeyboardGalleryPage.item,
    ]

    // MARK: AppKit (6 leaves, flat folder; NSGlassEffectView added per A9)

    private static let appKitItems: [GalleryItem] = [
        NSOutlineViewGalleryPage.item,
        NSBrowserGalleryPage.item,
        NSPathControlGalleryPage.item,
        NSTokenFieldGalleryPage.item,
        NSDatePickerGalleryPage.item,
        NSGlassEffectViewGalleryPage.item,
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
    /// when the sidebar emits a gallery-item ID like `"swiftui.appStructure.windowGroup"`.
    static func item(forID id: String) -> GalleryItem? {
        idToItem[id]
    }

    // MARK: Derived indexes

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
