import SwiftUI

// SwiftUI `AsyncImage` reference page.
// Covers: AsyncImage, AsyncImagePhase
// Source: Documentation/SwiftUI/images/asyncimage.md
// macOS 12.0+

struct AsyncImagePage: View {
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
            Text("AsyncImage")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that asynchronously loads and displays an image from a URL.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/images/asyncimage.md · macOS 12.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        AICard(api: "AsyncImage(url: URL(string: \"https://…\"))") {
            AsyncImage(url: URL(string: "https://picsum.photos/120/80")) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            AIVariant(title: "Simple init with placeholder") {
                AICard(api: "AsyncImage(url:) { image in … } placeholder: { ProgressView() }") {
                    AsyncImage(url: URL(string: "https://picsum.photos/100/100?random=1")) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }

            AIVariant(title: "Phase-based init — full state handling") {
                AICard(api: "AsyncImage(url:) { phase in switch phase { … } }") {
                    AsyncImage(url: URL(string: "https://picsum.photos/120/80?random=2")) { phase in
                        switch phase {
                        case .empty:
                            ZStack {
                                RoundedRectangle(cornerRadius: 8).fill(.background.secondary)
                                ProgressView()
                            }
                        case .success(let image):
                            image.resizable().scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        case .failure:
                            ZStack {
                                RoundedRectangle(cornerRadius: 8).fill(.background.secondary)
                                Label("Failed", systemImage: "exclamationmark.triangle")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 120, height: 80)
                }
            }

            AIVariant(title: "With custom URLSession scale") {
                AICard(api: "AsyncImage(url:scale:)") {
                    AsyncImage(url: URL(string: "https://picsum.photos/80/80?random=3"), scale: 2) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        Image(systemName: "photo").font(.largeTitle).foregroundStyle(.secondary)
                    }
                    .frame(width: 80, height: 80)
                }
            }

            AIVariant(title: "AsyncImagePhase — all cases") {
                AICard(api: "AsyncImagePhase: .empty, .success(Image), .failure(Error)") {
                    VStack(alignment: .leading, spacing: 6) {
                        let cases: [(String, String)] = [
                            (".empty", "Loading — image not yet available, show placeholder"),
                            (".success(Image)", "Successfully loaded — render the Image value"),
                            (".failure(Error)", "Load error — show an error indicator"),
                        ]
                        ForEach(cases, id: \.0) { name, desc in
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Text(name)
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.primary)
                                    .frame(width: 120, alignment: .leading)
                                Text(desc)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
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
            AIVariant(title: "Simulated .empty state") {
                AICard(api: "AsyncImagePhase.empty — show a ProgressView or skeleton") {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.background.secondary)
                            .frame(width: 200, height: 120)
                        VStack(spacing: 8) {
                            ProgressView()
                            Text("Loading image…")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            AIVariant(title: "Simulated .failure state") {
                AICard(api: "AsyncImagePhase.failure — show fallback placeholder") {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.background.secondary)
                            .frame(width: 200, height: 120)
                        Label("Image unavailable", systemImage: "photo.badge.exclamationmark")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    private struct AINote { let title: String; let detail: String; let symbol: String }
    private let notes: [AINote] = [
        .init(title: "AsyncImage manages its own network task.", detail: "No URLSession or Combine required. Provide a URL and SwiftUI handles fetching, caching (in-memory), and cancellation automatically.", symbol: "network"),
        .init(title: "Phase-based form gives full control.", detail: "Use the phase closure to handle all three states (.empty, .success, .failure) with separate UI. The simple placeholder form only addresses empty/success.", symbol: "switch.2"),
        .init(title: "scale: adjusts logical points vs pixel size.", detail: "For @2x URLs (e.g., from an API returning Retina images), pass scale: 2 so the image displays at the correct logical size.", symbol: "display"),
        .init(title: "AsyncImage caches in-memory only.", detail: "There is no built-in disk cache. For disk caching, use a custom URLSession with a URLCache or a third-party image-caching library.", symbol: "internaldrive"),
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

private struct AICard<C: View>: View {
    let api: String
    @ViewBuilder var content: () -> C
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            content()
                .padding(12)
                .frame(minWidth: 200, minHeight: 80, alignment: .center)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct AIVariant<C: View>: View {
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
    AsyncImagePage().frame(width: 900, height: 1000)
}
