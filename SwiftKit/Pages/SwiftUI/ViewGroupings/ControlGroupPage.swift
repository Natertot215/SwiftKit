import SwiftUI

// Dense ControlGroup reference page. Consolidates:
//   • ControlGroup                        (primary container; macOS 12.0+)  [from swiftui.view-groupings]
//   • ControlGroupStyle                   (protocol; macOS 12.0+)           [from swiftui.view-styles]
//   • ControlGroupStyleConfiguration      (configuration type; 12.0+)       [from swiftui.view-styles]
//   • View/controlGroupStyle(_:)          (style modifier; 12.0+)           [from swiftui.view-styles]
//
// Source docs:
//   Documentation/SwiftUI/view-groupings/controlgroup.md
//   Documentation/SwiftUI/view-styles/controlgroupstyle.md
//   Documentation/SwiftUI/view-styles/controlgroupstyleconfiguration.md
//   Documentation/SwiftUI/view-styles/controlgroupstyle(_:).md
//
// Follows TypographyPage / ButtonPage rhythm: one ScrollView, one VStack,
// one PageSection per topic. All demos compose Apple primitives directly.

struct ControlGroupPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                controlGroupStyleReferenceSection
                controlGroupStyleConfigurationReferenceSection
                defaultControlGroupSection
                styleGallerySection
                controlGroupStyleModifierSection
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
            Text("ControlGroup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A visually-cohesive container for a cluster of related controls. ControlGroup renders its children as a grouped unit \u{2014} a segmented row, palette, compact menu, or standard menu \u{2014} depending on the active ControlGroupStyle and context. Best used for parallel, related actions (text formatting, editing tools).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-groupings/controlgroup.md \u{00b7} macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("ControlGroup  \u{00b7}  ControlGroupStyle  \u{00b7}  ControlGroupStyleConfiguration  \u{00b7}  View/controlGroupStyle(_:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (ControlGroupStyle)

    private var controlGroupStyleReferenceSection: some View {
        PageSection("Reference \u{2014} ControlGroupStyle protocol", subtitle: "protocol ControlGroupStyle \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that applies standard interaction behavior and a custom appearance to all control groups within a view hierarchy. Conformers receive a ControlGroupStyleConfiguration carrying type-erased label and content views, and return a Body view that renders the group.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
@MainActor protocol ControlGroupStyle {
    associatedtype Body : View
    typealias Configuration = ControlGroupStyleConfiguration

    @ViewBuilder @MainActor
    func makeBody(configuration: Self.Configuration) -> Self.Body
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Built-in conformers on macOS")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "AutomaticControlGroupStyle \u{2014} platform default; renders as a borderless control cluster in toolbar contexts. macOS 12.0+.")
                    referenceRow(".navigation", "NavigationControlGroupStyle \u{2014} renders as back/forward navigation buttons. macOS 12.0+.")
                    referenceRow(".palette", "PaletteControlGroupStyle \u{2014} non-collapsible row of visually-distinct icon choices. macOS 13.0+.")
                    referenceRow(".menu", "MenuControlGroupStyle \u{2014} collapses to a single button + popup menu. macOS 14.0+.")
                    referenceRow(".compactMenu", "CompactMenuControlGroupStyle \u{2014} smallest variant of menu; tight inline button + chevron. macOS 14.0+.")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "SwiftKit does NOT author custom ControlGroupStyle conformers.",
                        detail: "Per project hard constraint: SwiftKit documents Apple's built-in protocol surface. Custom conformers are out of scope.",
                        symbol: "lock"
                    )
                }
            }
        }
    }

    // MARK: Reference (ControlGroupStyleConfiguration)

    private var controlGroupStyleConfigurationReferenceSection: some View {
        PageSection("Reference \u{2014} ControlGroupStyleConfiguration", subtitle: "struct ControlGroupStyleConfiguration \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The data passed to ControlGroupStyle.makeBody(configuration:). Carries the group's optional label and its body controls as type-erased views. Custom ControlGroupStyle conformers read these to compose a Body view that renders the controls with custom chrome.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Properties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("configuration.label", "ControlGroupStyleConfiguration.Label \u{2014} type-erased label view. Render it as the trigger button in .menu / .compactMenu styles.")
                    referenceRow("configuration.content", "ControlGroupStyleConfiguration.Content \u{2014} type-erased view containing the group's child controls.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("API declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
struct ControlGroupStyleConfiguration {
    struct Label   : View { … }   // optional group label (trigger)
    struct Content : View { … }   // group's child controls

    var label:   Label
    var content: Content
}

// Custom conformer (reference only — SwiftKit doesn't author these):
struct PillControlGroupStyle: ControlGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 1) { configuration.content }
            .padding(.horizontal, 6)
            .background(.fill.secondary, in: Capsule())
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Configuration.Label is optional semantically.",
                        detail: "ControlGroup may be created without a label. The Label view is always present in the configuration but may be empty. .menu and .compactMenu styles use it as the trigger button title.",
                        symbol: "questionmark.circle"
                    )
                }
            }
        }
    }

    // MARK: Default demo

    private var defaultControlGroupSection: some View {
        PageSection("ControlGroup container", subtitle: "ControlGroup { … } \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("ControlGroup renders related buttons as a visually-grouped unit. Without an explicit style, it renders using .automatic \u{2014} a tight cluster of borderless buttons in toolbar contexts, and a standard row elsewhere.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Initializers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("ControlGroup(@ViewBuilder content:)")
                    APICallout("ControlGroup(_ titleKey: LocalizedStringKey, @ViewBuilder content:)")
                    APICallout("ControlGroup(@ViewBuilder content:, @ViewBuilder label:)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Default \u{2014} three-button editing cluster (.automatic)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ControlGroup {
                        Button(action: {}) { Label("Cut", systemImage: "scissors") }
                        Button(action: {}) { Label("Copy", systemImage: "doc.on.doc") }
                        Button(action: {}) { Label("Paste", systemImage: "doc.on.clipboard") }
                    }
                    APICallout(
"""
ControlGroup {
    Button { } label: { Label("Cut",   systemImage: "scissors") }
    Button { } label: { Label("Copy",  systemImage: "doc.on.doc") }
    Button { } label: { Label("Paste", systemImage: "doc.on.clipboard") }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With label (used by .menu / .compactMenu)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    ControlGroup {
                        Button(action: {}) { Label("Bold", systemImage: "bold") }
                        Button(action: {}) { Label("Italic", systemImage: "italic") }
                        Button(action: {}) { Label("Underline", systemImage: "underline") }
                    } label: {
                        Label("Format", systemImage: "textformat")
                    }
                    .controlGroupStyle(.compactMenu)
                    APICallout(
"""
ControlGroup {
    Button { } label: { Label("Bold", systemImage: "bold") }
    Button { } label: { Label("Italic", systemImage: "italic") }
} label: {
    Label("Format", systemImage: "textformat")
}
.controlGroupStyle(.compactMenu)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("In a toolbar context")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.toolbar {
    ToolbarItem(placement: .automatic) {
        ControlGroup {
            Button("Back") { }
            Button("Forward") { }
        }
        .controlGroupStyle(.navigation)
    }
}
"""
                    )
                }
            }
        }
    }

    // MARK: Style gallery

    private var styleGallerySection: some View {
        PageSection("ControlGroupStyle gallery", subtitle: "Built-in styles applied to the same button cluster") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Five built-in ControlGroupStyle values on macOS. Availability varies \u{2014} see each specimen.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".automatic (macOS 12.0+)", api: ".controlGroupStyle(.automatic)") {
                    sampleGroup.controlGroupStyle(.automatic)
                }

                styleSpecimen(title: ".navigation (macOS 12.0+)", api: ".controlGroupStyle(.navigation)") {
                    ControlGroup {
                        Button(action: {}) { Label("Back", systemImage: "chevron.backward") }
                        Button(action: {}) { Label("Forward", systemImage: "chevron.forward") }
                    }
                    .controlGroupStyle(.navigation)
                }

                styleSpecimen(title: ".palette (macOS 13.0+)", api: ".controlGroupStyle(.palette)") {
                    sampleGroup.controlGroupStyle(.palette)
                }

                styleSpecimen(title: ".menu (macOS 14.0+)", api: ".controlGroupStyle(.menu)") {
                    ControlGroup {
                        Button(action: {}) { Label("Bold", systemImage: "bold") }
                        Button(action: {}) { Label("Italic", systemImage: "italic") }
                        Button(action: {}) { Label("Underline", systemImage: "underline") }
                    } label: {
                        Label("Format", systemImage: "textformat")
                    }
                    .controlGroupStyle(.menu)
                }

                styleSpecimen(title: ".compactMenu (macOS 14.0+)", api: ".controlGroupStyle(.compactMenu)") {
                    ControlGroup {
                        Button(action: {}) { Label("Bold", systemImage: "bold") }
                        Button(action: {}) { Label("Italic", systemImage: "italic") }
                        Button(action: {}) { Label("Underline", systemImage: "underline") }
                    } label: {
                        Label("Format", systemImage: "textformat")
                    }
                    .controlGroupStyle(.compactMenu)
                }
            }
        }
    }

    private var sampleGroup: some View {
        ControlGroup {
            Button(action: {}) { Label("Bold", systemImage: "bold") }
            Button(action: {}) { Label("Italic", systemImage: "italic") }
            Button(action: {}) { Label("Underline", systemImage: "underline") }
        }
    }

    // MARK: controlGroupStyle modifier

    private var controlGroupStyleModifierSection: some View {
        PageSection("View/controlGroupStyle(_:) modifier", subtitle: "View/controlGroupStyle(_:) \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Applies the given ControlGroupStyle to all ControlGroup views in the scope of this modifier. Walks down the view tree \u{2014} apply once on a container to affect every ControlGroup in that subtree. An inner .controlGroupStyle wins for its own subtree.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Signature")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout("func controlGroupStyle<S: ControlGroupStyle>(_ style: S) -> some View")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Scoping rule \u{2014} inner style wins")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
// Outer: .automatic applies to all ControlGroups below
VStack {
    ControlGroup { … }           // .automatic (from outer)

    ControlGroup { … }
        .controlGroupStyle(.compactMenu)  // .compactMenu wins for THIS group
}
.controlGroupStyle(.automatic)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Toolbar example \u{2014} matching the context")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.toolbar {
    ToolbarItem {
        ControlGroup {
            Button("Bold") { toggleBold() }
            Button("Italic") { toggleItalic() }
        }
        .controlGroupStyle(.palette)   // icon swatches in toolbar
    }
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "controlGroupStyle inherits down the view tree.",
                        detail: "Apply once on a container; every ControlGroup picks it up. Inner style wins for its subtree \u{2014} same pattern as .buttonStyle.",
                        symbol: "arrow.down"
                    )
                    noteRow(
                        title: ".menu and .compactMenu collapse the controls behind a trigger.",
                        detail: "When space is constrained (toolbar overflow, inspector), these styles hide children behind a single button. Always provide a label for the trigger button.",
                        symbol: "menubar.dock.rectangle"
                    )
                }
            }
        }
    }

    // MARK: Notes from the HIG

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on ControlGroup, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "ControlGroup is for related, parallel actions.",
                    detail: "The group communicates that actions belong together and operate on the same target. Don't reach for it when actions have different targets or precedence levels.",
                    symbol: "rectangle.connected.to.line.below"
                )
                noteRow(
                    title: "Use .palette for icon-based, non-collapsible selections.",
                    detail: ".palette renders a row of swatches \u{2014} formatting tools, alignment options, paint colors. It's always fully visible; it doesn't collapse. Best for 2\u{2013}7 options.",
                    symbol: "paintpalette"
                )
                noteRow(
                    title: "Use .menu or .compactMenu when space is constrained.",
                    detail: "These styles collapse the controls behind a trigger button. The group label becomes the trigger title. Provide a meaningful Label (icon + text) for accessibility.",
                    symbol: "arrow.down.right.and.arrow.up.left"
                )
                noteRow(
                    title: "ControlGroup vs HStack of Buttons.",
                    detail: "ControlGroup adds grouping semantics and adapts its rendering to context (toolbar vs inline vs menu). An HStack of Buttons is layout-only. Prefer ControlGroup when the controls are visually and functionally related.",
                    symbol: "questionmark.circle"
                )
                noteRow(
                    title: "Accessibility: ControlGroup groups child controls.",
                    detail: "Assistive technologies treat ControlGroup children as a cluster. VoiceOver announces the group and then each control. The label (when present) names the cluster.",
                    symbol: "accessibility"
                )
            }
        }
    }

    // MARK: Helpers

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

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 160, alignment: .leading)
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

#Preview {
    ControlGroupPage()
        .frame(width: 1100, height: 1300)
}
