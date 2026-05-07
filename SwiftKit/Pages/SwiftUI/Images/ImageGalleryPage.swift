import SwiftUI

// SwiftUI `Image` reference page.
// Source: Documentation/SwiftUI/images/image.md
// macOS 10.15+. Displays an image — SF Symbols, asset catalog, and system resources.

struct ImageGalleryPage: View {
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
            Text("Image")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that displays an image — SF Symbols, asset catalog images, or system resources.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/images/image.md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        ImgCard(api: "Image(systemName: \"star.fill\")") {
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundStyle(.tint)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ImgVariant(title: "SF Symbol — systemName:") {
                HStack(alignment: .top, spacing: 16) {
                    ImgCard(api: "Image(systemName: \"star.fill\")") {
                        Image(systemName: "star.fill").font(.title)
                    }
                    ImgCard(api: "Image(systemName: \"photo\")") {
                        Image(systemName: "photo").font(.title)
                    }
                    ImgCard(api: "Image(systemName: \"person.circle.fill\")") {
                        Image(systemName: "person.circle.fill").font(.title)
                    }
                    ImgCard(api: "Image(systemName: \"checkmark.shield.fill\")") {
                        Image(systemName: "checkmark.shield.fill").font(.title).foregroundStyle(.green)
                    }
                }
            }

            ImgVariant(title: "Resizable + frame") {
                HStack(alignment: .top, spacing: 16) {
                    ImgCard(api: ".resizable().frame(width: 60, height: 60)") {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.secondary)
                    }
                    ImgCard(api: ".resizable().scaledToFit().frame(width: 80)") {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .foregroundStyle(.secondary)
                    }
                    ImgCard(api: ".resizable().scaledToFill().frame(width: 60, height: 40)") {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 40)
                            .clipped()
                            .foregroundStyle(.secondary)
                    }
                }
            }

            ImgVariant(title: "Rendering modes") {
                HStack(alignment: .top, spacing: 16) {
                    ImgCard(api: ".renderingMode(.original)") {
                        Image(systemName: "star.fill")
                            .renderingMode(.original)
                            .font(.title)
                    }
                    ImgCard(api: ".renderingMode(.template)") {
                        Image(systemName: "star.fill")
                            .renderingMode(.template)
                            .font(.title)
                            .foregroundStyle(.tint)
                    }
                }
            }

            ImgVariant(title: "Symbol configurations via font") {
                HStack(alignment: .top, spacing: 16) {
                    ImgCard(api: ".font(.caption)") {
                        Image(systemName: "star.fill").font(.caption)
                    }
                    ImgCard(api: ".font(.body)") {
                        Image(systemName: "star.fill").font(.body)
                    }
                    ImgCard(api: ".font(.title)") {
                        Image(systemName: "star.fill").font(.title)
                    }
                    ImgCard(api: ".font(.largeTitle)") {
                        Image(systemName: "star.fill").font(.largeTitle)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            ImgVariant(title: "Accessibility label") {
                ImgCard(api: "Image(systemName: \"star.fill\").accessibilityLabel(\"Favorite\")") {
                    Image(systemName: "star.fill")
                        .font(.title)
                        .accessibilityLabel("Favorite")
                }
            }
            ImgVariant(title: "Decorative (hidden from accessibility)") {
                ImgCard(api: "Image(decorative: \"background-pattern\")") {
                    Image(systemName: "photo")
                        .font(.title)
                        .accessibilityHidden(true)
                }
            }
            ImgVariant(title: "antialiased via foregroundStyle") {
                HStack(alignment: .top, spacing: 16) {
                    ImgCard(api: ".foregroundStyle(.primary)") {
                        Image(systemName: "waveform").font(.title).foregroundStyle(.primary)
                    }
                    ImgCard(api: ".foregroundStyle(.tint)") {
                        Image(systemName: "waveform").font(.title).foregroundStyle(.tint)
                    }
                    ImgCard(api: ".foregroundStyle(.secondary)") {
                        Image(systemName: "waveform").font(.title).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private struct ImgNote { let title: String; let detail: String; let symbol: String }
    private let notes: [ImgNote] = [
        .init(title: "Image is not resizable by default.", detail: "Call .resizable() before .scaledToFit() or .scaledToFill() — the modifier must come first or the image renders at its intrinsic pixel size.", symbol: "arrow.up.left.and.down.right.magnifyingglass"),
        .init(title: "SF Symbols inherit the font size.", detail: "Image(systemName:) participates in the font environment. Setting .font(.title) on the image or a parent container sizes the symbol accordingly.", symbol: "textformat.size"),
        .init(title: "Image(decorative:) hides from VoiceOver.", detail: "Use for purely decorative images that don't add semantic meaning. For informative images, use accessibilityLabel(_:) to provide a description.", symbol: "eye.slash"),
        .init(title: "renderingMode(.template) tints with foregroundStyle.", detail: "Template mode converts the image to a single-color mask colored by .foregroundStyle(_:). Original mode renders pixel colors as-is.", symbol: "paintbrush"),
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

private struct ImgCard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 100, minHeight: 80, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct ImgVariant<C: View>: View {
    let title: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension ImageGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.images.image",
        title: "Image",
        folder: "Images",
        framework: .swiftUI,
        absorbedSymbols: [
            "swiftui.images.image",
            "swiftui.images.scale",
            "swiftui.images.orientation",
            "swiftui.images.resizingmode",
            "swiftui.images.imagescale(_:)",
            "Image",
            "Image/Scale",
            "Image/Orientation",
            "Image/ResizingMode",
            "View/imageScale(_:)"
        ],
        blurb: "A view that displays an image. Sources include asset-catalog files, platform image types (NSImage, UIImage, CGImage), and SF Symbols. Includes the nested Scale, Orientation, and ResizingMode types and the imageScale(_:) modifier.",
        signature: "@frozen struct Image",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/images/image.md",
        page: { AnyView(ImageGalleryPage()) }
    )
}

#Preview {
    ImageGalleryPage().frame(width: 1000, height: 1000)
}
