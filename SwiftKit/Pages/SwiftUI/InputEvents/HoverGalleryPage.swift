import SwiftUI

struct HoverGalleryPage: View {
    @State private var hovered: Bool = false
    @State private var continuousPhase: HoverPhase = .ended
    @State private var lastLocation: CGPoint = .zero

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(
                name: ".onHover",
                api: ".onHover { inside in hovered = inside }"
            ) {
                VStack(spacing: 8) {
                    Circle()
                        .fill(hovered ? Color.accentColor.opacity(0.6) : Color.accentColor.opacity(0.2))
                        .frame(width: 64, height: 64)
                        .scaleEffect(hovered ? 1.08 : 1.0)
                        .animation(.easeOut(duration: 0.15), value: hovered)
                        .onHover { hovered = $0 }
                    Text(hovered ? "inside" : "outside")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            VariantTile(
                name: ".onContinuousHover",
                api: ".onContinuousHover { phase in … }"
            ) {
                VStack(spacing: 8) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(Color.accentColor.opacity(0.15))
                            .frame(width: 160, height: 80)
                        if case .active(let loc) = continuousPhase {
                            Circle()
                                .fill(Color.accentColor)
                                .frame(width: 8, height: 8)
                                .position(x: loc.x, y: loc.y)
                        }
                    }
                    .frame(width: 160, height: 80)
                    .onContinuousHover { phase in
                        continuousPhase = phase
                        if case .active(let loc) = phase {
                            lastLocation = loc
                        }
                    }
                    Text(String(format: "(%.0f, %.0f)", lastLocation.x, lastLocation.y))
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
            }

            ReferenceTile(
                name: "View.onHover(perform:)",
                signature: "func onHover(perform action: @escaping (Bool) -> Void) -> some View",
                note: "Reports a Bool that flips true when the pointer enters the view's frame and false when it leaves. macOS 10.15+. The simplest hover hook."
            )

            ReferenceTile(
                name: "View.onContinuousHover(coordinateSpace:perform:)",
                signature: "func onContinuousHover(coordinateSpace: CoordinateSpaceProtocol = .local, perform: @escaping (HoverPhase) -> Void) -> some View",
                note: "Reports HoverPhase events while the pointer is over the view, with location. The default coordinateSpace is .local; pass .named(\"…\") or .global to convert.",
                badge: "macOS 14.0+"
            )

            ReferenceTile(
                name: "HoverPhase",
                signature: "enum HoverPhase  ·  .active(CGPoint)  ·  .ended",
                note: ".active carries the pointer's current location while it remains over the view; .ended fires once when the pointer leaves."
            )
        }
    }
}

extension HoverGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.hover",
        title: "Hover",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/onHover(perform:)",
            "View/onContinuousHover(coordinateSpace:perform:)",
            "HoverPhase"
        ],
        blurb: "Detects pointer enter/exit on a view's frame. onHover reports a Bool, onContinuousHover reports a HoverPhase with the pointer location while the pointer remains over the view.",
        signature: "func onHover(perform action: @escaping (Bool) -> Void) -> some View",
        availability: "macOS 10.15+ (onContinuousHover: macOS 14.0+)",
        docPath: "Documentation/SwiftUI/input-events/onhover(perform:).md",
        page: { AnyView(HoverGalleryPage()) }
    )
}

#Preview {
    HoverGalleryPage()
        .frame(width: 900, height: 700)
}
