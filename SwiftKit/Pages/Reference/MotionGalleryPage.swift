import SwiftUI

struct MotionGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Animation curves — tap a tile to play

            AnimationDemoTile(
                name: "default",
                api: ".animation(.default, value:)",
                animation: .default
            )

            AnimationDemoTile(
                name: "linear",
                api: ".animation(.linear, value:)",
                animation: .linear
            )

            AnimationDemoTile(
                name: "easeIn",
                api: ".animation(.easeIn, value:)",
                animation: .easeIn
            )

            AnimationDemoTile(
                name: "easeOut",
                api: ".animation(.easeOut, value:)",
                animation: .easeOut
            )

            AnimationDemoTile(
                name: "easeInOut",
                api: ".animation(.easeInOut, value:)",
                animation: .easeInOut
            )

            AnimationDemoTile(
                name: "spring",
                api: ".animation(.spring, value:)",
                animation: .spring
            )

            AnimationDemoTile(
                name: "smooth",
                api: ".animation(.smooth, value:)",
                animation: .smooth
            )

            AnimationDemoTile(
                name: "snappy",
                api: ".animation(.snappy, value:)",
                animation: .snappy
            )

            AnimationDemoTile(
                name: "bouncy",
                api: ".animation(.bouncy, value:)",
                animation: .bouncy
            )

            AnimationDemoTile(
                name: "interactiveSpring()",
                api: ".animation(.interactiveSpring(), value:)",
                animation: .interactiveSpring()
            )

            // MARK: Transitions — tap a tile to insert/remove

            TransitionDemoTile(
                name: "opacity",
                api: ".transition(.opacity)",
                transition: .opacity
            )

            TransitionDemoTile(
                name: "scale",
                api: ".transition(.scale)",
                transition: .scale
            )

            TransitionDemoTile(
                name: "slide",
                api: ".transition(.slide)",
                transition: .slide
            )

            TransitionDemoTile(
                name: "move(edge: .top)",
                api: ".transition(.move(edge: .top))",
                transition: .move(edge: .top)
            )

            TransitionDemoTile(
                name: "asymmetric",
                api: ".transition(.asymmetric(insertion: .scale, removal: .opacity))",
                transition: .asymmetric(insertion: .scale, removal: .opacity)
            )

            // MARK: Reduce-motion accessibility

            ReduceMotionDemoTile()

            // MARK: Reference

            ReferenceTile(
                name: "Animation",
                signature: "struct Animation",
                note: "Drives implicit animation via .animation(_:value:) and explicit animation via withAnimation { … }."
            )

            ReferenceTile(
                name: "AnyTransition",
                signature: "struct AnyTransition",
                note: "Describes how a view appears and disappears. Combine via .combined(with:) or split via .asymmetric(insertion:removal:)."
            )

            ReferenceTile(
                name: "accessibilityReduceMotion",
                signature: "@Environment(\\.accessibilityReduceMotion) var reduceMotion",
                note: "Read this in animation paths. When true, swap motion for a cross-fade or skip the animation outright."
            )
        }
    }
}

// MARK: - ReduceMotionDemoTile

/// A capsule that animates differently depending on the system's
/// "Reduce motion" accessibility preference. Demonstrates the contract
/// of `accessibilityReduceMotion`: when true, prefer a cross-fade or
/// no animation over expressive motion.
private struct ReduceMotionDemoTile: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var toggled: Bool = false

    var body: some View {
        VariantTile(
            name: "Respects reduce motion",
            api: "@Environment(\\.accessibilityReduceMotion)"
        ) {
            VStack(spacing: 8) {
                Capsule()
                    .fill(.tint)
                    .frame(width: 28, height: 18)
                    .offset(x: toggled ? 36 : -36)
                    .animation(
                        reduceMotion ? .linear(duration: 0.15) : .spring,
                        value: toggled
                    )
                    .onTapGesture { toggled.toggle() }
                Text(reduceMotion ? "Reduce motion: ON" : "Reduce motion: OFF")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

extension MotionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "reference.motion.motion",
        title: "Motion",
        folder: "Reference",
        framework: .reference,
        absorbedSymbols: ["Motion"],
        blurb: "Fluid motion that conveys status, provides feedback, and enriches the visual experience. Surveys system motion, reduce-motion accessibility, and best-practice guidance for custom animation.",
        signature: "Animation \u{00b7} Transition \u{00b7} accessibilityReduceMotion",
        availability: "macOS 10.15+",
        docPath: "Documentation/HIG/foundations/motion.md",
        page: { AnyView(MotionGalleryPage()) }
    )
}

#Preview {
    MotionGalleryPage()
        .frame(width: 900, height: 700)
}
