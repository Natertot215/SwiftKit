# Guidelines — Visual Rules & Token Usage

Rules governing visual correctness, semantic token usage, and styling. Apply before any UI-facing change.

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
