import SwiftUI

struct AccessibilityActionGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Action kinds

            VariantTile(
                name: "default action",
                api: ".accessibilityAction { … }"
            ) {
                Button("Activate") {}
                    .accessibilityAction {}
            }

            VariantTile(
                name: ".magicTap",
                api: ".accessibilityAction(.magicTap) { … }"
            ) {
                Button("Toggle Now Playing") {}
                    .accessibilityAction(.magicTap) {}
            }

            VariantTile(
                name: ".escape",
                api: ".accessibilityAction(.escape) { … }"
            ) {
                Button("Dismiss") {}
                    .accessibilityAction(.escape) {}
            }

            // MARK: Named & multiple actions

            VariantTile(
                name: "named action",
                api: #".accessibilityAction(named: "Mute") { … }"#
            ) {
                Image(systemName: "speaker.wave.2.fill")
                    .accessibilityAction(named: "Mute") {}
            }

            VariantTile(
                name: "accessibilityActions builder",
                api: ".accessibilityActions { … multiple … }"
            ) {
                Image(systemName: "ellipsis.circle")
                    .accessibilityActions {
                        Button("Edit") {}
                        Button("Duplicate") {}
                        Button("Delete", role: .destructive) {}
                    }
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityActionKind",
                signature: "struct AccessibilityActionKind  // .default, .escape, .magicTap",
                note: "System-defined action slots. Magic Tap and Escape are reserved gestures VoiceOver users invoke without selecting any element."
            )

            ReferenceTile(
                name: "AccessibilityActionCategory",
                signature: "struct AccessibilityActionCategory",
                note: "Group related custom actions together inside `accessibilityActions(category:_:)`. VoiceOver presents them as a single submenu."
            )

            ReferenceTile(
                name: "App Intent overload",
                signature: "func accessibilityAction(intent:label:) -> some View",
                note: "Wires an AppIntent to an accessibility action so the same code path runs from VoiceOver, Shortcuts, and Siri."
            )
        }
    }
}

extension AccessibilityActionGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityAction",
        title: "AccessibilityAction",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityAction(_:_:)",
            "View/accessibilityAction(named:_:)",
            "View/accessibilityAction(action:label:)",
            "View/accessibilityAction(intent:label:)",
            "View/accessibilityAction(_:intent:)",
            "View/accessibilityAction(named:intent:)",
            "View/accessibilityActions(_:)",
            "View/accessibilityActions(category:_:)",
            "AccessibilityActionKind",
            "AccessibilityActionCategory",
            "swiftui.accessible-controls.accessibilityaction(_:_:)",
            "swiftui.accessible-controls.accessibilityaction(named:_:)",
            "swiftui.accessible-controls.accessibilityaction(action:label:)",
            "swiftui.accessible-controls.accessibilityaction(intent:label:)",
            "swiftui.accessible-controls.accessibilityaction(_:intent:)",
            "swiftui.accessible-controls.accessibilityaction(named:intent:)",
            "swiftui.accessible-controls.accessibilityactions(_:)",
            "swiftui.accessible-controls.accessibilityactions(category:_:)",
            "swiftui.accessible-controls.accessibilityactionkind",
            "swiftui.accessible-controls.accessibilityactioncategory"
        ],
        blurb: "Adds an accessibility action to a view so assistive technologies — VoiceOver, Switch Control, Voice Control — can invoke it. Supports named actions, App Intents, and custom action categories.",
        signature: "func accessibilityAction(_ actionKind: AccessibilityActionKind = .default, _ handler: @escaping () -> Void) -> ModifiedContent<Self, AccessibilityAttachmentModifier>",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityaction(_:_:).md",
        page: { AnyView(AccessibilityActionGalleryPage()) }
    )
}

#Preview {
    AccessibilityActionGalleryPage()
        .frame(width: 900, height: 700)
}
