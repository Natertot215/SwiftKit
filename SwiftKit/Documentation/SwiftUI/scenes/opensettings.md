---
url: https://developer.apple.com/documentation/swiftui/environmentvalues/opensettings
framework: SwiftUI
category: Scenes
title: openSettings
kind: property
captured: 2026-05-02
---

# openSettings

A Settings presentation action stored in a view’s environment.

## Declaration

```swift
var openSettings: OpenSettingsAction { get }
```

### Discussion

Use the `openSettings` environment value to get an `OpenSettingsAction` instance for a given `Environment`. Then call the instance to open a window. You call the instance directly because it defines a `OpenSettingsAction/callAsFunction()` method that Swift calls when you call the instance.

For example, you can define a button that opens the settings window to a particular tab:

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}

struct SettingsView: View {
    @AppStorage("selectedSettingsTab")
    private var selectedSettingsTab = SettingsTab.general

    var body: some View {
        TabView(selection: $selectedSettingsTab) {
            GeneralSettings()
            AdvancedSettings()
        }
    }
}

struct AdvancedSettingsButton: View {
    @AppStorage("selectedSettingsTab")
    private var selectedSettingsTab = SettingsTab.general

    @Environment(\.openSettings) private var openSettings

    var body: some View {
        Button("Open Advanced Settings…") {
            selectedSettingsTab = .advanced
            openSettings()
        }
    }
}

enum SettingsTab: Int {
    case general
    case advanced
}
```







## Availability

- macOS 14.0



## See Also

- `Settings`
- `SettingsLink`
- `OpenSettingsAction`
