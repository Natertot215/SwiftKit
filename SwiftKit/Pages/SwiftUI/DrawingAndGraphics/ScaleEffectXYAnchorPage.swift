import SwiftUI

// SwiftUI `View/scaleEffect(x:y:anchor:)` reference page (two-axis form).
// Source: Documentation/SwiftUI/drawing-and-graphics/scaleeffect(x:y:anchor:).md
// macOS 10.15+. Independently scales x and y axes around an anchor.

struct ScaleEffectXYAnchorPage: View {
    @State private var sx: Double = 1.0
    @State private var sy: Double = 1.0

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
            Text("View/scaleEffect(x:y:anchor:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Independently scales the x and y axes by separate factors, anchored at a UnitPoint (default .center).")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/scaleeffect(x:y:anchor:).md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        Image(systemName: "envelope.badge.fill")
            .font(.largeTitle).imageScale(.large)
            .foregroundStyle(.white, .red)
            .padding(8)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 24) {
                VStack(spacing: 4) { sample; Text("(1, 1)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
                VStack(spacing: 4) { sample.scaleEffect(x: 1.8, y: 0.6); Text("(1.8, 0.6)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
                VStack(spacing: 4) { sample.scaleEffect(x: 0.6, y: 1.8); Text("(0.6, 1.8)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
            }
            APICallout(".scaleEffect(x: 1.8, y: 0.6)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SEXVariantRow(title: "Squash and stretch") {
                HStack(spacing: 24) {
                    VStack(spacing: 4) { sample.scaleEffect(x: 1.0, y: 0.5); Text("squash y").font(.caption).foregroundStyle(.secondary) }
                    VStack(spacing: 4) { sample.scaleEffect(x: 1.0, y: 1.6); Text("stretch y").font(.caption).foregroundStyle(.secondary) }
                    VStack(spacing: 4) { sample.scaleEffect(x: 0.5, y: 1.0); Text("squash x").font(.caption).foregroundStyle(.secondary) }
                    VStack(spacing: 4) { sample.scaleEffect(x: 1.6, y: 1.0); Text("stretch x").font(.caption).foregroundStyle(.secondary) }
                }
            }

            SEXVariantRow(title: "Anchor variants") {
                HStack(spacing: 24) {
                    anchorBox(label: ".topLeading", anchor: .topLeading)
                    anchorBox(label: ".center", anchor: .center)
                    anchorBox(label: ".bottomTrailing", anchor: .bottomTrailing)
                }
            }

            SEXVariantRow(title: "Negative scale — flip") {
                HStack(spacing: 24) {
                    VStack(spacing: 4) {
                        Image(systemName: "arrow.right").font(.largeTitle).imageScale(.large)
                        Text("(1, 1)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 4) {
                        Image(systemName: "arrow.right").font(.largeTitle).imageScale(.large).scaleEffect(x: -1, y: 1)
                        Text("(-1, 1)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 4) {
                        Image(systemName: "arrow.right").font(.largeTitle).imageScale(.large).scaleEffect(x: 1, y: -1)
                        Text("(1, -1)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private func anchorBox(label: String, anchor: UnitPoint) -> some View {
        VStack(spacing: 4) {
            ZStack {
                RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4]))
                Circle().fill(Color.accentColor).frame(width: 30, height: 30).scaleEffect(x: 1.8, y: 1.4, anchor: anchor)
            }
            .frame(width: 80, height: 80)
            Text(label).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        SEXVariantRow(title: "Interactive — independent x/y") {
            VStack(alignment: .leading, spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4]))
                    Image(systemName: "star.fill").font(.largeTitle).imageScale(.large).foregroundStyle(Color.accentColor)
                        .scaleEffect(x: sx, y: sy)
                        .animation(.spring, value: sx)
                        .animation(.spring, value: sy)
                }
                .frame(width: 240, height: 200)

                HStack {
                    Text("x").font(.caption).foregroundStyle(.secondary).frame(width: 30, alignment: .leading)
                    Slider(value: $sx, in: -1.5...3).frame(width: 240)
                    Text(String(format: "%.2f", sx)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                HStack {
                    Text("y").font(.caption).foregroundStyle(.secondary).frame(width: 30, alignment: .leading)
                    Slider(value: $sy, in: -1.5...3).frame(width: 240)
                    Text(String(format: "%.2f", sy)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Independent x and y factors.", "Scale axes separately to squash, stretch, or skew the rendered output. Default for both axes is 1.0 (no change).", "arrow.up.left.and.arrow.down.right"),
        ("Negative values flip.", "x = -1 mirrors horizontally; y = -1 flips vertically. Combine for a 180° rotation around the anchor.", "arrow.left.and.right"),
        ("Layout footprint unchanged.", "Like the uniform form, scaleEffect changes rendering only — the view's layout slot stays the same.", "rectangle.dashed"),
        ("Default anchor is .center.", "Pass an explicit UnitPoint anchor to scale around any normalized (0…1) point.", "scope"),
        ("See also scaleEffect(_:anchor:).", "Use the uniform form when both axes scale together — it reads more cleanly at the call site.", "scope")
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
}

private struct SEXVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { ScaleEffectXYAnchorPage().frame(width: 1100, height: 1400) }
