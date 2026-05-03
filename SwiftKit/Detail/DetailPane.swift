import SwiftUI

struct DetailPane: View {
    let selection: Leaf?
    @ObservedObject var appearance: AppearanceController

    var body: some View {
        Group {
            if let leaf = selection {
                PageRegistry.view(for: leaf)
            } else {
                emptyState
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .preferredColorScheme(appearance.colorScheme)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                AppearancePicker(appearance: appearance)
            }
        }
    }

    private var emptyState: some View {
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
