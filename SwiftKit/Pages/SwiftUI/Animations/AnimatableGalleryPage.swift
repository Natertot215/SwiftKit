import SwiftUI

// Animatable family — protocol surface and supporting value types.
// Animatable itself has no visual identity; demo via a simple custom shape
// that exposes an animatable parameter through animatableData.

struct AnimatableGalleryPage: View {
    @State private var corners: CGFloat = 8

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Live demo — a Shape that animates its parameter via animatableData

            VariantTile(
                name: "Animatable shape (corner radius)",
                api: "var animatableData: CGFloat { get set }"
            ) {
                VStack(spacing: 8) {
                    AnimatableRoundedRect(cornerRadius: corners)
                        .fill(.tint)
                        .frame(width: 88, height: 56)
                    Button(corners > 16 ? "Square it" : "Round it") {
                        withAnimation(.spring(duration: 0.5, bounce: 0.25)) {
                            corners = corners > 16 ? 4 : 24
                        }
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.small)
                }
            }

            VariantTile(
                name: "EmptyAnimatableData (no parameter)",
                api: "typealias AnimatableData = EmptyAnimatableData"
            ) {
                VStack(spacing: 6) {
                    Text("Default conformance")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text("animatableData = ()")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.tertiary)
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "Animatable",
                signature: "protocol Animatable",
                note: "Conform to expose an animatable parameter. Implement the read–write `animatableData` property; SwiftUI interpolates between values during animation."
            )

            ReferenceTile(
                name: "AnimatableData",
                signature: "associatedtype AnimatableData : VectorArithmetic",
                note: "The interpolated type. Common conformers: Double, CGFloat, CGSize, CGPoint, AnimatablePair. Defaults to EmptyAnimatableData when omitted."
            )

            ReferenceTile(
                name: "AnimatablePair<First, Second>",
                signature: "@frozen struct AnimatablePair<First, Second>",
                note: "Pairs two VectorArithmetic values into one. Use to expose multiple animatable parameters from a single type — `AnimatablePair<CGFloat, CGFloat>` for two scalars, nested for more."
            )

            ReferenceTile(
                name: "EmptyAnimatableData",
                signature: "@frozen struct EmptyAnimatableData",
                note: "The zero-information animatable type — used by views that conform to Animatable but have no animatable parameter of their own."
            )

            ReferenceTile(
                name: "VectorArithmetic",
                signature: "protocol VectorArithmetic : AdditiveArithmetic",
                note: "Adds scaling and magnitude to AdditiveArithmetic so SwiftUI can interpolate. Conformed by Double, CGFloat, CGSize, CGPoint, EdgeInsets, and AnimatablePair."
            )

            ReferenceTile(
                name: "AnimatableModifier",
                signature: "protocol AnimatableModifier : Animatable, ViewModifier",
                note: "Deprecated convenience for ViewModifier conformance to Animatable. Compose `Animatable & ViewModifier` directly instead.",
                badge: "Deprecated"
            )

            ReferenceTile(
                name: "AnimatableValues",
                signature: "// AnimatableValues — historical alias",
                note: "Historical SwiftUI internal alias retained in the documentation index. Not part of the public surface today; prefer Animatable + AnimatableData."
            )
        }
    }
}

// MARK: - AnimatableRoundedRect

/// A Shape that exposes its corner radius as `animatableData` so SwiftUI
/// can interpolate it during an `withAnimation` block.
private struct AnimatableRoundedRect: Shape {
    var cornerRadius: CGFloat

    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }

    func path(in rect: CGRect) -> Path {
        Path(roundedRect: rect, cornerRadius: cornerRadius, style: .continuous)
    }
}

extension AnimatableGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.animatable",
        title: "Animatable",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: [
            "AnimatableModifier",
            "AnimatablePair",
            "AnimatableValues",
            "EmptyAnimatableData",
            "swiftui.animations.animatable",
            "swiftui.animations.vectorarithmetic"
        ],
        blurb: "A type that describes how to animate a property of a view. Conform to Animatable to expose interpolated state to SwiftUI, or compose Animatable & ViewModifier (the deprecated AnimatableModifier protocol) to drive modifier-level animations alongside AnimatablePair, AnimatableValues, and VectorArithmetic helpers.",
        signature: "protocol Animatable \u{00b7} protocol AnimatableModifier : Animatable, ViewModifier",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/animations/animatable.md",
        page: { AnyView(AnimatableGalleryPage()) }
    )
}

#Preview {
    AnimatableGalleryPage()
        .frame(width: 900, height: 700)
}
