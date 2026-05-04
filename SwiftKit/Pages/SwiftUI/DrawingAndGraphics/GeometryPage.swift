import SwiftUI

// SwiftUI geometry reference page.
// Covers: GeometryReader, GeometryProxy, View/coordinateSpace(_:), CoordinateSpace,
//         CoordinateSpaceProtocol, View/onGeometryChange(for:of:action:),
//         Axis, Angle, UnitPoint, Anchor
// macOS 10.15+

struct GeometryPage: View {
    @State private var measuredSize: CGSize = .zero
    @State private var measuredOrigin: CGPoint = .zero

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
            Text("GeometryReader · Angle · UnitPoint · Axis")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("GeometryReader, GeometryProxy, coordinateSpace, onGeometryChange, Axis, Angle, UnitPoint, Anchor.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/ · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader { proxy in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.tint.opacity(0.15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.tint, lineWidth: 1)
                        }
                    Text("\(Int(proxy.size.width)) × \(Int(proxy.size.height))")
                        .font(.headline)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tint)
                }
            }
            .frame(width: 260, height: 80)
            APICallout("GeometryReader { proxy in\n  Text(\"\\(Int(proxy.size.width)) × \\(Int(proxy.size.height))\")\n}")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            GeoVariantRow(title: "GeometryReader — proportional layout") {
                GeometryReader { proxy in
                    HStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.blue)
                            .frame(width: proxy.size.width * 0.3)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.tint)
                            .frame(width: proxy.size.width * 0.5)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.pink)
                            .frame(width: proxy.size.width * 0.2)
                    }
                }
                .frame(height: 40)
                .frame(maxWidth: 360)
            }

            GeoVariantRow(title: "Angle — degrees and radians") {
                HStack(spacing: 24) {
                    let angles: [(String, Angle)] = [
                        ("45°", .degrees(45)),
                        ("90°", .degrees(90)),
                        ("π/4 rad", .radians(.pi / 4)),
                        ("-30°", .degrees(-30))
                    ]
                    ForEach(angles, id: \.0) { label, angle in
                        VStack(spacing: 6) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.tint)
                                .frame(width: 40, height: 40)
                                .rotationEffect(angle)
                            Text(label).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            GeoVariantRow(title: "UnitPoint — named anchor positions") {
                let points: [(String, UnitPoint)] = [
                    ("topLeading", .topLeading), ("top", .top), ("topTrailing", .topTrailing),
                    ("leading", .leading), ("center", .center), ("trailing", .trailing),
                    ("bottomLeading", .bottomLeading), ("bottom", .bottom), ("bottomTrailing", .bottomTrailing)
                ]
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3), spacing: 8) {
                    ForEach(points, id: \.0) { name, pt in
                        VStack(spacing: 4) {
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(.secondary.opacity(0.1))
                                    .frame(width: 60, height: 40)
                                Circle()
                                    .fill(.tint)
                                    .frame(width: 10, height: 10)
                                    .offset(
                                        x: pt.x * 60 - 5,
                                        y: pt.y * 40 - 5
                                    )
                            }
                            Text(name).font(.system(size: 9)).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            GeoVariantRow(title: "Axis — .horizontal and .vertical") {
                HStack(spacing: 20) {
                    VStack(spacing: 6) {
                        ScrollView(.horizontal) {
                            HStack(spacing: 8) {
                                ForEach(0..<5, id: \.self) { i in
                                    RoundedRectangle(cornerRadius: 6).fill(.tint.opacity(0.3 + Double(i) * 0.14))
                                        .frame(width: 40, height: 30)
                                }
                            }.padding(.horizontal, 4)
                        }
                        .frame(width: 140, height: 40)
                        APICallout("Axis.horizontal (ScrollView)")
                    }
                    VStack(spacing: 6) {
                        ScrollView(.vertical) {
                            VStack(spacing: 6) {
                                ForEach(0..<4, id: \.self) { i in
                                    RoundedRectangle(cornerRadius: 6).fill(.tint.opacity(0.3 + Double(i) * 0.17))
                                        .frame(width: 60, height: 20)
                                }
                            }.padding(.vertical, 4)
                        }
                        .frame(width: 80, height: 80)
                        APICallout("Axis.vertical")
                    }
                }
            }

            GeoVariantRow(title: "coordinateSpace(_:) + onGeometryChange") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Monitors geometry changes in named coordinate space.")
                        .font(.callout).foregroundStyle(.secondary)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.tint.opacity(0.15))
                        .overlay {
                            Text("Measured: \(Int(measuredSize.width)) × \(Int(measuredSize.height))")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tint)
                        }
                        .frame(width: 260, height: 60)
                        .coordinateSpace(.named("demo"))
                        .onGeometryChange(for: CGSize.self) { proxy in
                            proxy.size
                        } action: { newValue in
                            measuredSize = newValue
                        }
                    APICallout(".onGeometryChange(for: CGSize.self) { proxy in proxy.size } action: { ... }")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            GeoVariantRow(title: "GeometryProxy — safe area insets") {
                GeometryReader { proxy in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("size: \(Int(proxy.size.width)) × \(Int(proxy.size.height))")
                        Text("safeArea.top: \(Int(proxy.safeAreaInsets.top))")
                        Text("safeArea.bottom: \(Int(proxy.safeAreaInsets.bottom))")
                    }
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                }
                .frame(height: 60)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("GeometryReader proposes maximal space.", "GeometryReader always proposes its full available size to its children. Use it sparingly — it can cause unexpected layout expansion.", "arrow.up.left.and.arrow.down.right"),
        ("Prefer onGeometryChange over reading proxy inside body.", "onGeometryChange avoids layout feedback loops by deferring size reads to an action closure rather than building layout from geometry inline.", "arrow.circlepath"),
        ("UnitPoint coordinates are 0–1 normalized.", "UnitPoint(x: 0, y: 0) is top-leading, (1, 1) is bottom-trailing. They're used in gradients, rotationEffect anchor, and matchedGeometryEffect.", "square.grid.2x2"),
        ("Angle is bidirectional — degrees ↔ radians.", "Access .degrees and .radians properties freely on any Angle value. SwiftUI converts internally, so you can author in degrees and the system uses radians.", "angle"),
        ("Axis.Set can combine horizontal and vertical.", "Axis.Set is an OptionSet. Pass [.horizontal, .vertical] for bi-directional scroll or swipe detection.", "arrow.left.and.right")
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

private struct GeoVariantRow<Content: View>: View {
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
    GeometryPage()
        .frame(width: 1100, height: 1200)
}
