# SwiftKit Page Logic Log — Phase 3b

Per-page record of layout/UI decisions made during Phase 3b. Append-only. Each entry written by the implementer of that page as their **final act** after the code is constructed and reviewed — closer to a postmortem than a plan. Subsequent agents read the entire log before drafting their own page's layout.

## Discipline

- **READ-BEFORE.** Every implementer reads the entire log before drafting their page's layout. The agent brief instructs: "cite at least one prior entry's decision in your reasoning, OR explain why your page diverges."
- **WRITE-AFTER.** The implementer's last act before handing back code is appending the entry. Spec reviewer verifies the entry exists and contains all six required lines.
- **APPEND-ONLY.** Never edit prior entries. If a later page contradicts an earlier decision, the new entry explains the divergence.

## Entry format (≤12 lines)

```markdown
### <Heading> > <Folder> > <Leaf> — <YYYY-MM-DD>
- Layout: <chosen shape + key parameters>.
- Why: <component-driven rationale; what it is about these components that motivated the choice>.
- Tile/row shape: <heights, widths, metadata column, special wrappers, etc.>.
- Demos: <live vs reference, dark+light verified, any unusual rendering choices>.
- New primitive proposed: <none | name + brief>.
- Heads-up for siblings: <what the next agent in this folder / cross-folder should know>.
```

## Layout shapes and reference material

Available layout shapes, primitive toolkit, OG Typography pointer, and specialty-wrapper precedent are documented in [`phase-3-plan.md`](phase-3-plan.md) — the canonical Phase 3 reference. Implementers read the plan file before drafting; this log captures the *result* of those decisions, not the menu.

---

<!-- Entries below, in completion order. Each implementer appends here as their final act. -->
