import SwiftUI

// SwiftUI `Landmarks: Building an app with Liquid Glass` (article).
// Source: Documentation/SwiftUI/view-styles/landmarks-building-an-app-with-liquid-glass.md
// macOS 26.0+. Article-style reference for Apple's official Landmarks sample app
// that demonstrates the full Liquid Glass surface in a real codebase.

struct LandmarksLiquidGlassPage: View {
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
            Text("Landmarks: Building an app with Liquid Glass")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Article — Apple's full sample-app walkthrough showing Liquid Glass adopted across navigation, controls, and presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-styles/landmarks-building-an-app-with-liquid-glass.md · macOS 26.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        LLGSection(title: "Sample download", api: "developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Landmarks is Apple's canonical Liquid Glass sample. Open it in Xcode for a working project that exercises every API in this category.")
                    .font(.callout)
                    .foregroundStyle(.primary)
                Text("URL: https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                    .textSelection(.enabled)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            LLGSection(title: "What Landmarks demonstrates", api: "Liquid Glass surface") {
                VStack(alignment: .leading, spacing: 8) {
                    bullet("Floating glass toolbars and inspector panels")
                    bullet("Liquid Glass background materials behind list rows and detail content")
                    bullet(".buttonStyle(.glass) and .buttonStyle(.glassProminent) for action chrome")
                    bullet("GlassEffectContainer wrapping clusters of glass shapes")
                    bullet(".glassEffectTransition(.materialize) for in/out animations")
                    bullet("Custom shapes via the in: parameter for non-capsule chrome")
                }
            }

            LLGSection(title: "Recommended reading order", api: "Article sequencing") {
                VStack(alignment: .leading, spacing: 8) {
                    bullet("First: Applying Liquid Glass to custom views — concept primer (see ApplyingLiquidGlassPage in SwiftKit)")
                    bullet("Then: clone Landmarks; build it; navigate between detail screens")
                    bullet("Inspect: ContentView for the navigation shell, FavoritesView for chip clusters")
                    bullet("Compare: Landmarks's GlassEffectContainer usage vs naïve sibling .glassEffect()")
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            LLGSection(title: "Mini-recreation — Landmarks-style toolbar cluster", api: "GlassEffectContainer + .glassEffect + .glassProminent") {
                miniLandmarks
                    .padding(20)
                    .background(
                        LinearGradient(colors: [.green.opacity(0.5), .blue.opacity(0.5)],
                                       startPoint: .topLeading, endPoint: .bottomTrailing),
                        in: RoundedRectangle(cornerRadius: 12)
                    )
            }
        }
    }

    private var miniLandmarks: some View {
        GlassEffectContainer {
            HStack(spacing: 12) {
                Button { } label: { Image(systemName: "chevron.left") }
                    .buttonStyle(.glass)
                Button { } label: { Image(systemName: "heart") }
                    .buttonStyle(.glass)
                Spacer()
                Button("Visit") { }
                    .buttonStyle(.glassProminent)
            }
            .padding(12)
        }
    }

    private func bullet(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "circle.fill")
                .font(.system(size: 6))
                .padding(.top, 7)
                .foregroundStyle(.secondary)
            Text(text)
                .font(.callout)
                .foregroundStyle(.primary)
        }
    }

    private struct LLGNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [LLGNote] = [
        .init(title: "Article, not API.",
              detail: "This page documents Apple's sample app. There's no single function to call — open Landmarks in Xcode and read its source for the canonical patterns.",
              symbol: "doc.text"),
        .init(title: "Pair with the Applying Liquid Glass article.",
              detail: "ApplyingLiquidGlassPage covers the concepts; this page is the worked-example reference. Both ship as articles in Apple's Liquid Glass topic.",
              symbol: "books.vertical"),
        .init(title: "Sample uses macOS 26 minimum.",
              detail: "Landmarks targets macOS 26 + iOS 26. SwiftKit's macOS 26 target matches, so any pattern in the sample is directly applicable here.",
              symbol: "calendar"),
        .init(title: "Search for GlassEffectContainer in the source — every cluster uses one.",
              detail: "The most important takeaway: Apple wraps EVERY group of glass shapes in a container. That's the perf-correct path; sibling .glassEffect() without a container wastes GPU.",
              symbol: "magnifyingglass"),
        .init(title: "Liquid Glass + dark mode == priority pairing.",
              detail: "Landmarks looks particularly striking in dark mode where the material refraction is more visible. SwiftKit's dark-mode-first rule applies here too.",
              symbol: "moon.stars")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }
}

private struct LLGSection<Content: View>: View {
    let title: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
            APICallout(api)
        }
    }
}

#Preview {
    LandmarksLiquidGlassPage()
        .frame(width: 1200, height: 1100)
}
