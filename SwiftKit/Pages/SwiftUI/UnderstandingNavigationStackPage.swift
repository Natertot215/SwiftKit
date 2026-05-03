import SwiftUI

// SwiftUI "Understanding the navigation stack" article reference page.
// Source: Documentation/SwiftUI/navigation/understanding-the-navigation-stack.md
// This is an Apple article (kind: article) — not a primitive. SwiftKit renders a
// short header pointing readers at the local mirror.

struct UnderstandingNavigationStackPage: View {
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
            Text("Understanding the Navigation Stack")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple article describing the NavigationStack container and value-based routing.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/understanding-the-navigation-stack.md · article")
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
                    Text("The local mirror lives at Documentation/SwiftUI/navigation/understanding-the-navigation-stack.md. It walks through path types (NavigationPath vs [Hashable]), destination wiring (.navigationDestination overloads), programmatic push/pop, and Codable state restoration.")
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
                APICallout("NavigationStack         — Documentation/SwiftUI/navigation/navigationstack.md")
                APICallout("NavigationPath          — Documentation/SwiftUI/navigation/navigationpath.md")
                APICallout("NavigationLink          — Documentation/SwiftUI/navigation/navigationlink.md")
                APICallout(".navigationDestination(for:/isPresented:/item:) — three sibling overloads")
            }
        }
    }
}

#Preview {
    UnderstandingNavigationStackPage()
        .frame(width: 1100, height: 700)
}
