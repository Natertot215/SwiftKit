import SwiftUI
import Combine

enum AppearancePreference: String, CaseIterable {
    case system, light, dark
}

final class AppearanceController: ObservableObject {
    @Published var preference: AppearancePreference {
        didSet { UserDefaults.standard.set(preference.rawValue, forKey: storageKey) }
    }

    private let storageKey = "preferredScheme"

    init() {
        let stored = UserDefaults.standard.string(forKey: storageKey)
        self.preference = stored.flatMap(AppearancePreference.init(rawValue:)) ?? .dark
    }

    var colorScheme: ColorScheme? {
        switch preference {
        case .system: return nil
        case .light:  return .light
        case .dark:   return .dark
        }
    }
}
