import SwiftUI
import AppKit

// AppKit Writing Tools — NSWritingToolsCoordinator and related types.
//
// Absorbed leaves:
//   Configuration:           Customizing Writing Tools behavior (article),
//                            NSWritingToolsBehavior, NSWritingToolsResultOptions
//   Writing Tools for custom views: Supporting Writing Tools via the pasteboard (article),
//                            Adding Writing Tools support to a custom AppKit view (article),
//                            NSWritingToolsCoordinator,
//                            NSWritingToolsCoordinator.Delegate,
//                            NSWritingToolsCoordinator.Context,
//                            NSWritingToolsCoordinator.AnimationParameters,
//                            Enhancing your custom text engine with Writing Tools (article)
//   Text previews:           NSTextPreview

// MARK: - Page

struct NSWritingToolsPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                overviewSection
                behaviorSection
                coordinatorSection
                contextSection
                delegateSection
                textPreviewSection
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
            Text("Writing Tools")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSWritingToolsCoordinator and related APIs for integrating Apple Intelligence Writing Tools into custom AppKit text views.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} NSWritingToolsCoordinator macOS 15.2+ \u{00b7} NSWritingToolsBehavior macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Overview

    private var overviewSection: some View {
        PageSection("Overview") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Writing Tools is an Apple Intelligence feature introduced in macOS 15 (Sequoia). It provides proofreading, rewriting, summarization, and composition assistance for text views. NSTextView and NSTextField adopt Writing Tools automatically. Custom text engines must integrate via NSWritingToolsCoordinator.")
                    .font(.callout).foregroundStyle(.secondary)

                Label("No renderable demo is possible — Writing Tools requires Apple Intelligence, which requires user opt-in and compatible hardware (Apple Silicon with sufficient RAM). All content below is type-signature reference.", systemImage: "info.circle")
                    .font(.callout).foregroundStyle(.secondary)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    // MARK: Behavior / Options

    private var behaviorSection: some View {
        PageSection("Reference \u{2014} NSWritingToolsBehavior / NSWritingToolsResultOptions") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSWritingToolsBehavior",
                    kind: "enum : Int",
                    availability: "macOS 15.0+",
                    blurb: "Controls whether and how Writing Tools is active in a text view. Set on NSTextField or NSTextView via the writingToolsBehavior property."
                ) {
                    snippet("""
                    enum NSWritingToolsBehavior: Int, Sendable {
                        case `default`   // system-defined; usually .automatic for editable text
                        case none        // disable Writing Tools for this view
                        case automatic   // full Writing Tools (inline + panel)
                        case limited     // panel only; no inline rewriting
                    }

                    // Apply to a text view:
                    textView.writingToolsBehavior = .limited    // macOS 15+
                    textField.writingToolsBehavior = .none      // opt out
                    """)
                }

                refBlock(
                    name: "NSWritingToolsResultOptions",
                    kind: "OptionSet",
                    availability: "macOS 15.0+",
                    blurb: "Restricts which kinds of Writing Tools results a view accepts. Set on NSTextView via the allowedWritingToolsResultOptions property."
                ) {
                    snippet("""
                    struct NSWritingToolsResultOptions: OptionSet, Sendable {
                        static let `default`:       NSWritingToolsResultOptions  // all result types
                        static let plainText:       NSWritingToolsResultOptions  // plain text only
                        static let richText:        NSWritingToolsResultOptions  // attributed text
                        static let list:            NSWritingToolsResultOptions  // bulleted/numbered lists
                        static let table:           NSWritingToolsResultOptions  // tabular data
                    }

                    // Apply to a text view:
                    textView.allowedWritingToolsResultOptions = [.plainText, .richText]
                    """)
                }
            }
        }
    }

    // MARK: Coordinator

    private var coordinatorSection: some View {
        PageSection("Reference \u{2014} NSWritingToolsCoordinator") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSWritingToolsCoordinator",
                    kind: "class : NSObject",
                    availability: "macOS 15.2+",
                    blurb: "Integrates Writing Tools with a custom NSView-based text engine. Your view creates an NSWritingToolsCoordinator, assigns itself as the delegate, and handles text delivery and animation callbacks. NSTextView manages this coordinator automatically."
                ) {
                    snippet("""
                    class NSWritingToolsCoordinator: NSObject  // macOS 15.2+

                    init(view: NSView)
                    var writingToolsBehavior: NSWritingToolsBehavior
                    var allowedResultOptions: NSWritingToolsResultOptions
                    var delegate: NSWritingToolsCoordinator.Delegate? { get set }

                    // The view that owns this coordinator:
                    var view: NSView { get }

                    // Query state:
                    var isActive: Bool { get }

                    // Request Writing Tools to stop (e.g., on focus loss):
                    func stopWritingTools()

                    // Notify the coordinator about external text changes:
                    func updateState()
                    """)
                }
            }
        }
    }

    // MARK: Context

    private var contextSection: some View {
        PageSection("Reference \u{2014} NSWritingToolsCoordinator.Context / AnimationParameters") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSWritingToolsCoordinator.Context",
                    kind: "class : NSObject",
                    availability: "macOS 15.2+",
                    blurb: "Describes a range of text that Writing Tools is processing. Your delegate creates Context objects in response to coordinator delegate callbacks. Each context has a unique identifier and carries the attributed string for the range."
                ) {
                    snippet("""
                    class NSWritingToolsCoordinator.Context: NSObject  // macOS 15.2+

                    init(attributedString: NSAttributedString,
                         range: NSRange)

                    var attributedString: NSAttributedString { get }
                    var range: NSRange { get }
                    var id: UUID { get }

                    // Usage in delegate:
                    func writingToolsCoordinator(
                        _ coordinator: NSWritingToolsCoordinator,
                        requestsBoundingBoxesForRange range: NSRange,
                        inContext context: NSWritingToolsCoordinator.Context,
                        completion: @escaping ([CGRect]) -> Void
                    ) {
                        // Return screen rects for each character in range
                        completion(rectsForRange(range))
                    }
                    """)
                }

                refBlock(
                    name: "NSWritingToolsCoordinator.AnimationParameters",
                    kind: "class : NSObject",
                    availability: "macOS 15.2+",
                    blurb: "Describes the animation to play when Writing Tools applies a text replacement. Your delegate receives this in animation callbacks and returns an NSView to use as the animation surface."
                ) {
                    snippet("""
                    class NSWritingToolsCoordinator.AnimationParameters: NSObject  // macOS 15.2+

                    var type: NSWritingToolsCoordinator.AnimationType
                    var duration: TimeInterval

                    enum NSWritingToolsCoordinator.AnimationType: Int {
                        case insertion    // text is being added
                        case replacement  // text is being replaced
                        case removal      // text is being removed
                    }
                    """)
                }
            }
        }
    }

    // MARK: Delegate

    private var delegateSection: some View {
        PageSection("Reference \u{2014} NSWritingToolsCoordinator.Delegate") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSWritingToolsCoordinator.Delegate",
                    kind: "protocol : NSObjectProtocol",
                    availability: "macOS 15.2+",
                    blurb: "The required interface for integrating a custom text engine with Writing Tools. The coordinator calls these methods to request text content, apply changes, and coordinate animations."
                ) {
                    snippet("""
                    protocol NSWritingToolsCoordinator.Delegate: NSObjectProtocol {

                        // 1. Provide text context for the selection:
                        func writingToolsCoordinator(
                            _ coordinator: NSWritingToolsCoordinator,
                            requestsContextsFor scope: NSWritingToolsCoordinator.RequestedScope,
                            completion: @escaping ([NSWritingToolsCoordinator.Context]) -> Void
                        )
                        // scope: .userSelection / .fullDocument / .contentAround

                        // 2. Apply suggested text replacement:
                        func writingToolsCoordinator(
                            _ coordinator: NSWritingToolsCoordinator,
                            replaceRange range: NSRange,
                            inContext context: NSWritingToolsCoordinator.Context,
                            proposedText: NSAttributedString,
                            reason: NSWritingToolsCoordinator.TextReplacementReason,
                            animationParameters: NSWritingToolsCoordinator.AnimationParameters?,
                            completion: @escaping (NSAttributedString?) -> Void
                        )
                        // Return nil to accept proposedText, or return a modified string.

                        // 3. Provide bounding rects for animations:
                        func writingToolsCoordinator(
                            _ coordinator: NSWritingToolsCoordinator,
                            requestsBoundingBoxesForRange range: NSRange,
                            inContext context: NSWritingToolsCoordinator.Context,
                            completion: @escaping ([CGRect]) -> Void
                        )

                        // 4. Prepare for / finish animation:
                        func writingToolsCoordinator(
                            _ coordinator: NSWritingToolsCoordinator,
                            prepareFor animationParameters: NSWritingToolsCoordinator.AnimationParameters,
                            for range: NSRange,
                            inContext context: NSWritingToolsCoordinator.Context,
                            completion: @escaping (NSView?) -> Void
                        )
                        // Return an NSView snapshot for the animation surface.

                        func writingToolsCoordinatorDidUpdateState(
                            _ coordinator: NSWritingToolsCoordinator
                        )
                    }
                    """)
                }
            }
        }
    }

    // MARK: NSTextPreview

    private var textPreviewSection: some View {
        PageSection("Reference \u{2014} NSTextPreview") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSTextPreview",
                    kind: "class : NSObject",
                    availability: "macOS 15.2+",
                    blurb: "A rendered snapshot of a range of text for use in Writing Tools animations. Your NSWritingToolsCoordinator.Delegate returns an NSTextPreview from the animation-preparation callback instead of a plain NSView when the text engine can produce a pre-rendered image."
                ) {
                    snippet("""
                    class NSTextPreview: NSObject  // macOS 15.2+

                    // Create from a rendered image and the bounding rect of the original text:
                    init(snapshot: NSImage, presentationFrame: CGRect)

                    var snapshot: NSImage { get }
                    var presentationFrame: CGRect { get }

                    // Usage in delegate animation-preparation callback:
                    func writingToolsCoordinator(
                        _ coordinator: NSWritingToolsCoordinator,
                        prepareFor animationParameters: NSWritingToolsCoordinator.AnimationParameters,
                        for range: NSRange,
                        inContext context: NSWritingToolsCoordinator.Context,
                        completion: @escaping (NSView?) -> Void
                    ) {
                        // Render the text in the range as an image:
                        let image = renderTextImage(for: range)
                        let frame = frameForRange(range)
                        let preview = NSTextPreview(snapshot: image, presentationFrame: frame)
                        // Wrap in a view for the coordinator:
                        let view = NSImageView(image: preview.snapshot)
                        view.frame = preview.presentationFrame
                        completion(view)
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
                noteRow("sparkles", "Writing Tools requires Apple Intelligence, which requires user opt-in and Apple Silicon hardware with 8+ GB RAM. Graceful fallback is automatic — the toolbar button is hidden when unavailable.")
                noteRow("1.square", "NSTextView and NSTextField adopt Writing Tools automatically on macOS 15+. Set writingToolsBehavior = .none to opt out of specific views (e.g., code editors, password fields).")
                noteRow("2.square", "NSWritingToolsCoordinator is only needed for custom text engines that don't use NSTextView. If you use NSTextView, no coordinator code is required.")
                noteRow("3.square", "The delegate's requestsContexts callback must call the completion handler on the main thread. The full document or selection is the typical context scope.")
                noteRow("4.square", "NSTextPreview and AnimationParameters enable smooth morphing animations when Writing Tools replaces text. Returning nil from the animation-prep callback falls back to a simpler cross-dissolve.")
                noteRow("pencil.and.sparkles", "allowedWritingToolsResultOptions restricts what types of content Writing Tools can insert — use [.plainText] for code views to prevent insertion of rich text, tables, or lists.")
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

extension NSWritingToolsPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.writingTools.nsWritingTools",
        title: "Writing Tools",
        folder: "Writing Tools",
        framework: .appKit,
        absorbedSymbols: [
            "NSWritingToolsBehavior",
            "NSWritingToolsResultOptions",
            "NSWritingToolsCoordinator",
            "NSWritingToolsCoordinator.Delegate",
            "NSWritingToolsCoordinator.Context",
            "NSWritingToolsCoordinator.AnimationParameters",
            "NSTextPreview"
        ],
        blurb: "NSWritingToolsCoordinator and related APIs for integrating Apple Intelligence Writing Tools into custom AppKit text views. NSTextView and NSTextField adopt Writing Tools automatically.",
        signature: "class NSWritingToolsCoordinator : NSObject",
        availability: "macOS 15.0+ (NSWritingToolsCoordinator: macOS 15.2+)",
        docPath: "Documentation/AppKit/writing-tools/writing-tools.md",
        page: { AnyView(NSWritingToolsPage()) }
    )
}

#Preview {
    NSWritingToolsPage().frame(width: 1100, height: 900)
}
