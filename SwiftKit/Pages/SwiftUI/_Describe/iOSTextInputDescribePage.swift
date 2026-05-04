import SwiftUI

// Describe-track page for iOS / watchOS Text Input & Controls.
// Source: Documentation/SwiftUI/text-input-and-output/
// iOS 13.0+. These modifiers and controls target iOS/watchOS software keyboard
// and platform-specific input — unavailable on macOS.

struct iOSTextInputDescribePage: View {
    var body: some View {
        DescribePage(
            title: "iOS / watchOS Text Input & Controls",
            docPath: "Documentation/SwiftUI/text-input-and-output/",
            availability: "iOS 13.0+",
            blurb: """
            This cluster groups text input and control modifiers that are unavailable on macOS. \
            keyboardType(_:) and textInputAutocapitalization(_:) configure the software keyboard — \
            a concept that does not exist on macOS (hardware keyboard only). The dictation-behavior \
            APIs (searchDictationBehavior, TextInputDictationActivation, TextInputDictationBehavior) \
            tie into the iOS dictation engine and are iOS/Mac Catalyst only. The two \
            textContentType(_:) overloads documented here target UITextContentType (iOS) and \
            WKTextContentType (watchOS) — the macOS equivalent uses NSTextContentType and is exposed \
            via a different overload already covered elsewhere. EditButton is an iOS/visionOS \
            convenience that wraps EditMode toggling into a single button — macOS apps use toolbar \
            items with explicit @State management instead. TextFieldLink is a watchOS control that \
            opens the keyboard from the Digital Crown. defaultWheelPickerItemHeight(_:) sets row \
            height in watchOS wheel pickers. MultiDatePicker is an iOS/visionOS multi-date selection \
            control.
            """,
            signatures: [
                ".keyboardType(.emailAddress) — iOS/Mac Catalyst only",
                ".textInputAutocapitalization(.sentences) — iOS only",
                "TextInputAutocapitalization — .never, .words, .sentences, .characters",
                ".searchDictationBehavior(.inline) — iOS/Mac Catalyst only",
                "TextInputDictationActivation — .automatic, .onLook",
                "TextInputDictationBehavior — .automatic, .inline",
                ".textContentType(_ : UITextContentType) — iOS only (UIKit bridge)",
                ".textContentType(_ : WKTextContentType) — watchOS only",
                "EditButton() — iOS/visionOS convenience for EditMode toggling",
                "TextFieldLink(\"Title\") { … } — watchOS keyboard-input control",
                ".defaultWheelPickerItemHeight(44) — watchOS only",
                "MultiDatePicker(\"Title\", selection: $dates) — iOS/visionOS only"
            ],
            notes: [
                "On macOS, use @State private var editMode: EditMode = .inactive and toggle it manually — EditButton does not exist.",
                "textContentType for macOS TextField uses the NSTextContentType overload, which is already wired in the TextField gallery page.",
                "MultiDatePicker requires iOS 16.0+ or visionOS 1.0+."
            ]
        )
    }
}

#Preview {
    iOSTextInputDescribePage()
        .frame(width: 900, height: 700)
}
