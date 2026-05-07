# Sort Decisions — Phase 1 Audit Trail

Top-level audit trail for Phase 1 sorting. Per-framework decision logs hold the line-by-line rationale; this file is the at-a-glance summary for the Phase 1 user-checkpoint review.

## Per-framework details

- **Reference** — [`sort-decisions-reference.md`](sort-decisions-reference.md)
- **SwiftUI** — [`sort-decisions-swiftui.md`](sort-decisions-swiftui.md)
- **AppKit** — [`sort-decisions-appkit.md`](sort-decisions-appkit.md)

Per-framework manifest companions (the actual page lists):

- [`page-component-map-reference.md`](page-component-map-reference.md)
- [`page-component-map-swiftui.md`](page-component-map-swiftui.md)
- [`page-component-map-appkit.md`](page-component-map-appkit.md)
- [`page-component-map.md`](page-component-map.md) — top-level overview + Nathan checkpoint questions

## Top-level decisions made by sort agents

### Page-list adjustments (require Nathan approval)

| Heading | Folder | Adjustment | Source |
|---|---|---|---|
| SwiftUI | App Structure | Add **Environment** leaf (165 tiles) | `environment-values/` |
| SwiftUI | App Structure | Add **State and Bindings** leaf (11 tiles) | `model-data/` |
| SwiftUI | App Structure | Add **AppKit Integration** leaf (13 tiles) | `appkit-integration/` |
| SwiftUI | App Structure | Add minimal **View Fundamentals** leaf | `view-fundamentals/` |
| SwiftUI | Layout | Add **Custom Layout** leaf (14 tiles) | `custom-layout/` |
| SwiftUI | Images and Shapes | Fold **AsyncImage** into Image page | (drops a separate leaf) |
| SwiftUI | Presentation | Fold **FullScreenCover** into Sheet | (drops a separate leaf) |
| SwiftUI | Animation and Effects | Optional **Glass Effects** leaf | macOS 26 Liquid Glass |
| AppKit | (root) | Add **NSGlassEffectView** leaf (3 tiles) | macOS 26 Liquid Glass AppKit |

### Classifier-gate compliance

All three sort agents honored the gate. No `kind: method`, `kind: property`, `kind: instance method`, `kind: instance-method`, `kind: init`, `kind: func`, `kind: var`, or `kind: case` doc was promoted to a page entry across any of the 3 frameworks.

The 5 misclassified `kind: article` method docs (`copyable(_:)`, `cuttable(for:action:)`, `pasteDestination(for:action:validator:)`, `focused(_:equals:)`, `prefersDefaultFocus(_:in:)`) restored from archive in Phase 0b are routed as tiles to their parent component pages (Clipboard / Focus → Gestures and Input > Keyboard / FocusState).

### Open `sampleCode` audit

This Phase 1 sort applied the *pre-Phase-0c* blanket-defer rule to the 22 active sampleCode docs (13 SwiftUI + 9 AppKit). Per Phase 0c's case-by-case rule, these need a targeted review pass to evaluate each on its merits — promote as a tile if it illustrates a focused component pattern; defer if it's a tutorial or full-app demo.

### Mirror gap

`LinearGradient`, `RadialGradient`, `AngularGradient` are real macOS SwiftUI types absent from `Documentation/SwiftUI/`. Recommend running a targeted recapture (`Documentation/_index/recapture-targets.sh`) for these 3 URLs before Phase 3 begins.

### Orphan-component cross-check (from Phase 0b)

Resolved by the SwiftUI sort agent:
- `CaptionTextFormat`, `DragState`, `TransferRepresentation`, `Transferable` — no type-doc in mirror; deferred.
- `LinearGradient` — flagged as mirror gap (see above).

Resolved by the AppKit sort agent:
- All 9 AppKit orphan candidates from Phase 0b (`NSAccessibilityElement`, `NSAttributedString`, `NSCoder`, `NSHostingMenu`, `NSMenuItemImportFromDeviceIdentifier`, `NSRestorableState`, `NSSplitViewItemAccessoryViewController`, `NSViewContentSelectionInfo`, `NSWindows`) — none have type-docs; all deferred or out-of-scope.

The 68 HIG orphan candidates from Phase 0b were largely cross-platform (UIKit/MapKit/Wallet/etc.) and are out of scope for the macOS gallery. Three flagged for verification (`RequestReviewAction`, `SymbolEffect`, `SymbolScale`) — `SymbolEffect`/`SymbolScale` route to SF Symbols Reference page if macOS-supported (verify in Phase 3).

## Total corpus accounting

Active corpus (post Phase 0b + 0c archival): **2,249 docs across 16 distinct `kind:` values**. Every doc is bucketed:

- **Tile-gate kinds** (method/property/init/func/var/case/instance method/instance-method): all routed as tiles. ~1,200+ docs.
- **Type-gate kinds** (struct/class/enum/protocol/macro/typealias): mixed. Some pages (NavigationStack, Button, Table, etc.); most as tiles inside parent pages.
- **`kind: sampleCode`** (22 docs): all currently deferred; case-by-case review pending.
- **`kind: article`** (5 docs): all are misclassified method docs, routed as tiles.

No silent drops. Every doc accounted for in exactly one bucket.
