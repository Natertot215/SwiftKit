import SwiftUI

// SwiftUI `View/rotationEffect(_:anchor:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/rotationeffect(_:anchor:).md
// macOS 10.15+. Rotates a view's rendered output in two dimensions around the specified anchor.

struct RotationEffectPage: View {
    @State private var degrees: Double = 0

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
            Text("View/rotationEffect(_:anchor:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Rotates a view's rendered output around the axis pointing out of the xy-plane. The frame is unchanged — only the visual is rotated.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/rotationeffect(_:anchor:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private func badge(_ label: String) -> some View {
        Text(label)
            .font(.headline)
            .foregroundStyle(.white)
            .padding(.horizontal, 12).padding(.vertical, 8)
            .background(Color.accentColor, in: RoundedRectangle(cornerRadius: 8))
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 32) {
                badge("Original")
                badge("Rotated").rotationEffect(.degrees(22))
            }
            APICallout(".rotationEffect(.degrees(22))")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Across an angle range") {
                HStack(spacing: 24) {
                    ForEach([0.0, 30, 60, 90, 180], id: \.self) { d in
                        VStack(spacing: 6) {
                            badge("\(Int(d))\u{00b0}").rotationEffect(.degrees(d))
                            Text(".degrees(\(Int(d)))")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            VariantRow(title: "Anchor variants") {
                HStack(spacing: 32) {
                    ForEach(["topLeading", "center", "bottomTrailing"], id: \.self) { name in
                        VStack(spacing: 6) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.tertiary, lineWidth: 1)
                                    .frame(width: 110, height: 70)
                                badge("Hi").rotationEffect(.degrees(20), anchor: anchor(for: name))
                            }
                            Text("anchor: .\(name)")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            VariantRow(title: "Angle constructors") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        badge("rad").rotationEffect(.radians(.pi / 4))
                        Text(".radians(.pi/4)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        badge("deg").rotationEffect(.degrees(45))
                        Text(".degrees(45)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private func anchor(for name: String) -> UnitPoint {
        switch name {
        case "topLeading": .topLeading
        case "bottomTrailing": .bottomTrailing
        default: .center
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                badge("Drag")
                    .rotationEffect(.degrees(degrees))
                    .animation(.easeInOut, value: degrees)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Text("degrees").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $degrees, in: -360...360).frame(width: 280)
                    Text(String(format: "%+.0f\u{00b0}", degrees)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Frame is unchanged.", "Only the visual is rotated. Layout neighbors don't reflow — apply a frame or padding before rotating if you need the rotated size.", "rectangle.dashed"),
        ("Anchor is in unit-space.", "(0,0) is top-leading, (1,1) is bottom-trailing, (0.5, 0.5) is center. Use UnitPoint preset values for clarity.", "scope"),
        ("Animatable.", "Inside withAnimation, the angle interpolates smoothly, useful for spinners, dials, and tap reactions.", "arrow.triangle.2.circlepath"),
        ("For 3D rotation use rotation3DEffect.", "rotationEffect is strictly 2D around the z axis. For 3D, see rotation3DEffect or perspectiveRotationEffect.", "cube")
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
    RotationEffectPage().frame(width: 1100, height: 1000)
}
