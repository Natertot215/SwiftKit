import SwiftUI
import AppKit

// AppKit Views and Controls / Controls — dense reference page.
// Covers: NSImageView (class : NSControl) — a frame that displays image data.
// Also absorbs: NSImage (class), NSImageDelegate (protocol), NSImageRep (class),
// NSAccessibilityImage (protocol, describe-only), NSScrubberImageItemView (class, describe-only).
// Sources:
//   Documentation/AppKit/views-and-controls/nsimageview.md
//   Documentation/AppKit/images-and-pdf/nsimage.md
//   Documentation/AppKit/images-and-pdf/nsimagedelegate.md
//   Documentation/AppKit/images-and-pdf/nsimagerep.md
//   Documentation/AppKit/accessibility-for-appkit/nsaccessibilityimage.md
//   Documentation/AppKit/touch-bar/nsscrubberimageitemview.md

// MARK: - NSImageView bridge

private struct NSImageViewDemo: NSViewRepresentable {
    var symbolName: String
    var scaling: NSImageScaling
    var alignment: NSImageAlignment
    var frameStyle: NSImageView.FrameStyle
    var tint: NSColor?

    func makeNSView(context: Context) -> NSImageView {
        let view = NSImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    func updateNSView(_ nsView: NSImageView, context: Context) {
        nsView.image = NSImage(systemSymbolName: symbolName, accessibilityDescription: symbolName)
        nsView.imageScaling = scaling
        nsView.imageAlignment = alignment
        nsView.imageFrameStyle = frameStyle
        nsView.contentTintColor = tint
        nsView.symbolConfiguration = .init(pointSize: 36, weight: .regular)
    }
}

// MARK: - NSImage named-symbols demo bridge

private struct NSImageNamedDemo: NSViewRepresentable {
    let symbols: [(String, String)] = [
        ("star.fill",         "star.fill"),
        ("photo",             "photo"),
        ("globe",             "globe"),
        ("heart.fill",        "heart.fill"),
        ("folder.fill",       "folder.fill"),
        ("bell.fill",         "bell.fill"),
    ]

    func makeNSView(context: Context) -> NSStackView {
        let stack = NSStackView()
        stack.orientation = .horizontal
        stack.spacing = 20
        stack.alignment = .centerY
        stack.translatesAutoresizingMaskIntoConstraints = false

        for (name, desc) in symbols {
            let iv = NSImageView()
            iv.image = NSImage(systemSymbolName: name, accessibilityDescription: desc)
            iv.symbolConfiguration = .init(pointSize: 28, weight: .regular)
            iv.contentTintColor = .controlAccentColor
            iv.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                iv.widthAnchor.constraint(equalToConstant: 40),
                iv.heightAnchor.constraint(equalToConstant: 40),
            ])
            stack.addArrangedSubview(iv)
        }
        return stack
    }

    func updateNSView(_ nsView: NSStackView, context: Context) {}
}

// MARK: - Page

struct NSImageViewPage: View {
    @State private var symbolName: String = "star.fill"
    @State private var scaling: NSImageScaling = .scaleProportionallyUpOrDown
    @State private var alignment: NSImageAlignment = .alignCenter
    @State private var frameStyle: NSImageView.FrameStyle = .none
    @State private var useTint: Bool = true

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            nsImageSection
        } variants: {
            referenceSection
        } states: {
            nsImageViewSection
        } notes: {
            notesContent
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSImageView / NSImage")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSImage loads, caches, and draws image data. NSImageView is the AppKit control that hosts an NSImage, with configurable scaling, alignment, frame style, and symbol effects.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} NSImageView class : NSControl \u{00b7} NSImage class : NSObject")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: NSImage creation section (Default render tab)

    private var nsImageSection: some View {
        Block(title: "NSImage — creation and named system images") {
            VStack(alignment: .leading, spacing: 16) {
                NSImageNamedDemo()
                    .frame(height: 56)
                    .padding(12)
                    .frame(maxWidth: 480)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                snippet("""
                // class NSImage : NSObject

                // SF Symbol (recommended for UI icons):
                NSImage(systemSymbolName: "star.fill", accessibilityDescription: "Starred")

                // Named asset from bundle:
                NSImage(named: "Logo")               // NSImage.Name constant or string

                // From data:
                NSImage(data: pngData)

                // From file path:
                NSImage(contentsOfFile: "/path/to/image.png")
                NSImage(contentsOf: URL(fileURLWithPath: "/path/to/image.png"))

                // From CGImage:
                NSImage(cgImage: cgImage, size: .zero)  // .zero = use CGImage pixel dimensions

                // System app icon constants (NSImage.Name):
                NSImage(named: .applicationIcon)
                NSImage(named: .cautionName)
                NSImage(named: .menuOnStateTemplate)
                """)

                snippet("""
                // Key NSImage properties:
                image.size                           // NSSize — logical points (not pixels)
                image.representations                // [NSImageRep] — raw image data layers
                image.isTemplate = true              // marks image for tinting via contentTintColor
                image.capInsets = NSEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                image.resizingMode = .stretch        // .tile / .stretch

                // Drawing into a context (used in NSView.draw(_:)):
                image.draw(in: destRect)
                image.draw(in: destRect, from: .zero, operation: .sourceOver, fraction: 1.0)

                // Prefetch / cache control:
                image.cacheMode = .default           // .always / .bySize / .never
                image.recache()
                """)

                APICallout("NSImage(systemSymbolName:accessibilityDescription:) — always provide a non-empty description for accessibility; it becomes the VoiceOver label when the image is not decorative")
            }
        }
    }

    // MARK: Reference section (Variants tab)

    @ViewBuilder
    private var referenceSection: some View {
        VStack(alignment: .leading, spacing: 24) {

            // NSImageDelegate
            Block(title: "Reference — NSImageDelegate protocol") {
                snippet("""
                // protocol NSImageDelegate : NSObjectProtocol
                // Assign to image.delegate (weak reference).
                // Only needed when loading images asynchronously or on demand.

                // Called when a representation finishes loading (on-demand loading):
                optional func image(
                    _ image: NSImage,
                    didLoadRepresentation rep: NSImageRep,
                    with status: NSImage.LoadStatus   // .completed / .cancelled / .invalidData
                                                      // .unexpectedEOF / .readError
                )

                // Called when image draws a portion with incomplete data:
                optional func image(
                    _ image: NSImage,
                    willLoadRepresentation rep: NSImageRep
                )

                // Usage:
                myImage.delegate = self
                // Image will call didLoadRepresentation once each rep finishes loading.
                """)
            }

            // NSImageRep
            Block(title: "Reference — NSImageRep class") {
                snippet("""
                // abstract class NSImageRep : NSObject
                // An NSImage holds one or more NSImageRep instances, each representing
                // the same image at different resolutions, color spaces, or formats.
                // Concrete subclasses (you rarely instantiate directly):
                //   NSBitmapImageRep   — raster (PNG, JPEG, TIFF, HEIC, WebP…)
                //   NSCIImageRep       — Core Image backed
                //   NSPDFImageRep      — PDF page
                //   NSEPSImageRep      — EPS data
                //   NSCustomImageRep   — draw closure

                // Key properties on any NSImageRep:
                rep.size                             // NSSize in points
                rep.pixelsWide                       // Int — actual pixel width
                rep.pixelsHigh                       // Int — actual pixel height
                rep.colorSpaceName                   // NSColorSpaceName
                rep.bitsPerSample                    // Int — bit depth
                rep.bitsPerPixel                     // Int
                rep.isOpaque                         // Bool

                // Adding a rep to an image:
                image.addRepresentation(rep)
                image.removeRepresentation(rep)
                image.representations                // [NSImageRep]

                // Best-fit rep selection:
                image.bestRepresentation(for: NSRect(x:0, y:0, width:64, height:64),
                                         context: nil, hints: nil)
                """)
            }

            // NSAccessibilityImage
            Block(title: "Reference — NSAccessibilityImage protocol (describe-only)") {
                snippet("""
                // protocol NSAccessibilityImage : NSAccessibilityElementProtocol
                // Adopted automatically by NSImageView.
                // Implement when building a CUSTOM view that displays an image.

                // Single required method:
                func accessibilityLabel() -> String?   // VoiceOver reads this string

                // NSImageView auto-implements this by forwarding to:
                //   imageView.image?.accessibilityDescription
                // Always set the description at creation time:
                NSImage(systemSymbolName: "star.fill", accessibilityDescription: "Starred item")

                // For decorative images that should NOT be announced by VoiceOver:
                // Pass nil as accessibilityDescription; NSImageView will be ignored.
                """)
            }

            // NSScrubberImageItemView
            Block(title: "Reference — NSScrubberImageItemView (describe-only, macOS 10.12.2+)") {
                snippet("""
                // class NSScrubberImageItemView : NSScrubberItemView
                // A pre-built Touch Bar scrubber cell that displays an image.
                // Use as the item view class for NSScrubber when each item is an image.

                let scrubber = NSScrubber()
                scrubber.register(NSScrubberImageItemView.self, forItemIdentifier: "img")

                // In NSScrubberDataSource:
                func scrubber(_ scrubber: NSScrubber,
                              viewForItemAt index: Int) -> NSScrubberItemView {
                    let item = scrubber.makeItem(withIdentifier: "img", owner: nil)
                                       as! NSScrubberImageItemView
                    item.image = NSImage(systemSymbolName: "photo", accessibilityDescription: nil)
                    return item
                }

                // Key property:
                // item.imageView   — the embedded NSImageView (use to configure scaling/tint)
                """)
            }
        }
    }

    // MARK: NSImageView section (States tab)

    @ViewBuilder
    private var nsImageViewSection: some View {
        VStack(alignment: .leading, spacing: 24) {

            // Live demo
            Block(title: "NSImageView display modes + scaling") {
                VStack(alignment: .leading, spacing: 12) {
                    NSImageViewDemo(
                        symbolName: symbolName,
                        scaling: scaling,
                        alignment: alignment,
                        frameStyle: frameStyle,
                        tint: useTint ? .controlAccentColor : nil
                    )
                    .frame(width: 220, height: 120)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                    HStack(spacing: 12) {
                        Text("symbol").font(.caption).foregroundStyle(.secondary)
                        Picker("", selection: $symbolName) {
                            Text("star.fill").tag("star.fill")
                            Text("photo").tag("photo")
                            Text("globe").tag("globe")
                            Text("heart.fill").tag("heart.fill")
                        }
                        .labelsHidden().pickerStyle(.segmented).frame(width: 360)
                    }
                    HStack(spacing: 12) {
                        Text("imageScaling").font(.caption).foregroundStyle(.secondary)
                        Picker("", selection: $scaling) {
                            Text("none").tag(NSImageScaling.scaleNone)
                            Text("axesIndependently").tag(NSImageScaling.scaleAxesIndependently)
                            Text("propUpOrDown").tag(NSImageScaling.scaleProportionallyUpOrDown)
                            Text("propDown").tag(NSImageScaling.scaleProportionallyDown)
                        }
                        .labelsHidden().pickerStyle(.segmented).frame(width: 420)
                    }
                    HStack(spacing: 12) {
                        Text("imageFrameStyle").font(.caption).foregroundStyle(.secondary)
                        Picker("", selection: $frameStyle) {
                            Text("none").tag(NSImageView.FrameStyle.none)
                            Text("photo").tag(NSImageView.FrameStyle.photo)
                            Text("grayBezel").tag(NSImageView.FrameStyle.grayBezel)
                            Text("groove").tag(NSImageView.FrameStyle.groove)
                            Text("button").tag(NSImageView.FrameStyle.button)
                        }
                        .labelsHidden().pickerStyle(.segmented).frame(width: 420)
                    }
                    Toggle("contentTintColor = .controlAccentColor", isOn: $useTint).controlSize(.small)

                    APICallout("let v = NSImageView(); v.image = NSImage(systemSymbolName: \"star.fill\", accessibilityDescription: \"Star\")")
                    APICallout("v.imageScaling = .scaleProportionallyUpOrDown; v.contentTintColor = .controlAccentColor")
                }
            }

            // NSImageView full API
            Block(title: "NSImageView — full configurable API") {
                snippet("""
                // class NSImageView : NSControl
                let v = NSImageView()
                v.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: "Star")
                v.symbolConfiguration = .init(pointSize: 32, weight: .regular)

                // Scaling:
                v.imageScaling = .scaleProportionallyUpOrDown
                // .scaleNone / .scaleAxesIndependently / .scaleProportionallyDown

                // Alignment (within the view bounds):
                v.imageAlignment = .alignCenter
                // .alignTop / .alignBottom / .alignLeft / .alignRight
                // .alignTopLeft / .alignTopRight / .alignBottomLeft / .alignBottomRight

                // Frame decoration:
                v.imageFrameStyle = .photo            // .none / .photo / .grayBezel / .groove / .button

                // Tinting (template images and SF Symbols only):
                v.contentTintColor = .controlAccentColor   // semantic token

                // Dynamic range (HDR display):
                v.preferredImageDynamicRange = .high       // .standard / .constrainedHigh / .high

                // Editing / drag-and-drop:
                v.isEditable = true                        // accept dragged images + fire action
                v.allowsCutCopyPaste = true

                // SF Symbol effects:
                v.addSymbolEffect(.bounce, options: .nonRepeating, animated: true)
                v.setSymbolImage(replacement, contentTransition: .replace, options: .default)
                v.removeSymbolEffect(ofType: .bounce, options: .default, animated: true)
                v.removeAllSymbolEffects(options: .default, animated: true)
                """)
            }

            // Image accessibility
            Block(title: "Image Accessibility") {
                snippet("""
                // NSImageView auto-conforms NSAccessibilityImage.
                // VoiceOver reads the image's accessibilityDescription.
                // Set it at creation time — do NOT rely on the view's accessibilityLabel:
                let img = NSImage(systemSymbolName: "trash", accessibilityDescription: "Delete item")
                let view = NSImageView(image: img)

                // Decorative image (suppress VoiceOver announcement):
                NSImage(systemSymbolName: "chevron.right", accessibilityDescription: nil)
                // When accessibilityDescription is nil, NSImageView is ignored by VoiceOver.

                // For a custom view adopting NSAccessibilityImage:
                func accessibilityLabel() -> String? {
                    return "My custom image — describes its content"
                }
                """)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "NSImageView is the AppKit host; NSImage is the image object. For SwiftUI use Image(systemName:) and Image(nsImage:) — they wrap NSImage internally. NSViewRepresentable is needed only when you require NSImageView-specific APIs (symbolConfiguration, effects, isEditable).")
            noteRow("paintbrush", "contentTintColor recolors template images and SF Symbols. Multicolor symbols ignore tint unless configured explicitly with NSImageSymbolConfiguration(.multicolor) or .hierarchical / .palette modes.")
            noteRow("sparkles", "Symbol effects (addSymbolEffect, setSymbolImage, removeSymbolEffect) require SF Symbol images. Configure symbolConfiguration BEFORE adding effects — effects inherit the size and weight that are set at the time they are added.")
            noteRow("hand.raised", "NSImageView fires its action only when isEditable = true AND the user drags an image into the view. For tap-to-act, use NSButton(image:...) instead — NSImageView does not track mouse clicks.")
            noteRow("square.and.arrow.down", "NSImageRep subclasses are the raw data layer inside NSImage. NSBitmapImageRep is used most often (PNG, JPEG, HEIC, TIFF). NSCIImageRep bridges Core Image. NSPDFImageRep renders one PDF page. Rarely construct reps directly — use NSImage convenience initializers.")
            noteRow("accessibility", "NSAccessibilityImage is auto-adopted by NSImageView. For custom views rendering images, implement accessibilityLabel() and return a descriptive string. Always provide a non-nil accessibilityDescription on NSImage for non-decorative images.")
        }
    }

    // MARK: Helpers

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
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

// MARK: - Block helper

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
    NSImageViewPage().frame(width: 1100, height: 900)
}
