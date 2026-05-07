import SwiftUI

struct AngleGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Concrete-angle demos via .rotationEffect

            VariantTile(
                name: ".degrees(0)",
                api: "Angle.degrees(0)"
            ) {
                angleArrow
                    .rotationEffect(.degrees(0))
            }

            VariantTile(
                name: ".degrees(45)",
                api: "Angle.degrees(45)"
            ) {
                angleArrow
                    .rotationEffect(.degrees(45))
            }

            VariantTile(
                name: ".degrees(90)",
                api: "Angle.degrees(90)"
            ) {
                angleArrow
                    .rotationEffect(.degrees(90))
            }

            VariantTile(
                name: ".degrees(180)",
                api: "Angle.degrees(180)"
            ) {
                angleArrow
                    .rotationEffect(.degrees(180))
            }

            VariantTile(
                name: ".radians(.pi / 4)",
                api: "Angle.radians(.pi / 4)"
            ) {
                angleArrow
                    .rotationEffect(.radians(.pi / 4))
            }

            VariantTile(
                name: "Angle.zero",
                api: "Angle.zero  // identity rotation"
            ) {
                angleArrow
                    .rotationEffect(.zero)
            }

            // MARK: Reference

            ReferenceTile(
                name: "Angle",
                signature: "@frozen struct Angle  ·  init(degrees:)  ·  init(radians:)",
                note: "A geometric angle. Construct from degrees or radians; the struct stores both forms internally so reads are always free."
            )

            ReferenceTile(
                name: "Angle.degrees / .radians",
                signature: "var degrees: Double  ·  var radians: Double",
                note: "Read either representation regardless of which initializer was used. Conversion is exact at the floating-point level."
            )

            ReferenceTile(
                name: "Static factories",
                signature: ".degrees(_:)  ·  .radians(_:)  ·  .zero",
                note: "Idiomatic call sites use the dot-syntax factories where SwiftUI infers the Angle type — `.rotationEffect(.degrees(45))`."
            )

            ReferenceTile(
                name: "Comparable + Animatable",
                signature: "extension Angle : Comparable, Animatable, Hashable, Sendable",
                note: "Angle conforms to Animatable, so SwiftUI can interpolate between two angles inside `.animation` and `.rotationEffect`."
            )
        }
    }

    private var angleArrow: some View {
        Image(systemName: "arrow.up")
            .font(.system(size: 48, weight: .semibold))
            .foregroundStyle(.tint)
    }
}

extension AngleGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.angle",
        title: "Angle",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["Angle"],
        blurb: "A geometric angle whose value can be read in either radians or degrees — the canonical angle type for SwiftUI rotation, gradient, and gesture APIs.",
        signature: "@frozen struct Angle",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/angle.md",
        page: { AnyView(AngleGalleryPage()) }
    )
}

#Preview {
    AngleGalleryPage()
        .frame(width: 900, height: 700)
}
