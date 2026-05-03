import Foundation

enum CatalogFilters {
    static let excludedSwiftUIFolders: Set<String> = [
        "environment-values",
        "focus",
        "documents",
        "previews-in-xcode",
        "app-extensions",
        "system-events",
        "model-data",
        "uikit-integration",
        "accessibility-fundamentals",
        "preferences",
        "persistent-storage",
        "app-organization",
        "clipboard",
        "watchkit-integration",
        "_index",
        "essentials",
        "articles"
    ]

    static let excludedAppKitSections: Set<String> = [
        "Cocoa bindings",
        "Resource management",
        "App extensions",
        "Sound, speech, and haptics",
        "Drag and drop",
        "Reference (enumerations, constants, data types, macros)",
        "Deprecated symbols",
        "App structure",
        "Documents, data, and pasteboard",
        "Mouse, keyboard, and trackpad",
        "Printing",
        "Continuity Camera"
    ]
}
