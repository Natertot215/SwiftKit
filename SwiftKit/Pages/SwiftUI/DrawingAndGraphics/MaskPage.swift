import SwiftUI

// SwiftUI `View/mask(alignment:_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/mask(alignment:_:).md
// macOS 12.0+. Masks this view using the alpha channel of the given view.

struct MaskPage: View {
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
            Text("View/mask(alignment:_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Masks the view using the alpha channel of another view. Where the mask is opaque, the source shows through; where the mask is transparent, the source is hidden.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/mask(alignment:_:).md \u{00b7} macOS 12.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var sourceGradient: some View {
        LinearGradient(colors: [.blue, .purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 220, height: 110)
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 24) {
                sourceGradient
                Image(systemName: "arrow.right").foregroundStyle(.secondary)
                sourceGradient.mask {
                    RoundedRectangle(cornerRadius: 24)
                }
            }
            APICallout(".mask { RoundedRectangle(cornerRadius: 24) }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Shape masks") {
                HStack(spacing: 16) {
                    sourceGradient.frame(width: 130, height: 90).mask { Circle() }
                    sourceGradient.frame(width: 130, height: 90).mask { Capsule() }
                    sourceGradient.frame(width: 130, height: 90).mask {
                        RoundedRectangle(cornerRadius: 18)
                    }
                }
            }

            VariantRow(title: "Symbol mask") {
                HStack(spacing: 16) {
                    sourceGradient.frame(width: 220, height: 110).mask {
                        Image(systemName: "star.fill")
                            .resizable().scaledToFit()
                            .padding(8)
                    }
                    APICallout(".mask { Image(systemName: \"star.fill\").resizable().scaledToFit() }")
                }
            }

            VariantRow(title: "Text-shaped mask") {
                HStack(spacing: 16) {
                    sourceGradient.frame(width: 320, height: 90).mask {
                        Text("MASK")
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    APICallout(".mask { Text(\"MASK\").font(.largeTitle).fontWeight(.black) }")
                }
            }

            VariantRow(title: "Alignment") {
                HStack(spacing: 16) {
                    ForEach([("topLeading", Alignment.topLeading), ("center", .center), ("bottomTrailing", .bottomTrailing)], id: \.0) { name, alignment in
                        VStack(spacing: 6) {
                            sourceGradient.frame(width: 160, height: 100).mask(alignment: alignment) {
                                Circle().frame(width: 60, height: 60)
                            }
                            Text("alignment: .\(name)")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Partial-opacity mask") {
            VStack(alignment: .leading, spacing: 8) {
                sourceGradient.frame(width: 280, height: 110).mask {
                    RoundedRectangle(cornerRadius: 18).opacity(0.4)
                }
                APICallout(".mask { RoundedRectangle(cornerRadius: 18).opacity(0.4) }")
            }
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Mask reads alpha, not color.", "Where the mask view is fully opaque (alpha = 1), the source shows. Where alpha = 0, source is hidden. Color of the mask doesn't matter.", "circle.lefthalf.filled"),
        ("Default alignment is .center.", "Pass a different Alignment to position the mask within the source's frame.", "scope"),
        ("Closure can be any View.", "Shape, Image, Text, gradient \u{2014} anything that draws an alpha channel works. Combine with .opacity or .blendMode for partial reveals.", "square.stack"),
        ("clipShape vs mask.", "clipShape clips the view to a Shape's path with anti-aliasing; mask uses any view's alpha. Use clipShape for clean shape clipping; mask for arbitrary alpha-driven masking.", "scissors")
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

#Preview {
    MaskPage().frame(width: 1100, height: 1000)
}
