import SwiftUI

struct SymbolEffectGalleryPage: View {
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

extension SymbolEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.symbolEffect",
        title: "SymbolEffect",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.symboleffect(_:options:isactive:)",
            "swiftui.images.symboleffect(_:options:value:)",
            "swiftui.images.symboleffectsremoved(_:)",
            "swiftui.images.symboleffecttransition",
            "View/symbolEffect(_:options:isActive:)",
            "View/symbolEffect(_:options:value:)",
            "View/symbolEffectsRemoved(_:)",
            "SymbolEffectTransition"
        ],
        blurb: "Adds an animated symbol effect — pulse, bounce, variableColor, scale, appear, disappear — to SF Symbol images in the view hierarchy. Includes the indefinite and value-triggered overloads, symbolEffectsRemoved(_:), and the SymbolEffectTransition for symbol-aware insertion and removal.",
        signature: "func symbolEffect<T>(_ effect: T, options: SymbolEffectOptions = .default, isActive: Bool = true) -> some View where T : IndefiniteSymbolEffect, T : SymbolEffect",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/images/symboleffect(_:options:isactive:).md",
        page: { AnyView(SymbolEffectGalleryPage()) }
    )
}

#Preview {
    SymbolEffectGalleryPage()
        .frame(width: 900, height: 700)
}
