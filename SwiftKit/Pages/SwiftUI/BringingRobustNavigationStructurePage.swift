import SwiftUI

// SwiftUI "Bringing robust navigation structure to your SwiftUI app" article page.
// Source: Documentation/SwiftUI/navigation/bringing-robust-navigation-structure-to-your-swiftui-app.md
// This is an Apple sample-code article (kind: sampleCode) — not a primitive.
// SwiftKit renders a short header pointing readers at the local mirror.

struct BringingRobustNavigationStructurePage: View {
    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            EmptyView()
        } variants: {
            EmptyView()
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Bringing Robust Navigation Structure to Your SwiftUI App")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple sample-code article on navigation links, stacks, destinations, and paths for deep linking and state restoration.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/bringing-robust-navigation-structure-to-your-swiftui-app.md · article")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label {
                VStack(alignment: .leading, spacing: 6) {
                    Text("This is an article in Apple's docs, not a renderable primitive.")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("The local mirror lives at Documentation/SwiftUI/navigation/bringing-robust-navigation-structure-to-your-swiftui-app.md. The article is associated with WWDC22 session 10054 and ships with downloadable sample code that demonstrates the modern stack/split/path patterns end-to-end.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: "doc.text")
                    .foregroundStyle(.tint)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("Related primitive pages")
                    .font(.headline)
                    .foregroundStyle(.primary)
                APICallout("NavigationStack          — single-column push history")
                APICallout("NavigationSplitView      — two- or three-column sidebar/detail")
                APICallout("NavigationPath           — type-erased programmatic path")
                APICallout(".navigationDestination(for:) / (isPresented:) / (item:) — destination wiring")
            }
        }
    }
}

#Preview {
    BringingRobustNavigationStructurePage()
        .frame(width: 1100, height: 700)
}
