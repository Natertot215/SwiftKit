import SwiftUI

// SwiftUI `View/colorEffect(_:isEnabled:)` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/coloreffect(_:isenabled:).md
// macOS 14.0+. Demoted to Describe — requires a Metal .metal file in the bundle to render anything meaningful.

struct ColorEffectDescribePage: View {
    var body: some View {
        DescribePage(
            title: "View/colorEffect(_:isEnabled:)",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/coloreffect(_:isenabled:).md",
            availability: "macOS 14.0+",
            blurb: """
            Applies a Metal Shader as a per-pixel color filter on this view. The \
            shader runs once per output pixel and returns a modified color in the \
            destination color space. Lightweight — does not change geometry, only \
            color.

            For a function to act as a color filter the MSL signature must be:

                [[ stitchable ]] half4 name(float2 position, half4 color, args...)

            where `position` is the pixel's user-space coordinate, `color` is the \
            source pre-multiplied color, and `args...` matches whatever uniforms \
            you bind via Shader.init(function:arguments:). Look up the function \
            via ShaderLibrary.default.<name>(...) and pass the resulting Shader \
            into colorEffect.

            SwiftKit can't render a live demo here without a project-bundled \
            .metal file containing a stitchable color function. The signatures \
            and notes below capture the API surface; pair this page with the \
            Shader / ShaderFunction / ShaderLibrary describe pages for the full \
            picture.

            > Important: Views backed by AppKit or UIKit (NSViewRepresentable, \
            UIViewRepresentable) may NOT render into the filtered layer — they \
            log a warning and display a placeholder.
            """,
            signatures: [
                "func colorEffect(_ shader: Shader, isEnabled: Bool = true) -> some View",
                "// MSL signature",
                "[[ stitchable ]] half4 name(float2 position, half4 color, args...)",
                "// Swift-side construction",
                "let shader = ShaderLibrary.default.myColorFunc(.float(0.5))",
                "view.colorEffect(shader)"
            ],
            notes: [
                "Shader runs per-pixel \u{2014} cheap relative to layerEffect, no neighborhood sampling.",
                "Uniforms are passed via Shader.Argument values: .float, .floatArray, .color, .image, etc.",
                "AppKit/UIKit-backed views (NSViewRepresentable) render a placeholder, NOT the shader.",
                "isEnabled: Bool gates the effect at the call site \u{2014} useful for animated toggles.",
                "Pair with Shader, ShaderFunction, ShaderLibrary describe pages.",
                "Requires a .metal file in the bundle with the stitchable function \u{2014} not provided in SwiftKit."
            ]
        )
    }
}

#Preview {
    ColorEffectDescribePage().frame(width: 900, height: 700)
}
