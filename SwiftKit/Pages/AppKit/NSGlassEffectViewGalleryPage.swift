import SwiftUI
import AppKit

struct NSGlassEffectViewGalleryPage: View {
    var body: some View {
        GalleryItemPage(
            title: Self.item.title,
            signature: Self.item.signature,
            blurb: Self.item.blurb,
            availability: Self.item.availability,
            docPath: Self.item.docPath
        ) {
            // MARK: Style variants — live renders

            VariantTile(
                name: "NSGlassEffectView",
                api: "let glass = NSGlassEffectView(); glass.style = .regular; glass.contentView = label",
                height: 140
            ) {
                ZStack {
                    LinearGradient(
                        colors: [Color.accentColor, Color.secondary],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    NSGlassEffectViewRepresentable(style: .regular, label: "Regular")
                        .frame(width: 120, height: 48)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            VariantTile(
                name: "NSGlassEffectView.Style",
                api: "glass.style = .clear  // .regular | .clear",
                height: 140
            ) {
                ZStack {
                    LinearGradient(
                        colors: [Color.secondary, Color.accentColor],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                    NSGlassEffectViewRepresentable(style: .clear, label: "Clear")
                        .frame(width: 120, height: 48)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            VariantTile(
                name: "NSGlassEffectContainerView",
                api: "let container = NSGlassEffectContainerView(); container.addSubview(glassView)",
                height: 160
            ) {
                ZStack {
                    LinearGradient(
                        colors: [Color.accentColor.opacity(0.7), Color.secondary.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    NSGlassEffectContainerViewRepresentable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

extension NSGlassEffectViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.nsGlassEffectView.nsGlassEffectView",
        title: "NSGlassEffectView",
        folder: "AppKit",
        framework: .appKit,
        absorbedSymbols: ["NSGlassEffectView", "NSGlassEffectView.Style", "NSGlassEffectContainerView"],
        blurb: "A view that embeds its content view in a dynamic glass effect, rendering the macOS 26 Liquid Glass material in AppKit.",
        signature: "@MainActor class NSGlassEffectView : NSView",
        availability: "macOS 26.0+",
        docPath: "Documentation/AppKit/views-and-controls/nsglasseffectview.md",
        page: { AnyView(NSGlassEffectViewGalleryPage()) }
    )
}

// MARK: - NSViewRepresentable bridges

private struct NSGlassEffectViewRepresentable: NSViewRepresentable {
    let style: NSGlassEffectView.Style
    let label: String

    func makeNSView(context: Context) -> NSGlassEffectView {
        let glass = NSGlassEffectView()
        glass.style = style
        glass.cornerRadius = 10

        let tf = NSTextField(labelWithString: label)
        tf.font = .systemFont(ofSize: NSFont.systemFontSize, weight: .medium)
        tf.alignment = .center
        tf.textColor = .labelColor
        glass.contentView = tf

        return glass
    }

    func updateNSView(_ nsView: NSGlassEffectView, context: Context) {
        nsView.style = style
        (nsView.contentView as? NSTextField)?.stringValue = label
    }
}

private struct NSGlassEffectContainerViewRepresentable: NSViewRepresentable {
    func makeNSView(context: Context) -> NSGlassEffectContainerView {
        let container = NSGlassEffectContainerView()
        container.spacing = 12

        for title in ["Panel A", "Panel B"] {
            let glass = NSGlassEffectView()
            glass.style = .regular
            glass.cornerRadius = 10
            glass.translatesAutoresizingMaskIntoConstraints = false

            let tf = NSTextField(labelWithString: title)
            tf.font = .systemFont(ofSize: NSFont.smallSystemFontSize, weight: .medium)
            tf.alignment = .center
            tf.textColor = .labelColor
            glass.contentView = tf

            container.addSubview(glass)
        }

        let subs = container.subviews
        if subs.count == 2 {
            NSLayoutConstraint.activate([
                subs[0].centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -62),
                subs[0].centerYAnchor.constraint(equalTo: container.centerYAnchor),
                subs[0].widthAnchor.constraint(equalToConstant: 100),
                subs[0].heightAnchor.constraint(equalToConstant: 44),

                subs[1].centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 62),
                subs[1].centerYAnchor.constraint(equalTo: container.centerYAnchor),
                subs[1].widthAnchor.constraint(equalToConstant: 100),
                subs[1].heightAnchor.constraint(equalToConstant: 44)
            ])
        }

        return container
    }

    func updateNSView(_ nsView: NSGlassEffectContainerView, context: Context) {}
}
