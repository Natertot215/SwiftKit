import SwiftUI

struct AccessibilityFocusedGalleryPage: View {
    @AccessibilityFocusState private var isUsernameFocused: Bool

    private enum Field: Hashable { case username, password }
    @AccessibilityFocusState private var focusedField: Field?

    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Bool binding

            VariantTile(
                name: "Bool binding",
                api: ".accessibilityFocused($isUsernameFocused)"
            ) {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityFocused($isUsernameFocused)
                    .frame(maxWidth: 180)
            }

            // MARK: Hashable equals

            VariantTile(
                name: "Hashable, equals:",
                api: ".accessibilityFocused($focusedField, equals: .password)"
            ) {
                VStack(spacing: 6) {
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .accessibilityFocused($focusedField, equals: .username)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .accessibilityFocused($focusedField, equals: .password)
                }
                .frame(maxWidth: 200)
            }

            // MARK: Programmatic move

            VariantTile(
                name: "programmatic focus",
                api: "focusedField = .password"
            ) {
                Button("Focus password") {
                    focusedField = .password
                }
            }

            // MARK: Reference

            ReferenceTile(
                name: "AccessibilityFocusState",
                signature: "@propertyWrapper struct AccessibilityFocusState<Value>",
                note: "VoiceOver-specific cousin of `@FocusState`. Read the wrapped value to detect when an element is voice-focused; write it to move focus."
            )

            ReferenceTile(
                name: "Use cases",
                signature: "Form validation, modal dismissal, app-launched workflows.",
                note: "After surfacing an error, move VoiceOver focus to the offending field. After dismissing a sheet, restore focus to the trigger."
            )
        }
    }
}

extension AccessibilityFocusedGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.accessibility.accessibilityFocused",
        title: "AccessibilityFocused",
        folder: "Accessibility",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/accessibilityFocused(_:)",
            "View/accessibilityFocused(_:equals:)",
            "AccessibilityFocusState",
            "swiftui.accessible-controls.accessibilityfocused(_:)",
            "swiftui.accessible-controls.accessibilityfocused(_:equals:)",
            "swiftui.accessible-controls.accessibilityfocusstate"
        ],
        blurb: "Binds a view's accessibility-focus state to an AccessibilityFocusState property. Read or write the state to track or move VoiceOver focus programmatically.",
        signature: "func accessibilityFocused<Value>(_ binding: AccessibilityFocusState<Value>.Binding, equals value: Value) -> some View where Value : Hashable",
        availability: "macOS 12.0+",
        docPath: "Documentation/SwiftUI/accessible-controls/accessibilityfocused(_:).md",
        page: { AnyView(AccessibilityFocusedGalleryPage()) }
    )
}

#Preview {
    AccessibilityFocusedGalleryPage()
        .frame(width: 900, height: 700)
}
