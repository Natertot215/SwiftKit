# B8 — Gauge / ProgressView / Stepper Coverage Manifest

**Parent pages:**
- SwiftKit/Pages/SwiftUI/ControlsAndIndicators/GaugePage.swift (rewrite in place)
- SwiftKit/Pages/SwiftUI/ControlsAndIndicators/ProgressViewPage.swift (rewrite in place)
- SwiftKit/Pages/SwiftUI/ControlsAndIndicators/StepperPage.swift (rewrite in place)

**Parent leaf locations:**
- Gauge: Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 693
- ProgressView: Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 694
- Stepper: Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 686
- GaugeStyle: Catalog+SwiftUI.swift, `swiftui.view-styles` subsection, line 439
- GaugeStyleConfiguration: Catalog+SwiftUI.swift, `swiftui.view-styles` subsection, line 440
- ProgressViewStyle: Catalog+SwiftUI.swift, `swiftui.view-styles` subsection, line 442
- ProgressViewStyleConfiguration: Catalog+SwiftUI.swift, `swiftui.view-styles` subsection, line 443
- DefaultDateProgressLabel: Catalog+SwiftUI.swift, `swiftui.controls-and-indicators` subsection, line 695
- (No StepperStyle — Stepper has no style protocol)

**Status:** implementing

## Absorbed leaves

### Gauge consolidation

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 1 | GaugeStyle | GaugeStylePage.swift | protocol GaugeStyle | Documentation/SwiftUI/view-styles/gaugestyle.md | gallery | "Reference — GaugeStyle protocol & GaugeStyleConfiguration" |
| 2 | GaugeStyleConfiguration | GaugeStylePage.swift | struct GaugeStyleConfiguration | Documentation/SwiftUI/view-styles/gaugestyleconfiguration.md | gallery | "Reference — GaugeStyle protocol & GaugeStyleConfiguration" |
| 3 | View/gaugeStyle(_:) | GaugeStylePage.swift | View/gaugeStyle(_:) | Documentation/SwiftUI/view-styles/gaugestyle(_:).md | gallery | "GaugeStyle gallery — built-in styles" |

### ProgressView consolidation

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| 4 | ProgressViewStyle | ProgressViewStylePage.swift | protocol ProgressViewStyle | Documentation/SwiftUI/view-styles/progressviewstyle.md | gallery | "Reference — ProgressViewStyle protocol & ProgressViewStyleConfiguration" |
| 5 | ProgressViewStyleConfiguration | ProgressViewStylePage.swift | struct ProgressViewStyleConfiguration | Documentation/SwiftUI/view-styles/progressviewstyleconfiguration.md | gallery | "Reference — ProgressViewStyle protocol & ProgressViewStyleConfiguration" |
| 6 | View/progressViewStyle(_:) | ProgressViewStylePage.swift | View/progressViewStyle(_:) | Documentation/SwiftUI/view-styles/progressviewstyle(_:).md | gallery | "ProgressViewStyle gallery — built-in styles" |
| 7 | DefaultDateProgressLabel | ProgressViewPage.swift (currently embedded) | struct DefaultDateProgressLabel | Documentation/SwiftUI/controls-and-indicators/defaultdateprogresslabel.md | gallery | "Timer-based ProgressView with DefaultDateProgressLabel" |

### Stepper consolidation

| # | Leaf displayName | Current page path | apiSignature | Doc path | Page type | Subsection target |
|---|---|---|---|---|---|---|
| (none — Stepper has no absorbed style or configuration siblings) |

## Per-leaf coverage checklist

### Gauge Leaf 1: GaugeStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 6 — .automatic, .accessoryCircular, .accessoryCircularCapacity, .accessoryLinear, .accessoryLinearCapacity, .linearCapacity)
- [x] States demos transferred (count expected: 2 — live binding with Slider, tint propagation)
- [x] Notes paragraphs preserved (5 notes present: capacity vs ranged families, accessory styles for widgets, currentValueLabel rendering, value normalization, tint colors)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 439)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — GaugeStyle protocol & GaugeStyleConfiguration"

### Gauge Leaf 2: GaugeStyleConfiguration
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 0 — configuration struct shown inline in Reference section)
- [x] States demos transferred (count expected: 0)
- [x] Notes paragraphs preserved (inline with protocol reference)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 440)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — GaugeStyle protocol & GaugeStyleConfiguration"

### Gauge Leaf 3: View/gaugeStyle(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 6 — one per GaugeStyle value on macOS)
- [x] States demos transferred (count expected: 1 — live binding demo)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed (redirected to GaugePage)
- [x] Lands in subsection: "GaugeStyle gallery — built-in styles"

### ProgressView Leaf 4: ProgressViewStyle
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 6 — .automatic, .linear, .circular, each both determinate and indeterminate)
- [x] States demos transferred (count expected: 3 — live binding, labeled variants, tint propagation)
- [x] Notes paragraphs preserved (5 notes present: .automatic resolution, determinate vs indeterminate data-driven, fractionCompleted nil semantics, Progress wrapping, tint colors)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 442)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — ProgressViewStyle protocol & ProgressViewStyleConfiguration"

### ProgressView Leaf 5: ProgressViewStyleConfiguration
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 0 — configuration struct shown inline in Reference section)
- [x] States demos transferred (count expected: 0)
- [x] Notes paragraphs preserved (inline with protocol reference)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 443)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Reference — ProgressViewStyle protocol & ProgressViewStyleConfiguration"

### ProgressView Leaf 6: View/progressViewStyle(_:)
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 6 — one per ProgressViewStyle value × determinate/indeterminate)
- [x] States demos transferred (count expected: 1 — live binding demo)
- [x] Notes paragraphs preserved (5 notes present)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift
- [x] PageRegistry entry removed (redirected to ProgressViewPage)
- [x] Lands in subsection: "ProgressViewStyle gallery — built-in styles"

### ProgressView Leaf 7: DefaultDateProgressLabel
- [x] Header info captured (title, availability, apiSignature)
- [x] All signatures from source page transcribed
- [x] Default demo transferred (or replaced with equivalent in new context)
- [x] Variant demos transferred (count expected: 1 — timer interval demo with DefaultDateProgressLabel label display)
- [x] States demos transferred (count expected: 0)
- [x] Notes paragraphs preserved (1 note: internal SwiftUI type used by ProgressView(timerInterval:), not publicly constructible)
- [x] Source page deleted from filesystem
- [x] Catalog leaf removed from Catalog+SwiftUI.swift (line 695)
- [x] PageRegistry entry removed
- [x] Lands in subsection: "Timer-based ProgressView with DefaultDateProgressLabel"

### Stepper (no absorbed leaves)
- [x] Stepper has no style protocol or configuration sibling — consolidation is in-place rewrite only
- [x] Existing StepperPage.swift rewritten to TypographyPage rhythm (ScrollView/VStack/PageSection)
- [x] No catalog or registry edits required beyond verifying Catalog+SwiftUI.swift line 686 is retained

## Parent page section plans

### GaugePage section order

1. **Header** — Title: "Gauge"; summary: "A view that shows a value within a range"; availability: macOS 13.0+; APIs: Gauge, GaugeStyle, GaugeStyleConfiguration
2. **Default Gauge demo** — Basic Gauge(value:label:) with progress value and label
3. **Gauge variants — value ranges and labels** — Custom range (in: 0...120), currentValueLabel, minimumValueLabel, maximumValueLabel usage
4. **Reference — GaugeStyle protocol & GaugeStyleConfiguration** — Protocol shape; GaugeStyleConfiguration struct (value, minimumValueLabel, maximumValueLabel, label, currentValueLabel, markedValueLabels); no custom implementations in SwiftKit
5. **GaugeStyle gallery — built-in styles** — Six variants (.automatic, .linearCapacity, .accessoryLinear, .accessoryLinearCapacity, .accessoryCircular, .accessoryCircularCapacity); identical sample gauges with each style
6. **Gauge boundary states** — value: 0.0 (empty), value: 1.0 (full)
7. **Style variants and tint propagation** — Live binding demo, tint color application (.tint(.green), .tint(.orange))
8. **Notes** — Accessory styles for widgets (Watch complications), Gauge is read-only (pair with Slider for adjustment), two families (capacity vs ranged), currentValueLabel rendering positions, value normalization to 0…1

### ProgressViewPage section order

1. **Header** — Title: "ProgressView · DefaultDateProgressLabel"; summary: "A view that shows the progress of a task"; availability: macOS 11.0+; APIs: ProgressView, ProgressViewStyle, ProgressViewStyleConfiguration, DefaultDateProgressLabel
2. **Default ProgressView demo** — Indeterminate spinner (ProgressView())
3. **Indeterminate variants** — No value (spinning indicator), with label ("Loading…"), various visual contexts
4. **Determinate progress** — value: 0.0...1.0, determinate with label and total, boundary values (0.0, 1.0)
5. **Reference — ProgressViewStyle protocol & ProgressViewStyleConfiguration** — Protocol shape; ProgressViewStyleConfiguration.fractionCompleted (nil = indeterminate); Label and CurrentValueLabel nested types; no custom implementations in SwiftKit
6. **ProgressViewStyle gallery — built-in styles** — Three variants (.automatic, .linear, .circular), each shown determinate and indeterminate (6 demos)
7. **Style variants and tint propagation** — Live binding with Slider, labeled variants (.linear + label, .circular + label), tint color application (.tint(.green), .tint(.purple))
8. **Timer-based ProgressView with DefaultDateProgressLabel** — ProgressView(timerInterval:) with countdown display, DefaultDateProgressLabel internal type note
9. **Progress wrapping and hierarchical work** — Progress object support for cancellable/reportable progress with nested children
10. **Notes** — .automatic resolution (macOS .linear in lists/forms, .circular in toolbars), indeterminate vs determinate data-driven (no value = indeterminate), .circular maps to NSProgressIndicator.spinning on macOS, fractionCompleted nil for custom conformers, tint colors fill/spinner

### StepperPage section order

StepperPage remains as currently structured (no consolidation needed):

1. **Header** — Title: "Stepper"; summary: "A control that performs increment and decrement actions"; availability: macOS 10.15+; APIs: Stepper
2. **Default Stepper demo** — String label with @State binding
3. **Stepper variants — value constraints** — Unbound range, in: range constraint, step: increment, manual onIncrement/onDecrement
4. **Disabled state** — .disabled(true) propagation
5. **Stepped range and custom logic** — Custom onIncrement/onDecrement for doubling, cycling, external clamping
6. **Notes** — Range enforcement automatic with in:, button enable/disable at boundaries, onIncrement/onDecrement for non-fixed-delta stepping

## Sign-off

- Implementer: Claude Sonnet 4.6 — 2026-05-05
- Spec-compliance reviewer: (pending)
- Code-quality reviewer: (pending)

## Manifest metadata

- **Task ID:** B8
- **Parent types:** Gauge, ProgressView, Stepper (three small consolidations, one manifest)
- **Framework:** SwiftUI
- **Section:** controls-and-indicators (parents) + view-styles (GaugeStyle/GaugeStyleConfiguration, ProgressViewStyle/ProgressViewStyleConfiguration)
- **Affected Catalog+SwiftUI.swift lines:** 439–440 (gaugeStyle modifier + protocol + configuration), 442–443 (progressViewStyle modifier + protocol + configuration), 686 (Stepper), 693 (Gauge), 694 (ProgressView), 695 (DefaultDateProgressLabel)
- **PageRegistry entries affected:** Gauge, GaugeStyle, GaugeStyleConfiguration, View/gaugeStyle(_:), ProgressView, ProgressViewStyle, ProgressViewStyleConfiguration, View/progressViewStyle(_:), DefaultDateProgressLabel, Stepper
- **Pages to delete:** GaugeStylePage.swift, ProgressViewStylePage.swift
- **Pages to rewrite in place:** GaugePage.swift, ProgressViewPage.swift, StepperPage.swift
- **Created:** 2026-05-05
