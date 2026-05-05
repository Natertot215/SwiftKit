import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSPathControl (class, inherits NSControl) — renders a file-system
// or virtual path as a breadcrumb sequence with icons and labels.
// Source: Documentation/AppKit/views-and-controls/nspathcontrol.md
//
// Renderable demo: an NSViewRepresentable hosts an NSPathControl seeded
// with a static URL inside the user's home directory. SwiftUI controls
// drive pathStyle and isEditable so the rendering responses are visibly
// exercised.

// MARK: - Bridge

private struct NSPathControlDemo: NSViewRepresentable {
    var url: URL
    var style: NSPathControl.Style
    var isEditable: Bool

    func makeNSView(context: Context) -> NSPathControl {
        let control = NSPathControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }

    func updateNSView(_ nsView: NSPathControl, context: Context) {
        nsView.pathStyle = style
        nsView.isEditable = isEditable
        nsView.url = url
    }
}

// MARK: - Page

struct NSPathControlPage: View {
    @State private var style: NSPathControl.Style = .standard
    @State private var isEditable: Bool = false

    private let url = URL(fileURLWithPath: NSHomeDirectory())
        .appendingPathComponent("Documents")
        .appendingPathComponent("Projects")
        .appendingPathComponent("SwiftKit")

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
            Text("NSPathControl")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A display of a file system path or virtual path information.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} macOS 10.5+ \u{00b7} Documentation/AppKit/views-and-controls/nspathcontrol.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSPathControl bound to a static URL") {
            VStack(alignment: .leading, spacing: 12) {
                NSPathControlDemo(
                    url: url,
                    style: style,
                    isEditable: isEditable
                )
                .frame(height: 26)
                .frame(maxWidth: 540)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("pathStyle").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $style) {
                        Text("standard").tag(NSPathControl.Style.standard)
                        Text("popUp").tag(NSPathControl.Style.popUp)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 280)
                }
                Toggle("isEditable", isOn: $isEditable).controlSize(.small)

                APICallout("let p = NSPathControl(); p.url = URL(fileURLWithPath: \"/Users/me/Docs\")")
                APICallout("p.pathStyle = .standard; p.isEditable = false")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "NSPathControl.Style — three rendering modes") {
                snippet("""
                .standard         // light blue background, arrow separators (default)
                .popUp            // looks and acts like NSPopUpButton
                """)
                Text("The legacy .navigationBar style is deprecated in current macOS — its bezel mode is documented but not recommended for new code.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Setting the path") {
                snippet("""
                p.url = URL(fileURLWithPath: "/Users/me/Documents/Project")
                // Or, for virtual paths, set pathItems directly:
                p.pathItems = [
                    NSPathControlItem.make(title: "Inbox",   image: NSImage(systemSymbolName: "tray", accessibilityDescription: nil)),
                    NSPathControlItem.make(title: "Today",   image: NSImage(systemSymbolName: "calendar", accessibilityDescription: nil)),
                    NSPathControlItem.make(title: "Project A", image: NSImage(systemSymbolName: "folder", accessibilityDescription: nil))
                ]
                """)
                Text("Setting url asks the file system for icons and titles. Setting pathItems bypasses that and uses your supplied data — useful for non-file URLs.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Pop-up menu") {
                snippet("""
                p.menu = customMenu          // shown on click in .popUp style
                p.placeholderString = "Choose a folder…"
                """)
            }

            Block(title: "Allowed types (drag and drop)") {
                snippet("""
                p.allowedTypes = ["public.folder", "com.apple.application-bundle"]
                """)
                Text("Restrict drops to specific UTIs. Use NSPathControlDelegate.pathControl(_:validateDrop:) for finer-grained control.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Action and double-click action") {
                snippet("""
                p.target = self
                p.action = #selector(pathClicked(_:))
                p.doubleAction = #selector(pathDoubleClicked(_:))

                @objc func pathClicked(_ sender: NSPathControl) {
                    let cell = sender.clickedPathComponentCell()   // legacy path
                    let item = sender.clickedPathItem               // modern path
                }
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Editable + drag-and-drop") {
                snippet("""
                p.isEditable = true
                p.setDraggingSourceOperationMask(.copy, forLocal: true)
                p.setDraggingSourceOperationMask(.copy, forLocal: false)
                """)
                Text("Editable mode lets users drop a folder onto the control to change url. The action fires after the drop, and clickedPathItem is set to the trailing component of the new URL.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Empty state") {
                snippet("""
                p.url = nil
                p.placeholderString = "No folder chosen"
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits NSControl. Wrapped by SwiftUI via NSViewRepresentable in this gallery.")
            noteRow("arrow.triangle.branch", "Three rendering styles: .standard (arrows), .popUp (NSPopUpButton-like). Choose .popUp when the control acts as a folder picker more than a breadcrumb.")
            noteRow("hand.point.up.left", "Subscribe to the action selector to receive single-click events; doubleAction fires on double-click. The clicked component is available as clickedPathItem.")
            noteRow("link", "See Also: NSPathCell, NSPathComponentCell, NSPathControlItem, NSPathControlDelegate, NSPathCellDelegate.")
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
    NSPathControlPage().frame(width: 1100, height: 900)
}
