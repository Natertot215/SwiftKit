import SwiftUI

// SwiftUI `Gradient`, `MeshGradient`, `AnyGradient` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/gradient.md
// macOS 10.15+. Linear, Radial, Angular, and Mesh gradients.

struct GradientPage: View {
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
            Text("Gradient · MeshGradient · AnyGradient")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Linear, radial, angular, elliptical, and mesh gradient fills.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/gradient.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(colors: [.blue, .purple, .pink],
                                      startPoint: .leading, endPoint: .trailing))
                .frame(width: 280, height: 100)
            APICallout("LinearGradient(colors: [.blue, .purple, .pink], startPoint: .leading, endPoint: .trailing)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            GradVariantRow(title: "LinearGradient") {
                let configs: [(String, UnitPoint, UnitPoint)] = [
                    ("→ leading→trailing", .leading, .trailing),
                    ("↓ top→bottom", .top, .bottom),
                    ("↘ topLeading→bottomTrailing", .topLeading, .bottomTrailing)
                ]
                HStack(spacing: 16) {
                    ForEach(configs, id: \.0) { label, start, end in
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [.blue, .pink], startPoint: start, endPoint: end))
                                .frame(width: 100, height: 70)
                            Text(label).font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center).frame(width: 110)
                        }
                    }
                }
            }

            GradVariantRow(title: "RadialGradient") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(RadialGradient(colors: [.yellow, .orange, .red],
                                                  center: .center, startRadius: 0, endRadius: 70))
                            .frame(width: 140, height: 100)
                        APICallout("RadialGradient(center: .center, startRadius: 0, endRadius: 70)")
                    }
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(RadialGradient(colors: [Color.accentColor.opacity(0.1), Color.accentColor],
                                                  center: .topLeading, startRadius: 0, endRadius: 130))
                            .frame(width: 140, height: 100)
                        APICallout("center: .topLeading")
                    }
                }
            }

            GradVariantRow(title: "AngularGradient (conic)") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Circle()
                            .fill(AngularGradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red],
                                                   center: .center))
                            .frame(width: 100, height: 100)
                        APICallout("AngularGradient(colors: [...], center: .center)")
                    }
                    VStack(spacing: 6) {
                        Circle()
                            .fill(AngularGradient(gradient: Gradient(colors: [.blue, .accentColor, .blue]),
                                                   center: .center, startAngle: .degrees(0), endAngle: .degrees(180)))
                            .frame(width: 100, height: 100)
                        APICallout("startAngle / endAngle control")
                    }
                }
            }

            GradVariantRow(title: "EllipticalGradient") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(EllipticalGradient(colors: [Color.accentColor, Color.accentColor.opacity(0)],
                                                      center: .center))
                            .frame(width: 140, height: 90)
                        APICallout("EllipticalGradient(colors: [.tint, .tint.opacity(0)])")
                    }
                }
            }

            GradVariantRow(title: "Gradient.Stop — custom stop positions") {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(stops: [
                        .init(color: .blue, location: 0),
                        .init(color: .blue, location: 0.4),
                        .init(color: .pink, location: 0.6),
                        .init(color: .pink, location: 1)
                    ], startPoint: .leading, endPoint: .trailing))
                    .frame(width: 280, height: 60)
            }

            GradVariantRow(title: "MeshGradient (macOS 15+)") {
                if #available(macOS 15, *) {
                    MeshGradient(
                        width: 3, height: 3,
                        points: [
                            .init(0, 0), .init(0.5, 0), .init(1, 0),
                            .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                            .init(0, 1), .init(0.5, 1), .init(1, 1)
                        ],
                        colors: [
                            .blue, .cyan, .indigo,
                            .purple, .pink, .red,
                            .orange, .yellow, .green
                        ]
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 240, height: 160)
                } else {
                    Text("MeshGradient requires macOS 15+")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            GradVariantRow(title: "AnyGradient — type-erased gradient") {
                let g: AnyGradient = Color.accentColor.gradient
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        Circle().fill(g).frame(width: 80, height: 80)
                        APICallout("Color.accentColor.gradient")
                    }
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.blue.gradient)
                            .frame(width: 120, height: 70)
                        APICallout("Color.blue.gradient")
                    }
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Gradient colors take any ShapeStyle.", "Pass Color, AnyGradient, or other ShapeStyles as stop colors. Gradient.Stop lets you place color transitions at precise normalized positions.", "paintpalette"),
        ("Color.tint.gradient — one-line gradient fill.", "Any Color exposes a .gradient property that returns an AnyGradient suitable for use directly in .fill.", "sparkles"),
        ("MeshGradient requires macOS 15 (Sequoia).", "MeshGradient is not available before macOS 15. Guard with if #available(macOS 15, *) when needed (SwiftKit's macOS 26 target means it's always available here).", "calendar"),
        ("AngularGradient for conic effects.", "AngularGradient sweeps around a center point. Use it for color wheels, pie-chart backgrounds, and loading spinners.", "circle.dotted"),
        ("EllipticalGradient for radial on non-square frames.", "Unlike RadialGradient, EllipticalGradient automatically adapts its aspect ratio to the frame — no manual radius tuning needed.", "oval")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct GradVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    GradientPage()
        .frame(width: 1100, height: 1200)
}
