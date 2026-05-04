import SwiftUI
import MapKit

// SwiftUI MapKit modifiers reference page.
// Covers: mapStyle, mapScope, mapControls, mapControlVisibility,
//         mapCameraKeyframeAnimator, onMapCameraChange,
//         mapItemDetailPopover, mapItemDetailSheet
// Source: Documentation/SwiftUI/technology-specific-views/

struct MapKitPage: View {
    @State private var position: MapCameraPosition = .automatic
    @Namespace private var mapScope

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("MapKit SwiftUI Modifiers")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("mapStyle, mapScope, mapControls, camera animation, and map item sheets.")
                .font(.callout).foregroundStyle(.secondary)
            Text("MapKit macOS 14.0+ (most), mapItemDetailSheet macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Map with mapStyle + mapScope + mapControls") {
            Map(position: $position, scope: mapScope)
                .mapStyle(.standard(elevation: .realistic))
                .mapControls {
                    MapCompass(scope: mapScope)
                    MapScaleView(scope: mapScope)
                    MapZoomStepper(scope: mapScope)
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            APICallout(
                ".mapStyle(.standard(elevation: .realistic))\n.mapScope(ns)\n.mapControls { MapCompass(…) … }"
            )
            Text("mapScope ties Map controls (MapCompass, MapScaleView, MapZoomStepper, MapPitchSlider, MapUserLocationButton) to a specific Map instance.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "MapStyle variants") {
                snippet("""
                .mapStyle(.standard)                          // road map
                .mapStyle(.standard(elevation: .flat))        // flat 2D roads
                .mapStyle(.standard(elevation: .realistic))   // 3D terrain
                .mapStyle(.standard(emphasis: .muted))        // muted labels
                .mapStyle(.imagery)                           // satellite
                .mapStyle(.imagery(elevation: .realistic))    // satellite 3D
                .mapStyle(.hybrid)                            // satellite + roads
                .mapStyle(.hybrid(elevation: .realistic))     // hybrid 3D
                """)
            }

            Block(title: "mapControlVisibility(_:)") {
                snippet("""
                Map(…)
                    .mapControlVisibility(.hidden)    // hide all controls
                    .mapControlVisibility(.visible)   // show all controls
                    .mapControlVisibility(.automatic) // system default
                """)
            }

            Block(title: "onMapCameraChange(frequency:_:)") {
                snippet("""
                Map(position: $position)
                    .onMapCameraChange(frequency: .continuous) { context in
                        // context.camera — MKMapCamera
                        // context.region — MKCoordinateRegion
                        // context.rect   — MKMapRect
                        updateAnnotations(for: context.region)
                    }
                // frequency: .continuous — fires every frame
                // frequency: .onEnd      — fires when camera motion stops
                """)
                Text("Use .onEnd frequency for expensive updates (network fetches); use .continuous for real-time overlays.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "mapCameraKeyframeAnimator(trigger:keyframes:)") {
                snippet("""
                Map(position: $position)
                    .mapCameraKeyframeAnimator(trigger: startTour) {
                        KeyframeTrack(\\.centerCoordinate) {
                            LinearKeyframe(paris,     duration: 2.0)
                            LinearKeyframe(berlin,    duration: 2.0)
                            LinearKeyframe(amsterdam, duration: 2.0)
                        }
                        KeyframeTrack(\\.distance) {
                            LinearKeyframe(500_000, duration: 1.0)
                            LinearKeyframe(200_000, duration: 3.0)
                        }
                    }
                // Animates the map camera through a keyframe sequence.
                """)
                Text("mapCameraKeyframeAnimator is macOS 18+ / iOS 17+. Trigger the animation by toggling any Equatable value.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "mapItemDetailSheet + mapItemDetailPopover") {
                snippet("""
                // Sheet (iOS-style, macOS 15+):
                Map(…)
                    .mapItemDetailSheet(item: $selectedItem, displaysMap: true)

                // or with isPresented binding:
                .mapItemDetailSheet(isPresented: $showDetail,
                                    item: mapItem, displaysMap: false)

                // Popover (macOS 15+):
                .mapItemDetailPopover(item: $selectedItem,
                                       displaysMap: true,
                                       attachmentAnchor: .rect(.bounds))

                .mapItemDetailPopover(isPresented: $showPopover,
                                       item: mapItem,
                                       attachmentAnchor: .point(.center),
                                       arrowEdge: .bottom)
                """)
                Text("mapItemDetailSheet presents a system MKMapItem detail sheet. mapItemDetailPopover shows it as an attached popover — both are macOS 15+.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "mapScope — wiring controls to a Map") {
                snippet("""
                @Namespace private var mapNS

                ZStack(alignment: .topTrailing) {
                    Map(position: $pos, scope: mapNS)
                    VStack {
                        MapCompass(scope: mapNS)
                        MapScaleView(scope: mapNS)
                        MapZoomStepper(scope: mapNS)
                        MapUserLocationButton(scope: mapNS)
                    }
                    .padding()
                }
                .mapScope(mapNS)
                """)
                Text("mapScope(_:) on the Map container + matching scope: on each control ties them together when multiple Maps are on screen.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("map", "MapKit SwiftUI is macOS 14.0+. Earlier macOS versions need MKMapView via NSViewRepresentable.")
            noteRow("camera.fill", "onMapCameraChange(frequency: .continuous) fires at 60+ fps — avoid heavy work. Gate network calls behind .onEnd or a debounce.")
            noteRow("pin.fill", "mapItemDetailSheet and mapItemDetailPopover require a non-nil MKMapItem — guard against nil before setting the binding.")
            noteRow("scope", "mapScope is required when you place Map controls outside the Map view itself (e.g. in a ZStack overlay). Without it, controls have no associated map.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
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
    MapKitPage().frame(width: 1100, height: 900)
}
