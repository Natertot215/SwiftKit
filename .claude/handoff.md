# SwiftKit — Handoff

> Rewrite at the end of every session. Always reflects current state.

**Last session:** 2026-05-04
**Git:** `origin/main` synced through `c26be61`. Working tree clean.

## Current State

Phase 5 active. Catalog fully scaffolded — 990 `.placeholder` leaves. Triage complete (734 implement, 256 describe). Page authoring underway in parallel agent batches.

`.claude/` was migrated to the new StudioMD four-folder convention this session — start any new session by reading `claude.md` (root) and follow its file index for orientation.

**Build:** Clean. DerivedData hash confirmed. App launches.
**Doc mirror:** Complete. Zero failed stubs. Capture scripts in `Documentation/_index/`.

## Recently Completed

### 2026-05-04 (this session)
- **`.claude/` migrated to new StudioMD convention.** (commit `b25d725`)
  - `CLAUDE.md` → `claude.md` (brief + directional, non-negotiables upfront).
  - `memory.md` → `history.md` (chronological log format).
  - `handoff.md` rewritten as session-continuity doc.
  - `feedback.md`, `macuix-rules.md` → `Guidelines/`.
  - `lessons.md` split by domain → `Guidelines/visual-rules.md` (L-001, L-012), `Guidelines/api-and-layout.md` (L-002, L-003, L-008, L-009), `Guidelines/build-and-process.md` (L-005, L-006, L-007, L-010, L-011).
  - `sidebar-plan.md`, `describe-bundles-2026-05-03.md`, all 6 `triage-*.md` → `Planning/`.
  - `Transcripts/` created empty (written only on explicit request).
- **Git remote URL added to `claude.md`.** (commit `325c4c2`) — <https://github.com/Natertot215/SwiftKit.git>
- **Pushed to `origin/main`** after rebase on top of remote README update.

### Earlier (2026-05-01 → 2026-05-03)
- Phase 3: Full doc mirror captured (SwiftUI + AppKit + HIG).
- Phase 4: Catalog fully scaffolded with placeholder leaves.
- Phase 5 triage: All 990 leaves classified.
- Phase 5 batches 1–4: View fundamentals, configuration, styles + parallel agent runs.
- ~500+ placeholder leaves flipped to `.real`.
- 8 cross-section duplicates removed.

## Next Steps

1. **Read the new `.claude/` structure on session start.** Order: `claude.md` → `handoff.md` → `Guidelines/feedback.md`. Pull other Guidelines/ files when their domain comes up. Check `history.md` for past-decision context.
2. **Continue Phase 5 implement-track authoring** — batch by batch through remaining leaves. Triage parts B–E (in `Planning/`) hold the per-leaf classification.
3. **Author 31 describe-track pages** — plan in `Planning/describe-bundles-2026-05-03.md` (22 bundle + 9 standalone).
4. **Phase 6:** Final pass — screenshots for all pages, dark + light.

## Open Decisions / Blockers

- **Sidebar selection chrome** — Deferred. Pure SwiftUI override failed (3 attempts). Two paths in `Planning/sidebar-plan.md`. No blocker on Phase 5.
- **Pommora cross-sync** — SwiftKit unblocks Pommora UI. Cross-sync is a future step. Pommora's own `.claude/` may need a parallel migration to the new StudioMD convention; not yet done.

## Notes for the Next Session

- The migration plan that drove this session lives at `~/.claude/plans/please-review-the-current-prancy-dahl.md` if you need to retrace decisions.
- macOS filesystem is case-insensitive — any case-only rename (e.g. `CLAUDE.md` → `claude.md`) needs `git mv`, not `mv` or `Write`.
- `lessons.md` no longer exists at root; references should point to the appropriate `Guidelines/<scope>.md` file.
