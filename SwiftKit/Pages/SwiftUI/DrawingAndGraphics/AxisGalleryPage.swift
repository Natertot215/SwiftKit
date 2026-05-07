import SwiftUI

struct AxisGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: ScrollView axis

            VariantTile(
                name: "ScrollView(.vertical)",
                api: "ScrollView(.vertical)"
            ) {
                ScrollView(.vertical) {
                    VStack(spacing: 4) {
                        ForEach(0..<8, id: \.self) { i in
                            Text("Row \(i)")
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(6)
                                .background(.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(4)
                }
                .frame(width: 120, height: 96)
            }

            VariantTile(
                name: "ScrollView(.horizontal)",
                api: "ScrollView(.horizontal)"
            ) {
                ScrollView(.horizontal) {
                    HStack(spacing: 4) {
                        ForEach(0..<10, id: \.self) { i in
                            Text("\(i)")
                                .font(.caption)
                                .frame(width: 28, height: 28)
                                .background(.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(4)
                }
                .frame(width: 120, height: 60)
            }

            // MARK: Axis.Set scrollViews — multi-axis

            VariantTile(
                name: "ScrollView([.vertical, .horizontal])",
                api: "ScrollView([.vertical, .horizontal])"
            ) {
                ScrollView([.vertical, .horizontal]) {
                    LazyVGrid(columns: Array(repeating: GridItem(.fixed(28), spacing: 4), count: 8), spacing: 4) {
                        ForEach(0..<32, id: \.self) { i in
                            Text("\(i)")
                                .font(.caption2)
                                .frame(width: 28, height: 28)
                                .background(.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(4)
                }
                .frame(width: 120, height: 96)
            }

            // MARK: ViewThatFits axis

            VariantTile(
                name: "ViewThatFits(in: .horizontal)",
                api: "ViewThatFits(in: .horizontal)"
            ) {
                ViewThatFits(in: .horizontal) {
                    Text("Long descriptive label")
                    Text("Short label")
                    Image(systemName: "tag")
                }
                .frame(width: 120, height: 40)
            }

            // MARK: Reference

            ReferenceTile(
                name: "Axis",
                signature: "@frozen enum Axis  ·  case horizontal  ·  case vertical",
                note: "The two-dimensional axis enum. Used by ScrollView, ViewThatFits, and adaptive layouts to specify orientation."
            )

            ReferenceTile(
                name: "Axis.Set",
                signature: "struct Axis.Set : OptionSet  ·  .horizontal  ·  .vertical",
                note: "OptionSet form for APIs that accept zero, one, or both axes — most commonly `ScrollView([.vertical, .horizontal])`."
            )

            ReferenceTile(
                name: "Conformances",
                signature: "extension Axis : CaseIterable, Hashable, Identifiable, RawRepresentable, Sendable",
                note: "Iterate via `Axis.allCases`. RawValue is `Int8`, so Axis values can round-trip through plist or other primitive encodings."
            )
        }
    }
}

extension AxisGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.axis",
        title: "Axis",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Axis"],
        blurb: "The horizontal or vertical dimension in a 2D coordinate system — used by stack, scroll, and layout primitives to express axis-aligned behavior.",
        signature: "@frozen enum Axis",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/axis.md",
        page: { AnyView(AxisGalleryPage()) }
    )
}

#Preview {
    AxisGalleryPage()
        .frame(width: 900, height: 700)
}
