import SwiftUI
import AppKit

// AppKit Views and Controls / Content Views — NSTextView family consolidation.
//
// Absorbed types (all documented inline; individual sidebar leaves removed):
//   NSText, NSTextContainer, NSTextLayoutManager, NSTextContentStorage,
//   NSTextSelection, NSTextFinder, NSTextFinderClient, NSTextFinderBarContainer
//
// EXCLUDED (separate controls): NSTextField, NSSecureTextField
// EXCLUDED (TextKit D7): NSTextStorage, NSLayoutManager
//
// Source: Documentation/AppKit/views-and-controls/nstextview.md

// MARK: - Bridge

private struct NSTextViewBridge: NSViewRepresentable {
    @Binding var seedTrigger: Int
    var isEditable: Bool
    var spellChecking: Bool
    var autoCorrect: Bool

    func makeNSView(context: Context) -> NSScrollView {
        let scroll = NSTextView.scrollableTextView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.borderType = .lineBorder
        if let tv = scroll.documentView as? NSTextView {
            tv.translatesAutoresizingMaskIntoConstraints = true
            tv.autoresizingMask = [.width]
            tv.allowsUndo = true
            tv.isRichText = true
            tv.usesFontPanel = true
            tv.usesRuler = true
            tv.usesFindBar = true
            tv.font = NSFont.preferredFont(forTextStyle: .body)
            tv.textContainerInset = NSSize(width: 8, height: 8)
            seedRichText(tv)
        }
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {
        guard let tv = nsView.documentView as? NSTextView else { return }
        tv.isEditable = isEditable
        tv.isSelectable = true
        tv.isContinuousSpellCheckingEnabled = spellChecking
        tv.isAutomaticSpellingCorrectionEnabled = autoCorrect
        if context.coordinator.lastSeed != seedTrigger {
            context.coordinator.lastSeed = seedTrigger
            seedRichText(tv)
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator() }
    final class Coordinator { var lastSeed: Int = 0 }

    private func seedRichText(_ tv: NSTextView) {
        let body   = NSFont.preferredFont(forTextStyle: .body)
        let bold   = NSFontManager.shared.convert(body, toHaveTrait: .boldFontMask)
        let italic = NSFontManager.shared.convert(body, toHaveTrait: .italicFontMask)
        let m = NSMutableAttributedString()
        func a(_ s: String, _ f: NSFont) {
            m.append(NSAttributedString(string: s, attributes: [.font: f, .foregroundColor: NSColor.labelColor]))
        }
        a("NSTextView ", bold)
        a("is the front-end to AppKit's text system — draws text, handles selection, and supports rich attributes, attachments, key binding, undo, and the spell checker.\n\nTry ", body)
        a("selecting some text ", bold)
        a("and editing it. Cmd-Z undoes, Cmd-F opens the find bar.", body)
        m.append(NSAttributedString(string: "\n\nExample of ", attributes: [.font: body, .foregroundColor: NSColor.labelColor]))
        a("italic text ", italic)
        a("alongside regular body copy.", body)
        tv.textStorage?.setAttributedString(m)
    }
}

// MARK: - Page

struct NSTextViewPage: View {
    @State private var seedTrigger: Int = 0
    @State private var isEditable: Bool = true
    @State private var spellChecking: Bool = true
    @State private var autoCorrect: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                referenceA
                referenceB
                defaultSection
                formattingSection
                selectionSection
                findSection
                editingSection
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
            Text("NSTextView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that draws text and handles user interactions with that text.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSText : NSView \u{00b7} macOS 10.0+ \u{00b7} Documentation/AppKit/views-and-controls/nstextview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Reference A — Abstract base + layout types

    private var referenceA: some View {
        PageSection("Reference — NSText, NSTextContainer, NSTextLayoutManager, NSTextContentStorage, NSTextSelection") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSText",
                    kind: "abstract class",
                    availability: "macOS 10.0+",
                    blurb: "The abstract base for AppKit text-display objects. Defines shared properties (string, isEditable, isSelectable, delegate, font, alignment) and notifications. Never instantiated directly — use NSTextView."
                ) {
                    snippet("""
                    // NSText abstract interface (excerpted):
                    var string: String
                    var isEditable: Bool
                    var isSelectable: Bool
                    var font: NSFont?
                    var alignment: NSTextAlignment
                    var textColor: NSColor?
                    weak var delegate: NSTextDelegate?

                    // Notifications:
                    NSText.didBeginEditingNotification
                    NSText.didChangeNotification
                    NSText.didEndEditingNotification
                    """)
                }

                refBlock(
                    name: "NSTextContainer",
                    kind: "class",
                    availability: "macOS 10.0+",
                    blurb: "Defines the region where text is laid out — its size, line fragment padding, and optional exclusion paths (text flows around shapes). For most scrollable text views the container tracks the view bounds automatically."
                ) {
                    snippet("""
                    let container = NSTextContainer(size: CGSize(width: 400, height: .greatestFiniteMagnitude))
                    container.lineFragmentPadding  = 5       // default 5pt inset on each side
                    container.widthTracksTextView  = true    // resize with the view (default)
                    container.heightTracksTextView = false
                    container.exclusionPaths = [NSBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 80, height: 80))]
                    """)
                }

                refBlock(
                    name: "NSTextLayoutManager",
                    kind: "class",
                    availability: "macOS 12.0+",
                    blurb: "The TextKit 2 layout coordinator. Replaces NSLayoutManager for code that opts in via NSTextView(usingTextLayoutManager:). Performs incremental layout, manages NSTextLayoutFragment objects, and exposes an NSTextViewportLayoutController for visible-range tracking."
                ) {
                    snippet("""
                    // Opt in to TextKit 2:
                    let tv = NSTextView(usingTextLayoutManager: true)
                    let tlm = tv.textLayoutManager     // NSTextLayoutManager?

                    // Enumerate layout fragments:
                    tlm?.enumerateTextLayoutFragments(from: nil, options: []) { fragment in
                        _ = fragment.layoutFragmentFrame
                        return true
                    }

                    // Caution: calling tv.layoutManager on a TextKit-2 view
                    // forces a downgrade to the legacy NSLayoutManager path.
                    """)
                }

                refBlock(
                    name: "NSTextContentStorage",
                    kind: "class : NSTextContentManager",
                    availability: "macOS 12.0+",
                    blurb: "The TextKit 2 backing store. Wraps NSTextStorage and vends NSTextParagraph elements to the layout system. The NSTextContentManager abstraction lets custom backends (large-document streaming) plug into NSTextLayoutManager without NSTextStorage."
                ) {
                    snippet("""
                    let tcs: NSTextContentStorage? = tv.textContentStorage
                    tcs?.textStorage?.append(NSAttributedString(string: " appended"))

                    // Enumerate paragraphs:
                    tcs?.enumerateTextElements(from: nil, options: []) { element in
                        if let para = element as? NSTextParagraph {
                            _ = para.attributedString
                        }
                        return true
                    }
                    """)
                }

                refBlock(
                    name: "NSTextSelection",
                    kind: "class",
                    availability: "macOS 12.0+",
                    blurb: "Represents a selection in TextKit 2 — one or more NSTextRange values, an affinity, and a granularity. Used by NSTextSelectionNavigation for caret movement. Most AppKit text work uses NSTextView.selectedRanges (NSRange-based); NSTextSelection is for custom layout managers."
                ) {
                    snippet("""
                    // NSTextSelection type signatures:
                    init(_ ranges: [NSTextRange], affinity: NSSelectionAffinity, granularity: NSTextSelection.Granularity)
                    var textRanges: [NSTextRange]
                    var affinity: NSSelectionAffinity          // .upstream / .downstream
                    var granularity: NSTextSelection.Granularity // .character / .word / .paragraph / .line / .sentence
                    var isTransient: Bool                       // true during a live mouse-drag selection
                    var anchorPositionOffset: CGFloat
                    """)
                }
            }
        }
    }

    // MARK: Reference B — Find infrastructure

    private var referenceB: some View {
        PageSection("Reference — NSTextFinder, NSTextFinderClient, NSTextFinderBarContainer") {
            VStack(alignment: .leading, spacing: 16) {

                refBlock(
                    name: "NSTextFinder",
                    kind: "class",
                    availability: "macOS 10.7+",
                    blurb: "Controller for Cocoa's standard find bar (Cmd-F). Manages two objects: a client that owns searchable content (NSTextFinderClient) and a container that hosts the bar UI (NSTextFinderBarContainer). NSTextView and NSScrollView already conform — set usesFindBar = true and AppKit instantiates NSTextFinder automatically."
                ) {
                    snippet("""
                    // Simplest adoption — one line:
                    textView.usesFindBar = true      // AppKit owns the NSTextFinder

                    // Manual construction (custom content surfaces):
                    let finder = NSTextFinder()
                    finder.client           = myContentObject    // NSTextFinderClient
                    finder.findBarContainer = myScrollView       // NSTextFinderBarContainer
                    finder.isIncrementalSearchingEnabled = true

                    finder.performAction(.showFindInterface)
                    finder.performAction(.nextMatch)
                    finder.performAction(.replaceAll)
                    let valid = finder.validateAction(.replaceAll)  // Bool

                    // Wire find-menu items via responder chain:
                    // action = performTextFinderAction(_:)
                    // tag    = NSTextFinder.Action.showFindInterface.rawValue
                    """)
                }

                refBlock(
                    name: "NSTextFinderClient",
                    kind: "protocol",
                    availability: "macOS 10.7+",
                    blurb: "Adopted by the object that owns searchable content. NSTextView already conforms. The finder calls string(at:effectiveRange:endsWithSearchBoundary:) to enumerate content and drawCharacters(in:forContentView:) to highlight matches."
                ) {
                    snippet("""
                    // Protocol requirements (excerpted):
                    protocol NSTextFinderClient: AnyObject {
                        var string: String { get }
                        func string(at characterIndex: Int,
                                    effectiveRange outRange: NSRangePointer,
                                    endsWithSearchBoundary: UnsafeMutablePointer<ObjCBool>) -> String
                        var isEditable: Bool { get }
                        var isSelectable: Bool { get }
                        var visibleCharacterRanges: [NSValue] { get }
                        func scrollRangeToVisible(_ range: NSRange)
                        func shouldReplaceCharacters(inRanges ranges: [NSValue],
                                                     with strings: [String]) -> Bool
                        func replaceCharacters(in range: NSRange, with string: String)
                        func didReplaceCharacters()
                    }
                    """)
                }

                refBlock(
                    name: "NSTextFinderBarContainer",
                    kind: "protocol",
                    availability: "macOS 10.7+",
                    blurb: "Adopted by the view that hosts the find bar UI — NSScrollView already conforms. The finder sets findBarView when the bar is shown; the container lays it above or below the document. NSScrollView.findBarPosition controls placement."
                ) {
                    snippet("""
                    // Protocol requirements (excerpted):
                    protocol NSTextFinderBarContainer: AnyObject {
                        var findBarView: NSView? { get set }
                        var isFindBarVisible: Bool { get set }
                        func findBarViewDidChangeHeight()
                        // Optional:
                        var contentView: NSView? { get }
                    }

                    // NSScrollView:
                    scrollView.findBarPosition = .aboveHorizontalRuler  // default
                    """)
                }
            }
        }
    }

    // MARK: Default

    private var defaultSection: some View {
        PageSection("Default — NSTextView") {
            VStack(alignment: .leading, spacing: 16) {
                block("Editable rich text inside an NSScrollView") {
                    VStack(alignment: .leading, spacing: 12) {
                        NSTextViewBridge(
                            seedTrigger: $seedTrigger,
                            isEditable: isEditable,
                            spellChecking: spellChecking,
                            autoCorrect: autoCorrect
                        )
                        .frame(height: 220)
                        .frame(maxWidth: 560)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        HStack(spacing: 16) {
                            Toggle("isEditable", isOn: $isEditable).toggleStyle(.checkbox)
                            Toggle("isContinuousSpellCheckingEnabled", isOn: $spellChecking).toggleStyle(.checkbox)
                            Toggle("isAutomaticSpellingCorrectionEnabled", isOn: $autoCorrect).toggleStyle(.checkbox)
                        }
                        Button("Reset content") { seedTrigger &+= 1 }.controlSize(.regular)

                        APICallout("let scroll = NSTextView.scrollableTextView()")
                        APICallout("let tv = scroll.documentView as! NSTextView")
                        APICallout("tv.isRichText = true; tv.allowsUndo = true; tv.usesFindBar = true")
                    }
                }

                block("Construction") {
                    snippet("""
                    // Wrapped in NSScrollView — the standard configuration:
                    let scroll = NSTextView.scrollableTextView()
                    let tv = scroll.documentView as! NSTextView

                    // Plain (find-bar disabled) variant:
                    let plain = NSTextView.scrollablePlainDocumentContentTextView()

                    // Manual construction:
                    let custom = NSTextView(frame: .zero,
                                            textContainer: NSTextContainer(size: .zero))

                    // Opt in to TextKit 2 layout:
                    let modern = NSTextView(usingTextLayoutManager: true)
                    """)
                }
            }
        }
    }

    // MARK: Text Formatting

    private var formattingSection: some View {
        PageSection("Text Formatting") {
            VStack(alignment: .leading, spacing: 16) {
                block("Font, color, and paragraph style via NSTextStorage") {
                    snippet("""
                    guard let storage = tv.textStorage else { return }
                    let range = NSRange(location: 0, length: storage.length)

                    // Apply font:
                    let body = NSFont.preferredFont(forTextStyle: .body)
                    let bold = NSFontManager.shared.convert(body, toHaveTrait: .boldFontMask)
                    storage.addAttribute(.font, value: bold, range: range)

                    // Apply color (semantic tokens — no hex literals):
                    storage.addAttribute(.foregroundColor, value: NSColor.labelColor, range: range)

                    // Apply paragraph style:
                    let style = NSMutableParagraphStyle()
                    style.lineSpacing = 4
                    style.paragraphSpacing = 8
                    style.alignment = .left
                    storage.addAttribute(.paragraphStyle, value: style, range: range)

                    // Typing attributes (applied to next typed character):
                    tv.typingAttributes[.font] = bold
                    tv.typingAttributes[.foregroundColor] = NSColor.controlAccentColor
                    """)
                }

                block("isRichText, graphics, and dark-mode adaptation") {
                    snippet("""
                    tv.isRichText = true           // accepts NSAttributedString with multiple attributes
                    tv.isRichText = false          // strips attributes; plain String only
                    tv.importsGraphics = true      // allows pasted images / NSTextAttachment
                    tv.allowsImageEditing = true   // user can resize pasted images inline
                    tv.usesAdaptiveColorMappingForDarkAppearance = true  // auto-adapts doc colors for dark mode
                    """)
                }
            }
        }
    }

    // MARK: Selection and Ranges

    private var selectionSection: some View {
        PageSection("Selection and Ranges") {
            VStack(alignment: .leading, spacing: 16) {
                block("Reading and setting the selection") {
                    snippet("""
                    // Set selection:
                    tv.setSelectedRange(NSRange(location: 0, length: 5))

                    // Multi-range selection (multiple insertion points):
                    tv.selectedRanges = [NSValue(range: NSRange(location: 0, length: 5)),
                                         NSValue(range: NSRange(location: 20, length: 3))]

                    // Read:
                    let range = tv.selectedRange()     // NSRange (first range)
                    let ranges = tv.selectedRanges     // [NSValue] all ranges

                    // Granularity:
                    tv.selectionGranularity            // .selectByCharacter / .selectByWord / .selectByParagraph

                    // Scroll selection into view:
                    tv.scrollRangeToVisible(tv.selectedRange())
                    """)
                }

                block("Caret and selection appearance") {
                    snippet("""
                    tv.insertionPointColor = NSColor.controlAccentColor
                    tv.selectedTextAttributes = [
                        .backgroundColor: NSColor.unemphasizedSelectedTextBackgroundColor,
                        .foregroundColor: NSColor.selectedTextColor
                    ]
                    tv.markedTextAttributes = [.backgroundColor: NSColor.findHighlightColor]
                    """)
                }

                block("Notifications") {
                    snippet("""
                    NSTextView.didChangeSelectionNotification
                    NSTextView.didChangeTypingAttributesNotification
                    NSText.didBeginEditingNotification
                    NSText.didChangeNotification
                    NSText.didEndEditingNotification
                    """)
                }
            }
        }
    }

    // MARK: Find & Replace

    private var findSection: some View {
        PageSection("Find & Replace") {
            VStack(alignment: .leading, spacing: 16) {
                block("usesFindBar and incremental search") {
                    snippet("""
                    // Enable the inline find bar (Cmd-F):
                    tv.usesFindBar = true

                    // Highlight all matches as user types:
                    tv.isIncrementalSearchingEnabled = true

                    // Legacy floating find panel (mutually exclusive with usesFindBar):
                    tv.usesFindPanel = true

                    // Find bar placement on the owning NSScrollView:
                    scrollView.findBarPosition = .aboveHorizontalRuler  // default
                    """)
                }

                block("NSTextFinder — manual wiring for custom content surfaces") {
                    snippet("""
                    let finder = NSTextFinder()
                    finder.client           = mySearchableObject   // NSTextFinderClient
                    finder.findBarContainer = myScrollView         // NSTextFinderBarContainer
                    finder.isIncrementalSearchingEnabled = true

                    // Wire menu items (set action = performTextFinderAction(_:)):
                    menuItem.tag = NSTextFinder.Action.showFindInterface.rawValue
                    menuItem.tag = NSTextFinder.Action.nextMatch.rawValue
                    menuItem.tag = NSTextFinder.Action.replaceAll.rawValue
                    """)
                }
            }
        }
    }

    // MARK: Editing

    private var editingSection: some View {
        PageSection("Editing") {
            VStack(alignment: .leading, spacing: 16) {
                block("Editability and field-editor mode") {
                    snippet("""
                    tv.isEditable   = true    // user can type and modify content
                    tv.isSelectable = true    // user can select text (required for copy)
                    tv.isFieldEditor = false  // true = single-line keyboard behavior (Tab, Return exit)
                                              // field editors are reused by NSWindow; use sparingly
                    """)
                }

                block("Undo and auto-substitution") {
                    snippet("""
                    tv.allowsUndo = true
                    tv.isAutomaticQuoteSubstitutionEnabled = true   // " " → " "
                    tv.isAutomaticDashSubstitutionEnabled  = true   // -- → —
                    tv.isAutomaticTextCompletionEnabled    = true   // inline completion
                    tv.isAutomaticLinkDetectionEnabled     = true   // URL auto-link
                    tv.isGrammarCheckingEnabled            = false
                    tv.isContinuousSpellCheckingEnabled    = true
                    tv.isAutomaticSpellingCorrectionEnabled = false
                    """)
                }

                block("Writing Tools (macOS 15+)") {
                    snippet("""
                    tv.writingToolsBehavior = .complete     // .none / .limited / .complete / .default
                    tv.allowedWritingToolsResultOptions = [.plainText, .richText]
                    tv.isWritingToolsActive                 // -> Bool (read-only)
                    tv.inlinePredictionType = .automatic
                    """)
                }

                block("Inspector and ruler accessories") {
                    snippet("""
                    tv.usesFontPanel    = true
                    tv.usesRuler        = true
                    tv.isRulerVisible   = false
                    tv.usesInspectorBar = false   // macOS 10.14+; bar above the ruler
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("doc.text", "NSTextView inherits NSText (abstract). The TextKit 2 system: NSTextContentStorage (model) → NSTextLayoutManager (layout) → NSTextContainer (geometry) → NSTextView (rendering). Prefer TextKit 2 (init(usingTextLayoutManager:)) for new code.")
                noteRow("rectangle.center.inset.filled", "Always live inside an NSScrollView for multi-line content. NSTextView.scrollableTextView() returns a pre-wired pair.")
                noteRow("magnifyingglass", "Find bar: set usesFindBar = true — AppKit owns NSTextFinder automatically. For custom (non-NSTextView) surfaces, construct NSTextFinder manually and wire NSTextFinderClient and NSTextFinderBarContainer.")
                noteRow("info.circle", "Per Apple: \"if you only need a simple editable text field, see NSTextField.\" Use NSTextView for rich text, attachments, find bar, ruler, and undo-aware multi-line editing.")
                noteRow("clock", "Calling tv.layoutManager on a TextKit 2 view forces a downgrade to the legacy NSLayoutManager path. Avoid in new code — use tv.textLayoutManager instead.")
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

extension NSTextViewPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsTextView",
        title: "NSTextView",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSTextView",
            "NSText",
            "NSTextContainer",
            "NSTextLayoutManager",
            "NSTextContentStorage",
            "NSTextSelection",
            "NSTextFinder",
            "NSTextFinderClient",
            "NSTextFinderBarContainer"
        ],
        blurb: "The front-end to AppKit's text system: rich-text editing, selection, finding, attachments, key bindings, undo, and spell-checking. Wraps the TextKit 2 stack (NSTextLayoutManager + NSTextContentStorage).",
        signature: "class NSTextView : NSText",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/views-and-controls/nstextview.md",
        page: { AnyView(NSTextViewPage()) }
    )
}

#Preview {
    NSTextViewPage().frame(width: 1100, height: 900)
}
