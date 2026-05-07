import SwiftUI

// UnitCurve — maps input progress [0,1] -> output progress [0,1].
// Apply via Animation.timingCurve(_:duration:) so curves drive a real
// AnimationDemoTile capsule.

struct UnitCurveGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Built-in curves — applied via Animation.timingCurve(_:duration:)

            AnimationDemoTile(
                name: "UnitCurve.linear",
                api: ".animation(.timingCurve(.linear, duration: 0.5), value:)",
                animation: .timingCurve(.linear, duration: 0.5)
            )

            AnimationDemoTile(
                name: "UnitCurve.easeIn",
                api: ".animation(.timingCurve(.easeIn, duration: 0.5), value:)",
                animation: .timingCurve(.easeIn, duration: 0.5)
            )

            AnimationDemoTile(
                name: "UnitCurve.easeOut",
                api: ".animation(.timingCurve(.easeOut, duration: 0.5), value:)",
                animation: .timingCurve(.easeOut, duration: 0.5)
            )

            AnimationDemoTile(
                name: "UnitCurve.easeInOut",
                api: ".animation(.timingCurve(.easeInOut, duration: 0.5), value:)",
                animation: .timingCurve(.easeInOut, duration: 0.5)
            )

            AnimationDemoTile(
                name: "UnitCurve.circularEaseIn",
                api: ".animation(.timingCurve(.circularEaseIn, duration: 0.5), value:)",
                animation: .timingCurve(.circularEaseIn, duration: 0.5)
            )

            AnimationDemoTile(
                name: "UnitCurve.circularEaseOut",
                api: ".animation(.timingCurve(.circularEaseOut, duration: 0.5), value:)",
                animation: .timingCurve(.circularEaseOut, duration: 0.5)
            )

            AnimationDemoTile(
                name: "UnitCurve.circularEaseInOut",
                api: ".animation(.timingCurve(.circularEaseInOut, duration: 0.5), value:)",
                animation: .timingCurve(.circularEaseInOut, duration: 0.5)
            )

            AnimationDemoTile(
                name: "UnitCurve.bezier(start:end:)",
                api: ".timingCurve(.bezier(startControlPoint: .init(x: 0.2, y: 0), endControlPoint: .init(x: 0.0, y: 1.0)), duration: 0.5)",
                animation: .timingCurve(
                    .bezier(
                        startControlPoint: UnitPoint(x: 0.2, y: 0.0),
                        endControlPoint: UnitPoint(x: 0.0, y: 1.0)
                    ),
                    duration: 0.5
                )
            )

            // MARK: Reference

            ReferenceTile(
                name: "UnitCurve",
                signature: "struct UnitCurve",
                note: "A 2D curve mapping input progress in [0,1] to output progress in [0,1]. The y component returned by value(at:) drives interpolation."
            )

            ReferenceTile(
                name: "UnitCurve.bezier(startControlPoint:endControlPoint:)",
                signature: "static func bezier(startControlPoint: UnitPoint, endControlPoint: UnitPoint) -> UnitCurve",
                note: "Build a custom cubic-bezier curve from two control points in unit space. Mirrors CSS cubic-bezier(...)."
            )

            ReferenceTile(
                name: "value(at:) and velocity(at:)",
                signature: "func value(at: Double) -> Double · func velocity(at: Double) -> Double",
                note: "Sample the curve. velocity(at:) is the first derivative — useful for chaining a custom animation that needs to know how fast progress is changing."
            )

            ReferenceTile(
                name: "inverse",
                signature: "var inverse: UnitCurve",
                note: "A copy of the curve with x and y swapped. easeIn.inverse ≈ easeOut."
            )

            ReferenceTile(
                name: "Animation.timingCurve(_:duration:)",
                signature: "static func timingCurve(_ curve: UnitCurve, duration: TimeInterval = 0.35) -> Animation",
                note: "Creates an Animation driven by the supplied UnitCurve. The most common path from a UnitCurve to a usable .animation(_:value:) call."
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
