import SwiftUI

// Spring — a damped harmonic oscillator. Drives Animation.spring(_:) and
// system-tuned bouncy/smooth/snappy presets. Demos use Animation values
// constructed from Spring instances so the visual delta is obvious.

struct SpringGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: System-tuned springs

            AnimationDemoTile(
                name: "Spring.bouncy",
                api: ".animation(.spring(.bouncy), value:)",
                animation: .spring(.bouncy)
            )

            AnimationDemoTile(
                name: "Spring.smooth",
                api: ".animation(.spring(.smooth), value:)",
                animation: .spring(.smooth)
            )

            AnimationDemoTile(
                name: "Spring.snappy",
                api: ".animation(.spring(.snappy), value:)",
                animation: .spring(.snappy)
            )

            // MARK: Parameterized

            AnimationDemoTile(
                name: "Spring(duration:bounce:)",
                api: ".animation(.spring(Spring(duration: 0.5, bounce: 0.4)), value:)",
                animation: .spring(Spring(duration: 0.5, bounce: 0.4))
            )

            AnimationDemoTile(
                name: "Spring(response:dampingRatio:)",
                api: ".animation(.spring(Spring(response: 0.45, dampingRatio: 0.55)), value:)",
                animation: .spring(Spring(response: 0.45, dampingRatio: 0.55))
            )

            AnimationDemoTile(
                name: "Spring(mass:stiffness:damping:)",
                api: ".animation(.spring(Spring(mass: 1, stiffness: 180, damping: 12)), value:)",
                animation: .spring(Spring(mass: 1, stiffness: 180, damping: 12))
            )

            // MARK: Reference

            ReferenceTile(
                name: "Spring",
                signature: "struct Spring",
                note: "A representation of a damped harmonic oscillator. Convert between (duration, bounce), (response, dampingRatio), and (mass, stiffness, damping) parameter spaces — they describe the same motion."
            )

            ReferenceTile(
                name: "Spring(duration:bounce:)",
                signature: "init(duration: TimeInterval = 0.5, bounce: Double = 0.0)",
                note: "Highest-level initializer. `duration` is the perceived motion length; `bounce` ranges from 0 (no overshoot) through positive (overshoots) to negative (lazy approach)."
            )

            ReferenceTile(
                name: "Spring(response:dampingRatio:)",
                signature: "init(response: Double, dampingRatio: Double)",
                note: "Designer-friendly parameters. `response` is the period of an undamped oscillation; `dampingRatio` 1.0 = critically damped (no overshoot), <1 underdamped (oscillates), >1 overdamped."
            )

            ReferenceTile(
                name: "Spring(mass:stiffness:damping:allowOverDamping:)",
                signature: "init(mass: Double = 1.0, stiffness: Double, damping: Double, allowOverDamping: Bool = false)",
                note: "Physics-based form. Stiffness drives frequency; damping drives decay. Set `allowOverDamping: true` to permit damping that would normally be clamped."
            )

            ReferenceTile(
                name: "Spring.bouncy / .smooth / .snappy",
                signature: "static var bouncy: Spring · smooth · snappy",
                note: "System-tuned presets the OS uses across the platform. Use these unless you have a strong reason to author custom parameters."
            )
        }
    }
}

extension SpringGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.animations.spring",
        title: "Spring",
        folder: "Animations",
        framework: .swiftUI,
        absorbedSymbols: ["Spring"],
        blurb: "A representation of a spring's motion. Spring describes a damped harmonic oscillator the system uses to drive natural-feeling animations defined by response, damping, and blend duration.",
        signature: "struct Spring",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/animations/spring.md",
        page: { AnyView(SpringGalleryPage()) }
    )
}

#Preview {
    SpringGalleryPage()
        .frame(width: 900, height: 700)
}
