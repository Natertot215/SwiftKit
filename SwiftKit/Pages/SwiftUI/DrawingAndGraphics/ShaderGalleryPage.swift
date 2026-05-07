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
            // MARK: Reference — no live demo (shaders require a Metal .metal source)

            ReferenceTile(
                name: "Shader",
                signature: "struct Shader",
                note: "References a Metal shader function with bound argument values. Construct via `ShaderLibrary.default.<functionName>(<arguments>...)` — function discovery is dynamic on `ShaderLibrary` so call sites read like ordinary method calls.",
                badge: "macOS 14+"
            )

            ReferenceTile(
                name: "ShaderFunction",
                signature: "struct ShaderFunction",
                note: "An identifier-plus-library reference to a single Metal function. Returned by `ShaderLibrary.default[dynamicMember:]`; combined with arguments to produce a `Shader`."
            )

            ReferenceTile(
                name: "ShaderLibrary",
                signature: "struct ShaderLibrary  ·  static var `default`  ·  static func bundle(_:)",
                note: "Lookup table for compiled Metal libraries. `.default` reads the main bundle; `.bundle(_:)` targets an external bundle (frameworks, plug-ins)."
            )

            ReferenceTile(
                name: "View.colorEffect(_:isEnabled:)",
                signature: "func colorEffect(_ shader: Shader, isEnabled: Bool = true) -> some View",
                note: "Applies a per-pixel color filter implemented in Metal. The shader function receives a sampled color and returns a transformed color — common for tinting, posterizing, threshold effects."
            )

            ReferenceTile(
                name: "View.distortionEffect(_:maxSampleOffset:isEnabled:)",
                signature: "func distortionEffect(_ shader: Shader, maxSampleOffset: CGSize, isEnabled: Bool = true) -> some View",
                note: "Displaces sampled pixels — warps, wave effects, lens distortions. `maxSampleOffset` lets the renderer pre-allocate enough sampled area to cover the worst-case displacement."
            )

            ReferenceTile(
                name: "View.layerEffect(_:maxSampleOffset:isEnabled:)",
                signature: "func layerEffect(_ shader: Shader, maxSampleOffset: CGSize, isEnabled: Bool = true) -> some View",
                note: "Renders the view into an offscreen layer and runs a fragment shader over the result. Suitable for composite effects that need access to the full rendered output."
            )

            ReferenceTile(
                name: "Authoring pattern",
                signature: "let shader = ShaderLibrary.default.myFilter(.color(.red))",
                note: "Arguments to the dynamic-member call become bound shader uniforms in the order declared. Pass `.float(_:)`, `.color(_:)`, `.image(_:)`, `.boundingRect`, etc. to bind the shader's expected input."
            )

            ReferenceTile(
                name: "Why no live demo?",
                signature: "// shaders require a .metal source compiled into the bundle",
                note: "SwiftKit ships no Metal source files. The reference tiles document the surface; consult Apple's Shader documentation for runnable examples."
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
