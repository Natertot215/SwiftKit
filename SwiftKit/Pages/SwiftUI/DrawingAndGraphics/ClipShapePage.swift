import SwiftUI

// SwiftUI `View/clipShape(_:style:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/clipshape(_:style:).md
// macOS 10.15+. Sets a clipping shape for this view.

struct ClipShapePage: View {
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
            Text("View/clipShape(_:style:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Clips the view to a Shape's path. Anything outside the shape is removed; the shape itself isn't drawn.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/clipshape(_:style:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var source: some View {
        LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 140, height: 120)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 24) {
                source
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                source.clipShape(Circle())
            }
            APICallout(".clipShape(Circle())")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Built-in shapes") {
                HStack(spacing: 16) {
                    VStack(spacing: 6) {
                        source.clipShape(Circle())
                        Text("Circle()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        source.clipShape(Capsule())
                        Text("Capsule()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        source.clipShape(Ellipse())
                        Text("Ellipse()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            VariantRow(title: "RoundedRectangle radii") {
                HStack(spacing: 16) {
                    ForEach([4.0, 12, 24, 48], id: \.self) { r in
                        VStack(spacing: 6) {
                            source.clipShape(RoundedRectangle(cornerRadius: r))
                            Text("cornerRadius: \(Int(r))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            VariantRow(title: "UnevenRoundedRectangle") {
                HStack(spacing: 16) {
                    source.clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 32,
                            bottomLeadingRadius: 4,
                            bottomTrailingRadius: 32,
                            topTrailingRadius: 4
                        )
                    )
                    APICallout("UnevenRoundedRectangle(topLeadingRadius: 32, bottomLeadingRadius: 4, bottomTrailingRadius: 32, topTrailingRadius: 4)")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "FillStyle (eo-fill on a self-intersecting path)") {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 24) {
                    source.clipShape(StarShape(), style: FillStyle(eoFill: false))
                    source.clipShape(StarShape(), style: FillStyle(eoFill: true))
                }
                HStack(spacing: 24) {
                    Text("FillStyle(eoFill: false)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        .frame(width: 140)
                    Text("FillStyle(eoFill: true)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        .frame(width: 140)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Shape isn't drawn.", "clipShape uses the Shape only for its path. Use overlay(Shape().stroke(...)) if you need a visible border on top.", "scissors"),
        ("Aspect ratio is preserved.", "The shape fills the view's frame, maintaining aspect ratio. To clip a circle out of a non-square frame, the circle scales to fit.", "rectangle.expand.vertical"),
        ("style controls fill rules.", "Pass FillStyle(eoFill: true) for even-odd fill on self-intersecting paths (e.g., star with crossing segments).", "function"),
        ("Antialiased by default.", "Unlike clipped(), clipShape always anti-aliases the edge for clean curves.", "scribble.variable")
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

    // Self-intersecting star path so the FillStyle.eoFill demo has visible difference.
    private struct StarShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2
            let points = 5
            for i in 0..<points {
                let angle = (Double(i) / Double(points)) * 4 * .pi - .pi / 2
                let x = center.x + CGFloat(cos(angle)) * radius
                let y = center.y + CGFloat(sin(angle)) * radius
                if i == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            path.closeSubpath()
            return path
        }
    }
}

#Preview {
    ClipShapePage().frame(width: 1100, height: 1000)
}
