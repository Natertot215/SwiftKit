import SwiftUI

// SwiftUI `ColorRenderingMode` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/colorrenderingmode.md
// macOS 10.15+. Working color spaces for color-compositing operations.

struct ColorRenderingModeDescribePage: View {
    var body: some View {
        DescribePage(
            title: "ColorRenderingMode",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/colorrenderingmode.md",
            availability: "macOS 10.15+",
            blurb: """
            Three-case enum describing the working color space SwiftUI uses while \
            compositing inside a drawingGroup. The choice affects how out-of-gamut, \
            HDR, or extended-range color values are preserved through the offscreen \
            render.

            \u{2022} .nonLinear (default) \u{2014} sRGB-style gamma-encoded compositing. \
            Cheap, the right choice for ordinary UI.

            \u{2022} .linear \u{2014} compositing in linear-light. Useful when blending \
            mathematically (gradients, light models) but values are clamped to the \
            sRGB range.

            \u{2022} .extendedLinear \u{2014} linear-light, with values allowed to exceed \
            the sRGB gamut. Required to round-trip wide-gamut or HDR color values \
            through the offscreen render without clipping.

            ColorRenderingMode is the colorMode parameter of \
            View/drawingGroup(opaque:colorMode:). It has no effect outside a \
            drawingGroup.
            """,
            signatures: [
                "view.drawingGroup(opaque: false, colorMode: .nonLinear)",
                "view.drawingGroup(colorMode: .linear)",
                "view.drawingGroup(colorMode: .extendedLinear) // wide-gamut / HDR"
            ],
            notes: [
                "Default is .nonLinear \u{2014} sRGB gamma-encoded compositing.",
                ".linear composites in linear-light but clamps to sRGB.",
                ".extendedLinear allows values outside sRGB \u{2014} required for HDR / Display P3.",
                "Hashable / Sendable enum \u{2014} cheap to thread through state.",
                "Only consumed by drawingGroup; no effect on regular SwiftUI rendering."
            ]
        )
    }
}

#Preview {
    ColorRenderingModeDescribePage()
        .frame(width: 900, height: 700)
}
