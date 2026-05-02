# SwiftKit

Personal Apple-component reference library — a native macOS gallery app + complete local mirror of Apple's HIG, SwiftUI, and AppKit documentation. Built so future projects (Pommora and beyond) have a ground-truth reference for what each Apple primitive renders as on macOS 26.

## Status

Scaffolded 2026-05-01. Phase 0 (Xcode SwiftData strip) and Phase 2 (URL manifest gathering) complete. Phase 3 (page capture) in progress.

## Structure

- `SwiftKit/` — Xcode project (synchronized root group; new `.swift` files in `SwiftKit/SwiftKit/` auto-compile).
  - `SwiftKitApp.swift`, `ContentView.swift` — minimal shell.
  - `Documentation/` — local mirror of Apple HIG/SwiftUI/AppKit docs as flat markdown.
    - `_links/` — URL lists per framework.
    - `access-links.md` — consolidated master URL index.
    - `HIG/`, `SwiftUI/`, `AppKit/` — captured page bodies.
- `.claude/` — Claude Code project context (CLAUDE.md, framework.md, feedback.md, memory.md, lessons.md, macuix-rules.md).
- *(Pages, Sidebar, Detail subdirectories under SwiftKit/SwiftKit/ to be added in Phase 4+.)*
