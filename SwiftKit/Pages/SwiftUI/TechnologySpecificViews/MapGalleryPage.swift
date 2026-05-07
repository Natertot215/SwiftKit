import SwiftUI

struct MapGalleryPage: View {
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

extension MapGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.technologySpecificViews.map",
        title: "Map",
        folder: "Technology-specific views",
        framework: .swiftUI,
        absorbedSymbols: [
            "Map",
            "View/mapStyle(_:)",
            "View/mapScope(_:)",
            "View/mapFeatureSelectionDisabled(_:)",
            "View/mapFeatureSelectionAccessory(_:)",
            "View/mapFeatureSelectionContent(content:)",
            "View/mapControls(_:)",
            "View/mapControlVisibility(_:)",
            "View/mapCameraKeyframeAnimator(trigger:keyframes:)",
            "View/onMapCameraChange(frequency:_:)",
            "View/mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:)",
            "View/mapItemDetailPopover(isPresented:item:displaysMap:attachmentAnchor:arrowEdge:)",
            "View/mapItemDetailPopover(item:displaysMap:attachmentAnchor:)",
            "View/mapItemDetailPopover(item:displaysMap:attachmentAnchor:arrowEdge:)",
            "View/mapItemDetailSheet(isPresented:item:displaysMap:)",
            "View/mapItemDetailSheet(item:displaysMap:)",
            "View/lookAroundViewer(isPresented:scene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)",
            "View/lookAroundViewer(isPresented:initialScene:allowsNavigation:showsRoadLabels:pointsOfInterest:onDismiss:)"
        ],
        blurb: "MapKit's SwiftUI Map view family. Companion modifiers configure map style, scope, feature selection, controls, camera animation, item detail popovers and sheets, and the LookAround viewer.",
        signature: "struct Map<MapContentScope, Content> : View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/technology-specific-views/mapstyle(_:).md",
        page: { AnyView(MapGalleryPage()) }
    )
}

#Preview {
    MapGalleryPage()
        .frame(width: 900, height: 700)
}
