import SwiftUI
import AppKit

// AppKit Views and Controls / Interacting with adjacent views reference page.
// Covers: NSBackgroundExtensionView (class, inherits NSView) — extends content
// to fill its own bounds. Designed to be laid out under chrome (titlebar,
// sidebar, inspector) so its content view can stay inside the safe area while
// the background extends underneath the chrome.
// Source: Documentation/AppKit/views-and-controls/nsbackgroundextensionview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSBackgroundExtensionView
// over a colored backdrop, with a labeled inset content view, so the
// extending-content behavior is visible. The full safe-area / under-chrome
// behavior is most apparent when this view is attached to a window's content
// view; here we demonstrate the API surface.

// MARK: - Bridge

private struct NSBackgroundExtensionViewDemo: NSViewRepresentable {
    var automaticallyPlacesContentView: Bool

    func makeNSView(context: Context) -> NSView {
        let backdrop = NSView()
        backdrop.wantsLayer = true
        backdrop.layer?.backgroundColor = NSColor.systemOrange.withAlphaComponent(0.55).cgColor
        backdrop.translatesAutoresizingMaskIntoConstraints = false

        let extensionView = NSBackgroundExtensionView()
        extensionView.translatesAutoresizingMaskIntoConstraints = false

        // Build an inner content view: a labeled card that NSBackgroundExtensionView
        // either auto-places (default) or that the caller positions manually.
        let card = NSView()
        card.wantsLayer = true
        card.layer?.backgroundColor = NSColor.controlBackgroundColor.cgColor
        card.layer?.cornerRadius = 8
        card.translatesAutoresizingMaskIntoConstraints = false

        let label = NSTextField(labelWithString: "Extended content")
        label.font = NSFont.preferredFont(forTextStyle: .body)
        label.textColor = NSColor.labelColor
        label.alignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            card.widthAnchor.constraint(greaterThanOrEqualToConstant: 220),
            card.heightAnchor.constraint(equalToConstant: 64)
        ])

        extensionView.contentView = card
        extensionView.automaticallyPlacesContentView = automaticallyPlacesContentView

        backdrop.addSubview(extensionView)
        NSLayoutConstraint.activate([
            extensionView.leadingAnchor.constraint(equalTo: backdrop.leadingAnchor),
            extensionView.trailingAnchor.constraint(equalTo: backdrop.trailingAnchor),
            extensionView.topAnchor.constraint(equalTo: backdrop.topAnchor),
            extensionView.bottomAnchor.constraint(equalTo: backdrop.bottomAnchor)
        ])

        // When auto-placement is off, the caller is responsible for laying out
        // the contentView inside the extension view; demonstrate that path.
        if !automaticallyPlacesContentView {
            NSLayoutConstraint.activate([
                card.centerXAnchor.constraint(equalTo: extensionView.centerXAnchor),
                card.centerYAnchor.constraint(equalTo: extensionView.centerYAnchor)
            ])
        }

        context.coordinator.extensionView = extensionView
        return backdrop
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        context.coordinator.extensionView?.automaticallyPlacesContentView = automaticallyPlacesContentView
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator {
        weak var extensionView: NSBackgroundExtensionView?
    }
}

// MARK: - Page

struct NSBackgroundExtensionViewPage: View {
    @State private var automaticallyPlacesContentView: Bool = true

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
            Text("NSBackgroundExtensionView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that extends content to fill its own bounds.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} macOS 26.0 \u{00b7} Documentation/AppKit/views-and-controls/nsbackgroundextensionview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init() — content view inside an extension view") {
            VStack(alignment: .leading, spacing: 12) {
                NSBackgroundExtensionViewDemo(
                    automaticallyPlacesContentView: automaticallyPlacesContentView
                )
                .frame(height: 180)
                .frame(maxWidth: 480)

                HStack(spacing: 12) {
                    Text("automaticallyPlacesContentView").font(.caption).foregroundStyle(.secondary)
                    Toggle("", isOn: $automaticallyPlacesContentView)
                        .toggleStyle(.switch)
                        .controlSize(.small)
                        .labelsHidden()
                }

                APICallout("let extensionView = NSBackgroundExtensionView()")
                APICallout("extensionView.contentView = card; extensionView.automaticallyPlacesContentView = true")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "automaticallyPlacesContentView — default vs manual layout") {
                snippet("""
                extensionView.automaticallyPlacesContentView = true     // default — view lays out content inside its safe area
                extensionView.automaticallyPlacesContentView = false    // caller positions content via auto-layout
                """)
                Text("When true (default), NSBackgroundExtensionView lays its content view inside the safe area and extends modifications of that content along its edges to fill the full container. Set to false when you want full manual control over the content's frame.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Embedding content") {
                snippet("""
                extensionView.contentView = card        // any NSView; the extension renders its edges around it
                """)
                Text("contentView is an NSView. Per the doc: 'By default it lays out its content to stay within the safe area, and uses modifications of the content along the edges to fill the container view.'")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Typical usage — under-chrome layout") {
                snippet("""
                // Attach to a window's content view so the background extends
                // under the titlebar / sidebar / inspector while the contentView
                // stays inside the safe area:
                window.contentView = extensionView
                extensionView.contentView = mainSurface
                """)
                Text("The intended deployment is in a window where chrome (titlebar / sidebar / inspector) overlays the safe area. NSBackgroundExtensionView lets the background fill those overlapped regions while keeping the content reachable.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Safe-area awareness") {
                Text("The extension behavior depends on the surrounding window's safe area. Inside SwiftKit's child-view demo above, there is no titlebar overlap to extend under — the visual difference between the two automaticallyPlacesContentView modes is the most you can see in this hosting context. Real benefit appears when attached to a window content view with chrome.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. macOS 26.0 only.")
            noteRow("rectangle.expand.vertical", "Two instance properties: automaticallyPlacesContentView (Bool) and contentView (NSView). No delegate.")
            noteRow("macwindow", "Designed for window-level deployment under titlebar / sidebar / inspector chrome. Hosting in a child view shows the API surface but not the safe-area benefit.")
            noteRow("info.circle", "When automaticallyPlacesContentView is true, do not pin the content view's edges yourself — the extension view manages placement.")
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
    NSBackgroundExtensionViewPage().frame(width: 1100, height: 900)
}
