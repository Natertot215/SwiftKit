import SwiftUI

// GeometryEffect — animatable transform via a ProjectionTransform.
// Demonstrates a tiny "shake" effect (canonical Apple sample) and a skew effect.

struct GeometryEffectGalleryPage: View {
    @State private var attempts: CGFloat = 0
    @State private var skew: CGFloat = 0

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Live demos

            VariantTile(
                name: "Shake (animatable horizontal jitter)",
                api: ".modifier(Shake(animatableData: attempts))"
            ) {
                VStack(spacing: 8) {
                    Capsule()
                        .fill(.tint)
                        .frame(width: 88, height: 28)
                        .modifier(Shake(animatableData: attempts))
                    Button("Trigger shake") {
                        withAnimation(.linear(duration: 0.5)) {
                            attempts += 1
                        }
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.small)
                }
            }

            VariantTile(
                name: "Skew (animatable horizontal shear)",
                api: ".modifier(Skew(amount: skew))"
            ) {
                VStack(spacing: 8) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.tint)
                        .frame(width: 88, height: 56)
                        .modifier(Skew(amount: skew))
                    Button(skew == 0 ? "Skew" : "Reset") {
                        withAnimation(.spring) {
                            skew = skew == 0 ? 0.4 : 0
                        }
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.small)
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "GeometryEffect",
                signature: "protocol GeometryEffect : Animatable, ViewModifier",
                note: "A ViewModifier that contributes a ProjectionTransform without affecting layout. Implement effectValue(size:) returning a ProjectionTransform; expose animatableData so SwiftUI can interpolate it."
            )

            ReferenceTile(
                name: "ProjectionTransform",
                signature: "struct ProjectionTransform",
                note: "A 3x3 transformation matrix that supports affine + perspective transforms. Initialize from CGAffineTransform or build directly. The return type of GeometryEffect.effectValue(size:)."
            )

            ReferenceTile(
                name: "transformEffect(_:)",
                signature: "func transformEffect(_ transform: CGAffineTransform) -> some View",
                note: "Stock GeometryEffect-shaped helper. Applies a CGAffineTransform; not animatable on its own — wrap it in a custom GeometryEffect when you need interpolated motion."
            )
        }
    }
}

// MARK: - Shake

/// Apple's canonical GeometryEffect sample: a horizontal jitter whose amplitude
/// is driven by an animatable scalar. As `animatableData` interpolates from
/// N to N+1 over a duration, the modifier computes a sine-wave offset.
private struct Shake: GeometryEffect {
    var amount: CGFloat = 8
    var shakesPerUnit: CGFloat = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let dx = amount * sin(animatableData * .pi * shakesPerUnit)
        return ProjectionTransform(CGAffineTransform(translationX: dx, y: 0))
    }
}

// MARK: - Skew

/// Horizontal shear (CGAffineTransform with a non-zero `c` term) wrapped in
/// a GeometryEffect so it's animatable.
private struct Skew: GeometryEffect {
    var amount: CGFloat
    var animatableData: CGFloat {
        get { amount }
        set { amount = newValue }
    }

    func effectValue(size _: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: amount, d: 1, tx: 0, ty: 0))
    }
}

extension GeometryEffectGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.geometryEffect",
        title: "GeometryEffect",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["GeometryEffect"],
        blurb: "An effect that changes the visual appearance of a view, largely without changing its ancestors or descendants. Conform to GeometryEffect to drive animatable transforms via a ProjectionTransform.",
        signature: "protocol GeometryEffect : Animatable, ViewModifier",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/geometryeffect.md",
        page: { AnyView(GeometryEffectGalleryPage()) }
    )
}

#Preview {
    GeometryEffectGalleryPage()
        .frame(width: 900, height: 700)
}
