# Triage Part D — layout / lists / tables / view_groupings / scroll_views / gestures

Already-wired leaves (skipped — have `.real(symbol:)` entries in PageRegistry):
ForEach, Displaying data in lists, List, OutlineGroup, DisclosureGroup, View/listRowInsets(_:), View/listRowSpacing(_:), View/listSectionSpacing(_:), ListSectionSpacing, View/listSectionMargins(_:_:), View/listItemTint(_:), ListItemTint, View/headerProminence(_:), Prominence, View/listRowSeparatorTint(_:edges:), View/listSectionSeparatorTint(_:edges:), View/listRowSeparator(_:edges:), View/listSectionSeparator(_:edges:), View/listRowBackground(_:), View/alternatingRowBackgrounds(_:), AlternatingRowBackgroundBehavior, BackgroundProminence, View/badge(_:), View/badgeProminence(_:), BadgeProminence, View/swipeActions(edge:allowsFullSwipe:content:), View/selectionDisabled(_:), View/listRowHoverEffect(_:), View/listRowHoverEffectDisabled(_:), View/refreshable(action:), RefreshAction, View/moveDisabled(_:), View/deleteDisabled(_:), EditMode, EditActions, EditableCollectionContent, IndexedIdentifierCollection, View/listSectionIndexVisibility(_:), View/sectionIndexLabel(_:), Table, TableColumn.

---

## Implement

| Leaf id | API | Section |
|---|---|---|
| swiftui.custom-layout.anylayout | AnyLayout | custom_layout |
| swiftui.custom-layout.composing-custom-layouts-with-swiftui | Composing custom layouts with SwiftUI | custom_layout |
| swiftui.custom-layout.gridlayout | GridLayout | custom_layout |
| swiftui.custom-layout.hstacklayout | HStackLayout | custom_layout |
| swiftui.custom-layout.layout | Layout | custom_layout |
| swiftui.custom-layout.layoutproperties | LayoutProperties | custom_layout |
| swiftui.custom-layout.layoutsubview | LayoutSubview | custom_layout |
| swiftui.custom-layout.layoutsubviews | LayoutSubviews | custom_layout |
| swiftui.custom-layout.layoutvalue(key:value:) | View/layoutValue(key:value:) | custom_layout |
| swiftui.custom-layout.layoutvaluekey | LayoutValueKey | custom_layout |
| swiftui.custom-layout.proposedviewsize | ProposedViewSize | custom_layout |
| swiftui.custom-layout.viewspacing | ViewSpacing | custom_layout |
| swiftui.custom-layout.vstacklayout | VStackLayout | custom_layout |
| swiftui.custom-layout.zstacklayout | ZStackLayout | custom_layout |
| swiftui.gestures.adding-interactivity-with-gestures | Adding interactivity with gestures | gestures |
| swiftui.gestures.allowswindowactivationevents(_:) | View/allowsWindowActivationEvents(_:) | gestures |
| swiftui.gestures.anygesture | AnyGesture | gestures |
| swiftui.gestures.chirality | Chirality | gestures |
| swiftui.gestures.composing-swiftui-gestures | Composing SwiftUI gestures | gestures |
| swiftui.gestures.draggesture | DragGesture | gestures |
| swiftui.gestures.exclusivegesture | ExclusiveGesture | gestures |
| swiftui.gestures.gesture | Gesture | gestures |
| swiftui.gestures.gesture(_:) | View/gesture(_:) | gestures |
| swiftui.gestures.gesture(_:including:) | View/gesture(_:including:) | gestures |
| swiftui.gestures.gesture(_:isenabled:) | View/gesture(_:isEnabled:) | gestures |
| swiftui.gestures.gesture(_:name:isenabled:) | View/gesture(_:name:isEnabled:) | gestures |
| swiftui.gestures.gesturemask | GestureMask | gestures |
| swiftui.gestures.gesturestate | GestureState | gestures |
| swiftui.gestures.gesturestategesture | GestureStateGesture | gestures |
| swiftui.gestures.handgestureshortcut | HandGestureShortcut | gestures |
| swiftui.gestures.handgestureshortcut(_:isenabled:) | View/handGestureShortcut(_:isEnabled:) | gestures |
| swiftui.gestures.highprioritygesture(_:including:) | View/highPriorityGesture(_:including:) | gestures |
| swiftui.gestures.highprioritygesture(_:isenabled:) | View/highPriorityGesture(_:isEnabled:) | gestures |
| swiftui.gestures.highprioritygesture(_:name:isenabled:) | View/highPriorityGesture(_:name:isEnabled:) | gestures |
| swiftui.gestures.longpressgesture | LongPressGesture | gestures |
| swiftui.gestures.magnificationgesture | MagnificationGesture | gestures |
| swiftui.gestures.magnifygesture | MagnifyGesture | gestures |
| swiftui.gestures.onlongpressgesture(minimumduration:maximumdistance:perform:onpressingchanged:) | View/onLongPressGesture(minimumDuration:maximumDistance:perform:onPressingChanged:) | gestures |
| swiftui.gestures.ontapgesture(count:coordinatespace:perform:) | View/onTapGesture(count:coordinateSpace:perform:) | gestures |
| swiftui.gestures.ontapgesture(count:perform:) | View/onTapGesture(count:perform:) | gestures |
| swiftui.gestures.pencildoubletapgesturevalue | PencilDoubleTapGestureValue | gestures |
| swiftui.gestures.pencilhoverpose | PencilHoverPose | gestures |
| swiftui.gestures.pencilpreferredaction | PencilPreferredAction | gestures |
| swiftui.gestures.pencilsqueezegesturephase | PencilSqueezeGesturePhase | gestures |
| swiftui.gestures.pencilsqueezegesturevalue | PencilSqueezeGestureValue | gestures |
| swiftui.gestures.rotategesture | RotateGesture | gestures |
| swiftui.gestures.rotationgesture | RotationGesture | gestures |
| swiftui.gestures.sequencegesture | SequenceGesture | gestures |
| swiftui.gestures.simultaneousgesture | SimultaneousGesture | gestures |
| swiftui.gestures.simultaneousgesture(_:including:) | View/simultaneousGesture(_:including:) | gestures |
| swiftui.gestures.simultaneousgesture(_:isenabled:) | View/simultaneousGesture(_:isEnabled:) | gestures |
| swiftui.gestures.simultaneousgesture(_:name:isenabled:) | View/simultaneousGesture(_:name:isEnabled:) | gestures |
| swiftui.gestures.spatialeventcollection | SpatialEventCollection | gestures |
| swiftui.gestures.spatialeventgesture | SpatialEventGesture | gestures |
| swiftui.gestures.spatialtapgesture | SpatialTapGesture | gestures |
| swiftui.gestures.tapgesture | TapGesture | gestures |
| swiftui.gestures.windowdraggesture | WindowDragGesture | gestures |
| swiftui.layout-adjustments.aligning-views-across-stacks | Aligning views across stacks | layout_adjustments |
| swiftui.layout-adjustments.aligning-views-within-a-stack | Aligning views within a stack | layout_adjustments |
| swiftui.layout-adjustments.alignment | Alignment | layout_adjustments |
| swiftui.layout-adjustments.alignmentguide(_:computevalue:) | View/alignmentGuide(_:computeValue:) | layout_adjustments |
| swiftui.layout-adjustments.alignmentid | AlignmentID | layout_adjustments |
| swiftui.layout-adjustments.containerrelativeframe(_:alignment:) | View/containerRelativeFrame(_:alignment:) | layout_adjustments |
| swiftui.layout-adjustments.containerrelativeframe(_:alignment:_:) | View/containerRelativeFrame(_:alignment:_:) | layout_adjustments |
| swiftui.layout-adjustments.containerrelativeframe(_:count:span:spacing:alignment:) | View/containerRelativeFrame(_:count:span:spacing:alignment:) | layout_adjustments |
| swiftui.layout-adjustments.contentmarginplacement | ContentMarginPlacement | layout_adjustments |
| swiftui.layout-adjustments.contentmargins(_:_:for:) | View/contentMargins(_:_:for:) | layout_adjustments |
| swiftui.layout-adjustments.contentmargins(_:for:) | View/contentMargins(_:for:) | layout_adjustments |
| swiftui.layout-adjustments.edge | Edge | layout_adjustments |
| swiftui.layout-adjustments.edgeinsets | EdgeInsets | layout_adjustments |
| swiftui.layout-adjustments.fixedsize() | View/fixedSize() | layout_adjustments |
| swiftui.layout-adjustments.fixedsize(horizontal:vertical:) | View/fixedSize(horizontal:vertical:) | layout_adjustments |
| swiftui.layout-adjustments.frame(minwidth:idealwidth:maxwidth:minheight:idealheight:maxheight:alignment:) | View/frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:) | layout_adjustments |
| swiftui.layout-adjustments.frame(width:height:alignment:) | View/frame(width:height:alignment:) | layout_adjustments |
| swiftui.layout-adjustments.horizontalalignment | HorizontalAlignment | layout_adjustments |
| swiftui.layout-adjustments.horizontaledge | HorizontalEdge | layout_adjustments |
| swiftui.layout-adjustments.ignoressafearea(_:edges:) | View/ignoresSafeArea(_:edges:) | layout_adjustments |
| swiftui.layout-adjustments.inspecting-view-layout | Inspecting view layout | layout_adjustments |
| swiftui.layout-adjustments.laying-out-a-simple-view | Laying out a simple view | layout_adjustments |
| swiftui.layout-adjustments.layoutdirection | LayoutDirection | layout_adjustments |
| swiftui.layout-adjustments.layoutdirectionbehavior | LayoutDirectionBehavior | layout_adjustments |
| swiftui.layout-adjustments.layoutdirectionbehavior(_:) | View/layoutDirectionBehavior(_:) | layout_adjustments |
| swiftui.layout-adjustments.layoutpriority(_:) | View/layoutPriority(_:) | layout_adjustments |
| swiftui.layout-adjustments.making-fine-adjustments-to-a-view-s-position | Making fine adjustments to a view's position | layout_adjustments |
| swiftui.layout-adjustments.offset(_:) | View/offset(_:) | layout_adjustments |
| swiftui.layout-adjustments.offset(x:y:) | View/offset(x:y:) | layout_adjustments |
| swiftui.layout-adjustments.padding(_:) | View/padding(_:) | layout_adjustments |
| swiftui.layout-adjustments.padding(_:_:) | View/padding(_:_:) | layout_adjustments |
| swiftui.layout-adjustments.position(_:) | View/position(_:) | layout_adjustments |
| swiftui.layout-adjustments.position(x:y:) | View/position(x:y:) | layout_adjustments |
| swiftui.layout-adjustments.safeareainset(edge:alignment:spacing:content:) | View/safeAreaInset(edge:alignment:spacing:content:) | layout_adjustments |
| swiftui.layout-adjustments.safeareapadding(_:) | View/safeAreaPadding(_:) | layout_adjustments |
| swiftui.layout-adjustments.safeareapadding(_:_:) | View/safeAreaPadding(_:_:) | layout_adjustments |
| swiftui.layout-adjustments.safearearegions | SafeAreaRegions | layout_adjustments |
| swiftui.layout-adjustments.scenepadding(_:) | View/scenePadding(_:) | layout_adjustments |
| swiftui.layout-adjustments.scenepadding(_:edges:) | View/scenePadding(_:edges:) | layout_adjustments |
| swiftui.layout-adjustments.scenepadding | ScenePadding | layout_adjustments |
| swiftui.layout-adjustments.userinterfacesizeclass | UserInterfaceSizeClass | layout_adjustments |
| swiftui.layout-adjustments.verticalalignment | VerticalAlignment | layout_adjustments |
| swiftui.layout-adjustments.verticaledge | VerticalEdge | layout_adjustments |
| swiftui.layout-adjustments.viewdimensions | ViewDimensions | layout_adjustments |
| swiftui.layout-fundamentals.adding-a-background-to-your-view | Adding a background to your view | layout_fundamentals |
| swiftui.layout-fundamentals.background(_:ignoressafeareaedges:) | View/background(_:ignoresSafeAreaEdges:) | layout_fundamentals |
| swiftui.layout-fundamentals.background(_:in:fillstyle:) | View/background(_:in:fillStyle:) | layout_fundamentals |
| swiftui.layout-fundamentals.background(alignment:content:) | View/background(alignment:content:) | layout_fundamentals |
| swiftui.layout-fundamentals.background(ignoressafeareaedges:) | View/background(ignoresSafeAreaEdges:) | layout_fundamentals |
| swiftui.layout-fundamentals.background(in:fillstyle:) | View/background(in:fillStyle:) | layout_fundamentals |
| swiftui.layout-fundamentals.backgroundmaterial | EnvironmentValues/backgroundMaterial | layout_fundamentals |
| swiftui.layout-fundamentals.building-layouts-with-stack-views | Building layouts with stack views | layout_fundamentals |
| swiftui.layout-fundamentals.containerbackground(_:for:) | View/containerBackground(_:for:) | layout_fundamentals |
| swiftui.layout-fundamentals.containerbackground(for:alignment:content:) | View/containerBackground(for:alignment:content:) | layout_fundamentals |
| swiftui.layout-fundamentals.containerbackgroundplacement | ContainerBackgroundPlacement | layout_fundamentals |
| swiftui.layout-fundamentals.creating-performant-scrollable-stacks | Creating performant scrollable stacks | layout_fundamentals |
| swiftui.layout-fundamentals.grid | Grid | layout_fundamentals |
| swiftui.layout-fundamentals.gridcellanchor(_:) | View/gridCellAnchor(_:) | layout_fundamentals |
| swiftui.layout-fundamentals.gridcellcolumns(_:) | View/gridCellColumns(_:) | layout_fundamentals |
| swiftui.layout-fundamentals.gridcellunsizedaxes(_:) | View/gridCellUnsizedAxes(_:) | layout_fundamentals |
| swiftui.layout-fundamentals.gridcolumnalignment(_:) | View/gridColumnAlignment(_:) | layout_fundamentals |
| swiftui.layout-fundamentals.griditem | GridItem | layout_fundamentals |
| swiftui.layout-fundamentals.gridrow | GridRow | layout_fundamentals |
| swiftui.layout-fundamentals.grouping-data-with-lazy-stack-views | Grouping data with lazy stack views | layout_fundamentals |
| swiftui.layout-fundamentals.hstack | HStack | layout_fundamentals |
| swiftui.layout-fundamentals.lazyhgrid | LazyHGrid | layout_fundamentals |
| swiftui.layout-fundamentals.lazyhstack | LazyHStack | layout_fundamentals |
| swiftui.layout-fundamentals.lazyvgrid | LazyVGrid | layout_fundamentals |
| swiftui.layout-fundamentals.lazyvstack | LazyVStack | layout_fundamentals |
| swiftui.layout-fundamentals.overlay(_:ignoressafeareaedges:) | View/overlay(_:ignoresSafeAreaEdges:) | layout_fundamentals |
| swiftui.layout-fundamentals.overlay(_:in:fillstyle:) | View/overlay(_:in:fillStyle:) | layout_fundamentals |
| swiftui.layout-fundamentals.overlay(alignment:content:) | View/overlay(alignment:content:) | layout_fundamentals |
| swiftui.layout-fundamentals.picking-container-views-for-your-content | Picking container views for your content | layout_fundamentals |
| swiftui.layout-fundamentals.pinnedscrollableviews | PinnedScrollableViews | layout_fundamentals |
| swiftui.layout-fundamentals.spacer | Spacer | layout_fundamentals |
| swiftui.layout-fundamentals.viewthatfits | ViewThatFits | layout_fundamentals |
| swiftui.layout-fundamentals.vstack | VStack | layout_fundamentals |
| swiftui.layout-fundamentals.zindex(_:) | View/zIndex(_:) | layout_fundamentals |
| swiftui.layout-fundamentals.zstack | ZStack | layout_fundamentals |
| swiftui.scroll-views.anyscrolltargetbehavior | AnyScrollTargetBehavior | scroll_views |
| swiftui.scroll-views.defaultscrollanchor(_:) | View/defaultScrollAnchor(_:) | scroll_views |
| swiftui.scroll-views.defaultscrollanchor(_:for:) | View/defaultScrollAnchor(_:for:) | scroll_views |
| swiftui.scroll-views.onscrollgeometrychange(for:of:action:) | View/onScrollGeometryChange(for:of:action:) | scroll_views |
| swiftui.scroll-views.onscrollphasechange(_:) | View/onScrollPhaseChange(_:) | scroll_views |
| swiftui.scroll-views.onscrolltargetvisibilitychange(idtype:threshold:_:) | View/onScrollTargetVisibilityChange(idType:threshold:_:) | scroll_views |
| swiftui.scroll-views.onscrollvisibilitychange(threshold:_:) | View/onScrollVisibilityChange(threshold:_:) | scroll_views |
| swiftui.scroll-views.pagingscrolltargetbehavior | PagingScrollTargetBehavior | scroll_views |
| swiftui.scroll-views.safeareabar(edge:alignment:spacing:content:) | View/safeAreaBar(edge:alignment:spacing:content:) | scroll_views |
| swiftui.scroll-views.scrollanchorrole | ScrollAnchorRole | scroll_views |
| swiftui.scroll-views.scrollbouncebehavior | ScrollBounceBehavior | scroll_views |
| swiftui.scroll-views.scrollbouncebehavior(_:axes:) | View/scrollBounceBehavior(_:axes:) | scroll_views |
| swiftui.scroll-views.scrollclipdisabled(_:) | View/scrollClipDisabled(_:) | scroll_views |
| swiftui.scroll-views.scrollcontentbackground(_:) | View/scrollContentBackground(_:) | scroll_views |
| swiftui.scroll-views.scrollcontentoffsetadjustmentbehavior | ScrollContentOffsetAdjustmentBehavior | scroll_views |
| swiftui.scroll-views.scrolldisabled(_:) | View/scrollDisabled(_:) | scroll_views |
| swiftui.scroll-views.scrolledgeeffecthidden(_:for:) | View/scrollEdgeEffectHidden(_:for:) | scroll_views |
| swiftui.scroll-views.scrolledgeeffectstyle | ScrollEdgeEffectStyle | scroll_views |
| swiftui.scroll-views.scrolledgeeffectstyle(_:for:) | View/scrollEdgeEffectStyle(_:for:) | scroll_views |
| swiftui.scroll-views.scrollgeometry | ScrollGeometry | scroll_views |
| swiftui.scroll-views.scrollindicators(_:axes:) | View/scrollIndicators(_:axes:) | scroll_views |
| swiftui.scroll-views.scrollindicatorvisibility | ScrollIndicatorVisibility | scroll_views |
| swiftui.scroll-views.scrollindicatorsflash(onappear:) | View/scrollIndicatorsFlash(onAppear:) | scroll_views |
| swiftui.scroll-views.scrollindicatorsflash(trigger:) | View/scrollIndicatorsFlash(trigger:) | scroll_views |
| swiftui.scroll-views.scrollinputbehavior | ScrollInputBehavior | scroll_views |
| swiftui.scroll-views.scrollinputbehavior(_:for:) | View/scrollInputBehavior(_:for:) | scroll_views |
| swiftui.scroll-views.scrollinputkind | ScrollInputKind | scroll_views |
| swiftui.scroll-views.scrollphase | ScrollPhase | scroll_views |
| swiftui.scroll-views.scrollphasechangecontext | ScrollPhaseChangeContext | scroll_views |
| swiftui.scroll-views.scrollposition | ScrollPosition | scroll_views |
| swiftui.scroll-views.scrollposition(_:anchor:) | View/scrollPosition(_:anchor:) | scroll_views |
| swiftui.scroll-views.scrollposition(id:anchor:) | View/scrollPosition(id:anchor:) | scroll_views |
| swiftui.scroll-views.scrolltarget | ScrollTarget | scroll_views |
| swiftui.scroll-views.scrolltargetbehavior | ScrollTargetBehavior | scroll_views |
| swiftui.scroll-views.scrolltargetbehavior(_:) | View/scrollTargetBehavior(_:) | scroll_views |
| swiftui.scroll-views.scrolltargetbehaviorcontext | ScrollTargetBehaviorContext | scroll_views |
| swiftui.scroll-views.scrolltargetbehaviorproperties | ScrollTargetBehaviorProperties | scroll_views |
| swiftui.scroll-views.scrolltargetbehaviorpropertiescontext | ScrollTargetBehaviorPropertiesContext | scroll_views |
| swiftui.scroll-views.scrolltargetlayout(isenabled:) | View/scrollTargetLayout(isEnabled:) | scroll_views |
| swiftui.scroll-views.scrolltransition(_:axis:transition:) | View/scrollTransition(_:axis:transition:) | scroll_views |
| swiftui.scroll-views.scrolltransition(topleading:bottomtrailing:axis:transition:) | View/scrollTransition(topLeading:bottomTrailing:axis:transition:) | scroll_views |
| swiftui.scroll-views.scrolltransitionconfiguration | ScrollTransitionConfiguration | scroll_views |
| swiftui.scroll-views.scrolltransitionphase | ScrollTransitionPhase | scroll_views |
| swiftui.scroll-views.scrollview | ScrollView | scroll_views |
| swiftui.scroll-views.scrollviewproxy | ScrollViewProxy | scroll_views |
| swiftui.scroll-views.scrollviewreader | ScrollViewReader | scroll_views |
| swiftui.scroll-views.viewalignedscrolltargetbehavior | ViewAlignedScrollTargetBehavior | scroll_views |
| swiftui.tables.building-a-great-mac-app-with-swiftui | Building a great Mac app with SwiftUI | tables |
| swiftui.tables.disclosuretablerow | DisclosureTableRow | tables |
| swiftui.tables.tablecolumncustomization | TableColumnCustomization | tables |
| swiftui.view-groupings.controlgroup | ControlGroup | view_groupings |
| swiftui.view-groupings.containervalue(_:_:) | View/containerValue(_:_:) | view_groupings |
| swiftui.view-groupings.containervaluekey | ContainerValueKey | view_groupings |
| swiftui.view-groupings.containervalues | ContainerValues | view_groupings |
| swiftui.view-groupings.form | Form | view_groupings |
| swiftui.view-groupings.foreachsectioncollection | ForEachSectionCollection | view_groupings |
| swiftui.view-groupings.foreachsubviewcollection | ForEachSubviewCollection | view_groupings |
| swiftui.view-groupings.group | Group | view_groupings |
| swiftui.view-groupings.groupbox | GroupBox | view_groupings |
| swiftui.view-groupings.groupelementsofcontent | GroupElementsOfContent | view_groupings |
| swiftui.view-groupings.groupsectionsofcontent | GroupSectionsOfContent | view_groupings |
| swiftui.view-groupings.labeledcontent | LabeledContent | view_groupings |
| swiftui.view-groupings.section | Section | view_groupings |
| swiftui.view-groupings.sectioncollection | SectionCollection | view_groupings |
| swiftui.view-groupings.sectionconfiguration | SectionConfiguration | view_groupings |
| swiftui.view-groupings.subview | Subview | view_groupings |
| swiftui.view-groupings.subviewscollection | SubviewsCollection | view_groupings |
| swiftui.view-groupings.subviewscollectionslice | SubviewsCollectionSlice | view_groupings |

## Describe

| Leaf id | API | Section | Reason |
|---|---|---|---|
| swiftui.gestures.handactivationbehavior | HandActivationBehavior | gestures | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.gestures.onlongpressgesture(minimumduration:perform:onpressingchanged:) | View/onLongPressGesture(minimumDuration:perform:onPressingChanged:) | gestures | tvOS-only (Availability: tvOS 14.0 only) |
| swiftui.gestures.onlongtouchgesture(minimumduration:perform:ontouchingchanged:) | View/onLongTouchGesture(minimumDuration:perform:onTouchingChanged:) | gestures | tvOS-only (remote-surface gesture — tvOS 16.0 only) |
| swiftui.gestures.onpencildoubletap(perform:) | View/onPencilDoubleTap(perform:) | gestures | iOS/iPadOS-only (Pencil hardware — no macOS in availability) |
| swiftui.gestures.onpencilsqueeze(perform:) | View/onPencilSqueeze(perform:) | gestures | iOS/iPadOS-only (Pencil hardware — no macOS in availability) |
| swiftui.gestures.rotategesture3d | RotateGesture3D | gestures | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.gestures.deferssystemgestures(on:) | View/defersSystemGestures(on:) | gestures | iOS-only (Availability: iOS 16.0 only) |
| swiftui.layout-adjustments.depthalignment | DepthAlignment | layout_adjustments | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.layout-adjustments.edge3d | Edge3D | layout_adjustments | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.layout-adjustments.edgeinsets3d | EdgeInsets3D | layout_adjustments | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.layout-adjustments.frame(depth:alignment:) | View/frame(depth:alignment:) | layout_adjustments | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.layout-adjustments.frame(mindepth:idealdepth:maxdepth:alignment:) | View/frame(minDepth:idealDepth:maxDepth:alignment:) | layout_adjustments | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.layout-adjustments.layoutrotationunarylayout | LayoutRotationUnaryLayout | layout_adjustments | visionOS-only (Availability: visionOS 26.0 only) |
| swiftui.layout-adjustments.offset(z:) | View/offset(z:) | layout_adjustments | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.layout-adjustments.padding3d(_:) | View/padding3D(_:) | layout_adjustments | visionOS-only (Availability: visionOS only, no macOS) |
| swiftui.layout-adjustments.padding3d(_:_:) | View/padding3D(_:_:) | layout_adjustments | visionOS-only (Availability: visionOS only, no macOS) |
| swiftui.layout-adjustments.spatialcontainer | SpatialContainer | layout_adjustments | visionOS-only (Availability: visionOS 26.0 only) |
| swiftui.layout-adjustments.viewdimensions3d | ViewDimensions3D | layout_adjustments | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.lists.listsectionspacing(_:) | View/listSectionSpacing(_:) | lists | iOS/visionOS-only (doc availability: no macOS) |
| swiftui.lists.listsectionmargins(_:_:) | View/listSectionMargins(_:_:) | lists | iOS/visionOS-only (doc availability: no macOS) |
| swiftui.lists.listrowhovereffect(_:) | View/listRowHoverEffect(_:) | lists | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.lists.listrowhovereffectdisabled(_:) | View/listRowHoverEffectDisabled(_:) | lists | visionOS-only (Availability: visionOS 1.0 only) |
| swiftui.lists.listrowspacing(_:) | View/listRowSpacing(_:) | lists | iOS/visionOS-only (doc availability: no macOS) |
| swiftui.tables.dynamictablerowcontent | DynamicTableRowContent | tables | protocol — no direct renderable child-view form |
| swiftui.tables.emptytablerowcontent | EmptyTableRowContent | tables | internal builder type (protocol conformance container) |
| swiftui.tables.tablecolumncustomizationbehavior | TableColumnCustomizationBehavior | tables | enum options type — no standalone rendering; always describe |
| swiftui.tables.tablecolumnalignment | TableColumnAlignment | tables | enum support type — no standalone rendering |
| swiftui.tables.tablecolumnbuilder | TableColumnBuilder | tables | result builder — no renderable child-view form |
| swiftui.tables.tablecolumncontent | TableColumnContent | tables | protocol — no direct renderable child-view form |
| swiftui.tables.tablecolumnforeach | TableColumnForEach | tables | result builder container — no renderable child-view form |
| swiftui.tables.tablecolumnheaders(_:) | View/tableColumnHeaders(_:) | tables | modifier that affects Table only; no standalone rendering value |
| swiftui.tables.tableforeachcontent | TableForEachContent | tables | internal ForEach wrapper for Table — not a standalone view |
| swiftui.tables.tableheaderrowcontent | TableHeaderRowContent | tables | protocol — no direct renderable child-view form |
| swiftui.tables.tableoutlinegroupcontent | TableOutlineGroupContent | tables | internal outline-group wrapper for Table |
| swiftui.tables.tablerow | TableRow | tables | table content container — not renderable outside Table |
| swiftui.tables.tablerowbuilder | TableRowBuilder | tables | result builder — no renderable child-view form |
| swiftui.tables.tablerowcontent | TableRowContent | tables | protocol — no direct renderable child-view form |
| swiftui.tables.tupletablerowcontent | TupleTableRowContent | tables | internal tuple container — no renderable child-view form |
| swiftui.view-groupings.creating-custom-container-views | Creating custom container views | view_groupings | doc availability lists iOS/Mac Catalyst only — no macOS listed |
| swiftui.view-groupings.dynamicviewcontent | DynamicViewContent | view_groupings | protocol — no renderable child-view form |
