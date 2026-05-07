import SwiftUI

// SwiftUI `View/blur(radius:opaque:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/blur(radius:opaque:).md
// macOS 10.15+. Applies a Gaussian blur to the view's rendered output.

struct BlurGalleryPage: View {
    @State private var radius: Double = 4
    @State private var opaque = false

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
            Text("View/blur(radius:opaque:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Applies a Gaussian blur. Larger radii are more diffuse. opaque controls whether transparency in the source contributes to the output.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/blur(radius:opaque:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sample: some View {
        ZStack {
            LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
            Text("Hello")
                .font(.largeTitle).fontWeight(.bold).foregroundStyle(.white)
        }
        .frame(width: 160, height: 110)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 16) {
                sample
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sample.blur(radius: 4)
            }
            APICallout(".blur(radius: 4)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Across a radius range") {
                HStack(spacing: 12) {
                    ForEach([0.0, 2, 5, 10, 20], id: \.self) { r in
                        VStack(spacing: 4) {
                            sample.blur(radius: r)
                            Text(String(format: "radius: %.0f", r))
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }

            VariantRow(title: "Blurred text") {
                HStack(spacing: 16) {
                    ForEach([0.0, 1, 3, 6], id: \.self) { r in
                        VStack(spacing: 4) {
                            Text("Type")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.primary)
                                .blur(radius: r)
                            Text("\(Int(r))").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Interactive") {
            VStack(alignment: .leading, spacing: 12) {
                sample
                    .blur(radius: radius, opaque: opaque)
                    .animation(.easeInOut, value: radius)
                    .animation(.easeInOut, value: opaque)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Text("radius").font(.caption).foregroundStyle(.secondary).frame(width: 80, alignment: .leading)
                    Slider(value: $radius, in: 0...30).frame(width: 280)
                    Text(String(format: "%.1f", radius)).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
                Toggle("opaque", isOn: $opaque)
                    .toggleStyle(.switch)
                    .frame(maxWidth: 220, alignment: .leading)
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Radius unit is points.", "A radius of 0 leaves the view unchanged. Useful range varies by content; UI elements typically use 1\u{2013}10pt.", "ruler"),
        ("opaque excludes transparency.", "When false (default), transparent pixels in the source bleed into the blur. Set true when blurring a known-opaque view to avoid edge bleed.", "circle.lefthalf.filled"),
        ("Animatable.", "Inside withAnimation, the blur radius interpolates smoothly \u{2014} useful for focus / sheet-presentation depth cues.", "wand.and.sparkles"),
        ("Use .drawingGroup() under heavy stacks.", "If you stack blur with other filters over a complex hierarchy, .drawingGroup() flattens the result onto a Metal surface for predictable performance.", "cpu")
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

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

extension BlurGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.drawingAndGraphics.blur",
        title: "Blur",
        folder: "Drawing and graphics",
        framework: .swiftUI,
        absorbedSymbols: ["View/blur(radius:opaque:)"],
        blurb: "Applies a Gaussian blur to a view by a given radius, optionally treating the input as opaque to skip alpha-channel sampling.",
        signature: "func blur(radius: CGFloat, opaque: Bool = false) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/drawing-and-graphics/blur(radius:opaque:).md",
        page: { AnyView(BlurGalleryPage()) }
    )
}

#Preview {
    BlurGalleryPage().frame(width: 1100, height: 1000)
}
