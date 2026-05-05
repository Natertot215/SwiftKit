import SwiftUI

// SwiftUI `View/blendMode(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/blendmode(_:).md
// macOS 10.15+. Sets the blend mode for compositing this view with overlapping views.

struct BlendModePage: View {
    @State private var selected: BlendMode = .multiply

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/blendMode(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Sets how this view composites with overlapping content. BlendMode covers darkening, lightening, contrast, inversion, color-mixing, and Porter-Duff modes.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/blendmode(_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func swatch(_ blend: BlendMode, label: String) -> some View {
        ZStack {
            Color.yellow.frame(width: 80, height: 80)
            Color.red.frame(width: 60, height: 60)
                .offset(x: 22, y: 22)
                .blendMode(blend)
        }
        .frame(width: 110, height: 110)
        .overlay(alignment: .bottom) {
            Text(label).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                .padding(.bottom, 2)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 24) {
                swatch(.normal, label: ".normal")
                swatch(.multiply, label: ".multiply")
                swatch(.screen, label: ".screen")
                swatch(.overlay, label: ".overlay")
            }
            APICallout(".blendMode(.multiply)")
        }
    }

    private let groups: [(name: String, modes: [(BlendMode, String)])] = [
        ("Darkening", [(.darken, ".darken"), (.multiply, ".multiply"), (.colorBurn, ".colorBurn"), (.plusDarker, ".plusDarker")]),
        ("Lightening", [(.lighten, ".lighten"), (.screen, ".screen"), (.colorDodge, ".colorDodge"), (.plusLighter, ".plusLighter")]),
        ("Contrast", [(.overlay, ".overlay"), (.softLight, ".softLight"), (.hardLight, ".hardLight")]),
        ("Inversion", [(.difference, ".difference"), (.exclusion, ".exclusion")]),
        ("Color components", [(.hue, ".hue"), (.saturation, ".saturation"), (.color, ".color"), (.luminosity, ".luminosity")]),
        ("Porter-Duff", [(.sourceAtop, ".sourceAtop"), (.destinationOver, ".destinationOver"), (.destinationOut, ".destinationOut")])
    ]

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(groups, id: \.name) { group in
                VariantRow(title: group.name) {
                    HStack(spacing: 16) {
                        ForEach(Array(group.modes.enumerated()), id: \.offset) { _, item in
                            swatch(item.0, label: item.1)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive picker") {
            VStack(alignment: .leading, spacing: 12) {
                swatch(selected, label: name(for: selected))
                    .frame(maxWidth: .infinity, alignment: .center)
                Picker("Blend mode", selection: $selected) {
                    ForEach(allModes, id: \.0) { item in
                        Text(item.1).tag(item.0)
                    }
                }
                .pickerStyle(.menu)
                .frame(maxWidth: 260)
            }
        }
    }

    private var allModes: [(BlendMode, String)] {
        groups.flatMap { $0.modes }
    }

    private func name(for mode: BlendMode) -> String {
        allModes.first(where: { $0.0 == mode })?.1 ?? ".normal"
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Source-over by default.", "Without a blendMode, SwiftUI uses .normal \u{2014} the source draws on top of the destination using its alpha.", "circle.fill"),
        ("Use compositingGroup() to confine effect.", "Without compositingGroup, ancestor opacity/blend can interact with this view's blend in surprising ways. compositingGroup flattens the view into a single composited layer first.", "rectangle.stack"),
        ("Porter-Duff modes are alpha-based.", ".sourceAtop, .destinationOver, .destinationOut treat alpha as the primary input, useful for masking and compositing tricks.", "scissors"),
        ("Pair with drawingGroup for heavy stacks.", "Multiple blend modes over complex hierarchies benefit from .drawingGroup() flattening into a Metal surface first.", "cpu"),
        ("Color-component modes ignore brightness.", ".hue, .saturation, .color, .luminosity each preserve some channels of the destination and replace the rest \u{2014} useful for tinting.", "paintpalette")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

#Preview {
    BlendModePage().frame(width: 1100, height: 1100)
}
