import SwiftUI

struct WindowDragGestureGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: "WindowDragGesture",
                api: ".gesture(WindowDragGesture())"
            ) {
                VStack(spacing: 8) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.background.secondary)
                        .frame(width: 180, height: 64)
                        .overlay(
                            HStack(spacing: 6) {
                                Image(systemName: "rectangle.3.offgrid")
                                    .foregroundStyle(.secondary)
                                Text("Drag here to move window")
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 0.5)
                        )
                        .gesture(WindowDragGesture())
                    Text("Drag this strip to move the host window.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
            }

            VariantTile(
                name: "+ allowsWindowActivationEvents(false)",
                api: ".allowsWindowActivationEvents(false)"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(.background.secondary)
                        .frame(width: 160, height: 36)
                        .overlay(
                            Text("Drag without activating")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        )
                        .overlay(
                            Capsule().strokeBorder(.separator, lineWidth: 0.5)
                        )
                        .allowsWindowActivationEvents(false)
                        .gesture(WindowDragGesture())
                    Text("Background window stays inactive while dragging.")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
            }

            ReferenceTile(
                name: "WindowDragGesture",
                signature: "struct WindowDragGesture : Gesture",
                note: "A gesture whose recognition moves the containing window. Apply to a custom title bar surface or any view that should be a draggable handle for its window."
            )

            ReferenceTile(
                name: "View.allowsWindowActivationEvents(_:)",
                signature: "func allowsWindowActivationEvents(_ value: Bool? = nil) -> some View",
                note: "Controls whether interaction with the view delivers a window-activation event. Setting false lets users drag a background window via WindowDragGesture without bringing it forward."
            )

            ReferenceTile(
                name: "Companion to .windowStyle(.hiddenTitleBar)",
                signature: "Apply to a custom-title-bar surface paired with .windowStyle(.hiddenTitleBar)",
                note: "Common pairing: hide the system title bar and replace it with a SwiftUI surface that uses WindowDragGesture so users can still reposition the window."
            )
        }
    }
}

extension WindowDragGestureGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gestures.windowDragGesture",
        title: "WindowDragGesture",
        folder: "Gestures",
        framework: .swiftUI,
        absorbedSymbols: [
            "WindowDragGesture",
            "View/allowsWindowActivationEvents(_:)"
        ],
        blurb: "A gesture that recognizes the motion of and handles dragging the containing window. Pair with allowsWindowActivationEvents(_:) so dragging works even while the window is inactive.",
        signature: "struct WindowDragGesture",
        availability: "macOS 15.0+",
        docPath: "Documentation/SwiftUI/gestures/windowdraggesture.md",
        page: { AnyView(WindowDragGestureGalleryPage()) }
    )
}

#Preview {
    WindowDragGestureGalleryPage()
        .frame(width: 900, height: 700)
}
