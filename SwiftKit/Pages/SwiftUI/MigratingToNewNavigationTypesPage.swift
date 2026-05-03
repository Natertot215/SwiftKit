import SwiftUI

// SwiftUI "Migrating to new navigation types" article reference page.
// Source: Documentation/SwiftUI/navigation/migrating-to-new-navigation-types.md
// This is an Apple article (kind: article) — not a primitive. SwiftKit renders
// a short header pointing readers at the local mirror.

struct MigratingToNewNavigationTypesPage: View {
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
            Text("Migrating to New Navigation Types")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple migration guide for replacing the deprecated NavigationView with NavigationStack and NavigationSplitView.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/migrating-to-new-navigation-types.md · article")
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
                    Text("The local mirror lives at Documentation/SwiftUI/navigation/migrating-to-new-navigation-types.md. It walks through replacing NavigationView (deprecated 26.5) with NavigationStack for single-column drill-downs and NavigationSplitView for sidebar/detail layouts.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            } icon: {
                Image(systemName: "doc.text")
                    .foregroundStyle(.tint)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("Replacement table")
                    .font(.headline)
                    .foregroundStyle(.primary)
                APICallout("NavigationView { … }                    →  NavigationStack { … }")
                APICallout("NavigationView { sidebar; detail }      →  NavigationSplitView { sidebar } detail: { detail }")
                APICallout("NavigationLink(_, destination:)         →  NavigationLink(_, value:) + .navigationDestination(for:)")
                APICallout(".navigationViewStyle(_:) (deprecated)    →  .navigationSplitViewStyle(_:)")
            }
        }
    }
}

#Preview {
    MigratingToNewNavigationTypesPage()
        .frame(width: 1100, height: 700)
}
