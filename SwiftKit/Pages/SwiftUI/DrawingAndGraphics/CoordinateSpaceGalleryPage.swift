import SwiftUI

struct CoordinateSpaceGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Live demo — local vs named coordinate spaces

            VariantTile(
                name: "named space",
                api: ".coordinateSpace(name: \"demo\")"
            ) {
                CoordinateSpaceDemo(space: .named("demo"))
            }

            VariantTile(
                name: ".local",
                api: "GeometryProxy.frame(in: .local)"
            ) {
                CoordinateSpaceDemo(space: .local)
            }

            // MARK: Reference

            ReferenceTile(
                name: "CoordinateSpace",
                signature: "enum CoordinateSpace  ·  .global  ·  .local  ·  .named(AnyHashable)",
                note: "Identifies a coordinate space when reading geometry. `.local` is the receiving view; `.global` is the screen; `.named(_:)` references a space registered with `.coordinateSpace(name:)` higher in the tree."
            )

            ReferenceTile(
                name: "CoordinateSpaceProtocol",
                signature: "protocol CoordinateSpaceProtocol  ·  static var global  ·  static var local  ·  static func named(_:)  ·  .scrollView",
                note: "Newer protocol-based replacement that powers `.local` / `.global` / `.named(_:)` / `.scrollView` as static members. Lets APIs accept any conforming coordinate space without an erasing wrapper.",
                badge: "macOS 14+"
            )

            ReferenceTile(
                name: "View.coordinateSpace(_:)",
                signature: "func coordinateSpace<C: CoordinateSpaceProtocol>(_ space: C) -> some View",
                note: "Registers a named coordinate space at this view. Descendants reading geometry can express positions relative to this anchor by name."
            )

            ReferenceTile(
                name: "GeometryProxy.frame(in:)",
                signature: "func frame(in coordinateSpace: CoordinateSpace) -> CGRect",
                note: "Resolves the proxy's bounds in the supplied coordinate space. Pair with `.named(_:)` to compute distance from a named ancestor — common for parallax and pinning."
            )
        }
    }
}

/// Renders a draggable dot that reports its position in the supplied
/// coordinate space, demonstrating how `.local` differs from `.named`.
private struct CoordinateSpaceDemo: View {
    let space: CoordinateSpace
    @State private var position: CGPoint = .zero

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(Color.secondary.opacity(0.15))
                GeometryReader { proxy in
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture { location in
                            let frame = proxy.frame(in: space)
                            position = CGPoint(x: location.x - frame.minX, y: location.y - frame.minY)
                        }
                    Circle()
                        .fill(.tint)
                        .frame(width: 8, height: 8)
                        .position(position == .zero ? CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2) : position)
                }
            }
            .frame(width: 120, height: 80)
            .coordinateSpace(name: "demo")

            Text(String(format: "x: %.0f  y: %.0f", position.x, position.y))
                .font(.caption2)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }
}

extension CoordinateSpaceGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.coordinateSpace",
        title: "CoordinateSpace",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "CoordinateSpace",
            "CoordinateSpaceProtocol",
            "View/coordinateSpace(_:)"
        ],
        blurb: "Names and resolves coordinate spaces — the CoordinateSpace enum, the CoordinateSpaceProtocol used by .global / .local / .named(_:), and the view modifier that registers a custom space.",
        signature: "enum CoordinateSpace",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/coordinatespace.md",
        page: { AnyView(CoordinateSpaceGalleryPage()) }
    )
}

#Preview {
    CoordinateSpaceGalleryPage()
        .frame(width: 900, height: 700)
}
