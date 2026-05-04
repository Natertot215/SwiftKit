import SwiftUI

// SwiftUI `Path` reference page.
// Source: Documentation/SwiftUI/shapes/path.md
// macOS 10.15+. An outline of a 2D shape using bezier curves, lines, arcs.

struct PathPage: View {
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
            Text("Path")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("An outline of a 2D shape: lines, arcs, curves, and subpaths.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/shapes/path.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var trianglePath: Path {
        Path { p in
            p.move(to: CGPoint(x: 100, y: 10))
            p.addLine(to: CGPoint(x: 190, y: 170))
            p.addLine(to: CGPoint(x: 10, y: 170))
            p.closeSubpath()
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            trianglePath
                .fill(.tint)
                .frame(width: 200, height: 180)
            APICallout("Path { p in\n  p.move(to: ...)\n  p.addLine(to: ...)\n  p.closeSubpath()\n}.fill(.tint)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            PathVariantRow(title: "Basic polygon — triangle") {
                trianglePath
                    .fill(.tint)
                    .frame(width: 200, height: 180)
            }

            PathVariantRow(title: "Arc — sector / pie slice") {
                Path { p in
                    p.move(to: CGPoint(x: 75, y: 75))
                    p.addArc(center: CGPoint(x: 75, y: 75), radius: 70,
                             startAngle: .degrees(-90), endAngle: .degrees(120), clockwise: false)
                    p.closeSubpath()
                }
                .fill(.tint)
                .frame(width: 150, height: 150)
            }

            PathVariantRow(title: "Bezier curve — quadratic") {
                Path { p in
                    p.move(to: CGPoint(x: 20, y: 80))
                    p.addQuadCurve(to: CGPoint(x: 180, y: 80), control: CGPoint(x: 100, y: 0))
                }
                .stroke(.tint, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .frame(width: 200, height: 100)
            }

            PathVariantRow(title: "Bezier curve — cubic") {
                Path { p in
                    p.move(to: CGPoint(x: 20, y: 100))
                    p.addCurve(to: CGPoint(x: 220, y: 100),
                               control1: CGPoint(x: 80, y: 0),
                               control2: CGPoint(x: 160, y: 200))
                }
                .stroke(.tint, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                .frame(width: 240, height: 130)
            }

            PathVariantRow(title: "Filled + stroked star") {
                let star = starPath(center: CGPoint(x: 80, y: 80), outerRadius: 70, innerRadius: 30, points: 5)
                ZStack {
                    star.fill(.tint)
                    star.stroke(.primary.opacity(0.5), lineWidth: 2)
                }
                .frame(width: 160, height: 160)
            }

            PathVariantRow(title: "trim(from:to:) on a custom path") {
                HStack(spacing: 20) {
                    ForEach([0.25, 0.5, 0.75, 1.0], id: \.self) { t in
                        VStack(spacing: 4) {
                            Path { p in
                                p.move(to: .init(x: 10, y: 40))
                                p.addCurve(to: .init(x: 80, y: 40),
                                           control1: .init(x: 30, y: 0),
                                           control2: .init(x: 60, y: 80))
                            }
                            .trim(from: 0, to: t)
                            .stroke(.tint, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                            .frame(width: 90, height: 80)
                            Text("\(Int(t * 100))%")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            PathVariantRow(title: "Custom Shape conformance — reusable star") {
                HStack(spacing: 20) {
                    ForEach([3, 5, 7, 8], id: \.self) { pts in
                        VStack(spacing: 6) {
                            StarShape(points: pts)
                                .fill(.tint)
                                .frame(width: 64, height: 64)
                            Text("\(pts) pts")
                                .font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    private func starPath(center: CGPoint, outerRadius: CGFloat, innerRadius: CGFloat, points: Int) -> Path {
        Path { p in
            let step = CGFloat.pi / CGFloat(points)
            for i in 0..<(points * 2) {
                let angle = CGFloat(i) * step - .pi / 2
                let r = i.isMultiple(of: 2) ? outerRadius : innerRadius
                let pt = CGPoint(x: center.x + r * cos(angle), y: center.y + r * sin(angle))
                if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
            }
            p.closeSubpath()
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Path is the low-level drawing primitive.", "All SwiftUI shapes (Circle, Ellipse, etc.) are built on Path under the hood. Use Path when none of the built-in shapes fit.", "pencil.and.outline"),
        ("addArc uses SwiftUI's coordinate system.", "Y increases downward, so clockwise: false draws counter-clockwise visually. Adjust start/end angles accordingly.", "arrow.clockwise"),
        ("Custom Shape via Shape protocol.", "Wrap a Path in a struct conforming to Shape — implement func path(in rect: CGRect) -> Path — to get all the .fill, .stroke, .trim modifiers for free.", "square.3.layers.3d"),
        ("trim(from:to:) works on Path strokes.", "Animate the `to` parameter from 0 to 1 inside withAnimation for draw-on effects without any third-party animation library.", "wand.and.sparkles"),
        ("Use CGAffineTransform to scale paths to a rect.", "When building a custom Shape, apply path.applying(CGAffineTransform(scaleX:y:)) to fit your path inside the provided rect.", "arrow.up.left.and.arrow.down.right")
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

private struct StarShape: Shape {
    let points: Int
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * 0.45
        let step = CGFloat.pi / CGFloat(points)
        return Path { p in
            for i in 0..<(points * 2) {
                let angle = CGFloat(i) * step - .pi / 2
                let r = i.isMultiple(of: 2) ? outerRadius : innerRadius
                let pt = CGPoint(x: center.x + r * cos(angle), y: center.y + r * sin(angle))
                if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
            }
            p.closeSubpath()
        }
    }
}

private struct PathVariantRow<Content: View>: View {
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
    PathPage()
        .frame(width: 1100, height: 1100)
}
