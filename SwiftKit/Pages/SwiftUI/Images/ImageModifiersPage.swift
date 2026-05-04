import SwiftUI

// Image modifiers reference page.
// Covers: imageScale(_:), Image.Scale, Image.Orientation, Image.ResizingMode
// Source: Documentation/SwiftUI/images/
// macOS 10.15+

struct ImageModifiersPage: View {
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
            Text("Image Modifiers")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("imageScale, Image.Scale, Image.Orientation, and Image.ResizingMode.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("View/imageScale(_:) · Image.Scale · Image.Orientation · Image.ResizingMode · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        IMCard(api: ".imageScale(.medium)  (default)") {
            Image(systemName: "star.fill").imageScale(.medium)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            IMVariant(title: "imageScale(_:) — Image.Scale") {
                HStack(alignment: .top, spacing: 16) {
                    IMCard(api: ".imageScale(.small)") {
                        Image(systemName: "star.fill").imageScale(.small)
                    }
                    IMCard(api: ".imageScale(.medium)") {
                        Image(systemName: "star.fill").imageScale(.medium)
                    }
                    IMCard(api: ".imageScale(.large)") {
                        Image(systemName: "star.fill").imageScale(.large)
                    }
                }
            }

            IMVariant(title: "Image.Scale — all cases") {
                IMCard(api: "Image.Scale: .small, .medium, .large") {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 12) {
                            ForEach([Image.Scale.small, .medium, .large], id: \.hashValue) { scale in
                                Image(systemName: "photo")
                                    .imageScale(scale)
                            }
                        }
                        Text(".small  .medium  .large — scales SF Symbol glyph relative to surrounding text")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            IMVariant(title: "Image.ResizingMode") {
                HStack(alignment: .top, spacing: 16) {
                    IMCard(api: ".resizable(resizingMode: .stretch)") {
                        Image(systemName: "circle.fill")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 80, height: 40)
                            .foregroundStyle(.tint.opacity(0.5))
                    }
                    IMCard(api: ".resizable(resizingMode: .tile)") {
                        Image(systemName: "circle.fill")
                            .resizable(resizingMode: .tile)
                            .frame(width: 80, height: 40)
                            .foregroundStyle(.tint.opacity(0.5))
                    }
                }
            }

            IMVariant(title: "Image.Orientation — all cases") {
                IMCard(api: "Image.Orientation: up, down, left, right + mirrored variants") {
                    VStack(alignment: .leading, spacing: 6) {
                        let orientations: [(String, Image.Orientation)] = [
                            ("up", .up), ("upMirrored", .upMirrored),
                            ("down", .down), ("downMirrored", .downMirrored),
                            ("left", .left), ("leftMirrored", .leftMirrored),
                            ("right", .right), ("rightMirrored", .rightMirrored),
                        ]
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 140))], alignment: .leading, spacing: 8) {
                            ForEach(orientations, id: \.0) { name, orientation in
                                HStack(spacing: 6) {
                                    Image(systemName: "arrow.up.circle")
                                        .rotationEffect(orientationAngle(orientation))
                                        .scaleEffect(x: isMirrored(orientation) ? -1 : 1)
                                    Text(".\(name)")
                                        .font(.caption)
                                        .fontDesign(.monospaced)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            IMVariant(title: "Container imageScale cascades to all images") {
                IMCard(api: "HStack { Image(…); Image(…) }.imageScale(.large)") {
                    HStack(spacing: 12) {
                        Image(systemName: "star.fill")
                        Image(systemName: "heart.fill")
                        Image(systemName: "bolt.fill")
                    }
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                }
            }
        }
    }

    private func orientationAngle(_ o: Image.Orientation) -> Angle {
        switch o {
        case .up, .upMirrored: return .zero
        case .right, .rightMirrored: return .degrees(90)
        case .down, .downMirrored: return .degrees(180)
        case .left, .leftMirrored: return .degrees(270)
        @unknown default: return .zero
        }
    }

    private func isMirrored(_ o: Image.Orientation) -> Bool {
        switch o {
        case .upMirrored, .downMirrored, .leftMirrored, .rightMirrored: return true
        default: return false
        }
    }

    private struct IMNote { let title: String; let detail: String; let symbol: String }
    private let notes: [IMNote] = [
        .init(title: "imageScale(_:) affects SF Symbol glyphs only.", detail: "It doesn't resize arbitrary images — use .resizable() + .frame() for those. imageScale adjusts the glyph size relative to surrounding text context.", symbol: "arrow.up.left.and.down.right.magnifyingglass"),
        .init(title: "ResizingMode: stretch vs tile.", detail: ".stretch (default) scales the image uniformly to fill the frame. .tile repeats the image in a grid pattern — useful for texture backgrounds.", symbol: "rectangle.grid.2x2"),
        .init(title: "Image.Orientation matches CGImagePropertyOrientation.", detail: "Used when constructing Image from pixel data (CGImage, CVPixelBuffer) where the orientation metadata must be specified explicitly.", symbol: "rotate.right"),
        .init(title: "Container imageScale cascades.", detail: "Applying .imageScale(_:) on a container view (HStack, VStack, etc.) sets the scale for all SF Symbol Images inside unless overridden.", symbol: "rectangle.stack"),
    ]

    @ViewBuilder private var notesContent: some View {
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

private struct IMCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 100, minHeight: 72, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct IMVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    ImageModifiersPage().frame(width: 1000, height: 1000)
}
