import SwiftUI

struct VisionOS3DTypesDescribePage: View {
    var body: some View {
        DescribePage(
            title: "visionOS 3D Geometry & Effects",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/",
            availability: "visionOS 1.0+",
            blurb: """
            SwiftUI extends its 2D geometry model with a full depth (Z) axis for visionOS spatial layouts. UnitPoint3D, Alignment3D, DepthAlignment, and DepthAlignmentID are the 3D equivalents of UnitPoint and Alignment. EdgeInsets3D and Edge3D add front/back to the familiar 4-edge model. GeometryReader3D / GeometryProxy3D provide 3D size and coordinate access inside a volume, analogous to GeometryReader in 2D. PhysicalMetric and PhysicalMetricsConverter translate SwiftUI points to physical meters — essential for placing content at real-world distances. ViewDimensions3D and SpatialContainer are 3D layout helpers.

            The view modifiers visualEffect3D(_:), transform3DEffect(_:), rotation3DEffect(_:axis:anchor:), perspectiveRotationEffect(...), scaleEffect(x:y:z:anchor:), frame(depth:alignment:), frame(minDepth:idealDepth:maxDepth:alignment:), offset(z:), and padding3D(_:) all operate in 3D space. LayoutRotationUnaryLayout is an internal layout type for rotated containers. None of these APIs are available on macOS 26 — they require visionOS and a volumetric or immersive context.
            """,
            signatures: [
                "GeometryReader3D { proxy in … }",
                "GeometryProxy3D",
                "UnitPoint3D(x:y:z:)",
                "Alignment3D(horizontal:vertical:depth:)",
                "DepthAlignment, DepthAlignmentID",
                "EdgeInsets3D(top:leading:bottom:trailing:front:back:)",
                "Edge3D",
                "PhysicalMetric(wrappedValue:unit:)",
                "PhysicalMetricsConverter",
                "ViewDimensions3D, GeometryProxyCoordinateSpace3D",
                ".visualEffect3D { content, proxy in … }",
                ".transform3DEffect(AffineTransform3D(…))",
                ".rotation3DEffect(Angle, anchor: UnitPoint3D)",
                ".scaleEffect(x:y:z:anchor:)",
                ".frame(depth:alignment:), .offset(z:), .padding3D(_:)",
                "SpatialContainer, LayoutRotationUnaryLayout"
            ],
            notes: [
                "All 3D geometry types and modifiers require visionOS 1.0+.",
                "PhysicalMetric is a @propertyWrapper — declare @PhysicalMetric(unit: .meters) var size = 0.3.",
                "On macOS use the 2D equivalents: GeometryReader, UnitPoint, Alignment, EdgeInsets."
            ]
        )
    }
}

#Preview {
    VisionOS3DTypesDescribePage()
        .frame(width: 900, height: 700)
}
