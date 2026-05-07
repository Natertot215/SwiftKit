import SwiftUI
import AppKit

// AppKit TextKit — comprehensive reference for TextKit 2 and TextKit 1 types.
//
// Absorbed leaves:
//   TextKit 1:  NSTextStorage, NSLayoutManager, NSATSTypesetter, NSTypesetter
//   TextKit 2:  NSTextContentManager, NSTextLayoutFragment, NSTextLineFragment,
//               NSTextViewportLayoutController, NSTextLayoutOrientationProvider,
//               NSTextParagraph, NSTextListElement, NSTextElement, NSTextElementProvider,
//               NSTextRange, NSTextSelectionNavigation, NSTextLocation
//   Attachments: NSTextAttachment, NSTextAttachmentViewProvider, NSAdaptiveImageGlyph,
//               NSTextAttachmentContainer, NSTextAttachmentLayout, NSTextAttachmentCell,
//               NSTextAttachmentCellProtocol
//   Formatting:  NSParagraphStyle, NSMutableParagraphStyle, NSTextTab, NSTextList,
//               NSTextTable, NSTextTableBlock, NSTextBlock
//   Glyphs:      NSGlyph, NSGlyphStorage, NSGlyphGenerator, NSGlyphInfo,
//               NSControlGlyph, NSNullGlyph, NSFontRenderingMode, Reserved Glyph Codes

// MARK: - Page

struct NSTextKitPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                architectureSection
                textKit2Section
                contentElementsSection
                locationAndSelectionSection
                layoutSection
                attachmentsSection
                formattingSection
                textKit1Section
                glyphsSection
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
            Text("TextKit")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Apple's text layout and rendering engine. TextKit 2 (macOS 12+) provides a modern protocol-based architecture. TextKit 1 provides NSLayoutManager-based layout for legacy usage.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} TextKit 2 requires macOS 12.0+ \u{00b7} TextKit 1 available from macOS 10.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Architecture

    private var architectureSection: some View {
        PageSection("Reference \u{2014} TextKit Architecture") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "TextKit 2 Stack",
                    kind: "protocol-based architecture",
                    availability: "macOS 12.0+",
                    blurb: "TextKit 2 separates concerns across protocols: content storage, layout, viewport clipping, and element representation. NSTextView adopts the new stack automatically on macOS 12+ while maintaining TextKit 1 fallback."
                ) {
                    snippet("""
                    // TextKit 2 stack (macOS 12+):
                    NSTextContentStorage        // NSTextContentManager impl; owns NSTextStorage
                      └─ NSTextContentManager   // protocol — content lifecycle
                    NSTextLayoutManager         // layout + selection
                      └─ NSTextViewportLayoutController  // clips to visible area
                    NSTextContainer             // geometry

                    // Obtain from NSTextView:
                    let tlm  = textView.textLayoutManager     // NSTextLayoutManager?
                    let tcs  = textView.textContentStorage    // NSTextContentStorage?
                    """)
                }

                refBlock(
                    name: "TextKit 1 Stack",
                    kind: "class-based (legacy)",
                    availability: "macOS 10.0+",
                    blurb: "TextKit 1 is still fully supported but new code should target TextKit 2 protocols. Access via textView.layoutManager (non-nil when TextKit 1 is active)."
                ) {
                    snippet("""
                    // TextKit 1 stack:
                    NSTextStorage    // mutable attributed string subclass
                      └─ NSLayoutManager         // layout + glyph generation
                         └─ NSTextContainer       // geometry
                    // Obtain from NSTextView:
                    let lm = textView.layoutManager   // NSLayoutManager? (nil if TK2 active)
                    let ts = textView.textStorage     // NSTextStorage?
                    """)
                }
            }
        }
    }

    // MARK: TextKit 2

    private var textKit2Section: some View {
        PageSection("TextKit 2 \u{2014} NSTextContentManager / NSTextContentStorage") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextContentManager",
                    kind: "protocol : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "Manages a set of NSTextElement objects representing the document's content. Coordinates with NSTextLayoutManager to supply elements for layout. NSTextContentStorage is the concrete implementation used by NSTextView."
                ) {
                    snippet("""
                    protocol NSTextContentManager: NSObject
                    var textStorage: NSTextStorage? { get set }
                    func textElements(for range: NSTextRange) -> [NSTextElement]
                    func location(_ location: NSTextLocation, offsetBy offset: Int) -> NSTextLocation?
                    func offset(from: NSTextLocation, to: NSTextLocation) -> Int
                    func addTextLayoutManager(_ textLayoutManager: NSTextLayoutManager)
                    func removeTextLayoutManager(_ textLayoutManager: NSTextLayoutManager)
                    var documentRange: NSTextRange { get }

                    // NSTextContentStorage (concrete class):
                    class NSTextContentStorage: NSObject, NSTextContentManager
                    var attributedString: NSAttributedString? { get set }
                    func textElement(for range: NSRange) -> NSTextParagraph?
                    """)
                }

                refBlock(
                    name: "NSTextLayoutManager",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "Coordinates layout of text content from an NSTextContentManager across one or more NSTextContainer objects. Replaces NSLayoutManager in TextKit 2."
                ) {
                    snippet("""
                    class NSTextLayoutManager: NSObject
                    var textContentManager: NSTextContentManager? { get }
                    var textContainer: NSTextContainer? { get set }
                    var textViewportLayoutController: NSTextViewportLayoutController { get }
                    var usesHyphenation: Bool
                    var usesFontLeading: Bool
                    var allowsNonContiguousLayout: Bool

                    // Enumerate layout fragments in a given range:
                    func enumerateTextLayoutFragments(
                        from location: NSTextLocation?,
                        options: NSTextLayoutFragment.EnumerationOptions,
                        using block: (NSTextLayoutFragment) -> Bool
                    )

                    // Selection:
                    var textSelections: [NSTextSelection]
                    func setSelectionRange(_ range: NSTextRange, affinity: NSSelectionAffinity)
                    """)
                }
            }
        }
    }

    // MARK: Content Elements

    private var contentElementsSection: some View {
        PageSection("TextKit 2 \u{2014} Content Elements") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextElement",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "Base class for a unit of text content. NSTextParagraph and NSTextListElement are the concrete subclasses. Elements form a tree owned by an NSTextContentManager."
                ) {
                    snippet("""
                    class NSTextElement: NSObject
                    var textContentManager: NSTextContentManager? { get }
                    var elementRange: NSTextRange? { get }
                    var childElements: [NSTextElement] { get }
                    var parentElement: NSTextElement? { get }

                    // NSTextParagraph:
                    class NSTextParagraph: NSTextElement
                    var attributedString: NSAttributedString { get }   // immutable snapshot

                    // NSTextListElement (macOS 13+):
                    class NSTextListElement: NSTextElement
                    var textList: NSTextList { get }
                    var contents: NSAttributedString { get }
                    var markerAttributes: [NSAttributedString.Key: Any] { get }
                    """)
                }

                refBlock(
                    name: "NSTextElementProvider",
                    kind: "protocol",
                    availability: "macOS 12.0+",
                    blurb: "Protocol adopted by NSTextContentManager. Provides NSTextElement objects for a given range. Custom content managers must implement this to supply content for layout."
                ) {
                    snippet("""
                    protocol NSTextElementProvider {
                        var documentRange: NSTextRange { get }
                        func textElements(for range: NSTextRange) -> [NSTextElement]
                        func location(_ location: NSTextLocation, offsetBy offset: Int) -> NSTextLocation?
                        func offset(from: NSTextLocation, to: NSTextLocation) -> Int
                        func adjustedRange(from range: NSTextRange, forEditingTextSelection isEditing: Bool) -> NSTextRange?
                    }
                    """)
                }
            }
        }
    }

    // MARK: Location and Selection

    private var locationAndSelectionSection: some View {
        PageSection("TextKit 2 \u{2014} Location, Range, and Selection") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextLocation",
                    kind: "protocol",
                    availability: "macOS 12.0+",
                    blurb: "An opaque position within a text document. Compare locations using NSTextContentManager.offset(from:to:). Do not assume the location is an integer index — implementations vary."
                ) {
                    snippet("""
                    protocol NSTextLocation: NSObject
                    // NSTextContentStorage provides NSTextLocation backed by NSRange.location

                    // Move a location forward by n characters:
                    let loc2 = contentManager.location(loc1, offsetBy: n)
                    // Distance between two locations:
                    let dist = contentManager.offset(from: start, to: end)
                    """)
                }

                refBlock(
                    name: "NSTextRange",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "A half-open range [location, endLocation) within a document. The endLocation is exclusive. Use NSTextContentManager to create compatible NSTextLocation values."
                ) {
                    snippet("""
                    class NSTextRange: NSObject
                    init(location: NSTextLocation)           // empty range (zero length)
                    init(location: NSTextLocation, end: NSTextLocation)
                    var location: NSTextLocation             // start (inclusive)
                    var endLocation: NSTextLocation          // end (exclusive)
                    var isEmpty: Bool
                    func contains(_ location: NSTextLocation) -> Bool
                    func intersects(with range: NSTextRange) -> Bool
                    """)
                }

                refBlock(
                    name: "NSTextSelectionNavigation",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "Produces the next selection given a current selection and a navigation direction. Used by NSTextView to implement arrow keys, word selection, and line selection."
                ) {
                    snippet("""
                    class NSTextSelectionNavigation: NSObject
                    init(dataSource: NSTextSelectionDataSource)
                    var allowsNonContiguousRanges: Bool
                    var rotatesCoordinateSystemForLayoutOrientation: Bool

                    func destinationSelection(
                        for selection: NSTextSelection,
                        direction: NSTextSelection.NavigationDirection,
                        destination: NSTextSelection.Granularity,
                        extending: Bool,
                        confined: Bool
                    ) -> NSTextSelection?

                    func textSelections(interactingAt point: CGPoint,
                        inContainerAt location: NSTextLocation,
                        anchors: [NSTextSelection],
                        modifiers: NSTextSelectionNavigation.Modifier,
                        selecting: Bool,
                        bounds: CGRect) -> [NSTextSelection]
                    """)
                }
            }
        }
    }

    // MARK: Layout

    private var layoutSection: some View {
        PageSection("TextKit 2 \u{2014} Layout Fragments and Viewport") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextLayoutFragment",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "Represents a single paragraph or layout unit. Provides the rendered bounds, line fragments (NSTextLineFragment), and drawing support. Enumerate via NSTextLayoutManager."
                ) {
                    snippet("""
                    class NSTextLayoutFragment: NSObject
                    var textElement: NSTextElement? { get }
                    var rangeInElement: NSTextRange { get }
                    var textLineFragments: [NSTextLineFragment] { get }
                    var layoutFragmentFrame: CGRect { get }
                    var renderingSurfaceBounds: CGRect { get }
                    var leadingPadding: CGFloat { get }
                    var trailingPadding: CGFloat { get }
                    var topMargin: CGFloat { get }
                    var bottomMargin: CGFloat { get }
                    func draw(at point: CGPoint, in context: CGContext)
                    """)
                }

                refBlock(
                    name: "NSTextLineFragment",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "A single line of rendered text within an NSTextLayoutFragment. Contains the attributed string slice and its typographic bounds."
                ) {
                    snippet("""
                    class NSTextLineFragment: NSObject
                    var attributedString: NSAttributedString { get }
                    var characterRange: NSRange { get }
                    var typographicBounds: CGRect { get }     // relative to layout fragment
                    var glyphOrigin: CGPoint { get }
                    func fractionOfDistanceThroughGlyph(for point: CGPoint) -> CGFloat
                    func locationForCharacter(at index: String.Index) -> CGPoint
                    func characterIndex(for point: CGPoint) -> String.Index?
                    """)
                }

                refBlock(
                    name: "NSTextViewportLayoutController",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "Manages incremental layout for the visible viewport. Calls its delegate to notify about layout fragment positions, enabling efficient scrolling without full-document layout."
                ) {
                    snippet("""
                    class NSTextViewportLayoutController: NSObject
                    var textLayoutManager: NSTextLayoutManager? { get }
                    var delegate: NSTextViewportLayoutControllerDelegate? { get set }
                    var viewportBounds: CGRect { get set }   // set to the visible rect
                    var viewportRange: NSTextRange? { get }

                    func layoutViewport()    // call on scroll or resize
                    func relocateViewport(to position: CGFloat)  // programmatic scroll
                    func adjustViewport(byVerticalOffset offset: CGFloat)

                    // Delegate:
                    protocol NSTextViewportLayoutControllerDelegate: AnyObject {
                        func viewportBounds(for: NSTextViewportLayoutController) -> CGRect
                        func textViewportLayoutController(_:configureRenderingSurface: NSView, for: NSTextLayoutFragment)
                    }
                    """)
                }

                refBlock(
                    name: "NSTextLayoutOrientationProvider",
                    kind: "protocol",
                    availability: "macOS 10.0+",
                    blurb: "Adopted by NSTextContainer and NSTextView to declare the writing direction and layout orientation. Controls whether text flows top-to-bottom or right-to-left."
                ) {
                    snippet("""
                    protocol NSTextLayoutOrientationProvider {
                        var layoutOrientation: NSLayoutManager.TextLayoutOrientation { get }
                    }
                    // NSLayoutManager.TextLayoutOrientation:
                    //   .horizontal   — left-to-right, top-to-bottom
                    //   .vertical     — top-to-bottom, right-to-left (CJK vertical)
                    """)
                }
            }
        }
    }

    // MARK: Attachments

    private var attachmentsSection: some View {
        PageSection("Attachments") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextAttachment",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Represents a file attachment embedded in attributed text. On macOS 12+, the attachmentViewProvider property provides SwiftUI/AppKit view rendering. On older targets, use the fileWrapper and image properties."
                ) {
                    snippet("""
                    class NSTextAttachment: NSObject, NSTextAttachmentContainer, NSTextAttachmentLayout

                    // File-based:
                    init(fileWrapper: FileWrapper?)
                    init(data contentData: Data?, ofType uti: String?)

                    // Image-based shorthand:
                    init(image: NSImage)

                    // TextKit 2 view provider (macOS 12+):
                    var attachmentViewProvider: NSTextAttachmentViewProvider?

                    // TextKit 1 rendering:
                    var image: NSImage?
                    var bounds: CGRect
                    var fileWrapper: FileWrapper?
                    """)
                }

                refBlock(
                    name: "NSTextAttachmentViewProvider",
                    kind: "class : NSObject",
                    availability: "macOS 12.0+",
                    blurb: "Provides an NSView to render an attachment in a TextKit 2 layout. Subclass and override loadView() to return your custom view. Register your subclass with NSTextAttachment."
                ) {
                    snippet("""
                    class NSTextAttachmentViewProvider: NSObject
                    init(textAttachment: NSTextAttachment,
                         parentView: NSView?,
                         textLayoutManager: NSTextLayoutManager?,
                         location: NSTextLocation)

                    var textAttachment: NSTextAttachment? { get }
                    var textLayoutManager: NSTextLayoutManager? { get }
                    var location: NSTextLocation { get }
                    var view: NSView? { get set }
                    var tracksTextAttachmentViewBounds: Bool { get set }

                    func loadView()    // override to set self.view
                    func attachmentBounds(for attributes: [NSAttributedString.Key: Any],
                                          location: NSTextLocation,
                                          textContainer: NSTextContainer?,
                                          proposedLineFragment: CGRect,
                                          position: CGPoint) -> CGRect
                    """)
                }

                refBlock(
                    name: "NSAdaptiveImageGlyph",
                    kind: "class : NSObject",
                    availability: "macOS 15.0+",
                    blurb: "An image that adapts its size to fit inline text metrics (cap-height, baseline, x-height). Intended for emoji-like inline images that scale with font size. Embed in attributed strings via NSAttributedString.Key.adaptiveImageGlyph."
                ) {
                    snippet("""
                    class NSAdaptiveImageGlyph: NSObject, NSCopying, NSSecureCoding
                    init(imageData: Data)
                    var imageData: Data { get }
                    var contentIdentifier: String { get }  // uniqueness key

                    // Embed in attributed string:
                    let key = NSAttributedString.Key.adaptiveImageGlyph   // macOS 15+
                    let attrs: [NSAttributedString.Key: Any] = [key: myGlyph]
                    let str = NSAttributedString(string: "\u{FFFC}", attributes: attrs)
                    """)
                }
            }
        }
    }

    // MARK: Formatting

    private var formattingSection: some View {
        PageSection("Formatting and Attributes") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSParagraphStyle / NSMutableParagraphStyle",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Encodes paragraph-level formatting: alignment, line spacing, indents, tab stops, hyphenation, and line break mode. Embed via NSAttributedString.Key.paragraphStyle."
                ) {
                    snippet("""
                    // Read-only (use NSMutableParagraphStyle to configure):
                    class NSParagraphStyle: NSObject, NSCopying, NSMutableCopying, NSSecureCoding

                    let style = NSMutableParagraphStyle()
                    style.alignment            = .natural    // .left / .right / .center / .justified
                    style.lineSpacing          = 4           // extra space between lines (points)
                    style.lineHeightMultiple   = 1.2
                    style.minimumLineHeight    = 16
                    style.maximumLineHeight    = 0           // 0 = unconstrained
                    style.firstLineHeadIndent  = 20          // indent of first line
                    style.headIndent           = 20          // indent of remaining lines
                    style.tailIndent           = 0           // 0 = clip at container right edge
                    style.paragraphSpacing     = 8           // space after paragraph
                    style.paragraphSpacingBefore = 4         // space before paragraph
                    style.hyphenationFactor    = 0.9         // 0–1; higher = more hyphenation
                    style.lineBreakMode        = .byWordWrapping
                    style.lineBreakStrategy    = .pushOut
                    style.usesDefaultHyphenation = true      // macOS 13+

                    // Tab stops:
                    style.tabStops = [
                        NSTextTab(textAlignment: .left,  location: 64),
                        NSTextTab(textAlignment: .right, location: 256),
                    ]
                    style.defaultTabInterval = 36
                    """)
                }

                refBlock(
                    name: "NSTextTab",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "A single tab stop embedded in NSParagraphStyle.tabStops. Specifies the tab position and text alignment at that stop."
                ) {
                    snippet("""
                    class NSTextTab: NSObject, NSCopying, NSSecureCoding
                    init(textAlignment: NSTextAlignment, location: CGFloat,
                         options: [NSTextTab.OptionKey: Any] = [:])
                    var alignment: NSTextAlignment { get }
                    var location: CGFloat { get }           // points from left margin
                    var options: [NSTextTab.OptionKey: Any] { get }

                    // Common alignments: .left / .right / .center / .decimal / .natural
                    """)
                }

                refBlock(
                    name: "NSTextList",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Describes a bulleted or numbered list embedded in attributed text. Paired with NSParagraphStyle.textLists to define list nesting levels."
                ) {
                    snippet("""
                    class NSTextList: NSObject, NSSecureCoding
                    init(markerFormat: NSTextList.MarkerFormat, options: Int = 0)

                    // Common marker formats:
                    NSTextList.MarkerFormat.decimal         // 1, 2, 3 ...
                    NSTextList.MarkerFormat.lowerAlpha      // a, b, c ...
                    NSTextList.MarkerFormat.disc            // filled circle bullet
                    NSTextList.MarkerFormat.circle          // outline circle
                    NSTextList.MarkerFormat.square          // filled square

                    var markerFormat: NSTextList.MarkerFormat { get }
                    var listOptions: NSTextList.Options      // includes .prepentsMarker
                    var startingItemNumber: Int { get set }

                    func marker(forItemNumber itemNumber: Int) -> String
                    """)
                }

                refBlock(
                    name: "NSTextTable / NSTextTableBlock",
                    kind: "classes : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Represents an inline text table. NSTextTable defines the number of columns and overall table layout. NSTextTableBlock represents a single cell, with its column, row, colspan, and rowspan."
                ) {
                    snippet("""
                    // NSTextTable:
                    class NSTextTable: NSTextBlock
                    var numberOfColumns: Int { get set }
                    var layoutAlgorithm: NSTextTable.LayoutAlgorithm  // .automatic / .fixed
                    var collapsesBorders: Bool
                    var hidesEmptyCells: Bool

                    // NSTextTableBlock:
                    class NSTextTableBlock: NSTextBlock
                    init(table: NSTextTable,
                         startingRow: Int, rowSpan: Int,
                         startingColumn: Int, columnSpan: Int)
                    var table: NSTextTable { get }
                    var startingColumn: Int { get }
                    var columnSpan: Int { get }
                    var startingRow: Int { get }
                    var rowSpan: Int { get }

                    // NSTextBlock (base for table and table block):
                    class NSTextBlock: NSObject, NSSecureCoding, NSCopying
                    func setValue(_ value: CGFloat, type: NSTextBlock.ValueType,
                                  for dimension: NSTextBlock.Dimension)
                    func setBackgroundColor(_ color: NSColor?)
                    func setBorderColor(_ color: NSColor?)
                    """)
                }
            }
        }
    }

    // MARK: TextKit 1

    private var textKit1Section: some View {
        PageSection("TextKit 1 \u{2014} NSTextStorage / NSLayoutManager / NSTypesetter") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextStorage",
                    kind: "class : NSMutableAttributedString",
                    availability: "macOS 10.0+",
                    blurb: "The root of a TextKit 1 stack. A mutable attributed string that notifies registered NSLayoutManager instances of changes so they can re-layout affected text."
                ) {
                    snippet("""
                    class NSTextStorage: NSMutableAttributedString

                    // Register layout managers:
                    func addLayoutManager(_ aLayoutManager: NSLayoutManager)
                    func removeLayoutManager(_ aLayoutManager: NSLayoutManager)
                    var layoutManagers: [NSLayoutManager]

                    // Edit with coalesced change notifications:
                    func beginEditing()
                    func endEditing()    // triggers processEditing()

                    // Override point for subclasses:
                    func processEditing()
                    var changeInLength: Int { get }
                    var editedMask: NSTextStorageEditActions { get }
                    var editedRange: NSRange { get }

                    // Delegate:
                    var delegate: NSTextStorageDelegate? { get set }
                    """)
                }

                refBlock(
                    name: "NSLayoutManager",
                    kind: "class : NSObject",
                    availability: "macOS 10.7+",
                    blurb: "Manages glyph generation and layout for a TextKit 1 stack. Replaces the older NSTypesetter approach with a unified pipeline: NSTextStorage → NSLayoutManager → NSTextContainer → screen."
                ) {
                    snippet("""
                    class NSLayoutManager: NSObject, NSSecureCoding

                    // Connect the stack:
                    var textStorage: NSTextStorage? { get }
                    func addTextContainer(_ container: NSTextContainer)
                    var textContainers: [NSTextContainer]

                    // Glyph generation:
                    var glyphGenerator: NSGlyphGenerator
                    var typesetter: NSTypesetter

                    // Layout queries (trigger layout if needed):
                    func glyphRange(forCharacterRange charRange: NSRange, actualCharacterRange: NSRangePointer?) -> NSRange
                    func characterRange(forGlyphRange glyphRange: NSRange, actualGlyphRange: NSRangePointer?) -> NSRange
                    func boundingRect(forGlyphRange glyphRange: NSRange, in container: NSTextContainer) -> CGRect
                    func lineFragmentRect(forGlyphAt glyphIndex: Int, effectiveRange effectiveGlyphRange: NSRangePointer?) -> CGRect
                    func glyphIndex(for point: CGPoint, in container: NSTextContainer) -> Int
                    func characterIndex(for point: CGPoint, in container: NSTextContainer, fractionOfDistanceBetweenInsertionPoints: UnsafeMutablePointer<CGFloat>?) -> Int

                    // Drawing:
                    func drawGlyphs(forGlyphRange glyphRange: NSRange, at origin: NSPoint)
                    func drawBackground(forGlyphRange glyphRange: NSRange, at origin: NSPoint)
                    """)
                }

                refBlock(
                    name: "NSTypesetter / NSATSTypesetter",
                    kind: "classes : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "NSTypesetter is the abstract base class for line layout algorithms. NSATSTypesetter is the concrete implementation backed by the Apple Type Services engine. Rarely subclassed — override NSLayoutManager delegates instead."
                ) {
                    snippet("""
                    // Abstract base:
                    class NSTypesetter: NSObject
                    var usesFontLeading: Bool
                    var typesetterBehavior: NSLayoutManager.TypesetterBehavior
                    var hyphenationFactor: Float
                    var lineFragmentPadding: CGFloat
                    func layoutParagraph(at lineFragmentOrigin: UnsafeMutablePointer<NSPoint>) -> Int

                    // Concrete (used by NSLayoutManager by default):
                    class NSATSTypesetter: NSTypesetter
                    // Typically not configured directly; access via:
                    let ts = layoutManager.typesetter as? NSATSTypesetter
                    """)
                }
            }
        }
    }

    // MARK: Glyphs

    private var glyphsSection: some View {
        PageSection("Glyphs") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSGlyph / NSGlyphInfo / NSGlyphGenerator",
                    kind: "typealias / class / class",
                    availability: "macOS 10.0+",
                    blurb: "Glyph-level APIs for TextKit 1. NSGlyph is a typealias for UInt32 representing a single rendered glyph. NSGlyphInfo embeds a specific glyph index override into an attributed string. NSGlyphGenerator converts characters to glyphs for NSLayoutManager."
                ) {
                    snippet("""
                    // NSGlyph is a plain UInt32:
                    typealias NSGlyph = UInt32
                    let NSControlGlyph: NSGlyph = 0x00FFFFFF  // marks control characters
                    let NSNullGlyph:    NSGlyph = 0x0          // marks deleted glyphs

                    // NSGlyphInfo — embed a specific glyph:
                    class NSGlyphInfo: NSObject, NSSecureCoding, NSCopying
                    init?(glyphName: String, for font: NSFont, baseString: String)
                    init?(glyphIndex: NSGlyph, for font: NSFont, baseString: String)
                    var glyphName: String? { get }
                    var characterIdentifier: NSGlyph { get }

                    // NSGlyphGenerator:
                    class NSGlyphGenerator: NSObject
                    static var shared: NSGlyphGenerator
                    func generateGlyphs(for glyphStorage: NSGlyphStorage,
                                        desiredNumberOfCharacters nChars: Int,
                                        glyphIndex: UnsafeMutablePointer<Int>,
                                        characterIndex: UnsafeMutablePointer<Int>)
                    """)
                }

                refBlock(
                    name: "NSFontRenderingMode",
                    kind: "enum : UInt",
                    availability: "macOS 10.0+",
                    blurb: "Controls sub-pixel rendering strategy for glyphs. Passed to NSFont.screenFont(with:) in TextKit 1 rendering. Modern apps typically use the default anti-aliased mode."
                ) {
                    snippet("""
                    enum NSFontRenderingMode: UInt {
                        case defaultRenderingMode     // system chooses
                        case antialiasedRenderingMode // sub-pixel off, grayscale AA
                        case integerAdvancementsRenderingMode // pixel-grid snapping
                        case antialiasedIntegerAdvancementsRenderingMode // both
                    }
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("1.square", "TextKit 2 (macOS 12+) is the default for NSTextView. TextKit 1 activates automatically when you access textView.layoutManager or textView.textStorage directly, as those calls force a compatibility downgrade.")
                noteRow("2.square", "NSTextStorage is the shared mutable attributed string between the two stacks. TextKit 2 wraps it in NSTextContentStorage; TextKit 1 accesses it directly via NSLayoutManager.")
                noteRow("3.square", "NSTextAttachmentViewProvider (macOS 12+) enables NSView rendering for attachments in TextKit 2 without subclassing NSTextAttachmentCell.")
                noteRow("4.square", "NSAdaptiveImageGlyph (macOS 15+) embeds variable-size inline images keyed to NSAttributedString.Key.adaptiveImageGlyph — the font size drives scaling automatically.")
                noteRow("paperclip", "NSTextTableBlock and NSTextTable are TextKit 1-only; TextKit 2 does not yet support inline tables natively.")
                noteRow("abc", "NSGlyph, NSGlyphInfo, and NSGlyphGenerator are TextKit 1 glyph pipeline classes. TextKit 2 exposes glyph-level data through NSTextLineFragment instead.")
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
}

extension NSTextKitPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.textKit.nsTextKit",
        title: "TextKit",
        folder: "TextKit",
        framework: .appKit,
        absorbedSymbols: [
            "NSTextStorage",
            "NSLayoutManager",
            "NSATSTypesetter",
            "NSTypesetter",
            "NSTextContentManager",
            "NSTextLayoutFragment",
            "NSTextLineFragment",
            "NSTextViewportLayoutController",
            "NSTextLayoutOrientationProvider",
            "NSTextParagraph",
            "NSTextListElement",
            "NSTextElement",
            "NSTextElementProvider",
            "NSTextRange",
            "NSTextSelectionNavigation",
            "NSTextLocation",
            "NSTextAttachment",
            "NSTextAttachmentViewProvider",
            "NSAdaptiveImageGlyph",
            "NSTextAttachmentContainer",
            "NSTextAttachmentLayout",
            "NSTextAttachmentCell",
            "NSTextAttachmentCellProtocol",
            "NSParagraphStyle",
            "NSMutableParagraphStyle",
            "NSTextTab",
            "NSTextList",
            "NSTextTable",
            "NSTextTableBlock",
            "NSTextBlock",
            "NSGlyph",
            "NSGlyphStorage",
            "NSGlyphGenerator",
            "NSGlyphInfo",
            "NSControlGlyph",
            "NSNullGlyph",
            "NSFontRenderingMode"
        ],
        blurb: "Apple's text layout and rendering engine. TextKit 2 (macOS 12+) is the modern protocol-based architecture; TextKit 1 remains for legacy use. Covers content, layout, attachments, formatting, and glyph handling.",
        signature: "TextKit 1 + TextKit 2 family",
        availability: "macOS 10.0+ (TextKit 2: macOS 12.0+)",
        docPath: "Documentation/AppKit/textkit/textkit.md",
        page: { AnyView(NSTextKitPage()) }
    )
}

#Preview {
    NSTextKitPage().frame(width: 1100, height: 900)
}
