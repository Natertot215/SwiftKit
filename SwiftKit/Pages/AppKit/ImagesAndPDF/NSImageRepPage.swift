import SwiftUI
import AppKit

// AppKit Images and PDF — image representation classes and PDF support.
//
// Absorbed leaves:
//   Images (remaining placeholders):
//     Applying Apple HDR effect to your photos (article)
//   Bitmap Formats: NSBitmapImageRep, NSCIImageRep, NSPICTImageRep
//   Vector Formats:  NSPDFImageRep, NSPDFInfo, NSEPSImageRep
//   Custom Formats:  NSCustomImageRep

// MARK: - Bridges

private struct NSBitmapImageRepDemoView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let container = NSView()
        container.translatesAutoresizingMaskIntoConstraints = false

        // Create a simple bitmap by drawing into a bitmap context
        let size = CGSize(width: 80, height: 80)
        let rep = NSBitmapImageRep(
            bitmapDataPlanes: nil,
            pixelsWide: Int(size.width),
            pixelsHigh: Int(size.height),
            bitsPerSample: 8,
            samplesPerPixel: 4,
            hasAlpha: true,
            isPlanar: false,
            colorSpaceName: .deviceRGB,
            bytesPerRow: 0,
            bitsPerPixel: 0
        )

        if let rep {
            NSGraphicsContext.saveGraphicsState()
            NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
            NSColor.controlAccentColor.withAlphaComponent(0.7).setFill()
            NSBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 60, height: 60)).fill()
            NSGraphicsContext.restoreGraphicsState()

            let img = NSImage(size: size)
            img.addRepresentation(rep)
            let imageView = NSImageView(image: img)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.imageScaling = .scaleProportionallyUpOrDown
            container.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 80),
                imageView.heightAnchor.constraint(equalToConstant: 80),
            ])
        }
        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

// MARK: - Page

struct NSImageRepPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                hdrSection
                bitmapSection
                ciImageRepSection
                pdfRepSection
                epsSection
                customRepSection
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
            Text("Images and PDF")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Image representation classes: NSBitmapImageRep, NSCIImageRep, NSPDFImageRep, NSEPSImageRep, and NSCustomImageRep. Covers HDR, PDF, and custom format support.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSImageRep hierarchy")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: HDR

    private var hdrSection: some View {
        PageSection("HDR \u{2014} Applying Apple HDR Effect to Photos") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "Apple HDR Photo Effect",
                    kind: "article",
                    availability: "macOS 14.0+",
                    blurb: "NSImage supports displaying images with the Apple HDR effect using the image's embedded headroom metadata. Set the preferredImageDynamicRange on an NSImageView to opt in."
                ) {
                    snippet("""
                    // Enable EDR (Extended Dynamic Range) rendering for an image view (macOS 14+):
                    let imageView = NSImageView(image: hdrImage)
                    imageView.preferredImageDynamicRange = .high   // .standard / .high / .constrainedHigh

                    // Display headroom:
                    let headroom = imageView.image?.recommendedLayerContentsScale(0)
                    // NSScreen.main?.maximumPotentialExtendedDynamicRangeColorComponentValue
                    // gives the screen's maximum EDR headroom factor.

                    // NSImage draws at standard range by default.
                    // Use CALayer.wantsExtendedDynamicRangeContent = true on the backing layer
                    // for CALayer-based rendering of HDR content.
                    """)
                }
            }
        }
    }

    // MARK: Bitmap

    private var bitmapSection: some View {
        PageSection("NSBitmapImageRep") {
            VStack(alignment: .leading, spacing: 16) {
                block("Live NSBitmapImageRep demo") {
                    VStack(alignment: .leading, spacing: 12) {
                        NSBitmapImageRepDemoView()
                            .frame(height: 100)
                            .frame(maxWidth: 200)
                            .padding(12)
                            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                        APICallout("NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: 80, pixelsHigh: 80, ...)")
                        APICallout("NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)")
                        APICallout("// draw into context, then restoreGraphicsState()")
                    }
                }

                refBlock(
                    name: "NSBitmapImageRep",
                    kind: "class : NSImageRep",
                    availability: "macOS 10.0+",
                    blurb: "A raster image representation backed by raw pixel data. Used for reading/writing PNG, JPEG, GIF, TIFF, and other raster formats. Also the target for offscreen raster drawing."
                ) {
                    snippet("""
                    class NSBitmapImageRep: NSImageRep

                    // Init from file data:
                    init?(data: Data)                     // detect format automatically

                    // Init for offscreen rendering (fill params carefully):
                    init?(bitmapDataPlanes planes: UnsafeMutablePointer<UnsafeMutablePointer<UInt8>?>?,
                          pixelsWide width: Int,
                          pixelsHigh height: Int,
                          bitsPerSample bps: Int,        // 8 or 16
                          samplesPerPixel spp: Int,      // 3 (RGB) or 4 (RGBA)
                          hasAlpha alpha: Bool,
                          isPlanar: Bool,
                          colorSpaceName: NSColorSpaceName,
                          bytesPerRow rowBytes: Int,     // 0 = auto
                          bitsPerPixel: Int)             // 0 = auto

                    // Properties:
                    var bitmapFormat: NSBitmapImageRep.Format
                    var bitsPerPixel: Int { get }
                    var bytesPerRow: Int { get }
                    var bytesPerPlane: Int { get }
                    var numberOfPlanes: Int { get }
                    var isPlanar: Bool { get }
                    var colorSpace: NSColorSpace { get }
                    var bitmapData: UnsafeMutablePointer<UInt8>? { get }  // raw pixel bytes

                    // Pixel access:
                    func getPixel(_ pixel: UnsafeMutablePointer<Int>, atX x: Int, y: Int)
                    func setPixel(_ pixel: UnsafeMutablePointer<Int>, atX x: Int, y: Int)
                    func colorAt(x: Int, y: Int) -> NSColor?

                    // Export:
                    func representation(using storageType: NSBitmapImageRep.FileType,
                                         properties: [NSBitmapImageRep.PropertyKey: Any]) -> Data?
                    // FileType: .png / .jpeg / .tiff / .gif / .bmp

                    // Convert NSImage → PNG data:
                    let tiff = image.tiffRepresentation
                    let rep = NSBitmapImageRep(data: tiff!)!
                    let png = rep.representation(using: .png, properties: [:])
                    """)
                }
            }
        }
    }

    // MARK: CIImageRep

    private var ciImageRepSection: some View {
        PageSection("NSCIImageRep / NSPICTImageRep") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSCIImageRep",
                    kind: "class : NSImageRep",
                    availability: "macOS 10.4+",
                    blurb: "Wraps a Core Image CIImage as an NSImageRep, enabling CIImage content to be embedded in NSImage objects. Useful for Core Image filter pipelines that produce images for display."
                ) {
                    snippet("""
                    class NSCIImageRep: NSImageRep

                    init(ciImage image: CIImage)
                    var ciImage: CIImage { get }

                    // Usage — wrap CIImage output in NSImage:
                    let ciImage = CIFilter.gaussianBlur().outputImage!
                    let rep = NSCIImageRep(ciImage: ciImage)
                    let nsImage = NSImage(size: rep.size)
                    nsImage.addRepresentation(rep)
                    imageView.image = nsImage
                    """)
                }

                refBlock(
                    name: "NSPICTImageRep",
                    kind: "class : NSImageRep — legacy",
                    availability: "macOS 10.0+ (deprecated)",
                    blurb: "Reads QuickDraw PICT format image data. PICT is a legacy format from the classic Mac OS era. No new code should create PICT files; this class exists only for reading old PICT assets."
                ) {
                    snippet("""
                    class NSPICTImageRep: NSImageRep  // Legacy — PICT is a QuickDraw format
                    init?(data pictData: Data)
                    var pictData: Data { get }
                    var boundingBox: NSRect { get }
                    // Note: PICT rendering may be incomplete on Apple Silicon.
                    """)
                }
            }
        }
    }

    // MARK: PDF

    private var pdfRepSection: some View {
        PageSection("NSPDFImageRep / NSPDFInfo") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSPDFImageRep",
                    kind: "class : NSImageRep",
                    availability: "macOS 10.0+",
                    blurb: "Renders a PDF document (or a single page) as an NSImageRep. Each page of the PDF is a separate representation. Use to embed PDF content in NSImage for display or export."
                ) {
                    snippet("""
                    class NSPDFImageRep: NSImageRep

                    init?(data pdfData: Data)

                    var pdfOperationsAllowed: Bool { get }
                    var currentPage: Int { get set }    // zero-based page index
                    var pageCount: Int { get }
                    var bounds: NSRect { get }          // page bounds in PDF user space

                    // Get raw PDF data:
                    var pdfData: Data? { get }

                    // Usage — draw a specific page of a PDF:
                    guard let data = try? Data(contentsOf: pdfURL),
                          let rep = NSPDFImageRep(data: data) else { return }
                    rep.currentPage = 0   // first page
                    let img = NSImage(size: rep.bounds.size)
                    img.addRepresentation(rep)
                    imageView.image = img
                    """)
                }

                refBlock(
                    name: "NSPDFInfo",
                    kind: "class : NSObject",
                    availability: "macOS 10.9+",
                    blurb: "Carries the destination URL, paper size, orientation, and custom attributes for a PDF export. Used with NSPDFPanel.shared to configure a PDF save-as dialog."
                ) {
                    snippet("""
                    class NSPDFInfo: NSObject, NSSecureCoding

                    var url: URL?                    // output file URL (set after panel completes)
                    var isFileHidden: Bool
                    var tagNames: [String]           // Finder tags for the new file
                    var orientation: NSPaperOrientation    // .portrait / .landscape
                    var paperSize: NSSize
                    var attributes: NSMutableDictionary { get }  // custom PDF metadata

                    // Usage with NSPDFPanel:
                    let info = NSPDFInfo()
                    NSPDFPanel.shared.beginSheet(with: info, modalFor: window) { resultCode in
                        if resultCode == NSApplication.ModalResponse.OK.rawValue,
                           let url = info.url {
                            // Write PDF to url
                        }
                    }
                    """)
                }
            }
        }
    }

    // MARK: EPS

    private var epsSection: some View {
        PageSection("NSEPSImageRep") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSEPSImageRep",
                    kind: "class : NSImageRep",
                    availability: "macOS 10.0+",
                    blurb: "Renders Encapsulated PostScript (EPS) data as an NSImageRep. EPS is a PostScript-based vector format common in print workflows. NSEPSImageRep wraps the EPS data and rasterizes it for display."
                ) {
                    snippet("""
                    class NSEPSImageRep: NSImageRep

                    init?(data epsData: Data)
                    var epsData: Data { get }
                    var boundingBox: NSRect { get }

                    // Typically accessed via NSImage:
                    if let image = NSImage(data: epsFileData) {
                        if let rep = image.representations.first as? NSEPSImageRep {
                            print("EPS bounds:", rep.boundingBox)
                        }
                    }
                    """)
                }
            }
        }
    }

    // MARK: Custom Rep

    private var customRepSection: some View {
        PageSection("NSCustomImageRep") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSCustomImageRep",
                    kind: "class : NSImageRep",
                    availability: "macOS 10.0+",
                    blurb: "An NSImageRep that delegates drawing to a closure or a selector on an object. Use to embed arbitrary drawing code inside an NSImage so the image can be drawn at any size."
                ) {
                    snippet("""
                    class NSCustomImageRep: NSImageRep

                    // Block-based (macOS 10.8+):
                    init(size: NSSize, flipped: Bool, drawingHandler: @escaping (NSRect) -> Bool)

                    // Usage — scalable custom drawing inside NSImage:
                    let image = NSImage(size: NSSize(width: 32, height: 32))
                    let rep = NSCustomImageRep(size: image.size, flipped: false) { dstRect in
                        NSColor.controlAccentColor.setFill()
                        NSBezierPath(ovalIn: dstRect.insetBy(dx: 2, dy: 2)).fill()
                        return true
                    }
                    image.addRepresentation(rep)
                    imageView.image = image

                    // The drawing block is called whenever the image is drawn,
                    // allowing resolution-independent, always-crisp rendering.
                    """)
                }
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("photo", "NSImageRep is the abstract base for all representation classes. NSImage stores one or more representations and picks the best one for the rendering context (screen vs print, 1x vs 2x).")
                noteRow("square.grid.2x2", "NSBitmapImageRep is the go-to class for pixel-level image manipulation. Access raw bytes via .bitmapData, or use the getPixel/setPixel methods for individual pixels.")
                noteRow("wand.and.rays", "NSCIImageRep bridges Core Image and AppKit. Wrap any CIImage (filter output, camera input) in NSCIImageRep and add it to an NSImage to display it anywhere AppKit images are accepted.")
                noteRow("doc.richtext", "NSPDFImageRep renders individual PDF pages. For full PDF document display with navigation, use PDFView from the PDFKit framework instead.")
                noteRow("pencil.and.ruler", "NSCustomImageRep is the vector-image pattern for AppKit — the drawing closure is called at any target size, so the icon stays crisp at all resolutions without needing separate @2x assets.")
                noteRow("sun.max", "For HDR photo display (macOS 14+), set NSImageView.preferredImageDynamicRange = .high and ensure the window's colorSpace supports extended range (P3 or wider).")
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

extension NSImageRepPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.imagesAndPDF.nsImageRep",
        title: "NSImageRep",
        folder: "Images and PDF",
        framework: .appKit,
        absorbedSymbols: [
            "NSImageRep",
            "NSBitmapImageRep",
            "NSCIImageRep",
            "NSPICTImageRep",
            "NSPDFImageRep",
            "NSPDFInfo",
            "NSEPSImageRep",
            "NSCustomImageRep"
        ],
        blurb: "Image representation classes: bitmap, Core Image, PDF, EPS, and custom format reps that back NSImage. Includes HDR application notes and PDF info metadata.",
        signature: "class NSImageRep : NSObject",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/images-and-pdf/nsimagerep.md",
        page: { AnyView(NSImageRepPage()) }
    )
}

#Preview {
    NSImageRepPage().frame(width: 1100, height: 900)
}
