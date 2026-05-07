import SwiftUI

struct HoverEffectGalleryPage: View {
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

extension HoverEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.hoverEffect",
        title: "HoverEffect",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "HoverEffect",
            "View/hoverEffect(_:)",
            "View/hoverEffect(_:isEnabled:)",
            "View/hoverEffect(_:in:isEnabled:)",
            "View/hoverEffect(in:isEnabled:body:)",
            "View/hoverEffectDisabled(_:)",
            "View/defaultHoverEffect(_:)",
            "HoverEffectPhaseOverride",
            "OrnamentHoverContentEffect",
            "OrnamentHoverEffect",
            "CustomHoverEffect",
            "ContentHoverEffect",
            "HoverEffectGroup",
            "View/hoverEffectGroup()",
            "View/hoverEffectGroup(_:)",
            "View/hoverEffectGroup(id:in:behavior:)",
            "GroupHoverEffect",
            "HoverEffectContent",
            "EmptyHoverEffectContent"
        ],
        blurb: "Visual effects applied while the pointer hovers over a view. Built-in effects (.automatic, .highlight, .lift) plus the CustomHoverEffect protocol and the HoverEffectGroup family for coordinated, multi-view hover behavior.",
        signature: "struct HoverEffect",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/input-events/hovereffect.md",
        page: { AnyView(HoverEffectGalleryPage()) }
    )
}

#Preview {
    HoverEffectGalleryPage()
        .frame(width: 900, height: 700)
}
