import SwiftUI

struct ShaderGalleryPage: View {
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

extension ShaderGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.shader",
        title: "Shader",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: [
            "Shader",
            "ShaderFunction",
            "ShaderLibrary",
            "View/colorEffect(_:isEnabled:)",
            "View/distortionEffect(_:maxSampleOffset:isEnabled:)",
            "View/layerEffect(_:maxSampleOffset:isEnabled:)"
        ],
        blurb: "References a Metal shader function with bound uniforms — paired with the colorEffect, distortionEffect, and layerEffect modifiers, plus the ShaderFunction and ShaderLibrary lookup types.",
        signature: "struct Shader",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/shader.md",
        page: { AnyView(ShaderGalleryPage()) }
    )
}

#Preview {
    ShaderGalleryPage()
        .frame(width: 900, height: 700)
}
