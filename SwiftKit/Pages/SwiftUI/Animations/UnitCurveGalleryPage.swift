import SwiftUI

struct UnitCurveGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension UnitCurveGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.unitCurve",
        title: "UnitCurve",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["UnitCurve"],
        blurb: "A function defined by a two-dimensional curve that maps an input progress in [0,1] to an output progress in [0,1]. Reshape the curve to change the effective speed of an animation or other interpolation.",
        signature: "struct UnitCurve",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/unitcurve.md",
        page: { AnyView(UnitCurveGalleryPage()) }
    )
}

#Preview {
    UnitCurveGalleryPage()
        .frame(width: 900, height: 700)
}
