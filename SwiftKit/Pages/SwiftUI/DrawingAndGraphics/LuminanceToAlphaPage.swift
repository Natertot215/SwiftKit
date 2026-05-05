import SwiftUI

// SwiftUI `View/luminanceToAlpha()` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/luminancetoalpha().md
// macOS 10.15+. Maps RGB luminance to alpha — high luminance = opaque black, low = transparent.

struct LuminanceToAlphaPage: View {
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
            Text("View/luminanceToAlpha()")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Maps each pixel's luminance to alpha — useful for converting a luminance image into a mask. Output is black with the source's brightness as alpha.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/luminancetoalpha().md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                VStack(spacing: 6) {
                    sourceBox
                    Text("source").font(.caption).foregroundStyle(.secondary)
                }
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                VStack(spacing: 6) {
                    sourceBox.luminanceToAlpha()
                        .background(Color.white.opacity(0.0001), in: RoundedRectangle(cornerRadius: 8)) // visible bg for contrast
                    Text(".luminanceToAlpha()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
            APICallout(".luminanceToAlpha()")
        }
    }

    private var sourceBox: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill(.gray)
            Text("Hi")
                .font(.largeTitle).fontWeight(.heavy)
                .foregroundStyle(.white)
        }
        .frame(width: 110, height: 70)
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LTAVariantRow(title: "Use as a mask via .mask") {
                let maskShape = ZStack {
                    Color.black
                    Image(systemName: "star.fill")
                        .font(.largeTitle).imageScale(.large)
                        .foregroundStyle(.white)
                }
                .frame(width: 120, height: 120)
                .luminanceToAlpha()

                HStack(spacing: 16) {
                    LinearGradient(colors: [.purple, .pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 120, height: 120)
                        .mask(maskShape)
                    Text("LinearGradient masked by a luminance-to-alpha star")
                        .font(.callout).foregroundStyle(.secondary).frame(maxWidth: 260)
                }
            }

            LTAVariantRow(title: "Gradient → mask") {
                LinearGradient(colors: [.black, .gray, .white], startPoint: .leading, endPoint: .trailing)
                    .frame(width: 240, height: 60)
                    .luminanceToAlpha()
                Text("Black → fully transparent. White → opaque black. Mid-gray → 50% black.")
                    .font(.caption).foregroundStyle(.tertiary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        LTAVariantRow(title: "Compare against the source") {
            HStack(spacing: 16) {
                VStack(spacing: 6) { sourceBox; Text("original").font(.caption).foregroundStyle(.secondary) }
                VStack(spacing: 6) { sourceBox.luminanceToAlpha(); Text(".luminanceToAlpha()").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary) }
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Output is black with luminance-as-alpha.", "RGB collapses to a grayscale value, which becomes the alpha of a black pixel. White → opaque, black → transparent.", "circle.lefthalf.filled"),
        ("Designed for masks.", "Pair with .mask(_:) to use a colored or luminance-rich source as a mask layer. Equivalent to SVG feColorMatrix luminanceToAlpha.", "rectangle.dashed"),
        ("No parameters.", "luminanceToAlpha() is a non-parametric filter. For a graded effect, animate .opacity on a luminance-to-alpha layer.", "function"),
        ("Composable with other color filters.", "Apply hueRotation/saturation before luminanceToAlpha to shape the mask, or stack .blur after for soft-edged masks.", "square.2.layers.3d")
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

private struct LTAVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview { LuminanceToAlphaPage().frame(width: 1100, height: 1200) }
