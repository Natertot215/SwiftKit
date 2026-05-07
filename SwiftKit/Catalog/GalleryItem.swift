import SwiftUI

// MARK: - Framework

/// Top-level grouping for the sidebar's first-tier disclosures.
/// Every `GalleryItem` declares which framework subtree it belongs to via
/// `GalleryItem.framework`, and the sidebar reads that field through
/// `GalleryRegistry.byFramework` to build the three top-level rows
/// (Reference / SwiftUI / AppKit).
enum Framework: String, Hashable {
    /// Foundational concepts that span both SwiftUI and AppKit
    /// (Color, SF Symbols, Materials, Motion, Typography).
    case reference

    /// SwiftUI primitives — modifiers, views, scenes, shapes, layout
    /// containers. Default subtree for new SwiftUI pages.
    case swiftUI

    /// AppKit primitives — `NS*` views, controls, and integration shims
    /// surfaced via `NSViewRepresentable` / `NSViewControllerRepresentable`.
    case appKit
}

// MARK: - GalleryItem

/// Descriptor for a single page in the gallery.
///
/// **Authoring contract.** Every page file declares a `static let item: GalleryItem`
/// in an extension next to its `View` struct (see existing pages under
/// `Pages/` for the canonical shape). The descriptor carries everything the
/// sidebar and the page-routing layer need: a stable id, presentation
/// metadata, and a builder closure that returns the page view.
///
/// **Registration.** After authoring, append `<PageStruct>.item` to
/// `GalleryRegistry.allItems`. The sidebar (`GalleryRegistry.byFramework`)
/// and selection resolution (`GalleryRegistry.item(forID:)`) flow from
/// `allItems` automatically.
@MainActor
struct GalleryItem: Identifiable {
    /// Stable identifier used by the sidebar and `@SceneStorage` selection.
    /// Convention: `"<framework>.<folder>.<item>"` lower-camel.
    /// Example: `"swiftui.shapes.roundedRectangle"`.
    let id: String

    /// Display title shown in the sidebar and as the page header.
    let title: String

    /// Sidebar folder (broad grouping) this item lives under.
    /// Example: `"Shapes & Drawing"`, `"Controls"`, `"Navigation"`.
    let folder: String

    /// `.reference`, `.swiftUI`, or `.appKit` — selects which top-level
    /// disclosure this item appears under in the sidebar.
    let framework: Framework

    /// API symbols this page documents. Currently used only as authoring
    /// metadata (for cross-reference and future search), not programmatic
    /// lookup. Populate with the canonical Apple symbol names a reader
    /// might search for: e.g. `["NSButton", "NSButton.ButtonType"]`.
    let absorbedSymbols: Set<String>

    /// One-line description shown under the page title.
    let blurb: String

    /// Optional canonical type signature shown beneath the blurb.
    let signature: String?

    /// Optional availability string. Example: `"macOS 10.15+"`.
    let availability: String?

    /// Optional documentation path string for the page header.
    let docPath: String?

    /// Builder closure returning the page view. `@MainActor` because SwiftUI
    /// view construction is main-actor isolated.
    let page: @MainActor () -> AnyView

    init(
        id: String,
        title: String,
        folder: String,
        framework: Framework,
        absorbedSymbols: Set<String>,
        blurb: String,
        signature: String? = nil,
        availability: String? = nil,
        docPath: String? = nil,
        page: @escaping @MainActor () -> AnyView
    ) {
        self.id = id
        self.title = title
        self.folder = folder
        self.framework = framework
        self.absorbedSymbols = absorbedSymbols
        self.blurb = blurb
        self.signature = signature
        self.availability = availability
        self.docPath = docPath
        self.page = page
    }
}
