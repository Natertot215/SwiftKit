# D2 — NSCollectionView Family Consolidation Manifest

**Parent page:** SwiftKit/Pages/AppKit/ViewsAndControls/ContentViews/NSCollectionViewPage.swift
**Status:** merged

## Absorbed leaves

| # | Type | Kind | Absorbed Into |
|---|------|------|---------------|
| 1 | NSCollectionViewItem | class : NSViewController | Section 2 — Item and Cell Types |
| 2 | NSCollectionReusableView | class : NSView | Section 2 — Item and Cell Types |
| 3 | NSCollectionViewSectionHeaderView | class : NSCollectionReusableView | Section 2 — Item and Cell Types |
| 4 | NSCollectionViewElement | protocol | Section 2 — Item and Cell Types |
| 5 | NSCollectionViewDataSource | protocol | Section 3 — Data Protocols |
| 6 | NSCollectionViewDelegate | protocol | Section 3 — Data Protocols |
| 7 | NSCollectionViewDelegateFlowLayout | protocol | Section 3 — Data Protocols |
| 8 | NSCollectionViewDiffableDataSource | class (macOS 10.15.1+) | Section 3 — Data Protocols |
| 9 | NSDiffableDataSourceSnapshot | struct (macOS 10.15.1+) | Section 3 — Data Protocols |
| 10 | NSCollectionViewLayout | abstract class | Section 4 — Layout Types |
| 11 | NSCollectionViewFlowLayout | class | Section 4 — Layout Types |
| 12 | NSCollectionViewGridLayout | class | Section 4 — Layout Types |
| 13 | NSCollectionViewTransitionLayout | class | Section 4 — Layout Types |
| 14 | NSCollectionViewLayoutAttributes | class | Section 4 — Layout Types |
| 15 | NSCollectionViewCompositionalLayout | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 16 | NSCollectionViewCompositionalLayoutConfiguration | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 17 | NSCollectionViewCompositionalLayoutSectionProvider | typealias (macOS 10.15+) | Section 5 — Compositional DSL |
| 18 | NSCollectionLayoutItem | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 19 | NSCollectionLayoutGroup | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 20 | NSCollectionLayoutSection | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 21 | NSCollectionLayoutDimension | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 22 | NSCollectionLayoutSize | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 23 | NSCollectionLayoutSpacing | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 24 | NSCollectionLayoutEdgeSpacing | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 25 | NSCollectionLayoutBoundarySupplementaryItem | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 26 | NSCollectionLayoutSupplementaryItem | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 27 | NSCollectionLayoutDecorationItem | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 28 | NSCollectionLayoutAnchor | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 29 | NSCollectionLayoutGroupCustomItem | class (macOS 10.15+) | Section 5 — Compositional DSL |
| 30 | NSCollectionLayoutGroupCustomItemProvider | typealias (macOS 10.15+) | Section 5 — Compositional DSL |
| 31 | NSCollectionLayoutContainer | protocol (macOS 10.15+) | Section 5 — Compositional DSL |
| 32 | NSCollectionLayoutEnvironment | protocol (macOS 10.15+) | Section 5 — Compositional DSL |
| 33 | NSCollectionLayoutVisibleItem | protocol (macOS 10.15+) | Section 5 — Compositional DSL |
| 34 | NSCollectionLayoutSectionOrthogonalScrollingBehavior | enum (macOS 10.15+) | Section 5 — Compositional DSL |
| 35 | NSCollectionLayoutSectionVisibleItemsInvalidationHandler | typealias (macOS 10.15+) | Section 5 — Compositional DSL |
| 36 | NSCollectionViewUpdateItem | class (macOS 10.11+) | Section 5 — Compositional DSL / Invalidation |
| 37 | NSCollectionViewLayoutInvalidationContext | class (macOS 10.11+) | Section 5 — Compositional DSL / Invalidation |
| 38 | NSCollectionViewFlowLayoutInvalidationContext | class (macOS 10.11+) | Section 5 — Compositional DSL / Invalidation |

**Total absorbed:** 38 leaves (1 parent kept, 37 siblings deleted)

## Per-section coverage checklist

### Section 2 — Item and Cell Types
- [x] NSCollectionViewItem documented (loadView, makeItem, register)
- [x] NSCollectionReusableView documented (prepareForReuse, register supplementary)
- [x] NSCollectionViewSectionHeaderView documented (sectionCollapseButton)
- [x] NSCollectionViewElement documented (protocol, apply(layoutAttributes:), prepareForReuse)
- [x] All catalog leaves removed
- [x] Registry entries removed for all 4 types

### Section 3 — Data Protocols
- [x] NSCollectionViewDataSource documented (numberOfItemsInSection, itemForRepresentedObjectAt)
- [x] NSCollectionViewDelegate documented (didSelectItemsAt, didDeselectItemsAt, willDisplay)
- [x] NSCollectionViewDelegateFlowLayout documented (sizeForItemAt, insetForSectionAt, minimumLineSpacing)
- [x] NSCollectionViewDiffableDataSource documented (init closure, apply snapshot)
- [x] NSDiffableDataSourceSnapshot documented (appendSections, appendItems, deleteItems, moveItem)
- [x] All catalog leaves removed
- [x] Registry entries removed for all 5 types

### Section 4 — Layout Types
- [x] NSCollectionViewLayout documented (prepare, layoutAttributesForElements, collectionViewContentSize)
- [x] NSCollectionViewFlowLayout documented (itemSize, lineSpacing, sectionInset, scrollDirection, header/footer)
- [x] NSCollectionViewGridLayout documented (minimumItemSize, maximumItemSize)
- [x] NSCollectionViewTransitionLayout documented (startInteractiveTransition, transitionProgress, finish/cancel)
- [x] NSCollectionViewLayoutAttributes documented (frame, alpha, zIndex, isHidden)
- [x] All catalog leaves removed
- [x] Registry entries removed for all 5 types

### Section 5 — Compositional Layout DSL (describe-only)
- [x] Describe note at top: "no direct rendering — value-type building blocks"
- [x] Container group: NSCollectionViewCompositionalLayout, Configuration, SectionProvider
- [x] Core DSL group: Item, Group, Section, Dimension, Size
- [x] Spacing group: NSCollectionLayoutSpacing, EdgeSpacing
- [x] Supplementary/Decoration group: BoundarySupplementaryItem, SupplementaryItem, DecorationItem, Anchor
- [x] Custom group: GroupCustomItem, GroupCustomItemProvider
- [x] Environment/Scroll group: Container, Environment, VisibleItem, OrthogonalScrollingBehavior, VisibleItemsInvalidationHandler
- [x] Invalidation group: NSCollectionViewUpdateItem, LayoutInvalidationContext, FlowLayoutInvalidationContext
- [x] Full assembly example (code snippet only, no visual demo)
- [x] All 24 catalog leaves removed
- [x] All 24 registry entries removed

### Sections 6 & 7 — Renderable Demos
- [x] FlowLayoutDemo: NSViewRepresentable wrapping NSCollectionView in NSScrollView
- [x] TileItem (NSCollectionViewItem subclass) with swatch + label
- [x] FlowDemoCoordinator: NSCollectionViewDataSource
- [x] SwiftUI Steppers for itemCount, itemWidth, itemHeight, lineSpacing
- [x] HorizontalFlowDemo: horizontal scroll direction
- [x] Both demos use semantic colors only (NSColor.controlAccentColor, .separatorColor, .controlBackgroundColor)

## Code quality review

- [x] L-001 clean: zero hits for `Color(red:` or `.system(size:`
- [x] Bridges use NSViewRepresentable (FlowLayoutDemo, HorizontalFlowDemo)
- [x] No custom wrapper structs beyond NSViewRepresentable bridges
- [x] @State properties are private (itemWidth, itemHeight, lineSpacing, itemCount)
- [x] TileItem uses NSColor semantic tokens only
- [x] layer?.backgroundColor set via NSColor.cgColor — correct pattern for layer-backed views
- [x] NSCollectionView registered before first data source call
- [x] backgroundColors = [.clear] to remove default fill
- [x] ScrollView + VStack + PageSection rhythm followed
- [x] Reference sections appear above demos (sections 2–5 precede 6–7)
- [x] Build: SUCCEEDED

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Code-quality reviewer: Claude Sonnet 4.6 — 2026-05-05

## Manifest metadata

- **Task ID:** D2
- **Parent type:** NSCollectionView
- **Framework:** AppKit
- **Section:** views-and-controls / content-views
- **Absorbed leaves:** 38 total (37 siblings + 1 parent kept)
- **Registry entries removed:** 37
- **Files deleted:** 37 Describe/Page siblings
- **Created:** 2026-05-05
