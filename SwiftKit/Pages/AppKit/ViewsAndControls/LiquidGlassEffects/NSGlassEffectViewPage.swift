import SwiftUI
import AppKit

// AppKit Views and Controls / Liquid Glass effects reference page.
// Covers: NSGlassEffectView (class, inherits NSView) — embeds a content view in
// a dynamic glass effect with configurable style, corner radius, and tint color.
// Source: Documentation/AppKit/views-and-controls/nsglasseffectview.md
//
// Renderable demo: an NSViewRepresentable hosts a real NSGlassEffectView whose
// contentView is a labeled NSTextField; SwiftUI controls drive style, corner
// radius, and tint color over a colored backdrop so the glass effect is visible.

// MARK: - Bridge

private struct NSGlassEffectViewDemo: NSViewRepresentable {
    var style: NSGlassEffectView.Style
    var cornerRadius: CGFloat
    var tint: NSColor?

    func makeNSView(context: Context) -> NSView {
        let host = NSView()
        host.wantsLayer = true
        host.layer?.backgroundColor = NSColor.systemIndigo.withAlphaComponent(0.55).cgColor
        host.translatesAutoresizingMaskIntoConstraints = false

        let glass = NSGlassEffectView()
        glass.translatesAutoresizingMaskIntoConstraints = false

        let label = NSTextField(labelWithString: "Glass content")
        label.font = NSFont.preferredFont(forTextStyle: .title3)
        label.textColor = NSColor.labelColor
        label.alignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        let inner = NSView()
        inner.translatesAutoresizingMaskIntoConstraints = false
        inner.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: inner.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: inner.centerYAnchor)
        ])

        glass.contentView = inner

        host.addSubview(glass)
        NSLayoutConstraint.activate([
            glass.leadingAnchor.constraint(equalTo: host.leadingAnchor, constant: 24),
            glass.trailingAnchor.constraint(equalTo: host.trailingAnchor, constant: -24),
            glass.topAnchor.constraint(equalTo: host.topAnchor, constant: 24),
            glass.bottomAnchor.constraint(equalTo: host.bottomAnchor, constant: -24)
        ])

        context.coordinator.glass = glass
        return host
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let glass = context.coordinator.glass else { return }
        glass.style = style
        glass.cornerRadius = cornerRadius
        glass.tintColor = tint
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator {
        weak var glass: NSGlassEffectView?
    }
}

// MARK: - Page

struct NSGlassEffectViewPage: View {
    @State private var style: NSGlassEffectView.Style = .regular
    @State private var cornerRadius: CGFloat = 16
    @State private var tintEnabled: Bool = false

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
            Text("NSGlassEffectView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that embeds its content view in a dynamic glass effect.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} macOS 26.0 \u{00b7} Documentation/AppKit/views-and-controls/nsglasseffectview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init() — content view inside a live glass effect") {
            VStack(alignment: .leading, spacing: 12) {
                NSGlassEffectViewDemo(
                    style: style,
                    cornerRadius: cornerRadius,
                    tint: tintEnabled ? NSColor.systemPink : nil
                )
                .frame(height: 180)
                .frame(maxWidth: 480)

                HStack(spacing: 12) {
                    Text("style").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text(".regular").tag(NSGlassEffectView.Style.regular)
                        Text(".clear").tag(NSGlassEffectView.Style.clear)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 220)
                }

                HStack(spacing: 12) {
                    Text("cornerRadius").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $cornerRadius, in: 0...48)
                        .frame(width: 220)
                    Text(String(format: "%.0fpt", cornerRadius))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                HStack(spacing: 12) {
                    Text("tintColor").font(.caption).foregroundStyle(.secondary)
                    Toggle("Enable .systemPink tint", isOn: $tintEnabled)
                        .toggleStyle(.switch)
                        .controlSize(.small)
                }

                APICallout("let glass = NSGlassEffectView()")
                APICallout("glass.contentView = label; glass.style = .regular; glass.cornerRadius = 16")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Style — .regular vs .clear") {
                snippet("""
                glass.style = .regular        // softer, default glass look
                glass.style = .clear          // higher transparency, less material
                """)
                Text("NSGlassEffectView.Style is a nested enum with two cases. Pick based on whether you want a more material-like or a more transparent appearance.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Corner radius") {
                snippet("""
                glass.cornerRadius = 16        // CGFloat, in points; rounds the glass shape
                """)
                Text("cornerRadius is a CGFloat. Combine with autolayout-driven size to produce pill, capsule, or rounded-rectangle glass.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Tint color") {
                snippet("""
                glass.tintColor = NSColor.systemPink        // NSColor? — nil clears the tint
                glass.tintColor = nil
                """)
                Text("tintColor blends a semantic NSColor into the glass effect. Prefer system colors (NSColor.systemX, NSColor.controlAccentColor) over hand-mixed RGB.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Embedding content") {
                snippet("""
                let inner = NSTextField(labelWithString: "Glass content")
                glass.contentView = inner          // any NSView; the glass renders behind it
                """)
                Text("contentView is an NSView. The glass effect renders behind the content; use vibrant or grayscale foregrounds for best results.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "On a colored backdrop") {
                Text("The demo above sits on a translucent .systemIndigo backdrop so the glass material is visible. Over a flat solid color, .clear style is barely visible; over a textured / desktop-tinted backdrop the difference between .regular and .clear is most apparent.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "With multiple glass siblings — use NSGlassEffectContainerView") {
                snippet("""
                // Wrap multiple NSGlassEffectView instances in a container so AppKit
                // can merge their renders when they're in close proximity:
                let container = NSGlassEffectContainerView()
                container.contentView = stackOfGlassViews
                container.spacing = 8
                """)
                Text("See NSGlassEffectContainerView for the merging-and-spacing behavior.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. macOS 26.0 only.")
            noteRow("rectangle.on.rectangle", "Four instance properties: contentView, cornerRadius, style, tintColor. No delegate, no state machine — purely declarative.")
            noteRow("link", "See NSGlassEffectContainerView for proximity-merging multiple glass views, and NSGlassEffectView.Style for the enum.")
            noteRow("info.circle", "Glass effects render against the live composite behind the view. They look different over a flat color in a screenshot vs. over the desktop / a window's vibrancy material at runtime.")
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
    NSGlassEffectViewPage().frame(width: 1100, height: 900)
}
