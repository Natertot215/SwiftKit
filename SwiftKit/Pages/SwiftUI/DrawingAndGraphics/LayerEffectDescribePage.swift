import SwiftUI

// SwiftUI `View/layerEffect(_:maxSampleOffset:isEnabled:)` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/layereffect(_:maxsampleoffset:isenabled:).md
// macOS 14.0+. Demoted to Describe — requires a Metal .metal file in the bundle to render anything meaningful.

struct LayerEffectDescribePage: View {
    var body: some View {
        DescribePage(
            title: "View/layerEffect(_:maxSampleOffset:isEnabled:)",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/layereffect(_:maxsampleoffset:isenabled:).md",
            availability: "macOS 14.0+",
            blurb: """
            Rasterizes this view into a layer first, then applies a Metal Shader \
            that can sample the rasterized contents at any nearby position. The \
            most powerful of the three shader modifiers — colorEffect filters \
            colors, distortionEffect remaps positions, layerEffect lets the \
            shader actually read the surrounding pixels.

            For a function to act as a layer effect the MSL signature must be:

                [[ stitchable ]] half4 name(float2 position,
                                            SwiftUI::Layer layer,
                                            args...)

            The SwiftUI::Layer type (declared in <SwiftUI/SwiftUI.h>) exposes a \
            single sample(float2 position) method returning a linearly-filtered \
            premultiplied RGBA pixel. Multi-tap or convolution-style effects \
            (blur, edge-detect, displacement glow) are written by combining \
            multiple sample() calls and returning the final color.

            maxSampleOffset bounds the maximum distance any sample() call may \
            stray from its destination position. Use it accurately — \
            overestimating wastes memory, underestimating clips.

            SwiftKit cannot render a live demo without a bundled .metal file \
            containing a stitchable layer function. See the Shader / ShaderFunction / \
            ShaderLibrary describe pages for the surrounding API.

            > Important: Views backed by AppKit or UIKit may NOT render into the \
            filtered layer — they log a warning and display a placeholder.
            """,
            signatures: [
                "func layerEffect(_ shader: Shader,",
                "                 maxSampleOffset: CGSize,",
                "                 isEnabled: Bool = true) -> some View",
                "// MSL signature",
                "[[ stitchable ]] half4 name(float2 position, SwiftUI::Layer layer, args...)",
                "// Sampling within the shader",
                "half4 c = layer.sample(position + offset);"
            ],
            notes: [
                "Most powerful shader modifier \u{2014} the shader can READ the rasterized layer.",
                "Rasterization cost is added before shader runs \u{2014} heavier than color/distortion.",
                "SwiftUI::Layer.sample(float2) returns a premultiplied RGBA half4.",
                "Pair with multiple sample() calls for blur/convolution/glow effects.",
                "AppKit/UIKit-backed views render a placeholder, NOT the shader.",
                "Requires a .metal file in the bundle \u{2014} not provided in SwiftKit's bundle."
            ]
        )
    }
}

#Preview {
    LayerEffectDescribePage().frame(width: 900, height: 700)
}
