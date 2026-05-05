import SwiftUI

// SwiftUI `Angle` describe page.
// Source: Documentation/SwiftUI/drawing-and-graphics/angle.md
// macOS 10.15+. Geometric angle value type usable in degrees or radians.

struct AngleDescribePage: View {
    var body: some View {
        DescribePage(
            title: "Angle",
            docPath: "Documentation/SwiftUI/drawing-and-graphics/angle.md",
            availability: "macOS 10.15+",
            blurb: """
            A geometric angle. The single value can be read or written in either \
            degrees or radians; the underlying storage is one Double, the unit \
            is just the lens you're looking through.

            Construct via:
            \u{2022} Angle.degrees(_:) / Angle(degrees:)
            \u{2022} Angle.radians(_:) / Angle(radians:)
            \u{2022} Angle.zero — the additive identity.
            \u{2022} Angle() — defaults to zero.

            Read via:
            \u{2022} angle.degrees
            \u{2022} angle.radians

            Conforms to Animatable so it interpolates smoothly with .animation, \
            and to Comparable so you can sort or clamp angle values directly. \
            Codable, Hashable, Sendable, BitwiseCopyable — usable in @State, \
            preferences, and persisted values.

            Angle is what View/rotationEffect, View/rotation3DEffect, gradient \
            angles, and Path arc operations consume — anywhere SwiftUI needs an \
            angle, this is the value type.
            """,
            signatures: [
                "@frozen struct Angle: Animatable, Comparable, Codable, Hashable, Sendable",
                "static let zero: Angle",
                "static func degrees(_: Double) -> Angle",
                "static func radians(_: Double) -> Angle",
                "init(degrees:)",
                "init(radians:)",
                "var degrees: Double",
                "var radians: Double"
            ],
            notes: [
                "Animatable \u{2014} interpolates smoothly with implicit animations.",
                "Comparable \u{2014} sort, clamp, min/max angle values directly.",
                "Codable \u{2014} round-trip across persistence layers.",
                "Storage is a single Double; degrees/radians are computed accessors.",
                "Used by rotationEffect, rotation3DEffect, gradient(angle:), Path.arc, etc.",
                "@frozen \u{2014} layout stable across OS versions."
            ]
        )
    }
}

#Preview {
    AngleDescribePage().frame(width: 900, height: 700)
}
