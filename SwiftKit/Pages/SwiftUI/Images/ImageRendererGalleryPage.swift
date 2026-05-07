import SwiftUI

// ImageRenderer reference page.
// Covers: ImageRenderer
// Source: Documentation/SwiftUI/images/imagerenderer.md
// macOS 13.0+

struct ImageRendererGalleryPage: View {
    @State private var renderedImage: NSImage? = nil
    @State private var isRendering = false

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
            Text("ImageRenderer")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Render a SwiftUI view into a bitmap image — PNG, PDF, or CGImage.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/images/imagerenderer.md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    @MainActor
    private func renderSampleView() {
        isRendering = true
        let view = SampleView()
        let renderer = ImageRenderer(content: view)
        renderer.scale = 2.0
        if let cgImage = renderer.cgImage {
            renderedImage = NSImage(cgImage: cgImage, size: CGSize(width: cgImage.width / 2, height: cgImage.height / 2))
        }
        isRendering = false
    }

    private var defaultDemo: some View {
        IRCard(api: "ImageRenderer(content: myView).cgImage") {
            VStack(spacing: 8) {
                if let img = renderedImage {
                    Image(nsImage: img)
                        .border(.separator, width: 1)
                    Text("Rendered output (above)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                } else {
                    SampleView()
                        .padding(8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    Text("Source view (not yet rendered)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Button(renderedImage == nil ? "Render to Image" : "Re-render") {
                    renderSampleView()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            IRVariant(title: "cgImage — render to CGImage") {
                IRCard(api: "renderer.cgImage") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("cgImage returns an optional CGImage for use with Core Graphics, Core Image, or NSImage/UIImage.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("let renderer = ImageRenderer(content: myView)\nrenderer.scale = 2.0  // Retina\nlet cg = renderer.cgImage")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .padding(8)
                            .background(.background.tertiary, in: RoundedRectangle(cornerRadius: 4))
                    }
                }
            }

            IRVariant(title: "nsImage — render to NSImage") {
                IRCard(api: "renderer.nsImage") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("On macOS, renderer.nsImage returns an NSImage directly — no CGImage conversion needed.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("let renderer = ImageRenderer(content: myView)\nlet ns = renderer.nsImage")
                            .font(.caption)
                            .fontDesign(.monospaced)
                            .padding(8)
                            .background(.background.tertiary, in: RoundedRectangle(cornerRadius: 4))
                    }
                }
            }

            IRVariant(title: "render(rasterizationScale:renderer:) — PDF") {
                IRCard(api: "renderer.render(rasterizationScale:renderer:) — PDF CGContext") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Call renderer.render(rasterizationScale: 1, renderer: { size, context in … }) with a CGContext backed by PDFKit to produce vector PDF output.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            IRVariant(title: "proposedSize — customize the rendered size") {
                IRCard(api: "renderer.proposedSize = .init(width: 400, height: 300)") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Set renderer.proposedSize to control the frame offered to the view. Defaults to the view's ideal size.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            IRVariant(title: "Live re-render on state change") {
                IRCard(api: "renderer.observedObject(_:) — update when a model changes") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("ImageRenderer can observe ObservableObject instances. When the object changes, the rendered output updates automatically.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        Text("Useful for sharing / exporting dynamic content that reflects live data.")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                }
            }
        }
    }

    private struct IRNote { let title: String; let detail: String; let symbol: String }
    private let notes: [IRNote] = [
        .init(title: "ImageRenderer is a MainActor class.", detail: "All access must happen on the main thread. Call from async main-actor context or directly in button actions and similar synchronous main-thread code.", symbol: "person.circle"),
        .init(title: "scale controls pixel density.", detail: "Set renderer.scale = 2 for @2x (Retina) output. The resulting CGImage will have 2× the pixel count at the same logical size.", symbol: "display"),
        .init(title: "Not all SwiftUI modifiers render the same way.", detail: "Blur, shadows, and materials render correctly. Metal shaders and some Metal-based effects may not appear in the rasterized output.", symbol: "exclamationmark.triangle"),
        .init(title: "proposedSize defaults to the view's ideal size.", detail: "Leave it unset to let the view determine its own size. Set it to force a specific canvas size — useful for fixed-size export.", symbol: "arrow.up.left.and.down.right.magnifyingglass"),
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

private struct SampleView: View {
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
                .font(.title)
            VStack(alignment: .leading) {
                Text("Rendered View")
                    .fontWeight(.semibold)
                Text("ImageRenderer output")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(12)
        .background(Color(.windowBackgroundColor))
    }
}

private struct IRCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 300, minHeight: 60, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct IRVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension ImageRendererGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.imageRenderer",
        title: "ImageRenderer",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.imagerenderer",
            "ImageRenderer"
        ],
        blurb: "An object that creates images from SwiftUI views. Rasterize on-demand to CGImage, NSImage, UIImage, or PDF data — useful for exporting Canvas content, badges, or any composed view as a bitmap.",
        signature: "final class ImageRenderer<Content> where Content : View",
        availability: "macOS 13.0+",
        docPath: "Documentation/SwiftUI/images/imagerenderer.md",
        page: { AnyView(ImageRendererGalleryPage()) }
    )
}

#Preview {
    ImageRendererGalleryPage().frame(width: 900, height: 1000)
}
