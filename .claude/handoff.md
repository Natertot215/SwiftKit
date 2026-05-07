# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Last session:** 2026-05-07 *(strip-and-restart + sidebar placeholder template)*
**Git:** `main` ahead of `origin/main`. Last commit `753f4d9` is the placeholder-template commit.
**HEAD:** `753f4d9 Sidebar placeholder template — 3 folders × 3 sub × 9 pages`
**Tags:** `pre-restart` → `62db021` *(snapshot of full pre-strip corpus, recoverable via `git show pre-restart:<path>`)*
**Build:** ✅ `** BUILD SUCCEEDED **` after both the strip *(`ee95864`)* and the placeholder template *(`753f4d9`)*.

## What the strip did *(2026-05-07)*

Following Nathan's decision to restart from a clean foundation, the project was stripped:

- **Pre-strip snapshot committed first** *(commit `62db021`, tag `pre-restart`)*. Full corpus recoverable from that tag — nothing was lost.
- **Stripped subtrees:** `SwiftKit/Pages/SwiftUI/` *(678 files)*, `SwiftKit/Pages/AppKit/` *(140 files)*, `SwiftKit/Pages/Documentation/` *(11 mis-placed Describe pages)*. Plus the legacy `SwiftKit/Pages/Reference/TypographyPage.swift`.
- **GalleryRegistry.allItems reset** to the 5 Reference pages: Materials, Motion, Color, SF Symbols, Typography.
- **Build verified green** with the trimmed registry.
- **Strip commit landed** *(`ee95864`)*: 831 files changed, 5 insertions, **141,056 deletions**.

## Why the strip happened

Documented in `// The Nexus // Claude // SwiftKit — Where The Mess Came From.md` *(complete retrospective, mobile-readable)* and `// The Nexus // Projects // Project SwiftKit // SwiftKit Status - 5-7.md` *(pre-strip objective snapshot)*.

**Short version:** the May-3 Phase 5 triage classified Apple's 1,722 SwiftUI URLs into 990 "leaves" and treated each as a sidebar page. That conflated *variant enumeration* with *page list*, producing 358 SwiftUI pages where ~60 belonged. Family consolidation arrived 3 days late and was applied to only 8 of ~60 families. By 2026-05-07, the corpus was 836 page files / 141,656 lines / 43 folders — a tangled mass that was faster to strip than untangle.

## Current state

```
Total Swift files:         21
  Shell + scaffolds:       14
  Reference pages:         5 (on disk, unregistered while placeholder template active)
  Shared:                  2 (DescribePage.swift, PlaceholderGalleryPage.swift)

GalleryRegistry entries:   81 (placeholder template: 3 frameworks × 3 sub-folders × 9 pages)
Sidebar folders:           3 main ("Folder 1/2/3"), 9 sub-folders ("Subfolder X.Y"), 81 pages
Documentation mirror:      2,535 markdown files (intact, unchanged)
```

The shell, scaffolds, and Reference pages are all proven and unchanged. The placeholder template exercises the full 3-tier disclosure (framework → folder → page). The 5 Reference pages remain on disk as authoring models; they re-register when their slot is replaced by real content. The Documentation mirror is intact and is the authoring source for everything that comes next.

## What's next

Plan documented in detail at `// The Nexus // Projects // Project SwiftKit // SwiftKit Handoff - 5-7.md`.

**Target shape:** ~70 pages across 14 folders *(13 SwiftUI + 1 AppKit + Reference collapses to single-tier)*.

**Cadence:** pilot first *(`ButtonGalleryPage`)*, then one folder per session, solo authoring. No parallel agents authoring pages without explicit per-page approval.

**Source content:** read the relevant `Documentation/<framework>/<topic>/<symbol>.md` for each page. No more re-derivation from training memory.

## Open decisions before pilot

- Whether to delete `SwiftKit/Detail/PageScaffold/GalleryPageScaffold.swift` *(legacy scaffold, no surviving consumers — verify with grep)*.
- Whether to keep `SwiftKit/Pages/_Shared/DescribePage.swift` *(no consumers post-strip but may be wanted for protocol/iOS-only describe content under the new model)*.
- Lock in the 13 SwiftUI folder names *(proposed: App Structure, Navigation, Layout, Containers, Controls, Text and Input, Images and Shapes, Presentation, Toolbars and Menus, Animation and Effects, Accessibility, Gestures and Input)*.
- Confirm `ButtonGalleryPage` as the pilot.

## Standing constraints *(unchanged)*

- macOS 26 only. Dark mode first. Apple primitives only.
- `PBXFileSystemSynchronizedRootGroup`: drop `.swift` files into `SwiftKit/<subdir>/`, Xcode auto-syncs.
- `Documentation/` is project-root sibling, never inside `SwiftKit/SwiftKit/` *(L-010)*.
- Keep `GalleryRegistry.allItems` flat *(L-011)*.
- Semantic tokens only *(visual-rules L-001, L-012)*.
- SourceKit "Cannot find X in scope" diagnostics are stale — clear after `xcodebuild`. Trust build.

## Permanent gotchas

- **Apple's URL count is not the page count.** A modifier doesn't deserve its own page; it's a variant tile inside a primitive's page.
- **Documentation mirror is the authoring input** — read the markdown before writing the page.
- **Folders are reserved for large groupings.** Anything with fewer than ~4 pages folds up.
- **Commit before any sweep that deletes files.** *(Day 1's enrichment pass burned because deleted files were uncommitted.)*

## Pre-strip Planning docs *(historical only)*

The two dated planning docs in `.claude/Planning/` predate the strip:

- `2026-05-07-finish-line-handoff.md` — written morning of the strip, reflects pre-strip mental model.
- `2026-05-07-tile-migration-handoff.md` — migration plan that the strip obsoleted.

Both retained for historical record. **Do not execute either plan** — both assume the pre-strip corpus.

## Open follow-ups

- Visual QA pass on placeholder template — confirm 3-tier disclosure mechanics, default selection, and `PlaceholderGalleryPage` routing all behave as desired.
- Settle the open decisions before pilot *(see `// The Nexus // Projects // Project SwiftKit // SwiftKit Handoff - 5-7.md`)*: GalleryPageScaffold delete? DescribePage keep? Folder name lock-in? Button as pilot?
- Author the pilot page *(`ButtonGalleryPage`)*. When it lands, replace the matching placeholder block in `GalleryRegistry` and revert `Framework.displayName` for that case to its canonical label.
- After pilot, write `.claude/Planning/2026-05-07-restart-spec.md` with the locked-in folder + page list.
