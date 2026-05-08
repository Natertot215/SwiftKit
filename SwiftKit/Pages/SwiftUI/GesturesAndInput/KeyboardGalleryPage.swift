import SwiftUI

/// Gallery page scaffold for Keyboard. Phase 2 Step 2 placeholder —
/// every tile is a `VariantTile` with the verbatim Apple symbol name and an
/// empty demo well. Phase 3 fills the API string and the live render per tile.
struct KeyboardGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            VariantTile(name: "KeyboardShortcut", api: nil) { Color.clear }
            VariantTile(name: "KeyEquivalent", api: nil) { Color.clear }
            VariantTile(name: "EventModifiers", api: nil) { Color.clear }
            VariantTile(name: "KeyPress", api: nil) { Color.clear }
            VariantTile(name: "keyboardShortcut(_:)", api: nil) { Color.clear }
            VariantTile(name: "keyboardShortcut(_:modifiers:)", api: nil) { Color.clear }
            VariantTile(name: "onKeyPress(_:action:)", api: nil) { Color.clear }
            VariantTile(name: "onKeyPress(keys:phases:action:)", api: nil) { Color.clear }
            VariantTile(name: "onCommand(_:perform:)", api: nil) { Color.clear }
            VariantTile(name: "onDeleteCommand(perform:)", api: nil) { Color.clear }
            VariantTile(name: "onMoveCommand(perform:)", api: nil) { Color.clear }
            VariantTile(name: "onExitCommand(perform:)", api: nil) { Color.clear }
            VariantTile(name: "copyable(_:)", api: nil) { Color.clear }
            VariantTile(name: "cuttable(for:action:)", api: nil) { Color.clear }
            VariantTile(name: "pasteDestination(for:action:validator:)", api: nil) { Color.clear }
            VariantTile(name: "onCopyCommand(perform:)", api: nil) { Color.clear }
            VariantTile(name: "onCutCommand(perform:)", api: nil) { Color.clear }
            VariantTile(name: "onPasteCommand(of:perform:)", api: nil) { Color.clear }
        }
    }
}

extension KeyboardGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.gesturesAndInput.keyboard",
        title: "Keyboard",
        folder: "Gestures and Input",
        framework: .swiftUI,
        absorbedSymbols: ["EventModifiers", "KeyEquivalent", "Keyboard", "KeyboardShortcut"],
        blurb: "Keyboard — Phase 3 fills this from the Apple documentation Abstract.",
        signature: nil,
        availability: nil,
        docPath: nil,
        page: { AnyView(KeyboardGalleryPage()) }
    )
}
