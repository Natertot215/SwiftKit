import SwiftUI
import AppKit

// AppKit TextDisplay — text input, checking, spell-checking, and deprecated APIs.
//
// Absorbed leaves:
//   Text views:   NSTextViewDelegate, NSTextDelegate
//   Text input:   Adopting the system text cursor (article), NSTextInputContext,
//                 NSTextInputClient, NSTextAlternatives, NSTextContent,
//                 NSTextInsertionIndicator, NSTextInsertionIndicator.DisplayMode,
//                 NSTextInsertionIndicator.AutomaticModeOptions
//   Text-checking: NSTextCheckingController, NSTextCheckingClient,
//                 NSTextInputTraits, NSTextInputTraitType
//   Spell-checking: NSSpellChecker, NSChangeSpelling, NSIgnoreMisspelledWords
//   Deprecated:   NSTextInput

// MARK: - Bridges

private struct NSTextInsertionIndicatorDemo: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let container = NSView()
        container.translatesAutoresizingMaskIntoConstraints = false

        let indicator = NSTextInsertionIndicator(frame: NSRect(x: 40, y: 8, width: 2, height: 24))
        indicator.displayMode = .automatic
        indicator.color = NSColor.controlAccentColor
        container.addSubview(indicator)
        return container
    }
    func updateNSView(_ nsView: NSView, context: Context) {}
}

// MARK: - Page

struct NSTextDisplayPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                textDelegatesSection
                textInputSection
                textInsertionIndicatorSection
                textCheckingSection
                spellCheckingSection
                deprecatedSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Text Display")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Text input protocols, insertion indicators, spell-checking, and text-checking infrastructure for AppKit views.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSTextInsertionIndicator macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Text Delegates

    private var textDelegatesSection: some View {
        PageSection("Reference \u{2014} NSTextViewDelegate / NSTextDelegate") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextViewDelegate",
                    kind: "protocol : NSTextDelegate",
                    availability: "macOS 10.0+",
                    blurb: "The full delegate contract for NSTextView. Covers typing, selection changes, menu validation, spell-check decisions, link clicking, and drag handling. Most methods are optional."
                ) {
                    snippet("""
                    protocol NSTextViewDelegate: NSTextDelegate {
                        // Editing:
                        func textView(_ textView: NSTextView, shouldChangeTextIn range: NSRange,
                                      replacementString: String?) -> Bool
                        func textViewDidChangeSelection(_ notification: Notification)
                        func textViewDidChangeTypingAttributes(_ notification: Notification)

                        // Menus / completions:
                        func textView(_ textView: NSTextView,
                                      menu: NSMenu, for event: NSEvent,
                                      at charIndex: Int) -> NSMenu?
                        func textView(_ textView: NSTextView,
                                      completions words: [String],
                                      forPartialWordRange charRange: NSRange,
                                      indexOfSelectedItem index: UnsafeMutablePointer<Int>) -> [String]

                        // Link:
                        func textView(_ textView: NSTextView,
                                      clickedOnLink link: Any, at charIndex: Int) -> Bool

                        // Drag:
                        func textView(_ textView: NSTextView, draggedCell cell: NSTextAttachmentCell,
                                      in rect: NSRect, event: NSEvent, at charIndex: Int)
                    }

                    // NSTextDelegate (shared with NSText):
                    protocol NSTextDelegate: NSObjectProtocol {
                        func textShouldBeginEditing(_ textObject: NSText) -> Bool
                        func textShouldEndEditing(_ textObject: NSText) -> Bool
                        func textDidBeginEditing(_ notification: Notification)
                        func textDidEndEditing(_ notification: Notification)
                        func textDidChange(_ notification: Notification)
                    }
                    """)
                }
            }
        }
    }

    // MARK: Text Input

    private var textInputSection: some View {
        PageSection("Text Input \u{2014} NSTextInputContext / NSTextInputClient") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextInputContext",
                    kind: "class : NSObject",
                    availability: "macOS 10.6+",
                    blurb: "Manages the connection between a custom view and the Input Method framework. Your NSView subclass that handles text input owns one NSTextInputContext and calls activate()/deactivate() on focus changes."
                ) {
                    snippet("""
                    class NSTextInputContext: NSObject
                    init(client: NSTextInputClient)
                    var client: NSTextInputClient { get }
                    static var current: NSTextInputContext? { get }  // active context

                    func activate()     // call from NSView.becomeFirstResponder()
                    func deactivate()   // call from NSView.resignFirstResponder()
                    func handleEvent(_ theEvent: NSEvent) -> Bool  // forward key events

                    var acceptsGlyphs: Bool           // allow glyph-based input (CJK)
                    var allowedInputSourceLocales: [String]?  // restrict input methods
                    var selectedKeyboardInputSource: String?

                    // Invalidate after text changes that come from outside input:
                    func invalidateCharacterCoordinates()
                    func discardMarkedText()
                    """)
                }

                refBlock(
                    name: "NSTextInputClient",
                    kind: "protocol",
                    availability: "macOS 10.0+",
                    blurb: "The required interface for a view that handles text input via NSTextInputContext. Implement these methods to integrate with the Input Method framework, dictation, autocorrect, and dead-key composition."
                ) {
                    snippet("""
                    protocol NSTextInputClient {
                        // Marked (composing) text:
                        func setMarkedText(_ string: Any, selectedRange: NSRange, replacementRange: NSRange)
                        func unmarkText()
                        func selectedRange() -> NSRange
                        func markedRange() -> NSRange
                        func hasMarkedText() -> Bool

                        // Attribute strings for candidate display:
                        func attributedSubstring(forProposedRange range: NSRange,
                                                 actualRange: NSRangePointer?) -> NSAttributedString?

                        // Geometry (for input method popover placement):
                        func firstRect(forCharacterRange range: NSRange,
                                       actualRange: NSRangePointer?) -> NSRect
                        func characterIndex(for point: NSPoint) -> Int

                        // Commit or replace text:
                        func insertText(_ string: Any, replacementRange: NSRange)

                        // Supported attributes:
                        func validAttributesForMarkedText() -> [NSAttributedString.Key]
                    }
                    """)
                }

                refBlock(
                    name: "NSTextAlternatives",
                    kind: "class : NSObject",
                    availability: "macOS 10.8+",
                    blurb: "A list of alternative strings for a given primary string, typically provided by dictation or autocorrect. Embed in attributed strings via NSAttributedString.Key.textAlternatives so the system can cycle alternatives on double-tap."
                ) {
                    snippet("""
                    class NSTextAlternatives: NSObject, NSSecureCoding
                    init(primaryString: String, alternativeStrings: [String])
                    var primaryString: String { get }
                    var alternativeStrings: [String] { get }

                    // Notification posted when user selects an alternative:
                    static let selectionNotification: NSNotification.Name  // userInfo[\"NSTextAlternativeString\"]
                    """)
                }

                refBlock(
                    name: "NSTextContent",
                    kind: "protocol",
                    availability: "macOS 12.0+",
                    blurb: "Adopted by NSTextField and NSTextView to expose a contentType property that hints to the system about the semantic type of the input (e.g. email address, URL, password). The system uses this to offer appropriate autocomplete."
                ) {
                    snippet("""
                    protocol NSTextContent {
                        var contentType: NSTextContentType? { get set }
                    }
                    // NSTextContentType is a struct wrapping RawValue:
                    extension NSTextContentType {
                        static let username:     NSTextContentType
                        static let password:     NSTextContentType
                        static let emailAddress: NSTextContentType
                        static let URL:          NSTextContentType
                        static let telephoneNumber: NSTextContentType
                        static let oneTimeCode:  NSTextContentType  // macOS 12+
                    }
                    """)
                }
            }
        }
    }

    // MARK: NSTextInsertionIndicator

    private var textInsertionIndicatorSection: some View {
        PageSection("NSTextInsertionIndicator") {
            VStack(alignment: .leading, spacing: 16) {
                block("Text insertion indicator (macOS 14+)") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Live demo: NSTextInsertionIndicator (blinking caret)")
                            .font(.caption).foregroundStyle(.secondary)

                        NSTextInsertionIndicatorDemo()
                            .frame(height: 44)
                            .frame(maxWidth: 120)
                            .padding(12)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        APICallout("let caret = NSTextInsertionIndicator(frame: NSRect(x: 0, y: 0, width: 2, height: 20))")
                        APICallout("caret.displayMode = .automatic   // blinking when view is focused")
                        APICallout("caret.color = .controlAccentColor")
                    }
                }

                refBlock(
                    name: "NSTextInsertionIndicator",
                    kind: "class : NSView",
                    availability: "macOS 14.0+",
                    blurb: "A system-managed blinking text caret for custom text views. Add as a subview of your text canvas and position it at the insertion point. Use displayMode to control when it blinks."
                ) {
                    snippet("""
                    class NSTextInsertionIndicator: NSView  // macOS 14.0+

                    var displayMode: NSTextInsertionIndicator.DisplayMode
                    var color: NSColor               // default = .controlAccentColor
                    var automaticModeOptions: NSTextInsertionIndicator.AutomaticModeOptions

                    // DisplayMode:
                    enum NSTextInsertionIndicator.DisplayMode: Int {
                        case automatic    // blinks when view has focus; hides otherwise
                        case hidden       // always hidden
                        case visible      // always visible (no blinking)
                    }

                    // AutomaticModeOptions (OptionSet):
                    struct NSTextInsertionIndicator.AutomaticModeOptions: OptionSet {
                        static let suppressWhileTracking: AutomaticModeOptions
                        static let suppressWhileCommandIsDown: AutomaticModeOptions
                    }
                    """)
                }
            }
        }
    }

    // MARK: Text Checking

    private var textCheckingSection: some View {
        PageSection("Text Checking") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextCheckingController",
                    kind: "class : NSObject",
                    availability: "macOS 10.15+",
                    blurb: "Coordinates autocorrect, smart quotes, data detection, and grammar checking for a custom text view. The view implements NSTextCheckingClient and passes itself to an NSTextCheckingController."
                ) {
                    snippet("""
                    class NSTextCheckingController: NSObject
                    init(client: NSTextCheckingClient)
                    var client: NSTextCheckingClient { get }

                    // Trigger checks:
                    func didChangeSelectedRange()
                    func didFinishEditing()
                    func insertedText(in range: NSRange)
                    func deleteBackward()
                    func considerTextCheckingForRange(_ range: NSRange)
                    func checkTextInDocument(_ sender: Any?)
                    func checkTextInSelection(_ sender: Any?)

                    // Menu:
                    func menu(for range: NSRange, proposedMenu: NSMenu,
                              for view: NSView, at point: NSPoint) -> NSMenu?
                    """)
                }

                refBlock(
                    name: "NSTextCheckingClient",
                    kind: "protocol : NSTextInputClient",
                    availability: "macOS 10.15+",
                    blurb: "Extends NSTextInputClient with methods for autocorrect and data-detector annotation. Implement in your custom text view and pass self to NSTextCheckingController."
                ) {
                    snippet("""
                    protocol NSTextCheckingClient: NSTextInputClient {
                        func annotatedSubstring(forProposedRange range: NSRange,
                                                actualRange: NSRangePointer?) -> NSAttributedString?
                        func setAnnotations(_ annotations: [NSAttributedString.Key: String],
                                            range: NSRange)
                        func addAnnotations(_ annotations: [NSAttributedString.Key: String],
                                            range: NSRange)
                        func removeAnnotation(_ annotationName: NSAttributedString.Key,
                                              range: NSRange)
                        func replaceCharacters(in range: NSRange, with annotatedString: NSAttributedString)
                        func selectAndShow(_ range: NSRange)
                        func view(for range: NSRange) -> NSView?
                        func candidateListTouchBarItem() -> NSCandidateListTouchBarItem<AnyObject>?
                    }
                    """)
                }

                refBlock(
                    name: "NSTextInputTraits / NSTextInputTraitType",
                    kind: "protocol / struct",
                    availability: "macOS 14.0+",
                    blurb: "NSTextInputTraits declares per-text-field behavior flags: autocorrection, autocapitalization, spell-checking, and smart punctuation. NSTextInputTraitType is the key type for custom trait extensions."
                ) {
                    snippet("""
                    // NSTextInputTraits (macOS 14+):
                    protocol NSTextInputTraits: NSObjectProtocol {
                        var autocorrectionType: NSTextInputTraitType { get set }
                        var spellCheckingType: NSTextInputTraitType { get set }
                        var grammarCheckingType: NSTextInputTraitType { get set }
                        var smartQuotesType: NSTextInputTraitType { get set }
                        var smartDashesType: NSTextInputTraitType { get set }
                        var smartInsertDeleteType: NSTextInputTraitType { get set }
                        var dataDetectionTypes: NSTextCheckingTypes { get set }
                    }
                    // NSTextInputTraitType values:
                    // .default / .no / .yes
                    """)
                }
            }
        }
    }

    // MARK: Spell Checking

    private var spellCheckingSection: some View {
        PageSection("Spell Checking") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSSpellChecker",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "The shared spell-check and grammar-check service. Works with NSTextView automatically; custom views call checkSpelling(of:startingAt:language:wrap:inSpellDocumentWithTag:wordCount:) manually."
                ) {
                    snippet("""
                    class NSSpellChecker: NSObject
                    static var shared: NSSpellChecker

                    // Spell check:
                    func checkSpelling(of stringToCheck: String,
                                       startingAt startingOffset: Int,
                                       language: String?,
                                       wrap wrapFlag: Bool,
                                       inSpellDocumentWithTag tag: Int,
                                       wordCount: UnsafeMutablePointer<Int>?) -> NSRange

                    // Grammar check:
                    func checkGrammar(of stringToCheck: String,
                                      startingAt startingOffset: Int,
                                      language: String?,
                                      wrap wrapFlag: Bool,
                                      inSpellDocumentWithTag tag: Int,
                                      details: AutoreleasingUnsafeMutablePointer<NSArray?>?) -> NSRange

                    // Text-checking pipeline (returns NSTextCheckingResult array):
                    func check(_ stringToCheck: String,
                                offset: Int,
                                types checkingTypes: NSTextCheckingTypes,
                                options: [NSSpellChecker.OptionKey: Any]?,
                                inSpellDocumentWithTag tag: Int,
                                orthography: AutoreleasingUnsafeMutablePointer<NSOrthography?>?,
                                wordCount: UnsafeMutablePointer<Int>?) -> [NSTextCheckingResult]

                    // Unique tag for your document:
                    func uniqueSpellDocumentTag() -> Int
                    func closeSpellDocument(withTag tag: Int)

                    // User corrections:
                    func ignoreWord(_ wordToIgnore: String, inSpellDocumentWithTag tag: Int)
                    func ignoredWords(inSpellDocumentWithTag tag: Int) -> [String]?
                    func learnWord(_ word: String)
                    func unlearnWord(_ word: String)
                    func hasLearnedWord(_ word: String) -> Bool
                    """)
                }

                refBlock(
                    name: "NSChangeSpelling / NSIgnoreMisspelledWords",
                    kind: "informal protocols (action selectors)",
                    availability: "macOS 10.0+",
                    blurb: "Action-method protocols implemented by views that want to receive the 'Change Spelling' and 'Ignore Word' commands from the Spelling panel. NSTextView adopts both automatically."
                ) {
                    snippet("""
                    // NSChangeSpelling — implement to receive corrected word from Spelling panel:
                    @objc func changeSpelling(_ sender: Any?)
                    // sender is the Spelling panel; read the corrected word via:
                    // NSSpellChecker.shared.correction  (deprecated; use panel's wordField instead)

                    // NSIgnoreMisspelledWords — implement to ignore word from Spelling panel:
                    @objc func ignoreSpelling(_ sender: Any?)
                    // Call: NSSpellChecker.shared.ignoreWord(word, inSpellDocumentWithTag: tag)
                    """)
                }
            }
        }
    }

    // MARK: Deprecated

    private var deprecatedSection: some View {
        PageSection("Deprecated") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextInput",
                    kind: "protocol — deprecated",
                    availability: "macOS 10.0+ (deprecated in macOS 10.6)",
                    blurb: "The predecessor to NSTextInputClient. Deprecated in macOS 10.6 — adopt NSTextInputClient instead. Any custom view implementing NSTextInput should be migrated: the two protocols share method names but NSTextInputClient adds markedRange() and characterIndex(for:) which are required for modern input methods."
                ) {
                    snippet("""
                    // DO NOT use NSTextInput in new code.
                    // Migrate to NSTextInputClient:
                    //
                    //   NSTextInput                  →  NSTextInputClient
                    //   insertText(_:)               →  insertText(_:replacementRange:)
                    //   doCommandBySelector(_:)      →  (retained as NSStandardKeyBindingResponding)
                    //   setMarkedText(_:selectedRange:) → setMarkedText(_:selectedRange:replacementRange:)
                    //   firstRectForCharacterRange:  → firstRect(forCharacterRange:actualRange:)
                    //   characterIndexForPoint:      → characterIndex(for:)
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("keyboard", "NSTextInputContext wraps an NSTextInputClient view for input method communication. Activate it on becomeFirstResponder and deactivate on resignFirstResponder.")
                noteRow("text.cursor", "NSTextInsertionIndicator (macOS 14+) replaces the manual caret-drawing pattern. Add it as a subview and position its frame at the insertion point. The system handles blinking and accessibility.")
                noteRow("checkmark.circle", "NSTextCheckingController (macOS 10.15+) handles autocorrect, smart-quotes, and data detection for custom text views without subclassing NSTextView.")
                noteRow("abc", "NSSpellChecker.shared requires a unique tag per document (uniqueSpellDocumentTag()). Close it with closeSpellDocument(withTag:) when the document closes to free spell-check state.")
                noteRow("nosign", "NSTextInput is deprecated since macOS 10.6. New code must implement NSTextInputClient.")
            }
        }
    }

    // MARK: Helpers

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }

    private func refBlock<Content: View>(
        name: String,
        kind: String,
        availability: String,
        blurb: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(name).font(.headline).foregroundStyle(.primary)
                Text(kind).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Spacer()
                Text(availability).font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
            }
            Text(blurb).font(.callout).foregroundStyle(.secondary)
            content()
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }

    private func block<Content: View>(_ title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

extension NSTextDisplayPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.textDisplay.nsTextDisplay",
        title: "Text Display",
        folder: "Text display",
        framework: .appKit,
        absorbedSymbols: [
            "NSTextViewDelegate",
            "NSTextDelegate",
            "NSTextInputContext",
            "NSTextInputClient",
            "NSTextAlternatives",
            "NSTextContent",
            "NSTextInsertionIndicator",
            "NSTextInsertionIndicator.DisplayMode",
            "NSTextInsertionIndicator.AutomaticModeOptions",
            "NSTextCheckingController",
            "NSTextCheckingClient",
            "NSTextInputTraits",
            "NSTextInputTraitType",
            "NSSpellChecker",
            "NSChangeSpelling",
            "NSIgnoreMisspelledWords",
            "NSTextInput"
        ],
        blurb: "Text input protocols, insertion indicators, spell-checking, and text-checking infrastructure that AppKit text views use. Includes NSTextInsertionIndicator (macOS 14+) and NSSpellChecker.",
        signature: "Text display protocol + class family",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/text-display/text-display.md",
        page: { AnyView(NSTextDisplayPage()) }
    )
}

#Preview {
    NSTextDisplayPage().frame(width: 1100, height: 900)
}
