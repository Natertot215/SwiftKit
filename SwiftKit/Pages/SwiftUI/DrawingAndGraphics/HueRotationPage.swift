import SwiftUI

// SwiftUI `View/hueRotation(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/huerotation(_:).md
// macOS 10.15+. Rotates the hue of all colors in the view by an Angle.

struct HueRotationPage: View {
    @State private var degrees: Double = 0

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View/hueRotation(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Rotates the hue of every color in the view by an Angle. 0° = unchanged; 180° = complementary.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/huerotation(_:).md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colors: [.red, .yellow, .green, .blue, .purple], startPoint: .leading, endPoint: .trailing))
            .frame(width: 220, height: 50)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                sample
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sample.hueRotation(.degrees(120))
            }
            APICallout(".hueRotation(.degrees(120))")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        HRVariantRow(title: "0° → 360° in 60° steps") {
            VStack(alignment: .leading, spacing: 8) {
                ForEach([0, 60, 120, 180, 240, 300, 360], id: \.self) { deg in
                    HStack(spacing: 12) {
                        Text("\(deg)°").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary).frame(width: 50, alignment: .leading)
                        sample.hueRotation(.degrees(Double(deg)))
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        HRVariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                sample.frame(width: 280, height: 80).hueRotation(.degrees(degrees)).animation(.easeInOut, value: degrees)
                HStack {
                    Text("degrees").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $degrees, in: 0...360).frame(width: 240)
                    Text(String(format: "%.0f°", degrees)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Takes an Angle.", "hueRotation accepts any Angle — .degrees(...), .radians(...). 360° wraps to 0°.", "angle"),
        ("Identity at 0° and 360°.", "Multiples of 360° are equivalent to no rotation. 180° produces hue-complement output.", "arrow.triangle.2.circlepath"),
        ("Animatable.", "Rotation is continuous — combine with TimelineView for chromatic animation.", "wand.and.sparkles"),
        ("Doesn't affect grayscale colors.", "Rotating a fully-desaturated view is a no-op — gray stays gray. Pair with .saturation when you need to drive both axes.", "circle.lefthalf.filled")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

private struct HRVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { HueRotationPage().frame(width: 1100, height: 1100) }
