import SwiftUI

// SwiftUI `GeometryReader` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/geometryreader.md
// macOS 10.15+. Container view that defines its content as a function of its own size and coordinate space.

struct GeometryReaderGalleryPage: View {
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
            Text("GeometryReader")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Container view whose content is a function of its own proposed size and coordinate space. Vends a GeometryProxy to its closure with size, frame(in:), safeAreaInsets, bounds(of:), and transform(in:).")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/geometryreader.md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            GeometryReader { proxy in
                VStack(alignment: .leading, spacing: 4) {
                    Text("size: \(Int(proxy.size.width)) \u{00d7} \(Int(proxy.size.height))")
                        .font(.callout).fontDesign(.monospaced).foregroundStyle(.primary)
                    Text("safeAreaInsets: top \(Int(proxy.safeAreaInsets.top)), bottom \(Int(proxy.safeAreaInsets.bottom)), leading \(Int(proxy.safeAreaInsets.leading)), trailing \(Int(proxy.safeAreaInsets.trailing))")
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    Text("frame(in: .global): \(Int(proxy.frame(in: .global).origin.x)), \(Int(proxy.frame(in: .global).origin.y))")
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                .padding(12)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            }
            .frame(height: 110)
            APICallout("GeometryReader { proxy in\n  Text(\"\\(Int(proxy.size.width)) \u{00d7} \\(Int(proxy.size.height))\")\n}")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Proportional split (50/50)") {
                GeometryReader { proxy in
                    HStack(spacing: 0) {
                        Color.accentColor.opacity(0.4)
                            .frame(width: proxy.size.width * 0.5)
                        Color.accentColor.opacity(0.2)
                    }
                }
                .frame(height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 6))
            }

            VariantRow(title: "Centered overlay using proxy.size") {
                GeometryReader { proxy in
                    Circle()
                        .fill(.tint)
                        .frame(width: 40, height: 40)
                        .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
                }
                .frame(height: 100)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
            }

            VariantRow(title: "Aspect-aware sizing") {
                GeometryReader { proxy in
                    let side = min(proxy.size.width, proxy.size.height) - 16
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.tint)
                        .frame(width: side, height: side)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(height: 120)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Live coordinates in named space") {
            VStack(alignment: .leading, spacing: 6) {
                GeometryReader { proxy in
                    let frame = proxy.frame(in: .named("page"))
                    Text("frame in 'page': x \(Int(frame.origin.x)) y \(Int(frame.origin.y)) w \(Int(frame.size.width)) h \(Int(frame.size.height))")
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.primary)
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 60)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                .padding(.leading, 32)
                .coordinateSpace(.named("page"))

                Text("Resize the window to see frame.x / .y change relative to the named page space.").font(.caption).foregroundStyle(.tertiary)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Proposes maximal size to children.", "GeometryReader greedily takes its parent's full proposal. That makes it expand inside flexible containers \u{2014} pin its frame explicitly when used inside lists or stacks.", "arrow.up.left.and.arrow.down.right"),
        ("Use for ratios, not for measurement.", "Prefer .onGeometryChange(for:of:action:) when you want to read size into @State \u{2014} that path is layout-pass-stable. GeometryReader is best for layout that depends on proxy values directly.", "ruler"),
        ("Vends a GeometryProxy.", "The closure parameter is GeometryProxy with size, safeAreaInsets, frame(in:), bounds(of:), transform(in:), and subscript(_:Anchor) for resolving anchor preferences.", "person.crop.circle"),
        ("Top-leading aligned by default.", "Children are placed at the top-leading corner of GeometryReader's frame \u{2014} use .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:) inside if you want centering.", "rectangle.split.3x1"),
        ("3D peer is GeometryReader3D.", "On visionOS use GeometryReader3D + GeometryProxy3D for three-dimensional measurements; on macOS the 2D form is sufficient.", "cube")
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

extension GeometryReaderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.geometryReader",
        title: "GeometryReader",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "GeometryReader",
            "GeometryReader3D",
            "GeometryProxy",
            "GeometryProxy3D",
            "GeometryProxyCoordinateSpace3D",
            "View/onGeometryChange(for:of:action:)"
        ],
        blurb: "A container that exposes its own size and coordinate space to its content — covers 2D and 3D readers, the proxy types they vend, and the onGeometryChange observation modifier.",
        signature: "@frozen struct GeometryReader<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/geometryreader.md",
        page: { AnyView(GeometryReaderGalleryPage()) }
    )
}

#Preview {
    GeometryReaderGalleryPage().frame(width: 1100, height: 1100)
}
