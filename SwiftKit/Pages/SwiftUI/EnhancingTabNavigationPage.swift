import SwiftUI

// SwiftUI "Enhancing your app's content with tab navigation" article reference page.
// Source: Documentation/SwiftUI/navigation/enhancing-your-app-content-with-tab-navigation.md
// This is an Apple article (kind: article) — not a primitive. SwiftKit renders
// a short header pointing readers at the local mirror.

struct EnhancingTabNavigationPage: View {
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
            Text("Enhancing Your App's Content with Tab Navigation")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Apple article on building a Tab + TabSection-based navigation surface with the .sidebarAdaptable style (Destination Video sample).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/navigation/enhancing-your-app-content-with-tab-navigation.md · article")
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
                    Text("The local mirror lives at Documentation/SwiftUI/navigation/enhancing-your-app-content-with-tab-navigation.md. It uses Apple's Destination Video sample to walk through Tab, TabSection, the .sidebarAdaptable style, and TabViewCustomization persistence.")
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
                APICallout("TabView                    — container for Tab/TabSection")
                APICallout("Tab / TabSection / TabRole — modern tab content")
                APICallout(".tabViewStyle(.sidebarAdaptable) — sidebar layout")
                APICallout("TabViewCustomization + .tabViewCustomization(_:) — persistence")
            }
        }
    }
}

#Preview {
    EnhancingTabNavigationPage()
        .frame(width: 1100, height: 700)
}
