import SwiftUI
import AppKit

// AppKit Drawing — NSBezierPath, NSGraphicsContext, NSGradient, NSShadow,
// convenience drawing functions, and NSStringDrawingContext.
//
// Absorbed leaves:
//   Drawing Contexts: NSGraphicsContext
//   Shapes & Paths:  NSBezierPath, Convenience Functions, NSEraseRect, NSDrawTiledRects,
//                    NSDrawGroove, NSDrawDarkBezel, NSDrawGrayBezel, NSDrawLightBezel,
//                    NSDrawWhiteBezel, NSDrawButton, NSDrawWindowBackground,
//                    NSDrawNinePartImage, NSDrawThreePartImage,
//                    NSFocusRingPlacement, NSFocusRingPlacement.set(), NSFocusRingType
//   Strings:         NSStringDrawingContext
//   Gradients:       NSGradient
//   Shadows:         NSShadow

// MARK: - Bridges

private struct NSBezierPathDemoView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        BezierCanvas()
    }
    func updateNSView(_ nsView: NSView, context: Context) {}

    private class BezierCanvas: NSView {
        override func draw(_ dirtyRect: NSRect) {
            super.draw(dirtyRect)

            // Rounded rect path
            let path = NSBezierPath(roundedRect: bounds.insetBy(dx: 12, dy: 12), xRadius: 16, yRadius: 16)
            NSColor.controlAccentColor.withAlphaComponent(0.2).setFill()
            path.fill()
            NSColor.controlAccentColor.setStroke()
            path.lineWidth = 2
            path.stroke()

            // Gradient overlay
            if let gradient = NSGradient(colors: [NSColor.controlAccentColor.withAlphaComponent(0.5), NSColor.clear]) {
                gradient.draw(in: path, angle: 90)
            }
        }
    }
}

private struct NSShadowDemoView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        ShadowCanvas()
    }
    func updateNSView(_ nsView: NSView, context: Context) {}

    private class ShadowCanvas: NSView {
        override func draw(_ dirtyRect: NSRect) {
            super.draw(dirtyRect)
            guard let ctx = NSGraphicsContext.current?.cgContext else { return }

            ctx.saveGState()
            let shadow = NSShadow()
            shadow.shadowColor = NSColor.black.withAlphaComponent(0.4)
            shadow.shadowBlurRadius = 8
            shadow.shadowOffset = NSSize(width: 0, height: -4)
            shadow.set()

            let rect = bounds.insetBy(dx: 20, dy: 14)
            let path = NSBezierPath(roundedRect: rect, xRadius: 10, yRadius: 10)
            NSColor.controlBackgroundColor.setFill()
            path.fill()
            ctx.restoreGState()
        }
    }
}

// MARK: - Page

struct NSDrawingPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                bezierSection
                graphicsContextSection
                gradientSection
                shadowSection
                convenienceFunctionsSection
                stringDrawingSection
                focusRingSection
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
            Text("Drawing")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSBezierPath, NSGraphicsContext, NSGradient, NSShadow, and AppKit drawing convenience functions.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSStringDrawingContext macOS 10.11+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: NSBezierPath

    private var bezierSection: some View {
        PageSection("NSBezierPath") {
            VStack(alignment: .leading, spacing: 16) {
                block("NSBezierPath + NSGradient canvas demo") {
                    NSBezierPathDemoView()
                        .frame(height: 100)
                        .frame(maxWidth: 360)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                refBlock(
                    name: "NSBezierPath",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Represents a vector path composed of straight lines, Bezier curves, and arcs. Use in NSView.draw(_:) by calling fill() and stroke(). Thread-safe to construct; must be drawn on the main thread."
                ) {
                    snippet("""
                    class NSBezierPath: NSObject, NSCopying, NSSecureCoding

                    // Convenience constructors:
                    NSBezierPath(rect: bounds)
                    NSBezierPath(ovalIn: rect)
                    NSBezierPath(roundedRect: rect, xRadius: 8, yRadius: 8)

                    // Building a path:
                    let path = NSBezierPath()
                    path.move(to: NSPoint(x: 10, y: 10))
                    path.line(to: NSPoint(x: 200, y: 10))
                    path.curve(to: NSPoint(x: 200, y: 100),
                               controlPoint1: NSPoint(x: 200, y: 40),
                               controlPoint2: NSPoint(x: 200, y: 80))
                    path.close()

                    // Arc:
                    path.appendArc(withCenter: center, radius: 50,
                                   startAngle: 0, endAngle: 270)

                    // Stroke and fill:
                    NSColor.controlAccentColor.setStroke()
                    NSColor.systemBlue.withAlphaComponent(0.3).setFill()
                    path.lineWidth = 2
                    path.lineJoinStyle = .round     // .miter / .round / .bevel
                    path.lineCapStyle = .round      // .butt / .round / .square
                    path.stroke()
                    path.fill()

                    // Clip:
                    path.setClip()

                    // Dash pattern:
                    let pattern: [CGFloat] = [6, 3]
                    path.setLineDash(pattern, count: 2, phase: 0)

                    // Winding rule:
                    path.windingRule = .evenOdd   // .nonZero / .evenOdd

                    // Transform:
                    let t = AffineTransform(rotationByDegrees: 45)
                    path.transform(using: t)

                    // Hit testing:
                    let hit = path.contains(NSPoint(x: 50, y: 50))
                    """)
                }
            }
        }
    }

    // MARK: NSGraphicsContext

    private var graphicsContextSection: some View {
        PageSection("NSGraphicsContext") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSGraphicsContext",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Manages the current drawing state for AppKit rendering. In NSView.draw(_:) the context is already set; use NSGraphicsContext.current to access it. The underlying CGContext is available via .cgContext."
                ) {
                    snippet("""
                    class NSGraphicsContext: NSObject

                    // Access the current context (inside draw(_:)):
                    static var current: NSGraphicsContext? { get set }

                    // Underlying Core Graphics context:
                    var cgContext: CGContext { get }

                    // Save/restore graphics state:
                    func saveGraphicsState()    // push
                    func restoreGraphicsState() // pop

                    // Static helpers:
                    static func saveGraphicsState()
                    static func restoreGraphicsState()

                    // Create for offscreen rendering:
                    static func current(for cgContext: CGContext) -> NSGraphicsContext

                    // Image rendering context (for drawing into NSImage):
                    let img = NSImage(size: NSSize(width: 100, height: 100))
                    img.lockFocus()
                    // draw here...
                    img.unlockFocus()

                    // Properties:
                    var isFlipped: Bool { get }                    // coordinate system orientation
                    var shouldAntialias: Bool { get set }
                    var imageInterpolation: NSImageInterpolation   // .default / .none / .low / .medium / .high
                    var compositingOperation: NSCompositingOperation
                    var colorRenderingIntent: CGColorRenderingIntent
                    """)
                }
            }
        }
    }

    // MARK: NSGradient

    private var gradientSection: some View {
        PageSection("NSGradient") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSGradient",
                    kind: "class : NSObject",
                    availability: "macOS 10.5+",
                    blurb: "An AppKit gradient that draws into the current graphics context. Supports both linear (angle-based) and radial variants. Always draw inside NSView.draw(_:)."
                ) {
                    snippet("""
                    class NSGradient: NSObject, NSSecureCoding, NSCopying

                    // Initializers:
                    init?(colors: [NSColor])                     // equal spacing
                    init?(colors: [NSColor], atLocations locations: [CGFloat], colorSpace: NSColorSpace)
                    init?(starting startingColor: NSColor, ending endingColor: NSColor)

                    // Draw linear (angle in degrees; 0 = left-to-right, 90 = bottom-to-top):
                    func draw(in rect: NSRect, angle: CGFloat)
                    func draw(in path: NSBezierPath, angle: CGFloat)

                    // Draw radial:
                    func draw(fromCenter startCenter: NSPoint, radius startRadius: CGFloat,
                               toCenter endCenter: NSPoint, radius endRadius: CGFloat,
                               options: NSGradient.DrawingOptions)

                    // DrawingOptions:
                    // .drawsBeforeStartingLocation / .drawsAfterEndingLocation

                    // Properties:
                    var colorSpace: NSColorSpace { get }
                    var numberOfColorStops: Int { get }
                    func getColor(_ color: AutoreleasingUnsafeMutablePointer<NSColor?>,
                                  location: UnsafeMutablePointer<CGFloat>?,
                                  at index: Int)
                    """)
                }
            }
        }
    }

    // MARK: NSShadow

    private var shadowSection: some View {
        PageSection("NSShadow") {
            VStack(alignment: .leading, spacing: 16) {
                block("NSShadow canvas demo") {
                    NSShadowDemoView()
                        .frame(height: 80)
                        .frame(maxWidth: 340)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                refBlock(
                    name: "NSShadow",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "Describes a drop shadow for AppKit drawing. Call set() to apply it to the current graphics state, then draw the shadowed content. Wrap in saveGraphicsState()/restoreGraphicsState() to limit scope."
                ) {
                    snippet("""
                    class NSShadow: NSObject, NSCopying, NSSecureCoding

                    var shadowOffset: NSSize         // x = horizontal, y = vertical
                    var shadowBlurRadius: CGFloat    // 0 = hard; larger = softer
                    var shadowColor: NSColor?        // nil = no shadow

                    func set()    // push this shadow onto the current graphics state

                    // Usage in draw(_:):
                    NSGraphicsContext.saveGraphicsState()
                    let shadow = NSShadow()
                    shadow.shadowColor = NSColor.black.withAlphaComponent(0.4)
                    shadow.shadowOffset = NSSize(width: 2, height: -4)
                    shadow.shadowBlurRadius = 6
                    shadow.set()

                    // Draw shadowed content:
                    NSBezierPath(roundedRect: myRect, xRadius: 8, yRadius: 8).fill()

                    NSGraphicsContext.restoreGraphicsState()

                    // NSAttributedString attribute:
                    let attrs: [NSAttributedString.Key: Any] = [.shadow: shadow]
                    """)
                }
            }
        }
    }

    // MARK: Convenience Functions

    private var convenienceFunctionsSection: some View {
        PageSection("Drawing Convenience Functions") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "Rect Fill, Bezel, and Image Tiling Functions",
                    kind: "global functions",
                    availability: "macOS 10.0+",
                    blurb: "Legacy AppKit drawing helpers. Prefer NSBezierPath for paths and NSImage.draw(in:) for images in modern code. These functions remain useful when implementing NSCell subclasses or legacy view drawing."
                ) {
                    snippet("""
                    // Fill a rect with the current fill color:
                    NSEraseRect(_ rect: NSRect)      // fill with white (erase)
                    NSRectFill(_ rect: NSRect)        // fill with current fill color

                    // Tiled rects (for striped/banded backgrounds):
                    NSDrawTiledRects(_ boundsRect: NSRect, _ clipRect: NSRect,
                                     _ sides: UnsafePointer<NSRectEdge>,
                                     _ grays: UnsafePointer<CGFloat>, _ count: Int) -> NSRect

                    // Bezel drawing (classic Mac appearance; rare in modern apps):
                    NSDrawGroove(_ rect: NSRect, _ clipRect: NSRect)
                    NSDrawDarkBezel(_ rect: NSRect, _ clipRect: NSRect)
                    NSDrawGrayBezel(_ rect: NSRect, _ clipRect: NSRect)
                    NSDrawLightBezel(_ rect: NSRect, _ clipRect: NSRect)
                    NSDrawWhiteBezel(_ rect: NSRect, _ clipRect: NSRect)
                    NSDrawButton(_ rect: NSRect, _ clipRect: NSRect)
                    NSDrawWindowBackground(_ rect: NSRect)   // fill with window background color

                    // Nine-part and three-part image tiling (for stretchable UI elements):
                    NSDrawNinePartImage(
                        _ frame: NSRect,
                        _ topLeftCorner: NSImage, _ topEdgeFill: NSImage, _ topRightCorner: NSImage,
                        _ leftEdgeFill: NSImage,  _ centerFill: NSImage,  _ rightEdgeFill: NSImage,
                        _ bottomLeftCorner: NSImage, _ bottomEdgeFill: NSImage, _ bottomRightCorner: NSImage,
                        _ op: NSCompositingOperation, _ alphaFraction: CGFloat, _ flipped: Bool, _ drawingRect: NSRect
                    )

                    NSDrawThreePartImage(
                        _ frame: NSRect,
                        _ startCap: NSImage, _ centerFill: NSImage, _ endCap: NSImage,
                        _ vertical: Bool, _ op: NSCompositingOperation,
                        _ alphaFraction: CGFloat, _ flipped: Bool
                    )
                    """)
                }
            }
        }
    }

    // MARK: String Drawing

    private var stringDrawingSection: some View {
        PageSection("NSStringDrawingContext") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSStringDrawingContext",
                    kind: "class : NSObject",
                    availability: "macOS 10.11+",
                    blurb: "Provides additional control over NSAttributedString's draw(with:options:context:) calls — specifically the minimum scale factor for reducing font size to fit a rect."
                ) {
                    snippet("""
                    class NSStringDrawingContext: NSObject

                    var minimumScaleFactor: CGFloat  // 0.0–1.0; 0 = no scaling; default = 0
                    var actualScaleFactor: CGFloat { get }    // set after drawing
                    var totalBounds: CGRect { get }           // bounding rect used during drawing

                    // Usage:
                    let context = NSStringDrawingContext()
                    context.minimumScaleFactor = 0.7   // shrink to 70% minimum

                    let str = NSAttributedString(string: "Hello World",
                                                  attributes: [.font: NSFont.systemFont(ofSize: 18)])
                    str.draw(with: targetRect,
                             options: [.usesLineFragmentOrigin, .usesFontLeading],
                             context: context)
                    print("Actual scale used:", context.actualScaleFactor)
                    """)
                }
            }
        }
    }

    // MARK: Focus Ring

    private var focusRingSection: some View {
        PageSection("Focus Ring") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSFocusRingPlacement / NSFocusRingType",
                    kind: "enum / enum",
                    availability: "macOS 10.0+",
                    blurb: "Control how and whether AppKit draws the keyboard-focus ring around custom NSView subclasses. In most cases, simply override drawFocusRingMask() and set focusRingMaskBounds."
                ) {
                    snippet("""
                    // NSFocusRingType — set on NSView or NSCell:
                    enum NSFocusRingType: UInt {
                        case `default`   // system chooses (usually .exterior)
                        case none        // suppress focus ring
                        case exterior    // ring drawn outside the control bounds
                    }
                    // Set on view:
                    view.focusRingType = .exterior

                    // NSFocusRingPlacement — set the clipping context for ring drawing:
                    enum NSFocusRingPlacement {
                        static func set()   // no-op in modern AppKit; legacy API
                    }

                    // Modern approach — override in NSView subclass:
                    override func drawFocusRingMask() {
                        NSBezierPath(roundedRect: bounds, xRadius: 6, yRadius: 6).fill()
                    }
                    override var focusRingMaskBounds: NSRect {
                        return bounds
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
                noteRow("paintbrush", "NSBezierPath drawing must occur inside NSView.draw(_:) or within an NSImage.lockFocus()/unlockFocus() block. Drawing outside these contexts produces undefined behavior.")
                noteRow("wand.and.rays", "NSGraphicsContext.current gives access to the underlying CGContext. For Core Graphics calls, extract it via .cgContext and wrap in ctx.saveGState()/restoreGState().")
                noteRow("sun.max", "NSGradient draws linear gradients using angle (0\u{00b0} = left-to-right, 90\u{00b0} = bottom-to-top) and radial gradients using two center/radius pairs. Always draw inside a clipping path.")
                noteRow("shadow", "NSShadow must be applied before drawing the content it shadows. Use saveGraphicsState()/restoreGraphicsState() to scope the shadow — it would otherwise affect all subsequent drawing.")
                noteRow("textformat.size", "NSStringDrawingContext.minimumScaleFactor is the AppKit way to shrink text to fit a rect — equivalent to SwiftUI's .minimumScaleFactor modifier.")
                noteRow("keyboard", "NSFocusRingType.none suppresses the focus ring visually but does not remove keyboard-focus semantics. Only use it when you draw a fully custom focus indicator.")
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

extension NSDrawingPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.drawing.nsDrawing",
        title: "Drawing",
        folder: "Drawing",
        framework: .appKit,
        absorbedSymbols: [
            "NSGraphicsContext",
            "NSBezierPath",
            "NSEraseRect",
            "NSDrawTiledRects",
            "NSDrawGroove",
            "NSDrawDarkBezel",
            "NSDrawGrayBezel",
            "NSDrawLightBezel",
            "NSDrawWhiteBezel",
            "NSDrawButton",
            "NSDrawWindowBackground",
            "NSDrawNinePartImage",
            "NSDrawThreePartImage",
            "NSFocusRingPlacement",
            "NSFocusRingType",
            "NSStringDrawingContext",
            "NSGradient",
            "NSShadow"
        ],
        blurb: "AppKit drawing primitives — NSBezierPath, NSGraphicsContext, NSGradient, NSShadow, the convenience C drawing functions, focus-ring placement, and NSStringDrawingContext.",
        signature: "AppKit drawing API surface",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/drawing/nsbezierpath.md",
        page: { AnyView(NSDrawingPage()) }
    )
}

#Preview {
    NSDrawingPage().frame(width: 1100, height: 900)
}
