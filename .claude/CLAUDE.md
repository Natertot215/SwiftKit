# SwiftKit — Project Context

A personal Apple-component reference library — one screen per SwiftUI / AppKit primitive, every documented variant rendered side-by-side and labeled with its exact API call. Like a Figma component library, native to macOS. The companion output is `Documentation/` (project-root sibling of the Xcode target) — a complete local mirror of Apple's HIG, SwiftUI, and AppKit documentation as flat markdown files, with a master URL index.

This file is the thin operational hub. The substance lives in the linked files below — read those before planning or coding.

## Stack

- **Language:** Swift 6.x.
- **UI:** SwiftUI as the shell. AppKit (`NSViewRepresentable` / `NSViewControllerRepresentable`, or full AppKit) is first-class when SwiftUI doesn't expose the needed macOS behavior. No third-party UI libraries, ever.
- **Persistence:** None. SwiftKit has no persistent state — selection lives in `@State`, the primitive list is a static tree in code.
- **Platform:** macOS 26 only.
- **Authoritative source for every UIX decision** (in priority order):
  1. Apple Human Interface Guidelines — <https://developer.apple.com/design/human-interface-guidelines/>
  2. Apple SwiftUI documentation — <https://developer.apple.com/documentation/swiftui/>
  3. Apple AppKit documentation — <https://developer.apple.com/documentation/appkit/>
  4. The macOS 26 SDK swiftinterface (for exact signatures, generics, and `@available` annotations)
  5. Live lookup via the Context7 MCP and the local `Documentation/` mirror.

- AppKit is allowed alongside SwiftUI. Use `NSViewRepresentable` / `NSViewControllerRepresentable` (or full AppKit when needed) whenever SwiftUI doesn't expose the macOS behavior the feature requires.

## Dark mode first

**All UI implementation is dark-mode first.** Every visual decision is designed against dark mode and screenshotted in dark mode before considered done. Light mode is a follow-up pass. The detail pane has a light/dark toggle (defaults to dark); the sidebar tracks system colorScheme.

How to apply:
- Build → screenshot → review loop captures dark-mode screenshots first.
- Use semantic color tokens (`.foregroundStyle(.primary)`, `.secondary`, `.tint`, system materials, accent color). Hand-mixed `Color(red:green:blue:)` is forbidden (L-001).

## Workflow

**Edit Swift in VS Code, run in Xcode.** Same convention as Pommora.

| Task | Where |
|---|---|
| Edit `.swift` files | VS Code (Swift extension by swiftlang) |
| Build (CLI) | `cd SwiftKit && xcodebuild -scheme SwiftKit -configuration Debug build -derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-<hash>` (hash captured on first build) |
| Run / debug | Xcode `Cmd+R` |
| SwiftUI Previews | Xcode only |
| Edit `Info.plist`, `*.entitlements`, `*.xcassets/Contents.json` | VS Code (text formats) |
| Add a new `.swift` file | Drop into `SwiftKit/<subdir>/` — synchronized groups pick it up (paths in this file are project-root-relative; cwd = `/Users/nathantaichman/The Studio/Projects/SwiftKit/`) |
| Adjust target settings, schemes, capabilities | Xcode (rare) |

## File index

| File | Purpose | Read before |
|---|---|---|
| [`framework.md`](framework.md) | Vision/purpose, current state, future plans, hard constraints | Planning any feature, scoping a task, making architectural decisions |
| [`feedback.md`](feedback.md) | Persistent behavior corrections from Nathan | Every session start |
| [`memory.md`](memory.md) | Non-obvious project state + decisions | Every session start |
| [`lessons.md`](lessons.md) | Failure patterns (L-001…L-009) carried from Pommora — universal Apple/SwiftUI rules | The kind of work that previously failed |
| [`macuix-rules.md`](macuix-rules.md) | SwiftUI / macOS rules — source authority, component constraints, HIG adherence, build→screenshot→review loop | **Mandatory** — see rule below |

## MANDATORY rule for Swift / SwiftUI / macOS work

**Any task touching Swift, SwiftUI, or macOS frontend code → load and follow [`macuix-rules.md`](macuix-rules.md) before writing or modifying any code. Non-negotiable.**

NEVER manually create SwiftUI components that don't natively exist; only pull from actual Swift or AppKit components. SwiftKit *documents* these primitives — it must not re-implement them. A "rendered Button" gallery page is just a `Button(...)` in a layout — fine. A "rendered SearchBar"  built from `TextField` + magnifying-glass is forbidden by name.

### Screenshot-confirm sequence (ENFORCED)

For every UI-affecting change:
1. `xcodebuild` to confirm clean build.
2. Relaunch the app (`pkill -x SwiftKit` → `open …SwiftKit.app`) and capture window-region screenshots in **both dark and light** via `screencapture -o -R<x>,<y>,<w>,<h>` after grabbing window bounds with `osascript`. Save under `Screen Recordings/<unix-ts>-<state>-{dark|light}.png`.
3. Multi-state pages: screenshot each state separately (default / hover / selected / disabled / focused).
4. Read every screenshot before declaring the task done.
5. Closing line per `macuix-rules.md`.

## Memory protocol

Per the global four-file convention:
- Nathan corrects behavior → append to [`feedback.md`](feedback.md) immediately.
- Architectural constraint or non-obvious decision surfaces → append to [`memory.md`](memory.md).
- Bug/mistake fixed → append dated incident to matching `L-00X` in [`lessons.md`](lessons.md), or add a new entry.

Three-tier rule (per `~/.claude/CLAUDE.md`): code facts in `framework.md`/`memory.md`; non-obvious *how-to-work-with-Nathan* corrections in `~/.claude/projects/<proj>/memory/`; global preferences in `~/.claude/CLAUDE.md`. No duplication across tiers.

## Code review & SwiftUI validation

Use the **`swiftui-expert-skill`** (AvdLee/SwiftUI-Agent-Skill) installed globally at `~/.agents/skills/swiftui-expert-skill` for code review. Invoke via the `Skill` tool.

For documentation lookups, prefer the local `Documentation/` mirror first (it has every Apple HIG/SwiftUI/AppKit page captured locally as markdown). Fall back to Context7 (`find-docs` skill or `mcp__plugin_context7_context7__query-docs`) only if a page is missing from the mirror.

## Things we do NOT do

- Don't invent `// MARK:` comment headers in short files.
- Don't add doc-comments to obvious symbols.
- Don't add error handling for impossible cases.
- Don't add backwards-compat shims — macOS 26 is the only target.
- Don't reach for `.font(.system(size:))` or hand-mixed `Color(red:green:blue:)`. (L-001)
- Don't scaffold `.modelContainer(for: [])`. SwiftKit has no `@Model` types and no persistence. (L-007)
- Don't re-implement primitives that SwiftKit is documenting. Compose Apple primitives directly.
