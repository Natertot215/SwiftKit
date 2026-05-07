# SwiftKit — Project Context

Apple-component reference library — one page per user-recognizable component, every documented variant rendered as a tile alongside its exact API call. Modifiers fold into the primitive's page as variant tiles, never as their own pages. Companion output is `Documentation/` (project-root sibling) — a local mirror of Apple HIG, SwiftUI, and AppKit docs as flat markdown.

**Git remote:** <https://github.com/Natertot215/SwiftKit.git>
**Status:** post-strip restart (2026-05-07). 5 Reference pages registered. ~70-page target shape documented in `framework.md`.

## Stack

- **Swift 6.x** — SwiftUI shell, AppKit first-class via `NSViewRepresentable` / `NSViewControllerRepresentable` when SwiftUI doesn't expose the needed behavior.
- **macOS 26 only.** No third-party UI libraries. No persistence (`@State` only).
- **Dark mode first.** Detail pane defaults to dark; sidebar tracks system colorScheme.
- **Apple primitives only.** SwiftKit documents primitives — it never re-implements them.

## Non-Negotiables

- Load `Guidelines/macuix-rules.md` before writing any Swift/SwiftUI/macOS code. Non-negotiable.
- UI terminology is descriptive, not a canonical API name — identify the Apple primitive, don't treat the label as the spec.
- Semantic color/font tokens only. No hand-mixed `Color(red:green:blue:)`, no Figma hex literals. (`Guidelines/visual-rules.md`)
- **One page = one user-recognizable component.** Modifiers go inside the component's page as variant tiles, never as their own pages. *(Post-strip rule, see `history.md` 2026-05-07.)*
- **`Documentation/` is the authoring source, NOT the page list.** Read each primitive's markdown before authoring its page. The page list is the ~70-page target spec in `framework.md`, derived from user-recognizable components — not from Apple's URL count.

## File Index

| File/Folder | Purpose | When to read |
|---|---|---|
| [`framework.md`](framework.md) | Vision, current state, future plans, constraints | Planning any feature |
| [`handoff.md`](handoff.md) | Current state, recent work, next steps, blockers | Every session start |
| [`history.md`](history.md) | Chronological feature/decision/implementation log | When context on past decisions is needed |
| [`Guidelines/feedback.md`](Guidelines/feedback.md) | Nathan's behavior corrections | Every session start |
| [`Guidelines/macuix-rules.md`](Guidelines/macuix-rules.md) | SwiftUI/macOS rules — **MANDATORY** | Before any Swift/SwiftUI work |
| [`Guidelines/visual-rules.md`](Guidelines/visual-rules.md) | Semantic tokens, color, styling (L-001, L-012) | Before any UI-facing change |
| [`Guidelines/api-and-layout.md`](Guidelines/api-and-layout.md) | API verification, layout patterns (L-002, L-003, L-008, L-009) | Before any modifier or layout change |
| [`Guidelines/build-and-process.md`](Guidelines/build-and-process.md) | Build setup, file placement, process (L-005–L-011) | Before scaffolding or debugging |
| [`Planning/`](Planning/) | Plans and triage documents | Before any planned feature work |
| [`Transcripts/`](Transcripts/) | Session transcripts — written on request | When reviewing past session context |

## Companion Documents in The Nexus *(mobile-readable)*

| Path | Purpose |
|---|---|
| `// The Nexus // Claude // SwiftKit — Where The Mess Came From.md` | 2026-05-07 retrospective: chronological drift, root causes, three forward paths |
| `// The Nexus // Projects // Project SwiftKit // SwiftKit Status - 5-7.md` | Pre-strip objective snapshot (file counts, build state, registry numbers) |
| `// The Nexus // Projects // Project SwiftKit // SwiftKit Handoff - 5-7.md` | Post-strip handoff: target shape, cadence, first three sessions, open decisions |

## Memory Protocol

- Nathan corrects behavior → append to `Guidelines/feedback.md` immediately.
- New decision or architectural constraint → append dated entry to `history.md`.
- Bug/mistake fixed → append to matching lesson file under `Guidelines/`, or start a new one.
- Session ends → rewrite `handoff.md` with current state, recent work, next steps, open decisions.
