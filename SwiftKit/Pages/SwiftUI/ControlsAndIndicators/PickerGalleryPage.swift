import SwiftUI

// Dense Picker reference page. Consolidates five previously-separate
// leaves into a single screen:
//   • Picker                                                              (struct)
//   • PickerStyle                                                         (protocol)
//   • View/pickerStyle(_:)
//   • View/horizontalRadioGroupLayout()
//   • View/paletteSelectionEffect(_:)
//   • PaletteSelectionEffect                                              (enum)
//
// Source docs:
//   Documentation/SwiftUI/controls-and-indicators/picker.md
//   Documentation/SwiftUI/controls-and-indicators/horizontalradiogrouplayout().md
//   Documentation/SwiftUI/controls-and-indicators/paletteselectioneffect(_:).md
//   Documentation/SwiftUI/controls-and-indicators/paletteselectioneffect.md
//   Documentation/SwiftUI/view-styles/pickerstyle.md
//   Documentation/SwiftUI/view-styles/pickerstyle(_:).md
//
// Mirrors TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. The PickerStyle Reference subsection is placed
// ABOVE the demo subsections per the describe-track placement rule. All
// demos compose Apple primitives directly — no custom wrapper views.

private enum Fruit: String, CaseIterable, Identifiable {
    case apple = "Apple", banana = "Banana", cherry = "Cherry", date = "Date"
    var id: Self { self }
}

private enum Shape2D: String, CaseIterable, Identifiable {
    case circle, square, triangle, star
    var id: Self { self }
    var symbol: String {
        switch self {
        case .circle: "circle.fill"
        case .square: "square.fill"
        case .triangle: "triangle.fill"
        case .star: "star.fill"
        }
    }
}

struct PickerGalleryPage: View {
    @State private var selectedFruit: Fruit = .apple
    @State private var selectedFruit2: Fruit = .apple
    @State private var selectedFruit3: Fruit = .banana
    @State private var selectedShape: Shape2D = .circle
    @State private var selectedShape2: Shape2D = .square
    @State private var selectedShape3: Shape2D = .triangle

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                pickerStyleReferenceSection
                paletteSelectionEffectReferenceSection
                defaultPickerSection
                pickerStyleGallerySection
                horizontalRadioGroupLayoutSection
                paletteSelectionEffectSection
                selectionMechanicsSection
                pickerStatesSection
                higNotesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Picker")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control for selecting from a set of mutually exclusive values. This page covers Picker itself plus every supporting style and modifier (PickerStyle protocol, .pickerStyle(_:), .horizontalRadioGroupLayout(), .paletteSelectionEffect(_:), and PaletteSelectionEffect).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/picker.md \u{00b7} macOS 10.15+ (palette / PaletteSelectionEffect: 14.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Picker  \u{00b7}  PickerStyle  \u{00b7}  PaletteSelectionEffect  \u{00b7}  .pickerStyle(\u{2026})  \u{00b7}  .horizontalRadioGroupLayout()  \u{00b7}  .paletteSelectionEffect(\u{2026})")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (PickerStyle protocol)
    //
    // Describe-track content placed above demos per the describe-track
    // placement rule. Reference subsections lead the page; demos follow.

    private var pickerStyleReferenceSection: some View {
        PageSection("Reference \u{2014} PickerStyle protocol", subtitle: "protocol PickerStyle \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that specifies the appearance and interaction of all pickers within a view hierarchy. PickerStyle is a marker protocol with no public requirements; SwiftUI ships private types that conform to it, and you adopt them via the static literals (.menu, .segmented, .radioGroup, .palette, .inline, .wheel, .navigationLink, .automatic).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
@MainActor protocol PickerStyle {
    // No required members are exposed publicly. SwiftUI ships
    // private conforming types you adopt via the static literals
    // (.menu, .inline, .segmented, .palette, .radioGroup,
    // .wheel, .navigationLink, .automatic).
}

// Apply via:
// View/pickerStyle(_:)   -- inherits down the view tree
"""
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Built-in conformers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "DefaultPickerStyle \u{2014} the platform default. On macOS this typically resolves to .menu in form-like contexts. macOS 10.15+.")
                    referenceRow(".menu", "MenuPickerStyle \u{2014} pops a NSPopUpButton-equivalent menu. macOS 10.15+.")
                    referenceRow(".inline", "InlinePickerStyle \u{2014} renders all options inline in a list/form. macOS 10.15+.")
                    referenceRow(".segmented", "SegmentedPickerStyle \u{2014} all options laid out as a horizontal segmented control. macOS 10.15+.")
                    referenceRow(".palette", "PalettePickerStyle \u{2014} compact horizontal row of icon swatches. macOS 14.0+.")
                    referenceRow(".radioGroup", "RadioGroupPickerStyle \u{2014} vertical stack of NSRadioButtons. macOS-only. macOS 10.15+.")
                    referenceRow(".wheel", "WheelPickerStyle \u{2014} iOS-style spinning wheel. iOS-only; unavailable on macOS.")
                    referenceRow(".navigationLink", "NavigationLinkPickerStyle \u{2014} pushes options onto a navigation stack. iOS-only; unavailable on macOS.")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "PickerStyle has no public surface to implement.",
                        detail: "It's a marker protocol \u{2014} the conforming types are private to SwiftUI. SwiftKit does NOT author custom conformers per project hard constraint; the catalog documents the built-in literals only.",
                        symbol: "lock"
                    )
                    noteRow(
                        title: "Apply via .pickerStyle(_:); inherits down the view tree.",
                        detail: "An inner .pickerStyle(\u{2026}) wins for its own subtree. Apply once on a container and every Picker beneath picks it up.",
                        symbol: "arrow.down"
                    )
                    noteRow(
                        title: ".automatic resolves per-platform.",
                        detail: "The same code shipped on macOS, iOS, and visionOS produces different style outputs because each platform's .automatic chooses something different. Test on the target platform, not just one.",
                        symbol: "circle.lefthalf.filled"
                    )
                }
            }
        }
    }

    // MARK: Reference (PaletteSelectionEffect)

    private var paletteSelectionEffectReferenceSection: some View {
        PageSection("Reference \u{2014} PaletteSelectionEffect", subtitle: "struct PaletteSelectionEffect \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Specifies how selected items in a .palette-style Picker are visually distinguished. Pair with View/paletteSelectionEffect(_:) on the Picker itself, or apply to a container that wraps it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Static values")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "Default \u{2014} the system picks an appropriate effect for the content. For SF Symbols this typically maps to .symbolVariant(.fill).")
                    referenceRow(".symbolVariant(_:)", "Replaces the selected SF Symbol with the named variant. Most common: .symbolVariant(.fill) swaps the outlined symbol for its filled counterpart.")
                    referenceRow(".custom", "Caller is responsible for highlighting the selected item via a closure that receives an isSelected Bool. Returned view replaces the original.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct PaletteSelectionEffect")
                    APICallout("static var automatic: PaletteSelectionEffect")
                    APICallout("static var custom: PaletteSelectionEffect")
                    APICallout("static func symbolVariant(_ variant: SymbolVariants) -> PaletteSelectionEffect")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".symbolVariant(.fill) is the canonical SF-Symbol palette pattern.",
                        detail: "Use outlined symbols (heart, star, circle) for unselected items and let the effect swap to the filled variant when selected. Provides a clear visual change without committing to a custom highlight.",
                        symbol: "heart"
                    )
                    noteRow(
                        title: ".custom requires you to author the highlight.",
                        detail: "Without an effect, .palette renders selection with a thin border. .custom hands you the isSelected boolean so you can color, scale, or replace the swatch yourself.",
                        symbol: "paintpalette"
                    )
                }
            }
        }
    }

    // MARK: Default Picker

    private var defaultPickerSection: some View {
        PageSection("Default Picker", subtitle: "Picker(\"Label\", selection: $value) { \u{2026} } \u{00b7} system-default style") {
            VStack(alignment: .leading, spacing: 12) {
                Picker("Fruit", selection: $selectedFruit) {
                    ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                }
                Text("Selected: \(selectedFruit.rawValue)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                APICallout("Picker(\"Fruit\", selection: $selectedFruit) { ForEach(Fruit.allCases) { Text($0.rawValue).tag($0) } }")
            }
        }
    }

    // MARK: PickerStyle gallery

    private var pickerStyleGallerySection: some View {
        PageSection("PickerStyle gallery \u{2014} built-in styles", subtitle: "View/pickerStyle(_:) \u{00b7} every documented style applied to identical pickers") {
            VStack(alignment: .leading, spacing: 24) {
                Text("All eight documented PickerStyle values, applied to identical sample pickers. Six render natively on macOS; .wheel and .navigationLink are iOS-only and noted as such.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".automatic", api: ".pickerStyle(.automatic) \u{00b7} macOS resolves to .menu") {
                    Picker("Fruit", selection: $selectedFruit2) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.automatic)
                }
                styleSpecimen(title: ".menu", api: ".pickerStyle(.menu) \u{00b7} popup menu") {
                    Picker("Fruit", selection: $selectedFruit2) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.menu)
                }
                styleSpecimen(title: ".inline", api: ".pickerStyle(.inline) \u{00b7} every option visible inline") {
                    Picker("Fruit", selection: $selectedFruit2) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.inline)
                }
                styleSpecimen(title: ".segmented", api: ".pickerStyle(.segmented) \u{00b7} horizontal segmented control") {
                    Picker("Fruit", selection: $selectedFruit2) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.segmented)
                }
                styleSpecimen(title: ".palette (macOS 14.0+)", api: ".pickerStyle(.palette) \u{00b7} icon swatches") {
                    Picker("Shape", selection: $selectedShape) {
                        ForEach(Shape2D.allCases) { s in
                            Image(systemName: s.symbol).tag(s)
                        }
                    }
                    .pickerStyle(.palette)
                }
                styleSpecimen(title: ".radioGroup (macOS-only)", api: ".pickerStyle(.radioGroup) \u{00b7} vertical NSRadioButtons") {
                    Picker("Fruit", selection: $selectedFruit2) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.radioGroup)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(".wheel \u{2014} iOS-only")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    Text("Spinning wheel picker. SwiftUI exposes the literal but the macOS SDK does not render it as a wheel \u{2014} use .menu or .radioGroup for native macOS feel.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(".pickerStyle(.wheel)  // iOS-only renderer")
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text(".navigationLink \u{2014} iOS-only")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    Text("Pushes the picker options onto a navigation stack. Designed for iOS Settings-style screens; unavailable on macOS.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    APICallout(".pickerStyle(.navigationLink)  // iOS-only renderer")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".menu is the macOS Preferences default.",
                        detail: "Pops a NSPopUpButton-equivalent menu. .automatic on macOS usually resolves to .menu in form-like contexts.",
                        symbol: "menubar.dock.rectangle"
                    )
                    noteRow(
                        title: ".segmented limits scaling \u{2014} use only with short labels.",
                        detail: "macOS draws segmented controls with proportional widths. Long labels truncate; over ~5 segments looks cramped. Use .menu for wider sets.",
                        symbol: "rectangle.split.3x1"
                    )
                    noteRow(
                        title: ".radioGroup is macOS-only.",
                        detail: "Renders as a vertical stack of NSRadioButtons. Use it when the choices should ALL be visible simultaneously \u{2014} common in Preferences.",
                        symbol: "circle.inset.filled"
                    )
                    noteRow(
                        title: ".palette renders as a row of icon swatches.",
                        detail: "Best paired with Image / Label content. Apple uses it for color palettes and shape pickers in formatting toolbars. Pairs with PaletteSelectionEffect to distinguish selection.",
                        symbol: "paintpalette"
                    )
                    noteRow(
                        title: ".wheel and .navigationLink are iOS-flavored.",
                        detail: "Both render on macOS but feel out of place. Reach for .menu or .radioGroup for native macOS feel.",
                        symbol: "iphone"
                    )
                }
            }
        }
    }

    @ViewBuilder
    private func styleSpecimen<Content: View>(title: String, api: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    // MARK: horizontalRadioGroupLayout()

    private var horizontalRadioGroupLayoutSection: some View {
        PageSection("Picker layout modifiers \u{2014} .horizontalRadioGroupLayout()", subtitle: "View/horizontalRadioGroupLayout() \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets the radio group layout to horizontal. Applies only to Picker(\u{2026}).pickerStyle(.radioGroup); on every other style and on every other platform it is a no-op. macOS-only modifier.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("@MainActor extension View {")
                    APICallout("    public func horizontalRadioGroupLayout() -> some View")
                    APICallout("}")
                }

                styleSpecimen(title: ".radioGroup \u{2014} default vertical layout", api: ".pickerStyle(.radioGroup)") {
                    Picker("Fruit", selection: $selectedFruit3) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.radioGroup)
                }
                styleSpecimen(title: ".radioGroup + .horizontalRadioGroupLayout()", api: ".pickerStyle(.radioGroup).horizontalRadioGroupLayout()") {
                    Picker("Fruit", selection: $selectedFruit3) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.radioGroup)
                    .horizontalRadioGroupLayout()
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".horizontalRadioGroupLayout() applies to .radioGroup only.",
                        detail: "On every other PickerStyle it is a no-op \u{2014} the modifier silently does nothing. On non-macOS platforms it is also a no-op.",
                        symbol: "arrow.left.and.right"
                    )
                }
            }
        }
    }

    // MARK: paletteSelectionEffect

    private var paletteSelectionEffectSection: some View {
        PageSection("PaletteSelectionEffect \u{2014} .paletteSelectionEffect(_:)", subtitle: "View/paletteSelectionEffect(_:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sets the selection effect for items in a Picker(\u{2026}).pickerStyle(.palette). Three values \u{2014} .automatic, .symbolVariant(.fill), .custom \u{2014} produce three distinct visual treatments of the selected swatch.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("@MainActor extension View {")
                    APICallout("    public func paletteSelectionEffect(_ effect: PaletteSelectionEffect) -> some View")
                    APICallout("}")
                }

                styleSpecimen(title: ".paletteSelectionEffect(.automatic)", api: ".pickerStyle(.palette).paletteSelectionEffect(.automatic)") {
                    Picker("Shape", selection: $selectedShape) {
                        ForEach(Shape2D.allCases) { s in
                            Image(systemName: s.symbol).tag(s)
                        }
                    }
                    .pickerStyle(.palette)
                    .paletteSelectionEffect(.automatic)
                }

                styleSpecimen(title: ".paletteSelectionEffect(.symbolVariant(.fill))", api: ".pickerStyle(.palette).paletteSelectionEffect(.symbolVariant(.fill))") {
                    Picker("Shape", selection: $selectedShape2) {
                        Image(systemName: "heart").tag(Shape2D.circle)
                        Image(systemName: "star").tag(Shape2D.square)
                        Image(systemName: "flag").tag(Shape2D.triangle)
                        Image(systemName: "bookmark").tag(Shape2D.star)
                    }
                    .pickerStyle(.palette)
                    .paletteSelectionEffect(.symbolVariant(.fill))
                }

                styleSpecimen(title: ".paletteSelectionEffect(.custom)", api: ".pickerStyle(.palette).paletteSelectionEffect(.custom)") {
                    Picker("Shape", selection: $selectedShape3) {
                        ForEach(Shape2D.allCases) { s in
                            Image(systemName: s.symbol).tag(s)
                        }
                    }
                    .pickerStyle(.palette)
                    .paletteSelectionEffect(.custom)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".symbolVariant(.fill) is the canonical SF-Symbol pattern.",
                        detail: "Use outlined symbols for items and let the effect swap to filled when selected. Best paired with semantically paired symbols (heart \u{2192} heart.fill, star \u{2192} star.fill).",
                        symbol: "heart"
                    )
                    noteRow(
                        title: ".custom hands you isSelected; you draw the highlight.",
                        detail: "Without any effect, .palette renders selection with a thin border. .custom is for when you want to drive selection visuals from your own design language.",
                        symbol: "paintpalette"
                    )
                }
            }
        }
    }

    // MARK: Selection mechanics

    private var selectionMechanicsSection: some View {
        PageSection("Selection mechanics", subtitle: "@State binding, .tag(_:) values, ForEach over Identifiable") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Each row inside the Picker's content needs a .tag value matching the binding's type. ForEach over Identifiable items + Text(\u{2026}).tag(item) is the canonical pattern.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Binding to a Hashable enum")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
private enum Fruit: String, CaseIterable, Identifiable {
    case apple = \"Apple\", banana = \"Banana\"
    var id: Self { self }
}

@State private var selectedFruit: Fruit = .apple

Picker(\"Fruit\", selection: $selectedFruit) {
    ForEach(Fruit.allCases) { f in
        Text(f.rawValue).tag(f)
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Live demo \u{2014} state echo")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.segmented)
                    Text("selectedFruit = .\(selectedFruit.rawValue.lowercased())")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: ".tag value type must match the binding's type exactly.",
                        detail: "Mismatch (e.g. tagging Strings while binding an Int) produces a Picker that compiles but never updates the binding. Make the type explicit on the @State.",
                        symbol: "tag"
                    )
                    noteRow(
                        title: "ForEach needs stable identity.",
                        detail: "Conform the model to Identifiable (or pass id: parameter). Indexed identity over a mutable array breaks selection \u{2014} the picker forgets the binding when the array reorders.",
                        symbol: "arrow.triangle.2.circlepath"
                    )
                }
            }
        }
    }

    // MARK: Picker states

    private var pickerStatesSection: some View {
        PageSection("Picker states", subtitle: ".disabled(true) \u{00b7} propagates across every PickerStyle") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The .disabled(true) modifier propagates through the view tree and dims any Picker beneath it, regardless of style.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".menu + .disabled(true)", api: ".pickerStyle(.menu).disabled(true)") {
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.menu)
                    .disabled(true)
                }
                styleSpecimen(title: ".segmented + .disabled(true)", api: ".pickerStyle(.segmented).disabled(true)") {
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.segmented)
                    .disabled(true)
                }
                styleSpecimen(title: ".radioGroup + .disabled(true)", api: ".pickerStyle(.radioGroup).disabled(true)") {
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.radioGroup)
                    .disabled(true)
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on Picker, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Pick the style by content count and context.",
                    detail: "1\u{2013}5 short options in a form: .segmented or .radioGroup. Many options or long labels: .menu. Visible-at-once preferences: .radioGroup. Iconographic choices: .palette.",
                    symbol: "list.bullet"
                )
                noteRow(
                    title: ".radioGroup is macOS-only and stacks vertically by default.",
                    detail: "Use .horizontalRadioGroupLayout() to flip to a row \u{2014} useful for short two- or three-option groups in a wider form layout.",
                    symbol: "circle.inset.filled"
                )
                noteRow(
                    title: ".palette is for iconographic choice.",
                    detail: "Use it for shape pickers, color swatches, alignment toggles, paragraph-style controls. Always pair with .paletteSelectionEffect for clarity \u{2014} the bare border highlight is hard to read at small sizes.",
                    symbol: "paintpalette"
                )
                noteRow(
                    title: "Keyboard interaction comes for free.",
                    detail: "macOS Picker handles arrow-key navigation, type-ahead selection, and Tab focus automatically. Don't override these with custom gestures \u{2014} you'll break VoiceOver and Full Keyboard Access.",
                    symbol: "keyboard"
                )
                noteRow(
                    title: "Style modifier walks down the view tree.",
                    detail: "Apply .pickerStyle(\u{2026}) once on a container and every Picker in that subtree picks it up. An inner .pickerStyle wins for its own subtree.",
                    symbol: "arrow.down"
                )
            }
        }
    }

    // MARK: Helpers

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 200, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

extension PickerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.controlsAndIndicators.picker",
        title: "Picker",
        folder: "Controls and indicators",
        framework: .swiftUI,
        absorbedSymbols: [
            "Picker",
            "View/defaultWheelPickerItemHeight(_:)"
        ],
        blurb: "A control for selecting from a set of mutually exclusive values. Companion modifier defaultWheelPickerItemHeight tunes wheel-style row height.",
        signature: "struct Picker<Label, SelectionValue, Content> where Label : View, SelectionValue : Hashable, Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/controls-and-indicators/picker.md",
        page: { AnyView(PickerGalleryPage()) }
    )
}

#Preview {
    PickerGalleryPage()
        .frame(width: 1100, height: 1100)
}
