import SwiftUI

struct SpatialTapGestureGalleryPage: View {
    @State private var lastLocation: CGPoint = .zero
    @State private var doubleTapLocation: CGPoint = .zero

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "SpatialTapGesture — single tap",
                api: "SpatialTapGesture().onEnded { lastLocation = $0.location }"
            ) {
                VStack(spacing: 8) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.accentColor.opacity(0.2))
                        .frame(width: 140, height: 80)
                        .gesture(
                            SpatialTapGesture()
                                .onEnded { value in
                                    lastLocation = value.location
                                }
                        )
                    Text(String(format: "(%.0f, %.0f)", lastLocation.x, lastLocation.y))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: "SpatialTapGesture(count: 2)",
                api: "SpatialTapGesture(count: 2).onEnded { … }"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(Color.accentColor.opacity(0.2))
                        .frame(width: 120, height: 50)
                        .gesture(
                            SpatialTapGesture(count: 2)
                                .onEnded { value in
                                    doubleTapLocation = value.location
                                }
                        )
                    Text(String(format: "double @ (%.0f, %.0f)", doubleTapLocation.x, doubleTapLocation.y))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "SpatialTapGesture",
                signature: "struct SpatialTapGesture : Gesture  // init(count: Int = 1, coordinateSpace: CoordinateSpaceProtocol = .local)",
                note: "Recognizes one or more taps and reports each tap's location. Distinguishes from TapGesture by exposing the location — useful when the action needs to know where in the view the tap landed."
            )

            ReferenceTile(
                name: "SpatialTapGesture.Value",
                signature: "location: CGPoint  ·  // location of the tap in the gesture's coordinate space",
                note: "The Value carries only the tap location. The coordinate space defaults to .local; pass an explicit space to convert to a parent or named space at recognition time."
            )

            ReferenceTile(
                name: "vs TapGesture",
                signature: "Use TapGesture for plain tap counting; use SpatialTapGesture when you need .location.",
                note: "Both share the count parameter and the same recognition logic. SpatialTapGesture is the strict superset — TapGesture exists for parity with iOS-era code that doesn't need location."
            )
        }
    }
}

extension SpatialTapGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.spatialTapGesture",
        title: "SpatialTapGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "SpatialTapGesture"
        ],
        blurb: "A gesture that recognizes one or more taps and reports their location, so you can react to where on the view the tap occurred.",
        signature: "struct SpatialTapGesture",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/gestures/spatialtapgesture.md",
        page: { AnyView(SpatialTapGestureGalleryPage()) }
    )
}

#Preview {
    SpatialTapGestureGalleryPage()
        .frame(width: 900, height: 700)
}
