import SwiftUI

// SwiftUI `Shape` protocol + modifiers reference page.
// Covers: Shape, AnyShape, ShapeRole, ShapeView, FillStyle, FillShapeView,
//         StrokeStyle, StrokeShapeView, StrokeBorderShapeView, InsettableShape,
//         ScaledShape, RotatedShape, OffsetShape, TransformedShape,
//         ContainerRelativeShape, View/containerShape(_:)
// macOS 10.15+

struct ShapeModifiersPage: View {
    @State private var scaleX: CGFloat = 1.0
    @State private var rotation: Double = 0

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
            Text("Shape Modifiers")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Shape, AnyShape, ScaledShape, RotatedShape, OffsetShape, TransformedShape, FillStyle, StrokeStyle, InsettableShape, ContainerRelativeShape.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/shapes/ · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.tint, style: FillStyle(eoFill: false, antialiased: true))
                .frame(width: 200, height: 100)
            APICallout("RoundedRectangle(cornerRadius: 16).fill(.tint, style: FillStyle())")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SMVariantRow(title: "FillStyle — eoFill (even-odd fill)") {
                HStack(spacing: 24) {
                    VStack(spacing: 6) {
                        donutPath
                            .fill(.tint, style: FillStyle(eoFill: false))
                            .frame(width: 80, height: 80)
                        Text("eoFill: false\n(winding rule)")
                            .font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
                    }
                    VStack(spacing: 6) {
                        donutPath
                            .fill(.tint, style: FillStyle(eoFill: true))
                            .frame(width: 80, height: 80)
                        Text("eoFill: true\n(even-odd rule)")
                            .font(.caption).foregroundStyle(.secondary).multilineTextAlignment(.center)
                    }
                }
            }

            SMVariantRow(title: "StrokeStyle — lineCap, lineJoin, dash") {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 16) {
                        VStack(spacing: 4) {
                            lineDemo(StrokeStyle(lineWidth: 6, lineCap: .butt))
                            Text(".butt").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 4) {
                            lineDemo(StrokeStyle(lineWidth: 6, lineCap: .round))
                            Text(".round").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 4) {
                            lineDemo(StrokeStyle(lineWidth: 6, lineCap: .square))
                            Text(".square").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    HStack(spacing: 16) {
                        VStack(spacing: 4) {
                            angledLineDemo(StrokeStyle(lineWidth: 6, lineJoin: .miter))
                            Text(".miter join").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 4) {
                            angledLineDemo(StrokeStyle(lineWidth: 6, lineJoin: .round))
                            Text(".round join").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 4) {
                            angledLineDemo(StrokeStyle(lineWidth: 6, lineJoin: .bevel))
                            Text(".bevel join").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    HStack(spacing: 16) {
                        VStack(spacing: 4) {
                            Path { p in
                                p.move(to: .init(x: 10, y: 30))
                                p.addLine(to: .init(x: 110, y: 30))
                            }
                            .stroke(.tint, style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [8, 4]))
                            .frame(width: 120, height: 40)
                            Text("dash: [8, 4]").font(.caption).foregroundStyle(.secondary)
                        }
                        VStack(spacing: 4) {
                            Path { p in
                                p.move(to: .init(x: 10, y: 30))
                                p.addLine(to: .init(x: 110, y: 30))
                            }
                            .stroke(.tint, style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [3, 3]))
                            .frame(width: 120, height: 40)
                            Text("dash: [3, 3]").font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            SMVariantRow(title: "AnyShape — type-erased shape") {
                let shapes: [(String, AnyShape)] = [
                    ("Circle", AnyShape(Circle())),
                    ("RoundedRectangle", AnyShape(RoundedRectangle(cornerRadius: 12))),
                    ("Capsule", AnyShape(Capsule()))
                ]
                HStack(spacing: 16) {
                    ForEach(shapes, id: \.0) { name, shape in
                        VStack(spacing: 6) {
                            shape.fill(.tint).frame(width: 80, height: 60)
                            Text(name).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            SMVariantRow(title: "ScaledShape / RotatedShape / OffsetShape") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        Circle().fill(.tint).frame(width: 60, height: 60).scaleEffect(x: 1.5, y: 0.7)
                        Text("scaleEffect(x:y:)").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        RoundedRectangle(cornerRadius: 10).fill(.tint).frame(width: 60, height: 60).rotationEffect(.degrees(30))
                        Text("rotationEffect").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        Circle().fill(.tint).frame(width: 40, height: 40).offset(x: 15, y: 10)
                        Text("offset(x:y:)").font(.caption).foregroundStyle(.secondary)
                    }
                }
            }

            SMVariantRow(title: "ContainerRelativeShape — adapts to clip container") {
                HStack(spacing: 16) {
                    ContainerRelativeShape()
                        .fill(.tint)
                        .frame(width: 100, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    ContainerRelativeShape()
                        .stroke(.tint, lineWidth: 3)
                        .frame(width: 100, height: 60)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            SMVariantRow(title: "TransformedShape via scaleEffect + rotation interactively") {
                VStack(alignment: .leading, spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.tint)
                        .frame(width: 120, height: 80)
                        .scaleEffect(x: scaleX)
                        .rotationEffect(.degrees(rotation))
                        .animation(.spring, value: scaleX)
                        .animation(.spring, value: rotation)

                    HStack {
                        Text("Scale X").font(.caption).foregroundStyle(.secondary).frame(width: 70, alignment: .leading)
                        Slider(value: $scaleX, in: 0.2...2.0).frame(width: 200)
                        Text(String(format: "%.1f", scaleX)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Rotation").font(.caption).foregroundStyle(.secondary).frame(width: 70, alignment: .leading)
                        Slider(value: $rotation, in: -180...180).frame(width: 200)
                        Text("\(Int(rotation))°").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private var donutPath: Path {
        var p = Path()
        p.addEllipse(in: CGRect(x: 5, y: 5, width: 70, height: 70))
        p.addEllipse(in: CGRect(x: 20, y: 20, width: 40, height: 40))
        return p
    }

    private func lineDemo(_ style: StrokeStyle) -> some View {
        Path { p in
            p.move(to: .init(x: 10, y: 30))
            p.addLine(to: .init(x: 110, y: 30))
        }
        .stroke(.tint, style: style)
        .frame(width: 120, height: 40)
    }

    private func angledLineDemo(_ style: StrokeStyle) -> some View {
        Path { p in
            p.move(to: .init(x: 10, y: 50))
            p.addLine(to: .init(x: 60, y: 10))
            p.addLine(to: .init(x: 110, y: 50))
        }
        .stroke(.tint, style: style)
        .frame(width: 120, height: 60)
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Shape protocol requires path(in:).", "Conform to Shape and implement func path(in rect: CGRect) -> Path. You get .fill, .stroke, .trim, and all view modifiers for free.", "pencil.and.outline"),
        ("AnyShape erases the concrete type.", "Use AnyShape when you need a heterogeneous collection of shapes or to store a shape in a property without generics.", "square.3.layers.3d"),
        ("FillStyle controls winding rule.", "eoFill: true uses the even-odd rule — overlapping subpaths create holes. eoFill: false (default) uses the non-zero winding rule.", "circle.lefthalf.strikethrough"),
        ("StrokeStyle is composable.", "Combine lineWidth, lineCap, lineJoin, miterLimit, and dash/dashPhase to produce any stroke appearance.", "line.3.horizontal"),
        ("ScaledShape, RotatedShape, OffsetShape are concrete wrappers.", "These are returned by the corresponding View modifiers applied to a Shape. They themselves conform to Shape, so you can chain more shape modifiers.", "arrow.up.left.and.arrow.down.right")
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

private struct SMVariantRow<Content: View>: View {
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
    ShapeModifiersPage()
        .frame(width: 1100, height: 1100)
}
