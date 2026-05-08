# Sort Decisions — SwiftUI Heading

## Page-list Adjustments

### Additions (recommended, requires Nathan approval)

1. **SwiftUI > App Structure > Environment** (new leaf) — The `environment-values/` folder contains 165 docs: `EnvironmentValues` struct, `Environment` property wrapper, `EnvironmentKey` protocol, and 162 individual environment property docs. This is a user-recognizable, heavily-used API. Recommend adding a single "Environment" page under App Structure (or a new "Data Flow" folder). All 165 docs tile here.

2. **SwiftUI > App Structure > State and Bindings** (new leaf) — The `model-data/` folder contains 11 docs covering `State`, `Binding`, `ObservedObject`, `StateObject`, `EnvironmentObject`, `Bindable`, `DynamicProperty`. These are the core state-management primitives every SwiftUI developer uses. Recommend one page with all 11 as tiles.

3. **SwiftUI > Layout > Custom Layout** (new leaf) — The `custom-layout/` folder contains 14 docs: `Layout` protocol, `AnyLayout`, `GridLayout`, `HStackLayout`, `VStackLayout`, `ZStackLayout`, `LayoutSubview`, `LayoutSubviews`, `ProposedViewSize`, `ViewSpacing`, `LayoutProperties`, `LayoutValueKey`, `layoutValue(key:value:)`. A concrete, user-facing API that warrants its own page. Recommend adding as 8th leaf under Layout folder.

4. **SwiftUI > Images and Shapes > AsyncImage** (remove as separate leaf, fold into Image) — AsyncImage is one struct with 2 supporting types (`AsyncImagePhase`). It doesn't warrant its own page. Fold all AsyncImage content into the Image page as a section of tiles. PlanningTree lists it as a separate leaf; recommend collapsing.

### Removals (no docs support)

5. **SwiftUI > Presentation > FullScreenCover** — This leaf has only 2 method docs and no struct/type of its own. Recommend folding into Sheet page as a section. If kept, it only gets `fullScreenCover(isPresented:)`, `fullScreenCover(item:)`, plus file dialog exports (which overlap with Document page). Nathan should decide Sheet vs standalone.

### Confirmation (no changes)

- All 12 folders and 39 leaves from PlanningTree confirmed as correct groupings after reviewing the actual docs.
- The structural changes are: add Environment leaf, add State and Bindings leaf, add Custom Layout leaf, fold AsyncImage into Image, fold or keep FullScreenCover.

---

## Classifier Gate Compliance

All `kind: method`, `kind: property`, `kind: instance method`, `kind: instance-method`, `kind: init`, `kind: func`, `kind: var`, and `kind: case` docs were classified as **tile candidates only**. None were promoted to pages.

- **Total tile-gate docs:** 926+ (all routed as tiles into existing or recommended pages)
- **No method/property doc was promoted to a page entry.** Classifier gate fully honored.

The 5 `kind: article` docs (`copyable(_:)`, `cuttable(for:action:)`, `pasteDestination(for:action:validator:)`, `focused(_:equals:)`, `prefersDefaultFocus(_:in:)`) carry incorrect `kind: article` frontmatter but are semantically view-modifier methods. Classified as tile candidates per the controller's restoration in Phase 0b merge. Routed: clipboard methods → Gestures and Input > Keyboard; focus methods → Gestures and Input > FocusState.

> **Note re: `kind: sampleCode`.** This sort applied the *pre-Phase-0c* blanket-defer rule to the 13 SwiftUI sampleCode docs. Per the Phase 0c framework.md update, sampleCode is now **case-by-case**. The 13 docs need a targeted Phase 1 review pass to evaluate each on its merits. List items added to the Unmapped section of the manifest.

---

## Per-Page Tile Counts

*(Counts are of named tiles in the manifest, including both type-docs and modifier-docs that are tiles for that page.)*

**App Structure**
- App and Scenes: 18 tiles
- WindowGroup: 47 tiles
- Document: 36 tiles

**Navigation**
- NavigationStack: 13 tiles
- NavigationSplitView: 8 tiles
- TabView: 22 tiles
- Sidebar: 3 tiles
- Searchable: 19 tiles
- Inspector: 4 tiles

**Layout**
- Stacks: 7 tiles
- Grid: 7 tiles
- LazyGrid: 4 tiles
- ScrollView: 41 tiles
- GeometryReader: 12 tiles
- Frame and Padding: 21 tiles
- Alignment: 18 tiles
- SafeArea: 5 tiles
- (+ Custom Layout: 14 tiles, if leaf added)

**Containers**
- List: 37 tiles
- Table: 22 tiles
- Form: 8 tiles
- GroupBox: 8 tiles
- Section: 13 tiles
- DisclosureGroup: 4 tiles

**Controls**
- Button: 18 tiles
- Toggle: 4 tiles
- Picker: 7 tiles
- DatePicker: 5 tiles
- ColorPicker: 1 tile
- Slider: 1 tile
- Stepper: 1 tile
- ProgressView: 5 tiles
- Gauge: 4 tiles
- Menu: 17 tiles

**Text and Input**
- Text: 34 tiles
- TextField: 23 tiles
- TextEditor: 11 tiles
- Label: 4 tiles
- AttributedString: 9 tiles

**Images and Shapes**
- Image: 18 tiles
- Shapes: 28 tiles
- Gradient: 14 tiles
- (AsyncImage folded into Image)

**Presentation**
- Sheet: 22 tiles
- Popover: 3 tiles
- Alert: 10 tiles
- ConfirmationDialog: 3 tiles
- FullScreenCover: 2 tiles (or fold into Sheet)

**Toolbars and Menus**
- Toolbar: 32 tiles
- ContextMenu: 5 tiles
- Commands: 15 tiles

**Animation and Effects**
- Animation: 26 tiles
- Transition: 12 tiles
- MatchedGeometry: 21 tiles
- Canvas: 41 tiles

**Accessibility**
- Labels and Descriptions: 25 tiles
- Actions and Behavior: 31 tiles
- Custom Content: 14 tiles

**Gestures and Input**
- Gestures: 25 tiles
- FocusState: 25 tiles
- Keyboard: 18 tiles

---

## Orphan-Candidate Routing

- `CaptionTextFormat` — **No type-doc in mirror.** Confirmed absent from all 1,654 docs. The guide reference is to an implementation pattern, not a standalone type with a distinct Apple URL in this mirror. **Decision: deferred — skip for MVP. Note for potential recapture.**

- `DragState` — **No type-doc in mirror.** `dragsession.md` exists (it's `DragSession`, a different type). `DragState` was a property-wrapper concept from older SwiftUI gesture guides and may have been superseded by `GestureState`. Confirmed absent from all 1,654 docs. **Decision: deferred — no type-doc in mirror; skip for MVP.**

- `LinearGradient` — **No type-doc in mirror.** Mirror has `Gradient`, `AnyGradient`, `MeshGradient` but not `LinearGradient`, `RadialGradient`, or `AngularGradient` as individual docs. These are real SwiftUI types (confirmed Apple primitives). The capture script likely missed them because their URL structure differs. **Decision: flag as mirror gap — recommend recapturing `LinearGradient`, `RadialGradient`, `AngularGradient` docs and adding to Gradient page.**

- `TransferRepresentation` — **No type-doc in mirror.** Part of the `Transferable` protocol infrastructure. These are data-layer abstractions, not UI components. **Decision: deferred — no type-doc in mirror; out of scope for a UI primitive gallery.**

- `Transferable` — **No type-doc in mirror.** Protocol enabling drag-and-drop and copy-paste data transfer; important infrastructure but not a visual component. **Decision: deferred — no type-doc in mirror; out of scope for a UI primitive gallery.**

- `copyable(_:)` — Confirmed present at `Documentation/SwiftUI/clipboard/copyable(_:).md` with `kind: article` (misclassified). View modifier enabling copy behavior. **Routed: Gestures and Input > Keyboard page** (clipboard section alongside `onCopyCommand`, `onCutCommand`, `onPasteCommand`).

- `cuttable(for:action:)` — Confirmed at `Documentation/SwiftUI/clipboard/cuttable(for:action:).md` with `kind: article`. View modifier enabling cut behavior. **Routed: Gestures and Input > Keyboard page.**

- `pasteDestination(for:action:validator:)` — Confirmed at `Documentation/SwiftUI/clipboard/pastedestination(for:action:validator:).md` (filename uses lowercase) with `kind: article`. View modifier enabling paste behavior. **Routed: Gestures and Input > Keyboard page.**

- `focused(_:equals:)` — Confirmed at `Documentation/SwiftUI/focus/focused(_:equals:).md` with `kind: article`. View modifier for binding focus state to a value. **Routed: Gestures and Input > FocusState page** (alongside other `focused` and `defaultFocus` modifiers).

- `prefersDefaultFocus(_:in:)` — Confirmed at `Documentation/SwiftUI/focus/prefersdefaultfocus(_:in:).md` with `kind: article`. View modifier for preferring default focus in a namespace. **Routed: Gestures and Input > FocusState page.**

---

## Large-Folder Deferral Decisions

The following folders have all or substantially all docs deferred (not appearing in any gallery page):

| Folder | Doc Count | Decision |
|---|---|---|
| `technology-specific-views/` | 112 | Defer all — `kind: method`; topics are MapKit, StoreKit, HealthKit, PhotosPicker, TipKit, WebKit, Wallet. Out-of-scope non-macOS-primitive APIs. |
| `environment-values/` | 165 | Route all to new "Environment" page (needs Nathan approval). If declined, defer all. |
| `previews-in-xcode/` | 22 | Defer all — developer tooling, not UI primitives. |
| `immersive-spaces/` | 22 | Defer all — visionOS only; SwiftKit is macOS 26. |
| `uikit-integration/` | 14 | Defer all — UIKit bridges; macOS-only stack. |
| `watchkit-integration/` | 4 | Defer all — WatchKit only. |
| `app-extensions/` | 19 | Defer all — Widget/ControlWidget extension infrastructure. |
| `system-events/` | 17 | Defer all — non-visual lifecycle/URL handling APIs. |
| `persistent-storage/` | 8 | Defer all — data persistence layer, not UI primitives. |
| `preferences/` | 11 | Defer all — internal layout preference system, not user-facing components. |

---

## Open Questions / For Nathan Checkpoint

1. **Environment and State pages**: Should `environment-values/` (165 docs) and `model-data/` (11 docs) get their own gallery pages? They're not visual components but are heavily used by every SwiftUI developer. Recommend yes for `model-data/` (State, Binding, etc.) and yes for `EnvironmentValues`/`Environment` as a page. If declined, these 176 docs are deferred.

2. **Custom Layout leaf**: Should `custom-layout/` (14 docs: `Layout` protocol, `AnyLayout`, stack/grid layout types) get a "Custom Layout" leaf under the Layout folder? It's a legitimate user-facing API. Recommend yes.

3. **AsyncImage as separate page vs tile on Image**: PlanningTree has AsyncImage as a separate leaf. Given there's only one struct and one enum, recommend folding into Image page. Nathan to confirm.

4. **AppKit Integration page under SwiftUI**: The `appkit-integration/` folder has 13 docs for `NSViewRepresentable`, `NSViewControllerRepresentable`, `NSHostingView`, `NSHostingController` — all macOS-specific and relevant to a macOS gallery. Recommend adding as a leaf. Should it live under SwiftUI > App Structure, or as a separate AppKit heading leaf? (Note: `appkit-integration` docs are under SwiftUI/ in the mirror, not AppKit/.)

5. **FullScreenCover**: Keep as separate page or fold into Sheet? It's relevant on macOS (used with `.fullScreenCover`) but only has 2 method docs. Recommend fold into Sheet.

6. **Glass Effects page**: macOS 26 introduces `GlassBackgroundEffect`, `GlassEffectContainer`, `GlassEffectTransition`, `GlassButtonStyle`, `GlassProminentButtonStyle`, `glassBackgroundEffect(_:)`, `glassEffect(_:in:)`, `glassBackgroundEffect(displayMode:)`. These are a prominent new visual system. Consider adding a "Glass Effects" page under Images and Shapes or Animation and Effects. Currently routed as tiles on Button and Canvas pages.

7. **LinearGradient recapture**: `LinearGradient`, `RadialGradient`, `AngularGradient` are confirmed absent from the mirror. These are real SwiftUI types. Recommend running a targeted recapture for these 3 before Phase 3, and adding them as tiles to the Gradient page.

8. **view-fundamentals folder**: `View`, `ViewModifier`, `AnyView`, `EmptyView`, `ViewBuilder`, `TupleView` are fundamental but not visually demonstrable. Route as tiles on a "View Fundamentals" page under App Structure, or defer entirely? Recommend a minimal page showing `AnyView` and `EmptyView` use cases.

9. **`kind: sampleCode` case-by-case (Phase 0c update):** This sort blanket-deferred all 13 SwiftUI sampleCode docs per the previous rule. Per Phase 0c, sampleCode is now case-by-case. A separate review pass is needed to evaluate each of the 13 — promote as a tile on a relevant page if it illustrates a focused component pattern; defer if it's a tutorial/full-app demo without component scope. Phase 1 user-checkpoint review should resolve.

---

## Classifier Gate Summary (counts)

| Kind | Count | Disposition |
|---|---|---|
| method | 723+ | All tiles |
| property | 187+ | All tiles |
| instance method | 5 | All tiles |
| instance-method | 1 | Tile |
| init | 1 | Tile |
| func | 4 | All tiles |
| article | 5 | Tiles (5 restored clipboard/focus methods) |
| **Subtotal tile-gate** | **~926** | |
| struct | 533 | Mixed: ~250 tiles for named pages, ~283 deferred/unmapped |
| class | 10 | Mixed: 4 appkit-integration tiles (pending Nathan), rest deferred |
| enum | 54 | All tiles on their respective pages |
| protocol | 106 | All tiles on their respective pages |
| macro | 9 | Tiles on previews-in-xcode (deferred) or App Structure |
| typealias | 3 | Tiles (`PullDownButton` → Commands; `TimelineViewDefaultContext` → Animation; `UITraitBridgedEnvironmentKey` → deferred) |
| **Subtotal type-gate** | **~715** | |
| sampleCode | 13 | All deferred (Phase 0c rule says case-by-case — reconsider) |
| **Grand total** | **~1,654** | |

---

## C11 — sample-code review outcome (2026-05-07)

Per Phase 0c case-by-case rule, controller-side review of all 13 SwiftUI `kind: sampleCode` docs.

**Outcome: 13/13 deferred from gallery tiles.** None fit the single-primitive-render tile model (verbatim type-name header + brief description + live render of one Apple primitive). All are downloadable WWDC-companion sample apps that span multiple primitives in tutorial form. Phase 3 implementers MAY cite specific samples in tile descriptions where they add context (per the descriptions-may-reference-excluded-URLs rule).

| Doc | Length | Reason |
|---|---|---|
| `accessibility-fundamentals/creating-accessible-views.md` | stub | WWDC21 demo download — broad accessibility patterns |
| `custom-layout/composing-custom-layouts-with-swiftui.md` | 236 lines | Full app demo (pet-vote leaderboard); spans Grid/GridRow/ForEach. Phase 3 Custom Layout tiles MAY cite |
| `documents/building-a-document-based-app-using-swiftdata.md` | stub | Full app + uses SwiftData (banned per L-007) |
| `documents/building-a-document-based-app-with-swiftui.md` | stub | Full app demo |
| `drawing-and-graphics/add-rich-graphics-to-your-swiftui-app.md` | stub | WWDC21 demo download |
| `essentials/landmarks-building-an-app-with-liquid-glass.md` | stub | Full app demo |
| `focus/focus-cookbook-sample.md` | stub | WWDC23 cookbook demo |
| `navigation/bringing-robust-navigation-structure-to-your-swiftui-app.md` | stub | WWDC22 nav demo |
| `tables/building-a-great-mac-app-with-swiftui.md` | stub | Full Mac app demo |
| `text-input-and-output/building-rich-swiftui-text-experiences.md` | stub | WWDC text experiences demo |
| `text-input-and-output/creating-visual-effects-with-swiftui.md` | stub | WWDC24 visual effects demo |
| `view-groupings/creating-custom-container-views.md` | stub | WWDC24 container demo |
| `windows/bringing-multiple-windows-to-your-swiftui-app.md` | stub | WWDC22 multi-window demo |

**Net change from earlier sort:** Custom Layout drops from 14 to 13 tiles (composing-custom-layouts excluded). All other Phase 1 tile counts unchanged.
