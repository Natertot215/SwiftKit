import SwiftUI

// SwiftUI `View/distortionEffect(_:maxSampleOffset:isEnabled:)` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/distortioneffect(_:maxsampleoffset:isenabled:).md
// macOS 14.0+. Demoted to Describe — requires a Metal .metal file in the bundle to render anything meaningful.

struct DistortionEffectDescribePage: View {
    var body: some View {
        DescribePage(
            title: "View/distortionEffect(_:maxSampleOffset:isEnabled:)",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/distortioneffect(_:maxsampleoffset:isenabled:).md",
            availability: "macOS 14.0+",
            blurb: """
            Applies a Metal Shader as a geometric distortion effect — the shader \
            maps each destination pixel position to a source pixel position, \
            warping the rendered output without changing its colors.

            For a function to act as a distortion effect the MSL signature must be:

                [[ stitchable ]] float2 name(float2 position, args...)

            where the returned float2 is the source pixel position to sample for \
            this destination pixel. SwiftUI samples and writes that source color \
            unchanged.

            The maxSampleOffset: CGSize parameter is non-optional — it tells \
            SwiftUI the maximum distance, in each axis, between any returned \
            source pixel and its corresponding destination pixel. SwiftUI uses \
            this as a tile/expansion bound; underestimating it produces clipped \
            output.

            SwiftKit cannot render a live demo without a bundled .metal file \
            containing a stitchable distortion function. See the Shader / \
            ShaderFunction / ShaderLibrary describe pages for the surrounding API.

            > Important: Views backed by AppKit or UIKit may NOT render into the \
            filtered layer — they log a warning and display a placeholder.
            """,
            signatures: [
                "func distortionEffect(_ shader: Shader,",
                "                      maxSampleOffset: CGSize,",
                "                      isEnabled: Bool = true) -> some View",
                "// MSL signature",
                "[[ stitchable ]] float2 name(float2 position, args...)",
                "// Swift-side construction",
                "let shader = ShaderLibrary.default.warp(.float(time))",
                "view.distortionEffect(shader, maxSampleOffset: CGSize(width: 20, height: 20))"
            ],
            notes: [
                "Returns a NEW position to sample from \u{2014} colors are unchanged, geometry is distorted.",
                "maxSampleOffset must bound the worst-case distance the shader can map; underestimating clips.",
                "Heavier than colorEffect because SwiftUI must inflate the rasterization bounds.",
                "AppKit/UIKit-backed views (NSViewRepresentable) render a placeholder, NOT the shader.",
                "isEnabled: Bool toggles the effect for animated state.",
                "Requires a .metal file in the bundle \u{2014} not provided in SwiftKit's bundle."
            ]
        )
    }
}

#Preview {
    DistortionEffectDescribePage().frame(width: 900, height: 700)
}
