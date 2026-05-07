import SwiftUI

// SwiftUI `Divider` reference page.
// A thin horizontal or vertical separator line.
// macOS 10.15+

struct DividerGalleryPage: View {
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
            Text("Divider")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A visual element that separates content — horizontal in VStack, vertical in HStack.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/menus-and-commands/divider.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DVCard(api: "VStack { Text(\"A\"); Divider(); Text(\"B\") }") {
            VStack {
                Text("Above the Divider")
                Divider()
                Text("Below the Divider")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            DVVariant(title: "Horizontal — in a VStack (default)") {
                DVCard(api: "VStack { Text(…); Divider(); Text(…) }") {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Section A")
                        Divider()
                        Text("Section B")
                        Divider()
                        Text("Section C")
                    }
                    .frame(width: 200)
                }
            }

            DVVariant(title: "Vertical — in an HStack") {
                DVCard(api: "HStack { Text(…); Divider(); Text(…) }") {
                    HStack(spacing: 12) {
                        Text("Left")
                        Divider()
                        Text("Center")
                        Divider()
                        Text("Right")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
            }

            DVVariant(title: "Inside a Menu — separator between groups") {
                DVCard(api: "Menu { Button(…); Divider(); Button(…, role: .destructive) }") {
                    Menu("File") {
                        Button("New") {}
                        Button("Open") {}
                        Divider()
                        Button("Delete", role: .destructive) {}
                    }
                }
            }

            DVVariant(title: "Inside a List — section separator feel") {
                DVCard(api: "List { Text(…); Divider(); Text(…) }", height: 140) {
                    List {
                        Text("Item One")
                        Divider()
                        Text("Item Two")
                        Text("Item Three")
                    }
                }
            }

            DVVariant(title: "Custom tint via foregroundStyle") {
                DVCard(api: "Divider().foregroundStyle(.tint)") {
                    VStack(spacing: 8) {
                        Text("Above")
                        Divider().foregroundStyle(.tint)
                        Text("Below")
                    }
                    .frame(width: 200)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            DVVariant(title: "Overlay pattern — manual inset control") {
                DVCard(api: "Divider().padding(.horizontal, 20)") {
                    VStack(spacing: 8) {
                        Text("Full width")
                        Divider()
                        Text("Inset by 20pt")
                        Divider().padding(.horizontal, 20)
                        Text("Full width again")
                    }
                    .frame(width: 200)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowDV(symbol: "line.horizontal.3", title: "Divider is 1pt tall in VStack, 1pt wide in HStack.",
                      detail: "It expands to fill the available perpendicular axis. In an HStack, it fills the tallest sibling's height. In a VStack, it fills the widest sibling's width.")
            NoteRowDV(symbol: "sidebar.left", title: "In menus, Divider() renders as an NSMenuItem separator.",
                      detail: "Menu item separators on macOS are drawn by AppKit as gray horizontal rules between logical groups. They're not keyboard-focusable or clickable.")
        }
    }
}

private struct DVCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let h = height {
                    content().frame(width: 340, height: h)
                } else {
                    content().frame(minWidth: 240, alignment: .leading)
                }
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct DVVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowDV: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

extension DividerGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.menusAndCommands.divider",
        title: "Divider",
        folder: "Menus and commands",
        framework: .swiftUI,
        absorbedSymbols: [
            "Divider"
        ],
        blurb: "A visual element used to separate content. Inside a stack, the divider extends across the minor axis; outside a stack it draws horizontally. Useful as a Menu separator and as a generic in-line rule.",
        signature: "struct Divider",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/menus-and-commands/divider.md",
        page: { AnyView(DividerGalleryPage()) }
    )
}

#Preview {
    DividerGalleryPage().frame(width: 800, height: 900)
}
