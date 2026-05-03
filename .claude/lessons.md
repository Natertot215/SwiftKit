# Lessons — SwiftKit

Carried from Pommora — these failure patterns apply universally to any Apple/SwiftUI/macOS work. Each entry includes the mistake, why it's wrong, the rule going forward, and the incident(s) that proved it. Append new SwiftKit-specific incidents to the matching L-00X. New patterns get a new L-00X.

---

## L-001 · Don't hand-tune UI dimensions — use SwiftUI semantic primitives

**Applies before:** any UI change — sizing, fonts, icon scale, padding, row heights, color, materials, drag/drop, animations.

**The mistake:** Reaching for hand-coded dimensions instead of SwiftUI's semantic modifiers:
- `.frame(width: 22)` on an Image to "make the icon bigger"
- `.font(.system(size: 13))` to size a label
- `.font(.title3)` applied directly to an icon (instead of letting `Label` + `.imageScale` handle it)
- Hand-rolled `HStack { Image; Text }` instead of `Label`
- Manual row paddings to fake `.controlSize(.regular)` behavior
- Nested `ScrollView` hacks instead of `.listSectionSeparator(.hidden)`
- Manual width math on title vs. detail instead of `.layoutPriority` + `.lineLimit().truncationMode(.tail)`
- Hand-rolled `RoundedRectangle` selection highlights instead of letting `List`/`.tag` handle selection

**Why it's wrong:** Apple's semantic modifiers automatically scale with `.controlSize`, the system Sidebar size setting, and Dynamic Type. Hand-tuned literals silently break all three.

**The rule:**

| Want this | Use this | Don't do this |
|---|---|---|
| Bigger icon in a row | `.imageScale(.large)` on the `Label`/`List` | `.frame(width: 22)` on `Image` |
| Bigger icon + text together | `Label` + `.font(.headline)` + `.imageScale(.large)` | `.font(.system(size: 16))` |
| Sidebar size variants | `.controlSize(.small/.regular/.large)` | hand-tuned row paddings |
| Hide section dividers in a `List` | `.listSectionSeparator(.hidden)` | nested `ScrollView` hacks |
| Detail wins over title in a row | `.layoutPriority(1)` on detail + `.lineLimit(1).truncationMode(.tail)` on title | manual width math |
| Selection highlight in a row | `List` + `.tag(...)` selection | `RoundedRectangle.fill(Color.accentColor)` + `onTapGesture` |
| Color | `Color.accentColor`, `.primary`, `.secondary`, `Color(nsColor: .systemX)` | hex literals from Figma |
| Material backgrounds | `.regularMaterial`, `.thinMaterial`, etc. | hand-mixed RGBA |

**Incidents (Pommora):**
- 2026-04-26 — `.frame(width: 22)` + `.font(.title3)` on sidebar icons. Rewritten with `Label` + `.imageScale(.large)` + `.controlSize(.regular)`.
- 2026-04-28 — Orphan-row overflow path with hand-rolled selection (`RoundedRectangle.fill(.accentColor.opacity(0.85))`, hardcoded `26pt` row height). Scrapped; rendered all rows in the normal `ForEach` so `List` handled selection.

---

## L-002 · Verify SwiftUI APIs against the source — never invent from memory

**Applies before:** introducing or modifying any SwiftUI modifier, initializer, type, or protocol conformance.

**The mistake:** Writing SwiftUI code based on what the API "probably" looks like, then having it fail to compile or — worse — compile but behave wrong because the modifier doesn't exist on macOS 26, the signature has different parameter labels, or it does something subtly different than assumed.

**The rule — source-of-truth hierarchy:**
1. **Local `Documentation/` mirror first.** SwiftKit's mirror under `Documentation/SwiftUI/...` and `Documentation/AppKit/...` is the fastest authoritative source.
2. SwiftUI `.swiftinterface` in the macOS 26 SDK: `/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX26.4.sdk/System/Library/Frameworks/SwiftUI.framework/Modules/SwiftUI.swiftmodule/arm64e-apple-macos.swiftinterface` — use `grep -n` for exact signatures.
3. Apple SwiftUI docs (online) — fall back to (1) and (2) if unreachable.
4. Apple HIG — visual correctness.
5. Shipped macOS apps (Finder, Mail, Notes, Photos, Settings, Xcode) — when HIG doesn't pixel-spec something, the canonical apps are the reference.

**Verification protocol:**
1. Name the modifier/type you're about to use.
2. Grep the local mirror or `.swiftinterface`. Confirm: it exists, signature matches, available on macOS 26.
3. If the source is unreachable, **say so to Nathan**. Don't guess.

**Incidents (Pommora):**
- 2026-04-28 — Drag-reorder rewrite spiral (4 rejected iterations). Root cause: `.listStyle(.sidebar)` delegates to `NSOutlineView`, which forces the legacy blue insertion bar regardless of which SwiftUI drag modifiers are applied. Never verified against the swiftinterface before starting.

---

## L-003 · NavigationSplitView — use `.prominentDetail` for independent columns

**Applies before:** any change to `NavigationSplitView` layout, column widths, or split-view style.

**The mistake:** Leaving `NavigationSplitView` at its default `.balanced` style when the design intent is independent column resizing.

**The rule:** Add `.navigationSplitViewStyle(.prominentDetail)`. The detail column becomes the flexible absorber.

```swift
NavigationSplitView { ... } detail: { ... }
    .navigationSplitViewStyle(.prominentDetail)
```

**Note for SwiftKit:** SwiftKit's main 2-column NavigationSplitView should use `.prominentDetail` so dragging the sidebar divider only affects the detail pane (where the rendered primitive lives), not vice versa.

**Incidents (Pommora):**
- 2026-04-28 — Walking skeleton shipped with default `.balanced`. Fixed by adding `.navigationSplitViewStyle(.prominentDetail)`.

---

## L-005 · Pin DerivedData before behavioral debugging

**Applies before:** debugging any unexpected app behavior.

**The mistake:** Building to one DerivedData hash while the running app came from a different build. Changes are invisible in the running binary.

**The rule:** Before debugging: `ls ~/Library/Developer/Xcode/DerivedData/ | grep SwiftKit`. Confirm exactly one entry. Pin: `-derivedDataPath ~/Library/Developer/Xcode/DerivedData/SwiftKit-<hash>`.

**Incidents (Pommora):**
- 2026-04-28 — `xcodebuild` wrote to one hash while running app was from another. Multiple debug rounds wasted.

---

## L-006 · Surface architectural constraints before writing code, not after four failures

**Applies before:** any drag/drop, animation, layout rewrite, or complex interaction feature.

**The mistake:** Attempting multiple implementations of a feature blocked by an architectural constraint, without surfacing the constraint first.

**The rule:** After the second rejection of the same feature: stop and explain the constraint before attempting another implementation.

**Incidents (Pommora):**
- 2026-04-28 — Finder-style displacement drag rejected 4 times. Constraint (`.listStyle(.sidebar)` → `NSOutlineView`) was never surfaced upfront.

---

## L-007 · Don't scaffold an empty `.modelContainer(for: [])`

**Applies before:** stripping SwiftData out of an app skeleton, or scaffolding a new SwiftUI macOS app where SwiftData is anticipated but no `@Model` types are defined yet.

**The mistake:** Leaving `.modelContainer(for: [], inMemory: false)` on the `WindowGroup` when no `@Model` types exist.

**Why it's wrong:** On macOS 26, attaching `.modelContainer(for: [])` to a `WindowGroup` causes the container init to fail silently — the app launches, the process is alive, but **no window renders**. Looks like the app is broken; `xcodebuild` builds fine. Failure is invisible until launch.

**The rule:** No `.modelContainer(...)` until at least one `@Model` type is registered. Minimum viable skeleton is `WindowGroup { ContentView() }` with no `import SwiftData`.

**SwiftKit-specific:** SwiftKit will never have a `ModelContainer` — there's no persistent state. `@AppStorage` is fine for the light/dark toggle preference; that's `UserDefaults`-backed and unrelated to SwiftData.

**Incidents (Pommora):**
- 2026-04-30 — Skeleton setup left `.modelContainer(for: [], inMemory: false)`. App launched but no window rendered. Removed the modifier and `import SwiftData` — window rendered.

---

## L-008 · `.windowResizeAnchor` + `.windowResizability(.contentSize)` does NOT auto-grow the window when `.inspector(...)` adds a sibling column

**Applies before:** any task where you intend to grow the macOS window in response to a SwiftUI state change — adding a column, opening a panel, expanding a section that should push the window wider rather than compress siblings.

**The rule:** When the documented Apple SwiftUI pattern doesn't achieve a desired outcome empirically:
1. Documented Apple method wins, full stop. **Do not** reach for `NSWindow` access (or any AppKit shim) as a workaround.
2. Accept the default behavior. Document the limitation. Move on.
3. Surface the finding to Nathan so the project's mental model stays accurate.

**Incidents (Pommora):**
- 2026-04-30 — Tried `.windowResizability(.contentSize)` + `.frame(idealWidth:)` + `.windowResizeAnchor(.leading)` to grow the window when an inspector opened. Built fine; on toggle, the inspector animated in but the window stayed at its current width. Accepted compression as the shipped behavior. Inspector was subsequently rewound for unrelated UX reasons.

---

## L-011 · Don't pre-build large SwiftUI literal trees as one nested expression

**Applies before:** building any large static catalog/tree in Swift — gallery catalogs, navigation hierarchies, menu structures, anything that's "one big nested literal" with hundreds of entries.

**The mistake:** Writing the entire structure as a single deeply-nested expression like:

```swift
static let allNodes: [CatalogNode] = [
    .section(Section(title: "SwiftUI", children: [
        .folder(Folder(title: "Controls", children: [
            .leaf(Leaf(...)),
            .leaf(Leaf(...)),
            // ... 30 more leaves
        ])),
        // ... 48 more folders
    ])),
    // ... another framework
]
```

**Why it's wrong:** Swift's type-checker expands generic constraints during inference. With deeply-nested static literals, the inference cost balloons quadratically. The compiler eventually emits *"the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions"* and refuses to compile. Even when it succeeds, build times balloon to 30+ seconds for one file.

**The rule:** Break each subtree into a top-level `private let` binding, then assemble at the bottom in a small list literal:

```swift
private let controlsFolder: CatalogNode = .folder(Folder(
    title: "Controls",
    children: [.leaf(Leaf(...)), /* ... */]
))

private let stylesFolder: CatalogNode = .folder(Folder(...))
// ... one binding per folder

let swiftUITree: CatalogNode = .section(Section(
    title: "SwiftUI",
    children: [controlsFolder, stylesFolder, /* ... */]
))
```

Each top-level binding is type-checked independently; the assembly is a flat list of names. Build times stay sub-second.

**Where this hits in SwiftKit specifically:** `Catalog/Catalog+SwiftUI.swift` (49 sections, ~1,700 leaves) and `Catalog/Catalog+AppKit.swift` (30 sections, 117 sub-headers, ~640 leaves) are exactly the pattern this rule exists to prevent. Both files MUST be authored as one-binding-per-folder, then assembled.

**Incidents:**
- 2026-05-02 — caught preemptively during Phase 4 design review. The Plan agent flagged this risk before the catalog files were written. No code-level incident yet — this lesson exists to prevent the first one.

---

## L-010 · Don't nest non-Swift bulk content inside the Xcode target's source folder

**Applies before:** dropping any folder of non-Swift files (markdown docs, design exports, screenshots, fixtures) into a project that uses Xcode's synchronized file groups (default since Xcode 16 / macOS 26).

**The mistake:** Placing a tree of resources at `SwiftKit/SwiftKit/<bulk-folder>/`. Synchronized groups (`PBXFileSystemSynchronizedRootGroup`) auto-include every file in the target's source folder — Swift files compile, anything else gets bundled into `.app/Contents/Resources/` as a flat directory. If the bulk folder has cross-referenced subdirectories with files of the same name (Apple's docs mirror has `width.md` in both `AppKit/views-and-controls/` and `SwiftUI/<topic>/` — and ~15 other collisions), the build fails with `error: duplicate output file` for each pair.

**Why it's wrong:** The synchronized-group design assumes the source folder is for Swift sources, asset catalogs, and build-relevant resources. It's not the right place for development reference material. The build pipeline cannot deduplicate by subdirectory — Resources is flat.

**The rule:** Development-only bulk content (doc mirrors, capture scripts, dev screenshots) lives at the project root as a peer of the Xcode target folder, NOT inside it.

Path notation in this lessons file is **project-root-relative** (cwd = `/Users/nathantaichman/The Studio/Projects/SwiftKit/`):

```
✅ Documentation/          (peer of the Xcode target source folder, not bundled)
✅ Screen Recordings/      (peer, .gitignored as dev artifact)
✅ SwiftKit/<subdir>/      (Xcode target source — Swift files compile, asset catalogs bundle)
❌ SwiftKit/Documentation/ (inside synchronized group — auto-bundled)
```

**If migrating an existing project:** `git mv SwiftKit/<folder> <folder>`, update absolute paths in any scripts (relative paths under the moved folder stay valid), confirm clean build with `find <built.app> -name "*.md" | wc -l` (should be 0 for non-resource extensions), pin the new DerivedData hash per L-005.

**Incidents (SwiftKit):**
- 2026-05-02 — `Documentation/` mirror (2,540 .md files) sat at `SwiftKit/SwiftKit/Documentation/` after Phase 3. First build attempt before Phase 4 scaffold failed with ~15 duplicate-output errors. Resolved by relocating to `SwiftKit/Documentation/` (project root). Bundle size dropped from 6+ MB to 332 KB.

---

## L-012 · Figma values, screenshot eyedrops, and community hex are NOT specs for system UI — semantic tokens are

**Scope (clarified 2026-05-02):** This lesson governs **any code that draws system chrome itself** — AppKit bridges, custom `NSView` subclasses, or SwiftUI views that paint over system primitives (`.listRowBackground`, `.background(...)` over a `List` row, `.tint` overrides, `.foregroundColor(...)` applied unconditionally instead of letting selection drive it). For pure SwiftUI primitives with no styling overrides, this lesson reduces to: *don't override the framework's defaults — the framework already uses the right token internally.*

**Semantic tokens passed through styling modifiers are encouraged, not forbidden.** `.foregroundStyle(.accentColor)`, `.foregroundStyle(.primary)`, `.foregroundStyle(.secondary)`, `.tint(.accentColor)`, `.foregroundColor(.accentColor)`, `.font(.headline)`, `.controlSize(.regular)` — these are tokens entering the system pipeline, not literals replacing it. The anti-pattern is committing a hex / RGB literal that *replaces* what a token would resolve to (`Color(red:`, `NSColor(red:`, `Color.black.opacity(`, `NSColor.black.withAlphaComponent(`, `Color(hex:`), or suppressing system chrome with `.listRowBackground(Color.clear)` and `.background(...)` over a sidebar row. Apple's own SwiftUI tutorials use `.foregroundColor(.accentColor)` on sidebar action buttons — the rule is "no literals masquerading as design tokens AND no suppression of framework chrome," not "no styling modifiers ever."

**Applies before:** writing any color, font, weight, radius, padding, or other styling value that mimics an Apple system surface (sidebar selection, button, list separator, window background, vibrancy material, etc.).

**The mistake:** Sampling a value from Figma (or eyedropping a screenshot, or copying a hex from a Stack Overflow answer) and committing it as a literal — `NSColor(red:green:blue:alpha:)`, `.opacity(0.7)`, `Color(hex: "#404040")`, `.frame(height: 28)` — instead of using Apple's documented semantic token.

**Why it's wrong:** Three cumulative failure modes, each independently sufficient to break the look:

1. **Figma renders flat.** Figma represents the sidebar (and other vibrant surfaces) as a flat-color rectangle. A translucent overlay on top *looks* plausible inside Figma but, applied over a real `NSVisualEffectView` at runtime, behaves as a darken/lighten filter on the live material. The same hex produces opposite visual results in the two contexts. You cannot read a vibrancy spec out of a flat-color tool.
2. **Screenshot eyedropping returns the composite.** Sampling a translucent pill from a rasterized image gives you `token + material + wallpaper tint + display gamma + P3 encoding` collapsed into one RGB triple. Two screenshots taken on different wallpapers produce different hex values for the *same* token. The eyedropped value isn't the source — it's a one-time capture of the source under one specific rendering context.
3. **Window-focus confounds the comparison.** macOS sidebars render the unemphasized grey pill when unfocused and the emphasized accent pill when focused (Mail/Finder override this to keep grey + tint foreground). A reference screenshot taken focused vs. a verification screenshot taken unfocused (or vice versa) compares two different states; chasing the delta between them with a literal RGB value can't reach a stable answer because the framework is changing the value out from under you. See `macuix-rules.md` → "Always focus the window before screenshotting."

On top of those three: **Apple changes the resolved RGB of semantic tokens between OS versions** specifically to keep their look fresh. Hardcoded literals don't track. The whole point of the project's Apple-only doctrine (`feedback.md`) is to ride Apple's design pipeline, not snapshot it once and drift.

**The rule:**

1. **Identify the Apple semantic token first.** For colors: `NSColor.unemphasizedSelectedContentBackgroundColor`, `.selectedContentBackgroundColor`, `.controlAccentColor`, `.labelColor`, `.secondaryLabelColor`, `.separatorColor`, `.windowBackgroundColor`, etc. — and their SwiftUI equivalents (`Color.accentColor`, `Color.primary`, `Color.secondary`, `Color(nsColor: .someToken)`). For fonts: `.body`, `.headline`, etc. For materials: `.regularMaterial`, `.thinMaterial`. Cite the declaration site (`NSColor.h`, `Documentation/...`, or macOS 26 SDK `swiftinterface`) in the code change description.
2. **If no token exists for what you need, say so explicitly to Nathan before writing a literal.** Apple has a token for almost every system surface; the absence of one is itself a signal that you may be re-implementing system chrome (which is its own anti-pattern — see L-001 and `feedback.md` Apple-only).
3. **If the rendered look doesn't match the reference, suspect focus / material / parent context FIRST, not the token.** Do not "fix" a token mismatch by replacing the token with a literal. The mismatch is almost always (a) one screenshot focused and the other not, (b) a missing parent `NSVisualEffectView` / `NavigationSplitView` sidebar context, or (c) a hardcoded value elsewhere overriding the token.
4. **Push back on Figma-derived values.** When Nathan (or any source) provides a hex value for a system control, the response is: *"That value is descriptive of what Apple's token currently resolves to inside Figma's flat-color rendering. The semantic token X is what AppKit actually draws and what Mail/Finder use; using the literal will diverge from system look under [dark mode toggle / accessibility / desktop tint / future macOS]."* Do NOT silently obey and overwrite the token.

**How to apply when reviewing existing code:**
- Grep for `NSColor(red:`, `Color(red:`, `Color(hex:`, `Color.black.opacity`, `Color.white.opacity`, `NSColor.black.withAlphaComponent`, `NSColor.white.withAlphaComponent`, `Color(.sRGB`. Each match is a candidate violation — judge whether it's mimicking system look (replace) or genuinely brand/illustration content (leave).
- Grep for `.font(.system(size:` — replace with a semantic font style unless the value is for a brand/display surface.
- Grep for fixed `.frame(height:` / `.padding(...)` literals near `List`, `Sidebar`, `Toolbar`, or any `NavigationSplitView` child — these often encode system metrics that should come from `.controlSize(...)` or be left to the parent.

**Incidents:**
- 2026-05-02 — Sidebar selection pill in `Sidebar/CatalogOutlineView.swift` was overridden from `NSColor.unemphasizedSelectedContentBackgroundColor` to `NSColor.black.withAlphaComponent(0.7)` because a Figma node (`7711:4536`) was read as `#000000 @ 70%` and committed as the spec. Runtime pill rendered *darker* than the surrounding sidebar — the inverse of Mail.app and Finder, which lift the material with a translucent light fill. Compounding factors: (a) earlier dev-app screenshots were captured with the SwiftKit window unfocused, masking that the custom `drawBackground` was unnecessary in the first place — leading to over-correction; (b) the doc-comment at the call site already cited the correct semantic token, but the implementation contradicted the comment; (c) Claude obeyed Nathan's "just use 70% black" instruction without surfacing the Figma-vs-vibrancy mismatch. Fix was to revert to the semantic token, expand the doc-comment with a "DO NOT replace with sampled RGB" warning citing this lesson, and codify the doctrine in `macuix-rules.md` → "Semantic tokens over sampled RGB."
- 2026-05-02 (resolved by deletion + rebuild) — `Sidebar/CatalogOutlineView.swift` was deleted entirely. The replacement is `SwiftKit/App/SidebarView.swift`, a pure SwiftUI `List(selection:).listStyle(.sidebar)` implementation with **zero** chrome overrides — the framework draws selection per L-012's expanded scope. The lesson now applies preventively to `SidebarView.swift`: any future agent tempted to add `.listRowBackground`, `.background`, `.tint`, or unconditional `.foregroundColor` to the sidebar code is re-introducing the L-012 pattern.

---

## L-009 · Pin sidebar width with `.navigationSplitViewColumnWidth(min:ideal:max:)` when collapsing other columns conditionally

**Applies before:** any task that toggles a `NavigationSplitView` column's width based on selection — or, more generally, any time one column's width changes dynamically while another column should stay visually stable.

**The rule:** If any column's width is conditional, pin the sidebar with explicit `.navigationSplitViewColumnWidth(min:ideal:max:)`. Pick values that match HIG sidebar widths (typical: `min: 220, ideal: 240, max: 320`).

**SwiftKit note:** SwiftKit's sidebar should be pinned to `min: 240, ideal: 280, max: 360` — slightly wider than Pommora's because it carries 3-level hierarchy (Framework → Category → Primitive).

**Incidents (Pommora):**
- 2026-05-01 — Adding the `Library` sidebar item that collapses the middle column to 0. Sidebar fluctuated between ~140 and ~240 px until pinned with explicit min/ideal/max widths.
