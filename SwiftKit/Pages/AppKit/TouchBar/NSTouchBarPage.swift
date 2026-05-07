import SwiftUI
import AppKit

// AppKit Touch Bar — comprehensive reference for NSTouchBar and all item types.
//
// Absorbed leaves (all describe-only; Touch Bar hardware is not renderable in a window):
//   Essentials:     Creating and Customizing the Touch Bar (article), NSTouchBar,
//                   NSTouchBarDelegate, NSTouchBarProvider
//   Touch Bar items: NSTouchBarItem, NSCandidateListTouchBarItem,
//                   NSColorPickerTouchBarItem, NSCustomTouchBarItem,
//                   NSGroupTouchBarItem, NSPopoverTouchBarItem,
//                   NSSharingServicePickerTouchBarItem, NSSliderTouchBarItem,
//                   NSStepperTouchBarItem, NSUserInterfaceCompressionOptions,
//                   NSPickerTouchBarItem, NSPickerTouchBarItem.ControlRepresentation,
//                   NSPickerTouchBarItem.SelectionMode
//   Scrubbers:      NSScrubber, NSScrubberDataSource, NSScrubberDelegate
//   Scrubber items: NSScrubberItemView, NSScrubberArrangedView,
//                   NSScrubberSelectionStyle, NSScrubberSelectionView,
//                   NSScrubberTextItemView
//   Scrubber layouts: NSScrubberFlowLayout, NSScrubberFlowLayoutDelegate,
//                   NSScrubberProportionalLayout, NSScrubberLayoutAttributes,
//                   NSScrubberLayout

// MARK: - Page

struct NSTouchBarPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                hardwareNoteSection
                touchBarCoreSection
                touchBarItemsSection
                scrubberSection
                scrubberLayoutSection
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
            Text("Touch Bar")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSTouchBar and its item types for the OLED Touch Bar available on select MacBook Pro models (2016\u{2013}2021). No renderable demo is possible without Touch Bar hardware.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} NSTouchBar macOS 10.12.2+ \u{00b7} NSPickerTouchBarItem macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Hardware Note

    private var hardwareNoteSection: some View {
        PageSection("Hardware Note") {
            VStack(alignment: .leading, spacing: 8) {
                Label(
                    "Touch Bar hardware was available on MacBook Pro 2016\u{2013}2021. It is not present on Apple Silicon MacBook Pro (2021+) or any desktop Mac. NSTouchBar APIs are still compiled and used on all macOS targets but the UI renders only on hardware equipped models or in the Xcode Touch Bar simulator.",
                    systemImage: "exclamationmark.triangle"
                )
                .font(.callout).foregroundStyle(.secondary)

                Label(
                    "To test Touch Bar UI in Simulator: In Xcode Simulator, go to Window > Touch Bar > Show Touch Bar (macOS simulator only).",
                    systemImage: "info.circle"
                )
                .font(.callout).foregroundStyle(.secondary)
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    // MARK: Core

    private var touchBarCoreSection: some View {
        PageSection("Reference \u{2014} NSTouchBar / NSTouchBarDelegate") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTouchBar",
                    kind: "class : NSObject",
                    availability: "macOS 10.12.2+",
                    blurb: "The container for Touch Bar items. Override makeTouchBar() in NSViewController or NSWindow to provide a bar. The system caches and reuses it."
                ) {
                    snippet("""
                    class NSTouchBar: NSObject, NSCoding

                    var delegate: NSTouchBarDelegate? { get set }
                    var defaultItemIdentifiers: [NSTouchBarItem.Identifier]  // layout order
                    var principalItemIdentifier: NSTouchBarItem.Identifier?  // centred item
                    var escapeKeyReplacementItemIdentifier: NSTouchBarItem.Identifier?
                    var customizationIdentifier: NSTouchBarCustomizationIdentifier?  // enable customization
                    var customizationAllowedItemIdentifiers: [NSTouchBarItem.Identifier]

                    // Item lookup:
                    func item(forIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem?
                    var visibleItemIdentifiers: [NSTouchBarItem.Identifier] { get }

                    // Override in NSResponder subclasses:
                    override func makeTouchBar() -> NSTouchBar? {
                        let bar = NSTouchBar()
                        bar.delegate = self
                        bar.defaultItemIdentifiers = [.myButton, .otherItem, .flexibleSpace]
                        return bar
                    }
                    """)
                }

                refBlock(
                    name: "NSTouchBarDelegate",
                    kind: "protocol",
                    availability: "macOS 10.12.2+",
                    blurb: "Single required method that instantiates items on demand. Only called for identifiers the system doesn't already have a cached item for."
                ) {
                    snippet("""
                    protocol NSTouchBarDelegate: AnyObject {
                        func touchBar(_ touchBar: NSTouchBar,
                                      makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem?
                    }

                    // Implementation pattern:
                    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier id: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
                        switch id {
                        case .myButton:
                            let item = NSButtonTouchBarItem(identifier: id, title: "Go",
                                                            image: nil, target: self,
                                                            action: #selector(go(_:)))
                            item.customizationLabel = "Go"
                            return item
                        default:
                            return nil
                        }
                    }
                    """)
                }

                refBlock(
                    name: "NSTouchBarProvider",
                    kind: "protocol",
                    availability: "macOS 10.12.2+",
                    blurb: "Declares a touchBar property on the adopting type. NSView and NSViewController both adopt this. You can use it on any custom class that needs to vend a bar into the responder chain."
                ) {
                    snippet("""
                    protocol NSTouchBarProvider: AnyObject {
                        var touchBar: NSTouchBar? { get set }
                    }
                    // NSResponder subclasses (NSView, NSViewController, NSWindow) adopt this.
                    // The system walks the first-responder chain until it finds a non-nil touchBar.
                    """)
                }
            }
        }
    }

    // MARK: Touch Bar Items

    private var touchBarItemsSection: some View {
        PageSection("Reference \u{2014} NSTouchBarItem Subclasses") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTouchBarItem",
                    kind: "class : NSObject (abstract base)",
                    availability: "macOS 10.12.2+",
                    blurb: "The abstract base for all Touch Bar items. Subclass or use a concrete subclass. Each item has a unique NSTouchBarItem.Identifier. Shared system identifiers (e.g., .fixedSpaceSmall, .flexibleSpace) do not require delegate creation."
                ) {
                    snippet("""
                    class NSTouchBarItem: NSObject, NSCoding

                    var identifier: NSTouchBarItem.Identifier { get }
                    var visibilityPriority: NSTouchBarItem.VisibilityPriority  // compression priority
                    var isVisible: Bool { get }
                    var customizationLabel: String  // shown in customization UI

                    // System identifiers (no delegate needed):
                    NSTouchBarItem.Identifier.fixedSpaceSmall
                    NSTouchBarItem.Identifier.fixedSpaceLarge
                    NSTouchBarItem.Identifier.flexibleSpace
                    NSTouchBarItem.Identifier.otherItemsProxy  // nested bar slot
                    """)
                }

                refBlock(
                    name: "NSCustomTouchBarItem",
                    kind: "class : NSTouchBarItem",
                    availability: "macOS 10.12.2+",
                    blurb: "Wraps any NSView or NSViewController as a Touch Bar item. Use when no specific item subclass fits."
                ) {
                    snippet("""
                    class NSCustomTouchBarItem: NSTouchBarItem
                    var view: NSView { get set }           // the embedded NSView
                    var viewController: NSViewController? { get set }
                    var customizationLabel: String

                    // Usage:
                    let item = NSCustomTouchBarItem(identifier: .myItem)
                    item.view = NSTextField(labelWithString: "Hello Touch Bar")
                    """)
                }

                refBlock(
                    name: "NSGroupTouchBarItem",
                    kind: "class : NSTouchBarItem",
                    availability: "macOS 10.12.2+",
                    blurb: "Embeds a nested NSTouchBar as a single item. Useful for grouping related controls that compress together."
                ) {
                    snippet("""
                    class NSGroupTouchBarItem: NSTouchBarItem
                    var groupTouchBar: NSTouchBar { get set }
                    var groupUserInterfaceLayoutDirection: NSUserInterfaceLayoutDirection

                    // Convenience factory:
                    static func alertStyleGroupItem(withIdentifier identifier: NSTouchBarItem.Identifier)
                        -> NSGroupTouchBarItem
                    """)
                }

                refBlock(
                    name: "NSPopoverTouchBarItem",
                    kind: "class : NSTouchBarItem",
                    availability: "macOS 10.12.2+",
                    blurb: "A Touch Bar item that expands into a secondary NSTouchBar when tapped. The secondary bar collapses back when the user taps outside it or presses Esc."
                ) {
                    snippet("""
                    class NSPopoverTouchBarItem: NSTouchBarItem
                    var popoverTouchBar: NSTouchBar { get set }
                    var pressAndHoldTouchBar: NSTouchBar?   // shown on long press
                    var showsCloseButton: Bool

                    var collapsedRepresentation: NSView { get set }
                    var collapsedRepresentationImage: NSImage?
                    var collapsedRepresentationLabel: String?

                    func showPopover(_ sender: Any?)
                    func dismissPopover(_ sender: Any?)
                    """)
                }

                refBlock(
                    name: "NSSliderTouchBarItem",
                    kind: "class : NSTouchBarItem",
                    availability: "macOS 10.12.2+",
                    blurb: "A continuous slider embedded in the Touch Bar. Use for volume, brightness, and scrubbing."
                ) {
                    snippet("""
                    class NSSliderTouchBarItem: NSTouchBarItem
                    var slider: NSSlider { get }         // configure like a normal NSSlider
                    var label: String?                   // text label to the left
                    var minimumValueAccessory: NSSliderAccessory?
                    var maximumValueAccessory: NSSliderAccessory?
                    var valueAccessoryWidth: NSSliderAccessory.Width

                    var target: AnyObject?
                    var action: Selector?
                    """)
                }

                refBlock(
                    name: "NSCandidateListTouchBarItem",
                    kind: "class : NSTouchBarItem",
                    availability: "macOS 10.12.2+",
                    blurb: "Shows autocomplete candidates in the Touch Bar for a text view. NSTextView automatically populates this when a candidateListTouchBarItem is in the responder's bar."
                ) {
                    snippet("""
                    class NSCandidateListTouchBarItem<CandidateType: AnyObject>: NSTouchBarItem
                    var candidates: [CandidateType] { get set }
                    var client: (NSView & NSTextInputClient)? { get set }
                    var delegate: NSCandidateListTouchBarItemDelegate? { get set }
                    var isCollapsed: Bool { get set }
                    var allowsCollapsing: Bool
                    var isCandidateListVisible: Bool { get }
                    var allowsTextInputContextCandidates: Bool

                    func setCandidates(_ candidates: [CandidateType],
                                       forSelectedRange range: NSRange,
                                       in string: String?)
                    """)
                }

                refBlock(
                    name: "NSSharingServicePickerTouchBarItem",
                    kind: "class : NSTouchBarItem",
                    availability: "macOS 10.12.2+",
                    blurb: "Shows the system sharing services popover in the Touch Bar. Provide items to share via the delegate."
                ) {
                    snippet("""
                    class NSSharingServicePickerTouchBarItem: NSTouchBarItem
                    var delegate: NSSharingServicePickerTouchBarItemDelegate? { get set }
                    var isEnabled: Bool

                    protocol NSSharingServicePickerTouchBarItemDelegate: NSSharingServicePickerDelegate {
                        func items(for pickerTouchBarItem: NSSharingServicePickerTouchBarItem) -> [Any]
                    }
                    """)
                }

                refBlock(
                    name: "NSPickerTouchBarItem",
                    kind: "class : NSTouchBarItem",
                    availability: "macOS 10.15+",
                    blurb: "A segmented picker for the Touch Bar. Supports single-selection and multi-selection modes. Can display as a segmented control (.segmentedControl) or a collapsed menu (.radioGroup)."
                ) {
                    snippet("""
                    class NSPickerTouchBarItem: NSTouchBarItem
                    var controlRepresentation: NSPickerTouchBarItem.ControlRepresentation
                    var selectionMode: NSPickerTouchBarItem.SelectionMode
                    var selectedIndex: Int
                    var numberOfOptions: Int { get set }

                    func setImage(_ image: NSImage?, at index: Int)
                    func setLabel(_ label: String, at index: Int)

                    enum ControlRepresentation: Int {
                        case automatic
                        case expanded    // full-width segmented control
                        case collapsed   // icon + popover
                    }
                    enum SelectionMode: Int {
                        case selectOne   // radio-button semantics
                        case selectAny   // checkbox semantics
                        case momentary   // no persistent selection
                    }
                    """)
                }

                refBlock(
                    name: "NSUserInterfaceCompressionOptions",
                    kind: "struct",
                    availability: "macOS 10.13+",
                    blurb: "Describes how a view or Touch Bar item should compress when space is limited. Touch Bar items receive this via NSUserInterfaceCompression protocol."
                ) {
                    snippet("""
                    struct NSUserInterfaceCompressionOptions: OptionSet
                    static let hideImages: NSUserInterfaceCompressionOptions
                    static let hideText: NSUserInterfaceCompressionOptions
                    static let reduceMetrics: NSUserInterfaceCompressionOptions
                    static let breakEqualWidths: NSUserInterfaceCompressionOptions
                    static let standardOptions: NSUserInterfaceCompressionOptions

                    // NSUserInterfaceCompression protocol:
                    protocol NSUserInterfaceCompression {
                        func compress(withPrioritizedCompressionOptions prioritizedOptions: [NSUserInterfaceCompressionOptions])
                        func minimumSize(withPrioritizedCompressionOptions prioritizedOptions: [NSUserInterfaceCompressionOptions]) -> NSSize
                    }
                    """)
                }
            }
        }
    }

    // MARK: Scrubbers

    private var scrubberSection: some View {
        PageSection("Reference \u{2014} NSScrubber and Items") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSScrubber",
                    kind: "class : NSView",
                    availability: "macOS 10.12.2+",
                    blurb: "A horizontally-scrollable touch control for Touch Bar. Shows a list of items that the user can scroll or select with a direct-touch gesture. Embed in NSCustomTouchBarItem.view."
                ) {
                    snippet("""
                    class NSScrubber: NSView
                    var dataSource: NSScrubberDataSource? { get set }
                    var delegate: NSScrubberDelegate? { get set }
                    var scrubberLayout: NSScrubberLayout { get set }

                    var selectedIndex: Int
                    var highlightedIndex: Int { get }
                    var showsAdditionalContentIndicators: Bool

                    var itemAlignment: NSScrubber.Alignment        // .none / .leading / .trailing / .center
                    var mode: NSScrubber.Mode                      // .free / .fixed

                    var isContinuous: Bool
                    var floatsSelectionViews: Bool

                    var selectionBackgroundStyle: NSScrubberSelectionStyle?
                    var selectionOverlayStyle: NSScrubberSelectionStyle?

                    func register(_ viewClass: AnyClass?, forItemIdentifier identifier: NSUserInterfaceItemIdentifier)
                    func makeItem<T: NSScrubberItemView>(withIdentifier identifier: NSUserInterfaceItemIdentifier, owner: Any?) -> T?
                    func reloadData()
                    func scrollItem(at index: Int, to alignment: NSScrubber.Alignment)
                    """)
                }

                refBlock(
                    name: "NSScrubberDataSource",
                    kind: "protocol",
                    availability: "macOS 10.12.2+",
                    blurb: "Provides the number of items and the item views for an NSScrubber — analogous to NSTableViewDataSource."
                ) {
                    snippet("""
                    protocol NSScrubberDataSource: AnyObject {
                        func numberOfItems(for scrubber: NSScrubber) -> Int
                        func scrubber(_ scrubber: NSScrubber,
                                      viewForItemAt index: Int) -> NSScrubberItemView
                    }
                    """)
                }

                refBlock(
                    name: "NSScrubberDelegate",
                    kind: "protocol",
                    availability: "macOS 10.12.2+",
                    blurb: "Receives selection-change and highlight-change notifications from an NSScrubber."
                ) {
                    snippet("""
                    protocol NSScrubberDelegate: AnyObject {
                        func scrubber(_ scrubber: NSScrubber, didSelectItemAt selectedIndex: Int)
                        func scrubber(_ scrubber: NSScrubber, didHighlightItemAt highlightedIndex: Int)
                        func scrubber(_ scrubber: NSScrubber, didChangeVisibleRange visibleRange: NSRange)
                        func didBeginInteracting(with scrubber: NSScrubber)
                        func didFinishInteracting(with scrubber: NSScrubber)
                        func didCancelInteracting(with scrubber: NSScrubber)
                    }
                    """)
                }

                refBlock(
                    name: "NSScrubberItemView / NSScrubberTextItemView / NSScrubberImageItemView",
                    kind: "classes : NSView",
                    availability: "macOS 10.12.2+",
                    blurb: "Item view classes for NSScrubber. Register with scrubber.register(_:forItemIdentifier:) and dequeue with makeItem(withIdentifier:owner:)."
                ) {
                    snippet("""
                    // Base (subclass for fully custom items):
                    class NSScrubberItemView: NSView
                    var isSelected: Bool { get }

                    // NSScrubberArrangedView — adds selection state:
                    class NSScrubberArrangedView: NSView
                    var isSelected: Bool { get set }
                    var isHighlighted: Bool { get set }
                    func apply(_ layoutAttributes: NSScrubberLayoutAttributes)

                    // Text item:
                    class NSScrubberTextItemView: NSScrubberItemView
                    var textField: NSTextField { get }
                    var title: String

                    // Image item (via NSScrubberImageItemView in Touch Bar):
                    // Access via register + makeItem pattern; NSScrubberImageItemView
                    // exposes var imageView: NSImageView
                    """)
                }

                refBlock(
                    name: "NSScrubberSelectionStyle / NSScrubberSelectionView",
                    kind: "class / class",
                    availability: "macOS 10.12.2+",
                    blurb: "NSScrubberSelectionStyle is an abstract descriptor for selection appearance. Use .outlineOverlay or .roundedBackground; or subclass NSScrubberSelectionView for a custom look."
                ) {
                    snippet("""
                    class NSScrubberSelectionStyle: NSObject
                    static var outlineOverlay: NSScrubberSelectionStyle      // rounded outline
                    static var roundedBackground: NSScrubberSelectionStyle   // filled rounded rect

                    var selectionViewClass: AnyClass? { get }
                    func makeSelectionView() -> NSScrubberSelectionView?

                    class NSScrubberSelectionView: NSScrubberArrangedView
                    // Subclass and override draw(_:) for custom appearance
                    """)
                }
            }
        }
    }

    // MARK: Scrubber Layouts

    private var scrubberLayoutSection: some View {
        PageSection("Reference \u{2014} NSScrubberLayout") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSScrubberLayout (abstract base)",
                    kind: "class : NSObject",
                    availability: "macOS 10.12.2+",
                    blurb: "Determines the size and position of items in an NSScrubber. Two concrete subclasses cover most cases: NSScrubberFlowLayout (variable or fixed widths) and NSScrubberProportionalLayout (equal widths filling the bar)."
                ) {
                    snippet("""
                    class NSScrubberLayout: NSObject, NSCoding
                    var scrubber: NSScrubber? { get }
                    var visibleRect: NSRect { get }
                    var scrubberContentSize: NSSize { get }

                    func prepare()
                    func layoutAttributesForItem(at index: Int) -> NSScrubberLayoutAttributes?
                    func layoutAttributesForItems(in rect: NSRect) -> Set<NSScrubberLayoutAttributes>
                    func shouldInvalidateLayout(forChangeFrom oldLayout: NSScrubberLayout) -> Bool
                    func shouldInvalidateLayout(forHighlightChange: Bool) -> Bool
                    func shouldInvalidateLayout(forSelectionChange: Bool) -> Bool
                    """)
                }

                refBlock(
                    name: "NSScrubberFlowLayout",
                    kind: "class : NSScrubberLayout",
                    availability: "macOS 10.12.2+",
                    blurb: "Lays out items left-to-right with variable or fixed item sizes. If the delegate is nil, all items use itemSize. If the delegate is set, individual widths are queried per index."
                ) {
                    snippet("""
                    class NSScrubberFlowLayout: NSScrubberLayout
                    var delegate: NSScrubberFlowLayoutDelegate? { get set }
                    var itemSize: NSSize            // used when delegate is nil
                    var itemSpacing: CGFloat        // gap between items

                    protocol NSScrubberFlowLayoutDelegate: NSScrubberDelegate {
                        func scrubber(_ scrubber: NSScrubber,
                                      layout: NSScrubberFlowLayout,
                                      sizeForItemAt itemIndex: Int) -> NSSize
                    }
                    """)
                }

                refBlock(
                    name: "NSScrubberProportionalLayout",
                    kind: "class : NSScrubberLayout",
                    availability: "macOS 10.12.2+",
                    blurb: "Divides the scrubber width equally among all items. Ideal for tab-bar-style scrubbers where each item should occupy the same space."
                ) {
                    snippet("""
                    class NSScrubberProportionalLayout: NSScrubberLayout
                    init(numberOfVisibleItems: Int)  // how many items fill the visible width
                    var numberOfVisibleItems: Int { get set }
                    """)
                }

                refBlock(
                    name: "NSScrubberLayoutAttributes",
                    kind: "class : NSObject",
                    availability: "macOS 10.12.2+",
                    blurb: "Carries position and size for one scrubber item, analogous to UICollectionViewLayoutAttributes. Custom NSScrubberLayout subclasses produce and return these."
                ) {
                    snippet("""
                    class NSScrubberLayoutAttributes: NSObject, NSCopying
                    class func layoutAttributesForItem(at index: Int) -> Self
                    var itemIndex: Int { get }
                    var frame: NSRect { get set }
                    var alpha: CGFloat { get set }
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("touchid", "Touch Bar is available only on MacBook Pro 2016\u{2013}2021 hardware. On machines without it, NSTouchBar APIs are no-ops. Xcode Simulator on macOS lets you show a virtual Touch Bar via Window > Touch Bar.")
                noteRow("1.square", "Override makeTouchBar() in any NSResponder subclass. The system calls it lazily and caches the result. To refresh, set touchBar = nil then call makeTouchBar().")
                noteRow("2.square", "NSTouchBarItem.Identifier must be reverse-DNS style and unique per bar. System identifiers (.flexibleSpace, .otherItemsProxy) are shared across all bars.")
                noteRow("3.square", "NSScrubber requires an NSCustomTouchBarItem wrapper. Register item view classes with register(_:forItemIdentifier:) and dequeue in the data source.")
                noteRow("4.square", "NSScrubberFlowLayout with a delegate gives per-item sizing; NSScrubberProportionalLayout divides the bar equally — use that for tab-like pickers.")
                noteRow("nosign", "NSStepperTouchBarItem (macOS 10.15+) places an NSStepper in the Touch Bar. NSColorPickerTouchBarItem shows the system color picker.")
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

extension NSTouchBarPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.touchBar.nsTouchBar",
        title: "NSTouchBar",
        folder: "Touch Bar",
        framework: .appKit,
        absorbedSymbols: [
            "NSTouchBar",
            "NSTouchBarDelegate",
            "NSTouchBarProvider",
            "NSTouchBarItem",
            "NSCandidateListTouchBarItem",
            "NSColorPickerTouchBarItem",
            "NSCustomTouchBarItem",
            "NSGroupTouchBarItem",
            "NSPopoverTouchBarItem",
            "NSSharingServicePickerTouchBarItem",
            "NSSliderTouchBarItem",
            "NSStepperTouchBarItem",
            "NSPickerTouchBarItem",
            "NSPickerTouchBarItem.ControlRepresentation",
            "NSPickerTouchBarItem.SelectionMode",
            "NSUserInterfaceCompressionOptions",
            "NSScrubber",
            "NSScrubberDataSource",
            "NSScrubberDelegate",
            "NSScrubberItemView",
            "NSScrubberArrangedView",
            "NSScrubberSelectionStyle",
            "NSScrubberSelectionView",
            "NSScrubberTextItemView",
            "NSScrubberFlowLayout",
            "NSScrubberFlowLayoutDelegate",
            "NSScrubberProportionalLayout",
            "NSScrubberLayoutAttributes",
            "NSScrubberLayout"
        ],
        blurb: "NSTouchBar and its full item and scrubber families for the OLED Touch Bar (MacBook Pro 2016–2021). Reference-only — the bar renders only on Touch Bar hardware or in the Xcode simulator.",
        signature: "class NSTouchBar : NSObject",
        availability: "macOS 10.12.2+",
        docPath: "Documentation/AppKit/touch-bar/nstouchbar.md",
        page: { AnyView(NSTouchBarPage()) }
    )
}

#Preview {
    NSTouchBarPage().frame(width: 1100, height: 900)
}
