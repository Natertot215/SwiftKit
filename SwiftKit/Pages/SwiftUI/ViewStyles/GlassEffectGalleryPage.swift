import SwiftUI

struct GlassEffectGalleryPage: View {
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

extension GlassEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewStyles.liquidGlass",
        title: "Liquid Glass",
        folder: "View styles",
        framework: .swiftUI,
        absorbedSymbols: [
            "Applying Liquid Glass to custom views",
            "AutomaticGlassBackgroundEffect",
            "DefaultGlassEffectShape",
            "FeatheredGlassBackgroundEffect",
            "Glass",
            "Glass/interactive(_:)",
            "GlassBackgroundDisplayMode",
            "GlassBackgroundEffect",
            "GlassBackgroundEffectConfiguration",
            "GlassEffectContainer",
            "GlassEffectTransition",
            "Landmarks: Building an app with Liquid Glass",
            "PlateGlassBackgroundEffect",
            "View/glassBackgroundEffect(displayMode:)",
            "View/glassBackgroundEffect(in:displayMode:)",
            "View/glassEffect(_:in:)",
            "swiftui.view-styles.applying-liquid-glass-to-custom-views",
            "swiftui.view-styles.landmarks-building-an-app-with-liquid-glass"
        ],
        blurb: "SwiftUI's Liquid Glass material system on macOS 26 — apply the surface with glassEffect / glassBackgroundEffect, group and morph shapes inside GlassEffectContainer, and animate adoption with GlassEffectTransition. Includes the Glass material type and the built-in GlassBackgroundEffect conformers (Automatic, Feathered, PlateGlass).",
        signature: "Glass · glassEffect · GlassEffectContainer · GlassEffectTransition · glassBackgroundEffect",
        availability: "macOS 26.0+",
        docPath: "Documentation/SwiftUI/view-styles/glasseffect(_:in:).md",
        page: { AnyView(GlassEffectGalleryPage()) }
    )
}

#Preview {
    GlassEffectGalleryPage()
        .frame(width: 900, height: 700)
}
