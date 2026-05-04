# Guidelines — Build, Project Structure & Process

Rules governing build setup, file placement, project constraints, and implementation process. Apply when scaffolding, debugging, or making structural changes.

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
