import SwiftUI
import AppKit

// AppKit Fonts — NSFont, NSFontDescriptor, NSFontManager, NSFontCollection.
//
// Absorbed leaves:
//   Font Data:   NSFont, NSFont.Width, NSFontDescriptor, NSFontTraitMask,
//                NSFontFamilyClass, NSFontDescriptor.SymbolicTraits,
//                NSFontAssetRequest, NSFontSymbolicTraits
//   Management:  NSFontManager, NSFontCollection, NSMutableFontCollection,
//                NSFontCollectionOptions

// MARK: - Bridges

private struct NSFontFamilyListView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSScrollView {
        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.translatesAutoresizingMaskIntoConstraints = false

        let families = NSFontManager.shared.availableFontFamilies.sorted().prefix(30)
        let stack = NSStackView()
        stack.orientation = .vertical
        stack.alignment = .leading
        stack.spacing = 2
        stack.translatesAutoresizingMaskIntoConstraints = false

        for family in families {
            let font = NSFont(name: family, size: 13) ?? NSFont.systemFont(ofSize: 13)
            let label = NSTextField(labelWithAttributedString: NSAttributedString(
                string: family,
                attributes: [.font: font, .foregroundColor: NSColor.labelColor]
            ))
            label.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(label)
        }

        let clipView = scroll.contentView
        scroll.documentView = stack
        stack.widthAnchor.constraint(equalTo: clipView.widthAnchor).isActive = true
        return scroll
    }

    func updateNSView(_ nsView: NSScrollView, context: Context) {}
}

// MARK: - Page

struct NSFontPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                nsfontSection
                fontDescriptorSection
                fontManagerSection
                fontCollectionSection
                familyListSection
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
            Text("Fonts")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSFont, NSFontDescriptor, NSFontManager, NSFontCollection and related font data types.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSFontAssetRequest macOS 10.13+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: NSFont

    private var nsfontSection: some View {
        PageSection("Reference \u{2014} NSFont") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSFont",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "An immutable font object. Prefer system fonts (systemFont(ofSize:), .monospacedSystemFont) over named fonts for UI text. NSFont objects are cached by AppKit — creating the same font multiple times returns the same object."
                ) {
                    snippet("""
                    class NSFont: NSObject, NSCopying, NSSecureCoding

                    // System fonts:
                    NSFont.systemFont(ofSize: 0)           // 0 = default system size
                    NSFont.systemFont(ofSize: 14, weight: .medium)
                    NSFont.boldSystemFont(ofSize: 14)
                    NSFont.monospacedSystemFont(ofSize: 13, weight: .regular)
                    NSFont.monospacedDigitSystemFont(ofSize: 13, weight: .regular)

                    // Fixed sizes (design-spec sizes):
                    NSFont.systemFont(ofSize: NSFont.systemFontSize)     // ~13 pt
                    NSFont.systemFont(ofSize: NSFont.smallSystemFontSize) // ~11 pt
                    NSFont.systemFont(ofSize: NSFont.labelFontSize)       // ~10 pt
                    NSFont.systemFont(ofSize: NSFont.miniSystemFontSize)  // ~9 pt

                    // Named font:
                    NSFont(name: "Helvetica Neue", size: 16)

                    // From descriptor:
                    NSFont(descriptor: descriptor, size: 14)

                    // Core properties:
                    var fontName: String          // PostScript name (e.g., "HelveticaNeue-Bold")
                    var familyName: String?       // family (e.g., "Helvetica Neue")
                    var displayName: String?      // human-friendly name
                    var pointSize: CGFloat
                    var ascender: CGFloat
                    var descender: CGFloat        // negative value
                    var leading: CGFloat
                    var capHeight: CGFloat
                    var xHeight: CGFloat
                    var isFixedPitch: Bool

                    var fontDescriptor: NSFontDescriptor { get }

                    // Metrics:
                    func advancement(forGlyph glyph: NSGlyph) -> NSSize
                    func boundingRect(forGlyph glyph: NSGlyph) -> NSRect

                    // NSFont.Width (macOS 13+):
                    // Condensed / Standard / Expanded / Compressed widths:
                    NSFont.systemFont(ofSize: 14, weight: .regular, width: .condensed)
                    """)
                }
            }
        }
    }

    // MARK: NSFontDescriptor

    private var fontDescriptorSection: some View {
        PageSection("NSFontDescriptor") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSFontDescriptor / NSFontDescriptor.SymbolicTraits",
                    kind: "class : NSObject / OptionSet",
                    availability: "macOS 10.3+",
                    blurb: "A dictionary-based font specification. Construct one to match fonts by trait rather than by name. The SymbolicTraits OptionSet encodes bold, italic, condensed, monospaced, and other style axes."
                ) {
                    snippet("""
                    class NSFontDescriptor: NSObject, NSCopying, NSSecureCoding

                    // Create from family + traits:
                    let desc = NSFontDescriptor(fontAttributes: [
                        .family: "Helvetica Neue",
                        .face:   "Bold Italic",
                    ])

                    // Modify an existing descriptor:
                    let bold = someFont.fontDescriptor
                        .withSymbolicTraits(.bold)
                        .withSize(18)

                    let condensed = someFont.fontDescriptor
                        .withSymbolicTraits([.bold, .condensed])

                    // Match and resolve to a font:
                    let font = NSFont(descriptor: bold, size: 0)  // 0 = use desc's size

                    // NSFontDescriptor.SymbolicTraits (OptionSet):
                    struct NSFontDescriptor.SymbolicTraits: OptionSet {
                        static let bold:             NSFontDescriptor.SymbolicTraits
                        static let italic:           NSFontDescriptor.SymbolicTraits
                        static let expanded:         NSFontDescriptor.SymbolicTraits
                        static let condensed:        NSFontDescriptor.SymbolicTraits
                        static let monoSpace:        NSFontDescriptor.SymbolicTraits
                        static let vertical:         NSFontDescriptor.SymbolicTraits
                        static let UIOptimized:      NSFontDescriptor.SymbolicTraits
                    }

                    // NSFontTraitMask (legacy, Int OptionSet):
                    // .boldFontMask / .italicFontMask / .condensedFontMask / .expandedFontMask etc.

                    // NSFontFamilyClass (classification):
                    // .oldStyleSerifs / .transitionalSerifs / .modernSerifs / .clarendonSerifs
                    // .slabSerifs / .freeformSerifs / .sansSerif / .ornamentals / .scripts / .symbolic
                    """)
                }

                refBlock(
                    name: "NSFontAssetRequest",
                    kind: "class : NSObject",
                    availability: "macOS 10.13+",
                    blurb: "Downloads fonts on demand from Apple's font catalog. Useful for apps that need access to fonts not installed on the system without requiring the user to install them first."
                ) {
                    snippet("""
                    class NSFontAssetRequest: NSObject, NSProgressReporting
                    init(fontDescriptors: [NSFontDescriptor],
                         options: NSFontAssetRequest.Options = [])

                    func downloadFonts(completionHandler handler: @escaping (Error?) -> Void)

                    struct NSFontAssetRequest.Options: OptionSet {
                        static let usesStandardUI: NSFontAssetRequest.Options  // show download sheet
                    }

                    // Example:
                    let desc = NSFontDescriptor(fontAttributes: [.family: "Noto Serif"])
                    let request = NSFontAssetRequest(fontDescriptors: [desc])
                    request.downloadFonts { error in
                        if error == nil {
                            let font = NSFont(descriptor: desc, size: 14)
                            // font is now available
                        }
                    }
                    """)
                }
            }
        }
    }

    // MARK: NSFontManager

    private var fontManagerSection: some View {
        PageSection("NSFontManager") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSFontManager",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "The centralized font selection controller. Converts fonts between weights/styles and connects the Font Panel to the responder chain. Singleton — always use NSFontManager.shared."
                ) {
                    snippet("""
                    class NSFontManager: NSObject

                    static var shared: NSFontManager

                    // Available fonts:
                    var availableFonts: [String]              // all PostScript names
                    var availableFontFamilies: [String]       // all family names
                    func availableMembers(ofFontFamily family: String) -> [[Any]]?
                    // -> [[PostScriptName, FaceName, Weight(Int), Traits(UInt)]]

                    // Convert a font:
                    func convert(_ fontObj: NSFont) -> NSFont    // apply pending conversion
                    func convert(_ fontObj: NSFont, toSize size: CGFloat) -> NSFont
                    func convert(_ fontObj: NSFont, toFace typeface: String) -> NSFont?
                    func convert(_ fontObj: NSFont, toFamily family: String) -> NSFont
                    func convert(_ fontObj: NSFont, toHaveTrait trait: NSFontTraitMask) -> NSFont
                    func convert(_ fontObj: NSFont, toNotHaveTrait trait: NSFontTraitMask) -> NSFont

                    // Check traits:
                    func trait(_ trait: NSFontTraitMask, matches theFont: NSFont) -> Bool
                    func traits(of fontObj: NSFont) -> NSFontTraitMask

                    // Font panel:
                    func orderFrontFontPanel(_ sender: Any?)
                    func setSelectedFont(_ fontObj: NSFont, isMultiple flag: Bool)

                    // Action to receive from Font Panel:
                    // implement changeFont(_:) in your responder
                    """)
                }
            }
        }
    }

    // MARK: NSFontCollection

    private var fontCollectionSection: some View {
        PageSection("NSFontCollection / NSMutableFontCollection") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSFontCollection",
                    kind: "class : NSObject",
                    availability: "macOS 10.7+",
                    blurb: "A named, persistent collection of font descriptors — analogous to a smart playlist for fonts. The system provides built-in collections (All Fonts, Recently Used, etc.). Apps can create and register custom collections."
                ) {
                    snippet("""
                    class NSFontCollection: NSObject, NSCopying, NSMutableCopying, NSSecureCoding

                    // Built-in collections:
                    static var allFonts: NSFontCollection { get }
                    static var user: NSFontCollection? { get }
                    static var favoritesFontCollectionName: NSFontCollection.Name  // "Favorites"

                    // Create from descriptors:
                    init(descriptors queryDescriptors: [NSFontDescriptor])
                    init(locale: Locale)     // locale-appropriate fonts

                    // Lookup:
                    static var allCollectionNames: [NSFontCollection.Name] { get }
                    static func collection(withName name: NSFontCollection.Name) -> NSFontCollection?

                    // Matching fonts:
                    var matchingDescriptors: [NSFontDescriptor]? { get }
                    func matchingDescriptors(forFamily family: String) -> [NSFontDescriptor]?

                    // NSMutableFontCollection:
                    class NSMutableFontCollection: NSFontCollection
                    var queryDescriptors: [NSFontDescriptor]?
                    var exclusionDescriptors: [NSFontDescriptor]?
                    func addQuery(for descriptors: [NSFontDescriptor])
                    func removeQuery(for descriptors: [NSFontDescriptor])

                    // Register/unregister a named collection:
                    static func show(_ collection: NSFontCollection,
                                     withName name: NSFontCollection.Name,
                                     visibility: NSFontCollection.Visibility) throws
                    static func hide(withName name: NSFontCollection.Name,
                                     visibility: NSFontCollection.Visibility) throws

                    // NSFontCollectionOptions:
                    struct NSFontCollectionOptions: OptionSet {
                        static let applicationOnlyMask: NSFontCollectionOptions
                    }
                    """)
                }
            }
        }
    }

    // MARK: Family List Demo

    private var familyListSection: some View {
        PageSection("Live Demo \u{2014} Available Font Families") {
            VStack(alignment: .leading, spacing: 12) {
                Text("First 30 font families available via NSFontManager.shared.availableFontFamilies, each rendered in its own typeface.")
                    .font(.callout).foregroundStyle(.secondary)

                NSFontFamilyListView()
                    .frame(height: 280)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                APICallout("NSFontManager.shared.availableFontFamilies.sorted().prefix(30)")
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("textformat", "NSFont.systemFont(ofSize: 0) returns the default system font at the default point size. Use this instead of hard-coding a point size — it adapts to the user's system settings.")
                noteRow("textformat.alt", "NSFontDescriptor.withSymbolicTraits(_:) returns a new descriptor. It does NOT guarantee the described font exists; always check NSFont(descriptor:size:) for nil before use.")
                noteRow("arrow.down.circle", "NSFontAssetRequest (macOS 10.13+) downloads fonts from Apple's server. The downloaded fonts are available system-wide, not just in your app. Requires entitlement com.apple.developer.fonts.allow-downloading.")
                noteRow("list.bullet", "NSFontCollection lets you build smart font lists by descriptor (family, trait, language). The system's Font panel uses collections to populate its font family sidebar.")
                noteRow("textformat.abc", "NSFontManager.convert(_:) applies the current Font Panel selection to a given font. Call this from your changeFont(_:) responder method to get the user's chosen font.")
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

extension NSFontPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.fonts.nsFont",
        title: "NSFont",
        folder: "Fonts",
        framework: .appKit,
        absorbedSymbols: [
            "NSFont",
            "NSFont.Width",
            "NSFontDescriptor",
            "NSFontDescriptor.SymbolicTraits",
            "NSFontTraitMask",
            "NSFontFamilyClass",
            "NSFontSymbolicTraits",
            "NSFontAssetRequest",
            "NSFontManager",
            "NSFontCollection",
            "NSMutableFontCollection",
            "NSFontCollectionOptions"
        ],
        blurb: "An immutable font object plus the descriptor, manager, and collection types that drive font selection in AppKit. Prefer system fonts over named fonts for UI text.",
        signature: "class NSFont : NSObject",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/fonts/nsfont.md",
        page: { AnyView(NSFontPage()) }
    )
}

#Preview {
    NSFontPage().frame(width: 1100, height: 900)
}
