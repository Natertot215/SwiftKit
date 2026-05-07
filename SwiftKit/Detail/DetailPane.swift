import SwiftUI

/// Detail-pane chrome: holds the toolbar (appearance picker) and applies the
/// user-selected color scheme. The page itself is passed in via
/// `@ViewBuilder content` from `RootView`, which owns selection resolution.
struct DetailPane<Content: View>: View {
    @ObservedObject var appearance: AppearanceController
    @ViewBuilder var content: () -> Content

    init(
        appearance: AppearanceController,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.appearance = appearance
        self.content = content
    }

    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .preferredColorScheme(appearance.colorScheme)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    AppearancePicker(appearance: appearance)
                }
            }
    }
}

/// Empty-state view shown when nothing is selected. Reusable across both
/// sidebar modes — `RootView` shows it whenever the selection ID resolves to
/// no `Leaf` and no `GalleryItem`.
struct DetailEmptyState: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "rectangle.split.2x1")
                .font(.largeTitle)
                .foregroundStyle(.tertiary)
            Text("Select a component")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AppearancePicker: View {
    @ObservedObject var appearance: AppearanceController

    var body: some View {
        Picker("Appearance", selection: $appearance.preference) {
            Text("System").tag(AppearancePreference.system)
            Text("Light").tag(AppearancePreference.light)
            Text("Dark").tag(AppearancePreference.dark)
        }
        .pickerStyle(.segmented)
        .frame(width: 180)
    }
}
