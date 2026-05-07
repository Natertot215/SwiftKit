# Exclusions — URL List

Single index of every URL whose markdown was excluded from the gallery's component scope. The gallery surfaces only components, code, and their descriptions — the entries below are articles, guides, or topic-group navigation pages, none of which become a SwiftKit gallery page or tile.

**Component descriptions MAY reference these URLs** when citing Apple's broader documentation helps explain a component. The exclusion governs WHAT BECOMES A GALLERY PAGE, not what a description can cite.

## Counts

- **Articles** *(`kind: article`)*: 51 SwiftUI + 18 AppKit = 69 files. Archived in Phase 0b at `Documentation/_archive/guides/<framework>/...`.
- **Guides** *(entire HIG corpus)*: 180 files. Archived in Phase 0b at `Documentation/_archive/guides/HIG/...`.
- **Topic Pages** *(`kind: collectionGroup` and master `_index.md`)*: 36 AppKit + 1 SwiftUI = 37 files. Archived in Phase 0c at `Documentation/_archive/topic-pages/<framework>/...`.
- **Total: 286 excluded URLs across 3 categories.**

Per-framework manifests (full file lists with paths): `Documentation/_archive/guides/<framework>/_manifest.md` for articles + HIG; topic pages enumerated below.

---

## Articles

### SwiftUI *(51)*

- [Adding a background to your view](https://developer.apple.com/documentation/swiftui/adding-a-background-to-your-view)
- [Adding a search interface to your app](https://developer.apple.com/documentation/swiftui/adding-a-search-interface-to-your-app)
- [Adding interactivity with gestures](https://developer.apple.com/documentation/swiftui/adding-interactivity-with-gestures)
- [Adopting drag and drop using SwiftUI](https://developer.apple.com/documentation/swiftui/adopting-drag-and-drop-using-swiftui)
- [Aligning views across stacks](https://developer.apple.com/documentation/swiftui/aligning-views-across-stacks)
- [Aligning views within a stack](https://developer.apple.com/documentation/swiftui/aligning-views-within-a-stack)
- [Applying custom fonts to text](https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text)
- [Applying Liquid Glass to custom views](https://developer.apple.com/documentation/swiftui/applying-liquid-glass-to-custom-views)
- [Backyard Birds: Building an app with SwiftData and widgets](https://developer.apple.com/documentation/swiftui/backyard-birds-sample)
- [Building and customizing the menu bar with SwiftUI](https://developer.apple.com/documentation/swiftui/building-and-customizing-the-menu-bar-with-swiftui) — `menus-and-commands/`
- [Building and customizing the menu bar with SwiftUI](https://developer.apple.com/documentation/swiftui/building-and-customizing-the-menu-bar-with-swiftui) — `scenes/` *(Apple cross-listing — same URL)*
- [Building layouts with stack views](https://developer.apple.com/documentation/swiftui/building-layouts-with-stack-views)
- [Composing SwiftUI gestures](https://developer.apple.com/documentation/swiftui/composing-swiftui-gestures)
- [Configuring views](https://developer.apple.com/documentation/swiftui/configuring-views)
- [Controlling the timing and movements of your animations](https://developer.apple.com/documentation/swiftui/controlling-the-timing-and-movements-of-your-animations)
- [Creating a tvOS Media Catalog App in SwiftUI](https://developer.apple.com/documentation/swiftui/creating-a-tvos-media-catalog-app-in-swiftui)
- [Creating performant scrollable stacks](https://developer.apple.com/documentation/swiftui/creating-performant-scrollable-stacks)
- [Customizing window styles and state-restoration behavior in macOS](https://developer.apple.com/documentation/swiftui/customizing-window-styles-and-state-restoration-behavior-in-macos)
- [Declaring a custom view](https://developer.apple.com/documentation/swiftui/declaring-a-custom-view)
- [Displaying data in lists](https://developer.apple.com/documentation/swiftui/displaying-data-in-lists)
- [Enhancing Your App's Content with Tab Navigation](https://developer.apple.com/documentation/swiftui/enhancing-your-app-content-with-tab-navigation)
- [Fitting images into available space](https://developer.apple.com/documentation/swiftui/fitting-images-into-available-space)
- [Food Truck: Building a SwiftUI Multiplatform App](https://developer.apple.com/documentation/swiftui/food-truck-building-a-swiftui-multiplatform-app)
- [Grouping data with lazy stack views](https://developer.apple.com/documentation/swiftui/grouping-data-with-lazy-stack-views)
- [Inspecting view layout](https://developer.apple.com/documentation/swiftui/inspecting-view-layout)
- [Landmarks: Building an App with Liquid Glass](https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass) — `_index/`
- [Landmarks: Building an app with Liquid Glass](https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass) — `view-styles/` *(Apple cross-listing — same URL, different title-case)*
- [Laying out a simple view](https://developer.apple.com/documentation/swiftui/laying-out-a-simple-view)
- [Loading and Displaying a Large Data Feed](https://developer.apple.com/documentation/swiftui/loading-and-displaying-a-large-data-feed)
- [Making a view into a drag source](https://developer.apple.com/documentation/swiftui/making-a-view-into-a-drag-source)
- [Making fine adjustments to a view's position](https://developer.apple.com/documentation/swiftui/making-fine-adjustments-to-a-view-s-position)
- [Managing Model Data in Your App](https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app)
- [Managing search interface activation](https://developer.apple.com/documentation/swiftui/managing-search-interface-activation)
- [Managing User Interface State](https://developer.apple.com/documentation/swiftui/managing-user-interface-state)
- [Migrating from the Observable Object Protocol to the Observable Macro](https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro)
- [Migrating to New Navigation Types](https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types)
- [Migrating to the SwiftUI life cycle](https://developer.apple.com/documentation/swiftui/migrating-to-the-swiftui-life-cycle)
- [Monitoring Data Changes in Your App](https://developer.apple.com/documentation/swiftui/monitoring-model-data-changes-in-your-app)
- [Performing a search operation](https://developer.apple.com/documentation/swiftui/performing-a-search-operation)
- [Picking container views for your content](https://developer.apple.com/documentation/swiftui/picking-container-views-for-your-content)
- [Populating SwiftUI menus with adaptive controls](https://developer.apple.com/documentation/swiftui/populating-swiftui-menus-with-adaptive-controls)
- [Preparing views for localization](https://developer.apple.com/documentation/swiftui/preparing-views-for-localization)
- [Reducing view modifier maintenance](https://developer.apple.com/documentation/swiftui/reducing-view-modifier-maintenance)
- [Restoring Your App's State with SwiftUI](https://developer.apple.com/documentation/swiftui/restoring-your-app-s-state-with-swiftui)
- [Scoping a search operation](https://developer.apple.com/documentation/swiftui/scoping-a-search-operation)
- [Suggesting search terms](https://developer.apple.com/documentation/swiftui/suggesting-search-terms)
- [SwiftUI Updates](https://developer.apple.com/documentation/updates/swiftui) — `_index/`
- [SwiftUI updates](https://developer.apple.com/documentation/updates/swiftui) — `essentials/` *(Apple cross-listing — same URL, lowercase 'updates')*
- [Understanding the Navigation Stack](https://developer.apple.com/documentation/swiftui/understanding-the-navigation-stack)
- [Unifying your app's animations](https://developer.apple.com/documentation/swiftui/unifying-your-app-s-animations)
- [Wishlist: Planning travel in a SwiftUI app](https://developer.apple.com/documentation/swiftui/wishlist-planning-travel-in-a-swiftui-app)

> Apple cross-lists 3 SwiftUI guides under multiple sub-paths (e.g. `building-and-customizing-the-menu-bar-with-swiftui` lives under both `menus-and-commands/` and `scenes/`). Each cross-listed file appears as a separate bullet above so the bullet count (51) matches the file count in the per-framework manifest.

### AppKit *(18)*

- [Accessibility Functions](https://developer.apple.com/documentation/appkit/accessibility-functions)
- [Adding Writing Tools support to a custom AppKit view](https://developer.apple.com/documentation/appkit/adding-writing-tools-support-to-a-custom-nsview)
- [Adopting Liquid Glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)
- [Adopting the system text cursor in custom text views](https://developer.apple.com/documentation/appkit/adopting-the-system-text-cursor-in-custom-text-views)
- [Applying Apple HDR effect to your photos](https://developer.apple.com/documentation/appkit/applying-apple-hdr-effect-to-your-photos)
- [Browser View](https://developer.apple.com/documentation/appkit/browser-view)
- [Collection View](https://developer.apple.com/documentation/appkit/collection-view)
- [Custom Controls](https://developer.apple.com/documentation/appkit/custom-controls)
- [Customizing Writing Tools behavior for AppKit views](https://developer.apple.com/documentation/appkit/customizing-writing-tools-behavior-for-system-views)
- [Grid View](https://developer.apple.com/documentation/appkit/grid-view)
- [Organize Your User Interface with a Stack View](https://developer.apple.com/documentation/appkit/organize-your-user-interface-with-a-stack-view)
- [Porting your macOS apps to Apple Silicon](https://developer.apple.com/documentation/apple-silicon/porting-your-macos-apps-to-apple-silicon)
- [Restoring Your App's State with AppKit](https://developer.apple.com/documentation/appkit/restoring-your-app-s-state-with-appkit)
- [Scroll View](https://developer.apple.com/documentation/appkit/scroll-view)
- [Supporting Continuity Camera in Your Mac App](https://developer.apple.com/documentation/appkit/supporting-continuity-camera-in-your-mac-app)
- [Supporting Writing Tools via the pasteboard](https://developer.apple.com/documentation/appkit/supporting-writing-tools-via-the-pasteboard)
- [Updates to AppKit](https://developer.apple.com/documentation/updates/appkit)
- [Views and Controls](https://developer.apple.com/documentation/appkit/views-and-controls)

---

## Guides

### HIG *(180)*

180 entries — full URL list at `Documentation/_archive/guides/HIG/_manifest.md`. HIG is design guidance only; nothing from this set surfaces as a gallery page. Phase 1's orphan-component cross-check (see `.claude/Planning/guide-orphan-components.md`) covers any HIG-referenced types worth tile homes.

---

## Topic Pages

### SwiftUI *(1)*

- [SwiftUI](https://developer.apple.com/documentation/swiftui) — `SwiftUI/_index/_index.md` *(framework root landing — `kind: framework`)*

### AppKit *(36)*

- [Accessibility Functions](https://developer.apple.com/documentation/appkit/accessibility-functions) — `accessibility-for-appkit/accessibility-functions.md`
- [Custom Controls](https://developer.apple.com/documentation/appkit/custom-controls) — `accessibility-for-appkit/custom-controls.md`
- [AppKit Errors](https://developer.apple.com/documentation/appkit/appkit-errors) — `app-structure/appkit-errors.md`
- [Services Functions](https://developer.apple.com/documentation/appkit/services-functions) — `app-structure/services-functions.md`
- [Binding dictionary keys](https://developer.apple.com/documentation/appkit/binding-dictionary-keys) — `cocoa-bindings/binding-dictionary-keys.md`
- [NSPlaceholders](https://developer.apple.com/documentation/appkit/nsplaceholders) — `cocoa-bindings/nsplaceholders.md`
- [Selection Markers](https://developer.apple.com/documentation/appkit/selection-markers) — `cocoa-bindings/selection-markers.md`
- [Additional Writing Directions](https://developer.apple.com/documentation/appkit/additional-writing-directions) — `deprecated-symbols/additional-writing-directions.md`
- [Data Entry Types](https://developer.apple.com/documentation/appkit/data-entry-types) — `deprecated-symbols/data-entry-types.md`
- [Glyph Attributes](https://developer.apple.com/documentation/appkit/glyph-attributes) — `deprecated-symbols/glyph-attributes.md`
- [NSAccessibility](https://developer.apple.com/documentation/appkit/nsaccessibility) — `deprecated-symbols/nsaccessibility.md`
- [Anonymous](https://developer.apple.com/documentation/appkit/nsbuttontypes-anonymous) — `deprecated-symbols/nsbuttontypes-anonymous.md`
- [Return values for modal operations](https://developer.apple.com/documentation/appkit/return-values-for-modal-operations) — `deprecated-symbols/return-values-for-modal-operations.md`
- [Tags of Views in the FontPanel](https://developer.apple.com/documentation/appkit/tags-of-views-in-the-fontpanel) — `deprecated-symbols/tags-of-views-in-the-fontpanel.md`
- [Convenience Functions](https://developer.apple.com/documentation/appkit/convenience-functions) — `drawing/convenience-functions.md`
- [Protecting the User's Privacy](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy) — `essentials/protecting-the-user-s-privacy.md`
- [Constants](https://developer.apple.com/documentation/appkit/constants) — `reference-enumerations-constants-data-types-macros/constants.md`
- [Data Types](https://developer.apple.com/documentation/appkit/data-types) — `reference-enumerations-constants-data-types-macros/data-types.md`
- [Enumerations](https://developer.apple.com/documentation/appkit/enumerations) — `reference-enumerations-constants-data-types-macros/enumerations.md`
- [Macros](https://developer.apple.com/documentation/appkit/macros) — `reference-enumerations-constants-data-types-macros/macros.md`
- [Reserved Glyph Codes](https://developer.apple.com/documentation/appkit/reserved-glyph-codes) — `textkit/reserved-glyph-codes.md`
- [Browser View](https://developer.apple.com/documentation/appkit/browser-view) — `views-and-controls/browser-view.md`
- [Collection View](https://developer.apple.com/documentation/appkit/collection-view) — `views-and-controls/collection-view.md`
- [Combo Box](https://developer.apple.com/documentation/appkit/combo-box) — `views-and-controls/combo-box.md`
- [Date Picker](https://developer.apple.com/documentation/appkit/date-picker) — `views-and-controls/date-picker.md`
- [Grid View](https://developer.apple.com/documentation/appkit/grid-view) — `views-and-controls/grid-view.md`
- [Outline View](https://developer.apple.com/documentation/appkit/outline-view) — `views-and-controls/outline-view.md`
- [Path Control](https://developer.apple.com/documentation/appkit/path-control) — `views-and-controls/path-control.md`
- [Scroll View](https://developer.apple.com/documentation/appkit/scroll-view) — `views-and-controls/scroll-view.md`
- [Search Field](https://developer.apple.com/documentation/appkit/search-field) — `views-and-controls/search-field.md`
- [Slider](https://developer.apple.com/documentation/appkit/slider) — `views-and-controls/slider.md`
- [Table View](https://developer.apple.com/documentation/appkit/table-view) — `views-and-controls/table-view.md`
- [Text Field](https://developer.apple.com/documentation/appkit/text-field) — `views-and-controls/text-field.md`
- [Token Field](https://developer.apple.com/documentation/appkit/token-field) — `views-and-controls/token-field.md`
- [Toolbar](https://developer.apple.com/documentation/appkit/toolbar) — `views-and-controls/toolbar.md`
- [NSFontPanelValidation](https://developer.apple.com/documentation/appkit/nsfontpanelvalidation) — `windows-panels-and-screens/nsfontpanelvalidation.md`

> The AppKit topic-pages list above contains URLs that may also appear in the Articles > AppKit section above (e.g. "Browser View", "Collection View", "Custom Controls", "Grid View", "Scroll View"). Apple captured the same URL into multiple files during the original doc walk — one as `kind: article` (an article landing inside a sub-folder) and one as `kind: collectionGroup` (a topic-group file). Both file paths are listed above; both are excluded.

---

> **Replaces** `Documentation/_links/guides.md` (deleted Phase 0c). All exclusion content is consolidated here.
