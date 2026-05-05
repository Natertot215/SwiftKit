import SwiftUI
import AppKit

// AppKit Views and Controls / Liquid Glass effects reference page.
// Covers: NSGlassEffectContainerView (class, inherits NSView) — efficiently
// merges descendant NSGlassEffectView instances when they're in close proximity
// to each other, reducing per-frame render passes.
// Source: Documentation/AppKit/views-and-controls/nsglasseffectcontainerview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSGlassEffectContainerView
// whose contentView is an NSStackView of three small NSGlassEffectView pills.
// SwiftUI controls drive `spacing` (the merge-proximity threshold).

// MARK: - Bridge

private struct NSGlassEffectContainerViewDemo: NSViewRepresentable {
    var spacing: CGFloat
    var pillSpacing: CGFloat

    func makeNSView(context: Context) -> NSView {
        let host = NSView()
        host.wantsLayer = true
        host.layer?.backgroundColor = NSColor.systemTeal.withAlphaComponent(0.55).cgColor
        host.translatesAutoresizingMaskIntoConstraints = false

        let stack = NSStackView(views: [pill("One"), pill("Two"), pill("Three")])
        stack.orientation = .horizontal
        stack.spacing = pillSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false

        let container = NSGlassEffectContainerView()
        container.contentView = stack
        container.spacing = spacing
        container.translatesAutoresizingMaskIntoConstraints = false

        host.addSubview(container)
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: host.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: host.centerYAnchor)
        ])

        context.coordinator.container = container
        context.coordinator.stack = stack
        return host
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        context.coordinator.container?.spacing = spacing
        context.coordinator.stack?.spacing = pillSpacing
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator {
        weak var container: NSGlassEffectContainerView?
        weak var stack: NSStackView?
    }

    private func pill(_ title: String) -> NSGlassEffectView {
        let glass = NSGlassEffectView()
        glass.style = .regular
        glass.cornerRadius = 18
        glass.translatesAutoresizingMaskIntoConstraints = false

        let label = NSTextField(labelWithString: title)
        label.font = NSFont.preferredFont(forTextStyle: .body)
        label.textColor = NSColor.labelColor
        label.alignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        let inner = NSView()
        inner.translatesAutoresizingMaskIntoConstraints = false
        inner.addSubview(label)
        NSLayoutConstraint.activate([
            inner.widthAnchor.constraint(equalToConstant: 80),
            inner.heightAnchor.constraint(equalToConstant: 36),
            label.centerXAnchor.constraint(equalTo: inner.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: inner.centerYAnchor)
        ])
        glass.contentView = inner
        return glass
    }
}

// MARK: - Page

struct NSGlassEffectContainerViewPage: View {
    @State private var containerSpacing: CGFloat = 8
    @State private var pillSpacing: CGFloat = 4

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
            Text("NSGlassEffectContainerView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that efficiently merges descendant glass effect views together when they are within a specified proximity to each other.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} macOS 26.0 \u{00b7} Documentation/AppKit/views-and-controls/nsglasseffectcontainerview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init() — three NSGlassEffectView pills inside a container") {
            VStack(alignment: .leading, spacing: 12) {
                NSGlassEffectContainerViewDemo(
                    spacing: containerSpacing,
                    pillSpacing: pillSpacing
                )
                .frame(height: 160)
                .frame(maxWidth: 480)

                HStack(spacing: 12) {
                    Text("container.spacing").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $containerSpacing, in: 0...32)
                        .frame(width: 200)
                    Text(String(format: "%.0fpt", containerSpacing))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                HStack(spacing: 12) {
                    Text("pill stack spacing").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $pillSpacing, in: 0...32)
                        .frame(width: 200)
                    Text(String(format: "%.0fpt", pillSpacing))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                APICallout("let container = NSGlassEffectContainerView()")
                APICallout("container.contentView = stackOfGlassPills; container.spacing = 8")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "spacing — the merge-proximity threshold") {
                snippet("""
                container.spacing = 8        // CGFloat, in points
                """)
                Text("When descendant NSGlassEffectView instances are within `spacing` of each other, AppKit merges their glass renders into a single pass. Larger values are more aggressive about merging, smaller values keep each glass distinct.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Hosting glass content") {
                snippet("""
                container.contentView = stack       // any NSView that contains NSGlassEffectView descendants
                """)
                Text("contentView holds the subtree to scan. Add multiple NSGlassEffectView instances anywhere inside that subtree; the container handles the merging.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "When merging matters") {
                Text("Per Apple: 'Using a glass effect container view can improve performance by reducing the number of passes required to render similar glass effect views.' Reach for this when a UI clusters multiple glass elements (toolbar accessory chrome, a row of glass pills, a stack of overlay panels).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Single-glass case") {
                Text("If your UI only has one NSGlassEffectView, the container is unnecessary — wrap directly in your normal layout view. Reach for the container when there are two or more glass siblings in close proximity.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. macOS 26.0 only.")
            noteRow("rectangle.3.group", "Two instance properties: contentView (the subtree to scan) and spacing (the merge proximity in points).")
            noteRow("speedometer", "Optional — but recommended whenever multiple NSGlassEffectView instances render close to each other. Reduces render passes.")
            noteRow("link", "See NSGlassEffectView for the leaf glass view, and NSGlassEffectView.Style for the appearance enum.")
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
    NSGlassEffectContainerViewPage().frame(width: 1100, height: 900)
}
