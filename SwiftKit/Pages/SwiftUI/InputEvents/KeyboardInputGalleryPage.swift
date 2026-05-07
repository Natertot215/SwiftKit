import SwiftUI

struct KeyboardInputGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            ContentUnavailableView(
                "In progress",
                systemImage: "hammer",
                description: Text("This page is awaiting tile content.")
            )
        }
    }
}

extension KeyboardInputGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.keyboardInput",
        title: "KeyboardInput",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "KeyboardInput",
            "View/onKeyPress(_:action:)",
            "View/onKeyPress(phases:action:)",
            "View/onKeyPress(_:phases:action:)",
            "View/onKeyPress(characters:phases:action:)",
            "View/onKeyPress(keys:phases:action:)",
            "View/keyboardShortcut(_:)",
            "View/keyboardShortcut(_:modifiers:)",
            "View/keyboardShortcut(_:modifiers:localization:)",
            "View/onModifierKeysChanged(mask:initial:_:)",
            "View/modifierKeyAlternate(_:_:)",
            "KeyEquivalent",
            "EventModifiers",
            "KeyPress",
            "KeyboardShortcut"
        ],
        blurb: "Hardware keyboard input — onKeyPress for focused key handling, keyboardShortcut for window-scoped commands, and the supporting types KeyEquivalent, EventModifiers, KeyPress, and KeyboardShortcut.",
        signature: "func onKeyPress(_ key: KeyEquivalent, action: @escaping () -> KeyPress.Result) -> some View",
        availability: "macOS 11.0+ (onKeyPress: macOS 14.0+; onModifierKeysChanged / modifierKeyAlternate: macOS 15.0+)",
        docPath: "Documentation/SwiftUI/input-events/onkeypress(_:action:).md",
        page: { AnyView(KeyboardInputGalleryPage()) }
    )
}

#Preview {
    KeyboardInputGalleryPage()
        .frame(width: 900, height: 700)
}
