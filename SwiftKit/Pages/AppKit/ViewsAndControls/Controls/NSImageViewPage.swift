import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSImageView (class, inherits NSControl) — a frame that displays
// image data, with optional editing, drag-and-drop, and SF Symbol effects.
// Source: Documentation/AppKit/views-and-controls/nsimageview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSImageView seeded with
// a system SF Symbol. SwiftUI controls drive imageScaling, imageAlignment,
// imageFrameStyle, and contentTintColor so the configurable surface area
// is visibly exercised.

// MARK: - Bridge

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
        nsView.image = NSImage(systemSymbolName: symbolName, accessibilityDescription: nil)
        nsView.imageScaling = scaling
        nsView.imageAlignment = alignment
        nsView.imageFrameStyle = frameStyle
        nsView.contentTintColor = tint
        nsView.symbolConfiguration = .init(pointSize: 32, weight: .regular)
    }
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
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            statesContent
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("NSImageView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A display of image data in a frame.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} Documentation/AppKit/views-and-controls/nsimageview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSImageView with a system SF Symbol") {
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
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 360)
                }

                HStack(spacing: 12) {
                    Text("imageScaling").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $scaling) {
                        Text("none").tag(NSImageScaling.scaleNone)
                        Text("axesIndependently").tag(NSImageScaling.scaleAxesIndependently)
                        Text("propUpOrDown").tag(NSImageScaling.scaleProportionallyUpOrDown)
                        Text("propDown").tag(NSImageScaling.scaleProportionallyDown)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 420)
                }

                HStack(spacing: 12) {
                    Text("imageAlignment").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $alignment) {
                        Text("center").tag(NSImageAlignment.alignCenter)
                        Text("top").tag(NSImageAlignment.alignTop)
                        Text("bottom").tag(NSImageAlignment.alignBottom)
                        Text("leading").tag(NSImageAlignment.alignLeft)
                        Text("trailing").tag(NSImageAlignment.alignRight)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 420)
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
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 420)
                }

                Toggle("contentTintColor = .controlAccentColor", isOn: $useTint).controlSize(.small)

                APICallout("let v = NSImageView(); v.image = NSImage(systemSymbolName: \"star.fill\", accessibilityDescription: nil)")
                APICallout("v.imageScaling = .scaleProportionallyUpOrDown; v.imageAlignment = .alignCenter")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Construction — convenience initializer") {
                snippet("""
                NSImageView(image: NSImage(named: "Logo")!)
                """)
            }

            Block(title: "Specifying the image") {
                snippet("""
                v.image = NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)
                v.symbolConfiguration = .init(pointSize: 32, weight: .regular)
                """)
            }

            Block(title: "Visual characteristics") {
                snippet("""
                v.imageFrameStyle = .photo            // .none / .photo / .grayBezel / .groove / .button
                v.imageAlignment = .alignCenter
                v.imageScaling = .scaleProportionallyUpOrDown
                v.animates = true                     // animate animated GIF / APNG content
                v.contentTintColor = .controlAccentColor
                """)
            }

            Block(title: "Dynamic range (HDR display)") {
                snippet("""
                v.preferredImageDynamicRange = .high           // .standard / .constrainedHigh / .high
                let resolved = v.imageDynamicRange             // current resolved range
                NSImageView.defaultPreferredImageDynamicRange  // class-wide default
                """)
            }

            Block(title: "Symbol effects") {
                snippet("""
                v.addSymbolEffect(.bounce, options: .nonRepeating, animated: true)
                v.setSymbolImage(replacement, contentTransition: .replace, options: .default)
                v.removeSymbolEffect(ofType: .bounce, options: .default, animated: true)
                v.removeAllSymbolEffects(options: .default, animated: true)
                """)
                Text("Pass any concrete SymbolEffect from the Symbols framework. nonRepeating, repeating, and wholeSymbol options compose with the effect itself.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Editable image view") {
                snippet("""
                v.isEditable = true
                v.allowsCutCopyPaste = true
                """)
                Text("isEditable = true makes the view receive dragged images and fire its action method. allowsCutCopyPaste extends that to keyboard editing menus.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("hand.raised", "An image view fires its action only when the user drags an image into its bounds AND isEditable = true. For tap-to-act behavior, use NSButton with imageScaling instead — see the Apple doc note.")
            noteRow("sparkles", "Symbol effects work only with SF Symbol images. Configure the symbolConfiguration BEFORE adding effects so weight + size are stable.")
            noteRow("paintbrush", "contentTintColor recolors template SF Symbols and template raster images. Multicolor symbols ignore tint unless their hierarchical / palette mode is configured.")
        }
    }

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
