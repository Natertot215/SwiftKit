import SwiftUI
import AppKit

// AppKit Views and Controls / Visual adornments reference page.
// Covers: NSBox (class, inherits NSView) — a stylized rectangular box with an
// optional title; configurable boxType (.primary / .separator / .custom) and
// titlePosition (.atTop / .atBottom / .belowTop / etc.).
// Source: Documentation/AppKit/views-and-controls/nsbox.md
//
// Renderable demo: an NSViewRepresentable hosts a real NSBox with a labeled
// content view; SwiftUI controls drive boxType, titlePosition, borderType, and
// title.

// MARK: - Bridge

private struct NSBoxDemo: NSViewRepresentable {
    var boxType: NSBox.BoxType
    var titlePosition: NSBox.TitlePosition
    var title: String

    func makeNSView(context: Context) -> NSBox {
        let box = NSBox()
        box.translatesAutoresizingMaskIntoConstraints = false

        let inner = NSTextField(labelWithString: "Box content")
        inner.font = NSFont.preferredFont(forTextStyle: .body)
        inner.textColor = NSColor.labelColor
        inner.alignment = .center
        inner.translatesAutoresizingMaskIntoConstraints = false

        let card = NSView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(inner)
        NSLayoutConstraint.activate([
            inner.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            inner.centerYAnchor.constraint(equalTo: card.centerYAnchor),
            card.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            card.heightAnchor.constraint(greaterThanOrEqualToConstant: 80)
        ])
        box.contentView = card

        return box
    }

    func updateNSView(_ nsView: NSBox, context: Context) {
        nsView.boxType = boxType
        nsView.titlePosition = titlePosition
        nsView.title = title
    }
}

// MARK: - Page

struct NSBoxPage: View {
    @State private var boxType: NSBox.BoxType = .primary
    @State private var titlePosition: NSBox.TitlePosition = .atTop
    @State private var title: String = "Group"

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
            Text("NSBox")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A stylized rectangular box with an optional title.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} Documentation/AppKit/views-and-controls/nsbox.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init() — boxType / titlePosition / title") {
            VStack(alignment: .leading, spacing: 12) {
                NSBoxDemo(
                    boxType: boxType,
                    titlePosition: titlePosition,
                    title: title
                )
                .frame(height: 140)
                .frame(maxWidth: 480)

                HStack(spacing: 12) {
                    Text("boxType").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $boxType) {
                        Text(".primary").tag(NSBox.BoxType.primary)
                        Text(".separator").tag(NSBox.BoxType.separator)
                        Text(".custom").tag(NSBox.BoxType.custom)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 320)
                }

                HStack(spacing: 12) {
                    Text("titlePosition").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $titlePosition) {
                        Text(".noTitle").tag(NSBox.TitlePosition.noTitle)
                        Text(".aboveTop").tag(NSBox.TitlePosition.aboveTop)
                        Text(".atTop").tag(NSBox.TitlePosition.atTop)
                        Text(".belowTop").tag(NSBox.TitlePosition.belowTop)
                        Text(".aboveBottom").tag(NSBox.TitlePosition.aboveBottom)
                        Text(".atBottom").tag(NSBox.TitlePosition.atBottom)
                        Text(".belowBottom").tag(NSBox.TitlePosition.belowBottom)
                    }
                    .labelsHidden()
                    .frame(width: 220)
                }

                HStack(spacing: 12) {
                    Text("title").font(.caption).foregroundStyle(.secondary)
                    TextField("title", text: $title)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 200)
                }

                APICallout("let box = NSBox()")
                APICallout("box.boxType = .primary; box.titlePosition = .atTop; box.title = \"Group\"")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "boxType — three semantic shapes") {
                snippet("""
                box.boxType = .primary       // default — bordered box with optional title
                box.boxType = .separator     // a single horizontal or vertical separator line
                box.boxType = .custom        // caller-driven via borderColor / borderWidth / cornerRadius / fillColor
                """)
                Text("Use .primary for grouping; .separator collapses the box to a divider line — set the frame's narrow dimension to 1pt for a hairline.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "titlePosition — where the title sits") {
                snippet("""
                box.titlePosition = .atTop       // most common — title in the top border
                box.titlePosition = .belowTop    // inside the box, below the top edge
                box.titlePosition = .noTitle     // hide the title entirely
                """)
                Text("Other cases: .aboveTop, .aboveBottom, .atBottom, .belowBottom — all map to where the title cell sits relative to the border line.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Custom box — fillColor / borderColor / cornerRadius") {
                snippet("""
                box.boxType = .custom
                box.fillColor = NSColor.controlBackgroundColor
                box.borderColor = NSColor.separatorColor
                box.borderWidth = 1
                box.cornerRadius = 8
                """)
                Text("Custom-styling props apply only when boxType == .custom. Use semantic NSColor tokens (NSColor.separatorColor, NSColor.controlBackgroundColor) — do not hand-mix RGB.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Content view + margins") {
                snippet("""
                box.contentView = innerView                          // any NSView
                box.contentViewMargins = NSSize(width: 12, height: 8)
                box.sizeToFit()                                       // size the box to fit its content
                """)
                Text("contentViewMargins controls the inset between the border and the content view. sizeToFit() sizes the box around the content's intrinsic size.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Title font + cell") {
                snippet("""
                box.titleFont = NSFont.preferredFont(forTextStyle: .headline)
                box.titleCell                                         // -> NSCell, customize directly if needed
                """)
                Text("Pick a semantic system font (NSFont.preferredFont(forTextStyle:)) over a hand-tuned point size.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. The classic AppKit grouping primitive.")
            noteRow("rectangle.dashed", ".separator boxType collapses to a divider — set frame to 1pt on the perpendicular axis.")
            noteRow("paintbrush", "Customize visual properties (fillColor, borderColor, cornerRadius, borderWidth) only when boxType is .custom.")
            noteRow("info.circle", "Use semantic NSColor tokens — NSColor.separatorColor, NSColor.controlBackgroundColor, NSColor.windowBackgroundColor — never hand-mixed RGB.")
            noteRow("xmark.octagon", "borderType is deprecated as of macOS 10.15 (only applied to NSBoxOldStyle). Use the default appearance and rely on boxType / isTransparent instead.")
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
    NSBoxPage().frame(width: 1100, height: 900)
}
