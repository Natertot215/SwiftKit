import SwiftUI
import AppKit

// AppKit View Layout — Auto Layout constraints, anchors, guides, and compression.
//
// Absorbed leaves:
//   Auto Layout Constraints: NSLayoutConstraint
//   Layout Guides:           NSLayoutGuide, NSLayoutDimension
//   Anchors:                 NSLayoutAnchor, NSLayoutXAxisAnchor, NSLayoutYAxisAnchor
//   View Compression:        NSUserInterfaceCompression

// MARK: - Page

struct NSViewLayoutPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                constraintSection
                anchorSection
                guideSection
                compressionSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("View Layout")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSLayoutConstraint, NSLayoutAnchor, NSLayoutGuide, and NSUserInterfaceCompression for Auto Layout in AppKit.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} NSLayoutConstraint macOS 10.7+ \u{00b7} NSLayoutAnchor macOS 10.11+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var constraintSection: some View {
        PageSection("Reference \u{2014} NSLayoutConstraint") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSLayoutConstraint",
                    kind: "class : NSObject",
                    availability: "macOS 10.7+",
                    blurb: "The fundamental Auto Layout constraint. Defines a linear relationship between two layout attributes: firstItem.firstAttribute = secondItem.secondAttribute * multiplier + constant. Prefer the anchor API (NSLayoutAnchor) over direct NSLayoutConstraint construction."
                ) {
                    snippet("""
                    class NSLayoutConstraint: NSObject

                    // Visual Format Language (legacy):
                    NSLayoutConstraint.constraints(withVisualFormat: "H:|-[button]-|",
                                                    options: [],
                                                    metrics: nil,
                                                    views: ["button": myButton])

                    // Direct construction (verbose; prefer anchors):
                    NSLayoutConstraint(
                        item: labelView, attribute: .leading,
                        relatedBy: .equal,
                        toItem: container, attribute: .leading,
                        multiplier: 1.0,
                        constant: 16
                    )

                    // Key properties:
                    var firstItem: AnyObject? { get }
                    var secondItem: AnyObject? { get }
                    var firstAttribute: NSLayoutConstraint.Attribute { get }
                    var secondAttribute: NSLayoutConstraint.Attribute { get }
                    var relation: NSLayoutConstraint.Relation { get }    // .equal / .lessThanOrEqual / .greaterThanOrEqual
                    var multiplier: CGFloat { get }
                    var constant: CGFloat { get set }    // the only mutable part
                    var priority: NSLayoutConstraint.Priority { get set }
                    var isActive: Bool { get set }

                    // Activate/deactivate in bulk:
                    NSLayoutConstraint.activate([c1, c2, c3])
                    NSLayoutConstraint.deactivate([c1, c2, c3])

                    // Identifier for debugging:
                    var identifier: String?

                    // Critical: set translatesAutoresizingMaskIntoConstraints = false
                    // on EVERY view that participates in Auto Layout:
                    myView.translatesAutoresizingMaskIntoConstraints = false
                    """)
                }
            }
        }
    }

    private var anchorSection: some View {
        PageSection("Reference \u{2014} NSLayoutAnchor / NSLayoutXAxisAnchor / NSLayoutYAxisAnchor / NSLayoutDimension") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSLayoutAnchor",
                    kind: "class : NSObject (generic)",
                    availability: "macOS 10.11+",
                    blurb: "The modern, type-safe Auto Layout anchor API. NSLayoutXAxisAnchor handles horizontal positions; NSLayoutYAxisAnchor handles vertical positions; NSLayoutDimension handles sizes. Produced by NSView layout anchors."
                ) {
                    snippet("""
                    // NSView layout anchors:
                    view.leadingAnchor     : NSLayoutXAxisAnchor
                    view.trailingAnchor    : NSLayoutXAxisAnchor
                    view.leftAnchor        : NSLayoutXAxisAnchor
                    view.rightAnchor       : NSLayoutXAxisAnchor
                    view.centerXAnchor     : NSLayoutXAxisAnchor
                    view.topAnchor         : NSLayoutYAxisAnchor
                    view.bottomAnchor      : NSLayoutYAxisAnchor
                    view.centerYAnchor     : NSLayoutYAxisAnchor
                    view.firstBaselineAnchor: NSLayoutYAxisAnchor
                    view.lastBaselineAnchor: NSLayoutYAxisAnchor
                    view.widthAnchor       : NSLayoutDimension
                    view.heightAnchor      : NSLayoutDimension

                    // NSLayoutXAxisAnchor / NSLayoutYAxisAnchor:
                    class NSLayoutXAxisAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>
                    class NSLayoutYAxisAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>

                    // Constraint creation methods:
                    anchor.constraint(equalTo: otherAnchor)
                    anchor.constraint(equalTo: otherAnchor, constant: 16)
                    anchor.constraint(greaterThanOrEqualTo: otherAnchor)
                    anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: -8)

                    // NSLayoutDimension (size anchors):
                    class NSLayoutDimension: NSLayoutAnchor<NSLayoutDimension>
                    widthAnchor.constraint(equalToConstant: 100)    // fixed size
                    widthAnchor.constraint(equalTo: otherDimension, multiplier: 0.5)

                    // Full example — pin a view inside its superview with 16pt insets:
                    myView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        myView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 16),
                        myView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
                        myView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16),
                        myView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -16),
                    ])
                    """)
                }
            }
        }
    }

    private var guideSection: some View {
        PageSection("Reference \u{2014} NSLayoutGuide") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSLayoutGuide",
                    kind: "class : NSObject",
                    availability: "macOS 10.11+",
                    blurb: "An invisible rectangular region that participates in Auto Layout without being an NSView. Use guides to distribute views evenly, create spacing tokens, or define safe layout areas."
                ) {
                    snippet("""
                    class NSLayoutGuide: NSObject

                    var identifier: NSUserInterfaceItemIdentifier
                    var owningView: NSView? { get }   // set when guide is added to a view
                    var frame: NSRect { get }         // computed by Auto Layout

                    // All standard NSView anchors are available:
                    var leadingAnchor: NSLayoutXAxisAnchor { get }
                    var trailingAnchor: NSLayoutXAxisAnchor { get }
                    var centerXAnchor: NSLayoutXAxisAnchor { get }
                    var topAnchor: NSLayoutYAxisAnchor { get }
                    var bottomAnchor: NSLayoutYAxisAnchor { get }
                    var centerYAnchor: NSLayoutYAxisAnchor { get }
                    var widthAnchor: NSLayoutDimension { get }
                    var heightAnchor: NSLayoutDimension { get }

                    // Add to a view first:
                    let spacer = NSLayoutGuide()
                    spacer.identifier = NSUserInterfaceItemIdentifier("spacer")
                    container.addLayoutGuide(spacer)
                    NSLayoutConstraint.activate([
                        spacer.leadingAnchor.constraint(equalTo: viewA.trailingAnchor),
                        spacer.trailingAnchor.constraint(equalTo: viewB.leadingAnchor),
                        spacer.widthAnchor.constraint(equalToConstant: 20),
                    ])

                    // Remove:
                    container.removeLayoutGuide(spacer)
                    """)
                }
            }
        }
    }

    private var compressionSection: some View {
        PageSection("Reference \u{2014} NSUserInterfaceCompression") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSUserInterfaceCompression",
                    kind: "protocol",
                    availability: "macOS 10.13+",
                    blurb: "Adopted by views that can reduce their size when the containing toolbar or split view runs out of space. The system calls compress(withPrioritizedCompressionOptions:) with a ranked list of compression strategies."
                ) {
                    snippet("""
                    protocol NSUserInterfaceCompression {
                        func compress(withPrioritizedCompressionOptions
                            prioritizedOptions: [NSUserInterfaceCompressionOptions])
                        func minimumSize(withPrioritizedCompressionOptions
                            prioritizedOptions: [NSUserInterfaceCompressionOptions]) -> NSSize
                        var isHidden: Bool { get }
                    }

                    // NSUserInterfaceCompressionOptions (OptionSet):
                    struct NSUserInterfaceCompressionOptions: OptionSet {
                        static let hideImages:       NSUserInterfaceCompressionOptions
                        static let hideText:         NSUserInterfaceCompressionOptions
                        static let reduceMetrics:    NSUserInterfaceCompressionOptions
                        static let breakEqualWidths: NSUserInterfaceCompressionOptions
                        static let standardOptions:  NSUserInterfaceCompressionOptions  // all above
                    }

                    // Implementation example:
                    class MyToolbarView: NSView, NSUserInterfaceCompression {
                        func compress(withPrioritizedCompressionOptions options: [NSUserInterfaceCompressionOptions]) {
                            for option in options {
                                if option.contains(.hideText) { titleLabel.isHidden = true; return }
                                if option.contains(.hideImages) { iconView.isHidden = true; return }
                            }
                        }
                        func minimumSize(withPrioritizedCompressionOptions options: [NSUserInterfaceCompressionOptions]) -> NSSize {
                            return NSSize(width: 32, height: bounds.height)
                        }
                    }
                    """)
                }
            }
        }
    }

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("exclamationmark.triangle", "Always set translatesAutoresizingMaskIntoConstraints = false on every view before adding constraints. Leaving it true causes a conflict between Auto Layout and the legacy autoresizing system.")
                noteRow("arrow.left.and.right", "NSLayoutXAxisAnchor and NSLayoutYAxisAnchor are typed generics — the compiler prevents accidentally constraining a horizontal anchor to a vertical one at compile time.")
                noteRow("rectangle.dashed", "NSLayoutGuide is the correct way to create invisible spacers. Never add a transparent NSView just to act as a spacer — guides are lightweight and don't participate in event handling.")
                noteRow("arrow.down.right.and.arrow.up.left", "NSUserInterfaceCompression is called by NSToolbar when the window is too narrow. Implement it on custom toolbar item views to gracefully hide labels or images before the toolbar clips them.")
                noteRow("percent", "NSLayoutDimension.constraint(equalTo:multiplier:) creates proportional sizing — use a multiplier of 0.5 to make a view exactly half the width of another.")
            }
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

extension NSViewLayoutPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewLayout.nsViewLayout",
        title: "View Layout",
        folder: "View layout",
        framework: .appKit,
        absorbedSymbols: [
            "NSLayoutConstraint",
            "NSLayoutGuide",
            "NSLayoutDimension",
            "NSLayoutAnchor",
            "NSLayoutXAxisAnchor",
            "NSLayoutYAxisAnchor",
            "NSUserInterfaceCompression"
        ],
        blurb: "Auto Layout in AppKit: NSLayoutConstraint, the NSLayoutAnchor anchor family, NSLayoutGuide, and the NSUserInterfaceCompression view-compression protocol.",
        signature: "Auto Layout class + protocol family",
        availability: "macOS 10.7+",
        docPath: "Documentation/AppKit/view-layout/view-layout.md",
        page: { AnyView(NSViewLayoutPage()) }
    )
}

#Preview {
    NSViewLayoutPage().frame(width: 1100, height: 900)
}
