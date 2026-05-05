import SwiftUI

// SwiftUI `View/scrollContentBackground(_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollcontentbackground(_:).md
// macOS 13.0+.

struct ScrollContentBackgroundPage: View {
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
            Text("View/scrollContentBackground(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Sets the visibility of the system background that sits behind scrollable content. Most commonly used with List and Form to reveal a custom background underneath.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollcontentbackground(_:).md \u{00b7} macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 6) {
                APICallout(".scrollContentBackground(.visible)  // default for ScrollView")
                List {
                    ForEach(0..<6) { i in Text("Row \(i)").foregroundStyle(.primary) }
                }
                .frame(height: 160)
                .scrollContentBackground(.visible)
                .background(.tint.opacity(0.15))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            VStack(alignment: .leading, spacing: 6) {
                APICallout(".scrollContentBackground(.hidden)  // tint shows through")
                List {
                    ForEach(0..<6) { i in Text("Row \(i)").foregroundStyle(.primary) }
                }
                .frame(height: 160)
                .scrollContentBackground(.hidden)
                .background(.tint.opacity(0.15))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Visibility values").font(.headline).foregroundStyle(.primary)
                APICallout("Visibility.automatic  //  .visible  //  .hidden")
                Text(".automatic respects the platform's default for that scrollable kind. List/Form default to .visible (system grouped background); ScrollView defaults to .hidden.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Form with hidden background").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollContentBackground(.hidden) on a Form")
                Form {
                    Section("Section") {
                        Toggle("Toggle", isOn: .constant(true))
                        TextField("Field", text: .constant(""))
                    }
                }
                .frame(height: 180)
                .scrollContentBackground(.hidden)
                .background(.background.tertiary)
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("ScrollView seamless titlebar").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollContentBackground(.visible) on a ScrollView")
                Text("On macOS 15+, making a ScrollView's content background visible enables the seamless window/titlebar appearance. Use when the ScrollView fills a window pane edge-to-edge.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Defaults differ by container").font(.headline).foregroundStyle(.primary)
            APICallout("List, Form     -> .visible by default (grouped style)")
            APICallout("ScrollView     -> .hidden by default")
            Text("That's why .scrollContentBackground(.hidden) is the canonical move for List \u{2014} you're explicitly opting out of the platform background to show your own.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Pair with .background, not .background.tertiary alone.", "After hiding the scroll content background, layer your own .background underneath the List/Form. Otherwise you'll see the window's chrome through it.", "rectangle.stack"),
        ("Doesn't affect cell selection.", "Hiding the background still preserves List's row separators, hover, and selection \u{2014} those are independent of the container's grouped background.", "list.bullet"),
        ("macOS 15+ titlebar trick.", "ScrollView + .scrollContentBackground(.visible) yields the seamless inset look used by Settings panes and Mail's reading area.", "macwindow")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol).font(.headline).foregroundStyle(.primary)
                    Text(note.detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
                }
            }
        }
    }
}

#Preview {
    ScrollContentBackgroundPage().frame(width: 1100, height: 1100)
}
