import SwiftUI
import AppKit

// AppKit Views and Controls / Content views reference page.
// Covers: NSTextView (class, inherits NSText) — the front-end of AppKit's
// text system. Handles rich text, attachments, key bindings, spell checking,
// and undo. Always lives inside an NSScrollView for any content beyond a
// single line.
// Source: Documentation/AppKit/views-and-controls/nstextview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSTextView inside an
// NSScrollView pre-populated with a paragraph of seeded rich text. SwiftUI
// controls drive isEditable, isContinuousSpellCheckingEnabled,
// isAutomaticSpellingCorrectionEnabled, and toggle bold / italic on the
// current selection through the text view's typingAttributes.

// MARK: - Bridge

private struct NSTextViewDemo: NSViewRepresentable {
    @Binding var seedTrigger: Int
    var isEditable: Bool
    var spellChecking: Bool
    var autoCorrect: Bool

    func makeNSView(context: Context) -> NSScrollView {
        let scroll = NSTextView.scrollableTextView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.borderType = .lineBorder
        if let textView = scroll.documentView as? NSTextView {
            textView.translatesAutoresizingMaskIntoConstraints = true
            textView.autoresizingMask = [.width]
            textView.allowsUndo = true
            textView.isRichText = true
            textView.usesFontPanel = true
            textView.usesRuler = true
            textView.usesFindBar = true
            textView.font = NSFont.preferredFont(forTextStyle: .body)
            textView.textContainerInset = NSSize(width: 8, height: 8)
            seedRichText(textView)
        }
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let textView = nsView.documentView as? NSTextView else { return }
        textView.isEditable = isEditable
        textView.isSelectable = true
        textView.isContinuousSpellCheckingEnabled = spellChecking
        textView.isAutomaticSpellingCorrectionEnabled = autoCorrect

        if context.coordinator.lastSeed != seedTrigger {
            context.coordinator.lastSeed = seedTrigger
            seedRichText(textView)
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator() }
    final class Coordinator { var lastSeed: Int = 0 }

    private func seedRichText(_ textView: NSTextView) {
        let body = NSFont.preferredFont(forTextStyle: .body)
        let bold = NSFontManager.shared.convert(body, toHaveTrait: .boldFontMask)
        let italic = NSFontManager.shared.convert(body, toHaveTrait: .italicFontMask)

        let attributed = NSMutableAttributedString()
        attributed.append(NSAttributedString(string: "NSTextView ",
                                             attributes: [.font: bold,
                                                          .foregroundColor: NSColor.labelColor]))
        attributed.append(NSAttributedString(string: "is the front-end class to AppKit's ",
                                             attributes: [.font: body,
                                                          .foregroundColor: NSColor.labelColor]))
        attributed.append(NSAttributedString(string: "text system",
                                             attributes: [.font: italic,
                                                          .foregroundColor: NSColor.labelColor]))
        attributed.append(NSAttributedString(string: ". It draws text, handles selection, and supports rich attributes, attachments, key binding, undo, and the spell checker.\n\n",
                                             attributes: [.font: body,
                                                          .foregroundColor: NSColor.labelColor]))
        attributed.append(NSAttributedString(string: "Try ",
                                             attributes: [.font: body,
                                                          .foregroundColor: NSColor.labelColor]))
        attributed.append(NSAttributedString(string: "selecting some text ",
                                             attributes: [.font: bold,
                                                          .foregroundColor: NSColor.labelColor]))
        attributed.append(NSAttributedString(string: "and editing it directly — Cmd-Z undoes, Cmd-F opens the find bar, and the system spell checker lights up while typing if continuous checking is on.",
                                             attributes: [.font: body,
                                                          .foregroundColor: NSColor.labelColor]))

        textView.textStorage?.setAttributedString(attributed)
    }
}

// MARK: - Page

struct NSTextViewPage: View {
    @State private var seedTrigger: Int = 0
    @State private var isEditable: Bool = true
    @State private var spellChecking: Bool = true
    @State private var autoCorrect: Bool = false

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSTextView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that draws text and handles user interactions with that text.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSText \u{00b7} Documentation/AppKit/views-and-controls/nstextview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "Editable rich text inside an NSScrollView") {
            VStack(alignment: .leading, spacing: 12) {
                NSTextViewDemo(
                    seedTrigger: $seedTrigger,
                    isEditable: isEditable,
                    spellChecking: spellChecking,
                    autoCorrect: autoCorrect
                )
                .frame(height: 220)
                .frame(maxWidth: 560)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Toggle("isEditable", isOn: $isEditable).toggleStyle(.checkbox)
                    Toggle("isContinuousSpellCheckingEnabled", isOn: $spellChecking).toggleStyle(.checkbox)
                    Toggle("isAutomaticSpellingCorrectionEnabled", isOn: $autoCorrect).toggleStyle(.checkbox)
                }
                HStack(spacing: 12) {
                    Button("Reset content") { seedTrigger &+= 1 }
                        .controlSize(.regular)
                }

                APICallout("let scroll = NSTextView.scrollableTextView(); let textView = scroll.documentView as! NSTextView")
                APICallout("textView.isRichText = true; textView.allowsUndo = true; textView.usesFindBar = true")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Construction") {
                snippet("""
                // Pre-wrapped in a scroll view, ready for vertical scrolling:
                let scroll = NSTextView.scrollableTextView()
                let textView = scroll.documentView as! NSTextView

                // Plain (single-line, find-bar disabled) variant:
                let plainScroll = NSTextView.scrollablePlainDocumentContentTextView()

                // Manual construction:
                let custom = NSTextView(frame: .zero,
                                        textContainer: NSTextContainer(size: .zero))
                let modern = NSTextView(usingTextLayoutManager: true)
                """)
                Text("scrollableTextView() returns an NSScrollView whose documentView is a fresh NSTextView. Use it for any text view that needs to scroll.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Behavioral attributes") {
                snippet("""
                textView.isEditable = true
                textView.isSelectable = true
                textView.isRichText = true              // false = plain-text only
                textView.importsGraphics = true         // accepts pasted images / NSTextAttachment
                textView.allowsUndo = true
                textView.allowsImageEditing = true
                textView.isFieldEditor = false          // single-line keyboard behavior
                textView.usesAdaptiveColorMappingForDarkAppearance = true
                """)
            }

            Block(title: "Text checking") {
                snippet("""
                textView.isContinuousSpellCheckingEnabled = true
                textView.isAutomaticSpellingCorrectionEnabled = false
                textView.isAutomaticQuoteSubstitutionEnabled = true
                textView.isAutomaticDashSubstitutionEnabled = true
                textView.isAutomaticTextCompletionEnabled = true
                textView.isGrammarCheckingEnabled = false
                textView.isAutomaticLinkDetectionEnabled = true
                """)
            }

            Block(title: "Inspector + ruler + find") {
                snippet("""
                textView.usesFontPanel = true
                textView.usesRuler = true
                textView.isRulerVisible = false
                textView.usesInspectorBar = false
                textView.usesFindPanel = true
                textView.usesFindBar = true            // inline find bar
                textView.isIncrementalSearchingEnabled = true
                """)
            }

            Block(title: "Selection") {
                snippet("""
                textView.setSelectedRange(NSRange(location: 0, length: 5))
                textView.selectedRanges                // -> [NSValue]
                textView.selectionGranularity          // .selectByCharacter | .selectByWord | .selectByParagraph
                textView.selectionAffinity
                textView.insertionPointColor = NSColor.controlAccentColor
                textView.selectedTextAttributes = [.backgroundColor: NSColor.unemphasizedSelectedTextBackgroundColor]
                """)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Text storage") {
                snippet("""
                textView.textStorage?.setAttributedString(attributed)
                textView.textStorage?.replaceCharacters(in: range, with: replacement)
                textView.string = \"replace everything (plain text)\"
                textView.attributedString()           // -> NSAttributedString
                textView.typingAttributes              // attributes applied to next typed char
                """)
            }

            Block(title: "Typing attributes — bold / italic the current selection") {
                snippet("""
                let fm = NSFontManager.shared
                if let current = textView.typingAttributes[.font] as? NSFont {
                    let bolded = fm.convert(current, toHaveTrait: .boldFontMask)
                    textView.typingAttributes[.font] = bolded
                }
                """)
            }

            Block(title: "Notifications") {
                snippet("""
                NSTextView.didChangeSelectionNotification
                NSTextView.didChangeTypingAttributesNotification
                NSText.didBeginEditingNotification
                NSText.didChangeNotification
                NSText.didEndEditingNotification
                """)
            }

            Block(title: "Writing tools (macOS 15+)") {
                snippet("""
                textView.writingToolsBehavior = .complete  // .none, .limited, .complete, .default
                textView.allowedWritingToolsResultOptions = [.plainText, .richText]
                textView.isWritingToolsActive               // -> Bool
                textView.inlinePredictionType = .automatic
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSText. The principal text component in AppKit — handles selection, rich attributes, attachments, key bindings, spell checking, undo, and Writing Tools.")
            noteRow("rectangle.center.inset.filled", "Always live inside an NSScrollView for any multi-line content. The convenience NSTextView.scrollableTextView() returns an NSScrollView pre-wired with a fresh NSTextView as its documentView.")
            noteRow("link", "Driven by NSTextStorage (the model), NSTextLayoutManager / NSLayoutManager (layout), and NSTextContainer (geometry). Apple recommends NSTextLayoutManager (modern) — init(usingTextLayoutManager:) opts in.")
            noteRow("info.circle", "Per Apple: \"if you need only to implement a simple editable text field, see NSTextField.\" Reach for NSTextView when you need rich text, attachments, find bar, ruler, or multi-line behavior.")
            noteRow("clock", "macOS 12+: explicitly calling layoutManager forces the legacy NSLayoutManager path. For modern code, prefer textLayoutManager and let AppKit pick.")
        }
    }

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
}

private struct Block<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    NSTextViewPage().frame(width: 1100, height: 900)
}
