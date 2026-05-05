import SwiftUI

// SwiftUI `Shader` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/shader.md
// macOS 14.0+. Value type referencing a Metal shader function with bound uniforms.

struct ShaderDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Shader",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/shader.md",
            availability: "macOS 14.0+",
            blurb: """
            A reference to a function in a Metal shader library together with its \
            bound uniform argument values. Shader is a value type that combines:

            \u{2022} a ShaderFunction (which library + function name to call), and
            \u{2022} a sequence of Shader.Argument values bound to that function's parameters.

            Once constructed, a Shader can be passed into View/colorEffect, \
            View/distortionEffect, View/layerEffect, or used directly as a \
            ShapeStyle (Shader conforms to ShapeStyle, so any shape's fill or \
            text foregroundStyle can be a shader).

            When used as a ShapeStyle the MSL signature is:

                [[ stitchable ]] half4 name(float2 position, args...)

            returning a premultiplied color in the destination color space.

            Idiomatic call site:

                let shader = ShaderLibrary.default.gradientFill(
                    .color(.red),
                    .color(.blue),
                    .float(angle)
                )
                Rectangle().fill(shader)
            """,
            signatures: [
                "struct Shader: ShapeStyle, Equatable, Sendable",
                "init(function: ShaderFunction, arguments: [Shader.Argument])",
                "var function: ShaderFunction",
                "var arguments: [Shader.Argument]",
                "var dithersColor: Bool",
                "func compile(as: Shader.UsageType)"
            ],
            notes: [
                "Equatable / Sendable value type \u{2014} cheap to construct, safe across actors.",
                "Conforms to ShapeStyle \u{2014} fill any shape with a shader directly.",
                "Used by colorEffect, distortionEffect, layerEffect modifiers.",
                "Pair with ShaderLibrary's @dynamicMemberLookup for ergonomic construction.",
                "compile(as:) prewarms the shader for a specific UsageType (color filter, distortion, etc).",
                "dithersColor controls whether SwiftUI dithers the shader output to mask banding."
            ]
        )
    }
}

#Preview {
    ShaderDescribePage().frame(width: 900, height: 700)
}
