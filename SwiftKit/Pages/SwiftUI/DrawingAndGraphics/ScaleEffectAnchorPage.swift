import SwiftUI

// SwiftUI `View/scaleEffect(_:anchor:)` reference page (uniform scale form).
// Source: Documentation/SwiftUI/drawing-and-graphics/scaleeffect(_:anchor:).md
// macOS 10.15+. Scales the rendered output by a single factor relative to an anchor.

struct ScaleEffectAnchorPage: View {
    @State private var scale: Double = 1.0
    @State private var anchorX: Double = 0.5
    @State private var anchorY: Double = 0.5

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
            Text("View/scaleEffect(_:anchor:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Uniformly scales rendered output by a CGFloat factor, relative to a UnitPoint anchor (default .center).")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/scaleeffect(_:anchor:).md · macOS 10.15+")
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
                sample
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sample.scaleEffect(2)
            }
            APICallout(".scaleEffect(2)  // default anchor: .center")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SEVariantRow(title: "Scale factor sweep") {
                HStack(spacing: 24) {
                    ForEach([0.5, 0.8, 1.0, 1.5, 2.0], id: \.self) { s in
                        VStack(spacing: 4) {
                            sample.scaleEffect(s)
                            Text(String(format: "%.1f", s)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                        .frame(width: 80, height: 100)
                    }
                }
            }

            SEVariantRow(title: "Anchor variants") {
                HStack(spacing: 24) {
                    anchorBox(label: ".topLeading", anchor: .topLeading)
                    anchorBox(label: ".center", anchor: .center)
                    anchorBox(label: ".bottomTrailing", anchor: .bottomTrailing)
                    anchorBox(label: ".leading", anchor: .leading)
                }
            }
        }
    }

    private func anchorBox(label: String, anchor: UnitPoint) -> some View {
        VStack(spacing: 4) {
            ZStack {
                RoundedRectangle(cornerRadius: 6).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4]))
                Circle().fill(Color.accentColor).frame(width: 30, height: 30).scaleEffect(1.6, anchor: anchor)
            }
            .frame(width: 80, height: 80)
            Text(label).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        SEVariantRow(title: "Interactive — scale + anchor") {
            VStack(alignment: .leading, spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, style: StrokeStyle(lineWidth: 1, dash: [4]))
                    Image(systemName: "star.fill").font(.largeTitle).imageScale(.large).foregroundStyle(Color.accentColor)
                        .scaleEffect(scale, anchor: UnitPoint(x: anchorX, y: anchorY))
                        .animation(.spring, value: scale)
                        .animation(.spring, value: anchorX)
                        .animation(.spring, value: anchorY)
                }
                .frame(width: 240, height: 200)

                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("scale").font(.caption).foregroundStyle(.secondary).frame(width: 70, alignment: .leading)
                        Slider(value: $scale, in: 0.2...3).frame(width: 220)
                        Text(String(format: "%.2f", scale)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("anchor.x").font(.caption).foregroundStyle(.secondary).frame(width: 70, alignment: .leading)
                        Slider(value: $anchorX, in: 0...1).frame(width: 220)
                        Text(String(format: "%.2f", anchorX)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("anchor.y").font(.caption).foregroundStyle(.secondary).frame(width: 70, alignment: .leading)
                        Slider(value: $anchorY, in: 0...1).frame(width: 220)
                        Text(String(format: "%.2f", anchorY)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Default anchor is .center.", "Without an anchor argument, scaling pivots around the view's center. Pass an explicit UnitPoint to anchor anywhere else.", "scope"),
        ("UnitPoint values are normalized.", "x and y are 0…1, where (0, 0) is .topLeading and (1, 1) is .bottomTrailing. Use named constants (.topLeading, .center, etc.) when possible.", "rectangle.dashed"),
        ("Doesn't change layout size.", "scaleEffect transforms only rendering; the view occupies its original layout slot. For a layout-affecting size change, use .frame or .scaleEffect with .compositingGroup.", "rectangle.dashed.and.paperclip"),
        ("Animatable.", "Scale interpolates smoothly, including with .spring. Use for tap-down feedback and emphasis transitions.", "wand.and.sparkles"),
        ("See also scaleEffect(x:y:anchor:).", "When you need different x and y scale factors (squash, stretch), use the two-axis form on a separate page.", "arrow.up.left.and.arrow.down.right")
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

private struct SEVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { ScaleEffectAnchorPage().frame(width: 1100, height: 1300) }
