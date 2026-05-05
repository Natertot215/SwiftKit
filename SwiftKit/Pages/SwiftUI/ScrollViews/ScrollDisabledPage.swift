import SwiftUI

// SwiftUI `View/scrollDisabled(_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrolldisabled(_:).md
// macOS 13.0+.

struct ScrollDisabledPage: View {
    @State private var isDisabled: Bool = false

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
            Text("View/scrollDisabled(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Disables or enables scrolling for any scrollable view in the hierarchy \u{2014} ScrollView, List, Table, TextEditor. Content remains visible, but user gestures and trackpad input no longer scroll.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrolldisabled(_:).md \u{00b7} macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                APICallout(".scrollDisabled(\(isDisabled ? "true" : "false"))")
                Spacer()
                Toggle("Disable scrolling", isOn: $isDisabled).toggleStyle(.switch)
            }

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<40) { i in
                        Text("Row \(i)").font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.leading, 12)
                    }
                }
            }
            .frame(height: 220)
            .scrollDisabled(isDisabled)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text(isDisabled ? "Scroll gestures are blocked. Programmatic scroll via ScrollPosition still works." : "Scroll freely.")
                .font(.caption).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Environment propagation").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView { … }
    .scrollDisabled(true)  // affects every nested scrollable too
""")
                Text("scrollDisabled passes through the environment, so wrapping a screen disables every nested ScrollView, List, and TextEditor.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("List and Table").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollDisabled(true) on a List")
                Text("Works on List and Table too \u{2014} useful for embedding a scrollable inside a non-scrollable layout where the surrounding scroll is the one you want to drive.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Pairing with scrollPosition").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView { … }
    .scrollDisabled(true)
    .scrollPosition(\\.position)  // programmatic scroll still works
""")
                Text("scrollDisabled blocks user-driven scrolling but not programmatic scrolling \u{2014} ScrollPosition.scrollTo and ScrollViewProxy.scrollTo continue to work.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("scrollDisabled vs scrollInputBehavior").font(.headline).foregroundStyle(.primary)
            APICallout(".scrollDisabled(true)                     // blocks all inputs")
            APICallout(".scrollInputBehavior(.disabled, for: .x) // blocks one input only")
            Text("scrollDisabled is the all-or-nothing switch. For per-input control (e.g. block hand-gesture-shortcut on watchOS but keep crown), use scrollInputBehavior(_:for:).")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Content remains visible.", "Disabling scrolling does not remove or hide content. The full scroll content is laid out; only user-driven scrolling is blocked.", "eye"),
        ("Doesn't override scrollInputBehavior.", "If scrollDisabled(true) is in scope, scrollInputBehavior cannot re-enable scrolling for any input \u{2014} disabled wins.", "lock"),
        ("Useful for nested scrollables.", "Inside a parent ScrollView, set the inner scrollable's .scrollDisabled(true) to let parent gestures drive the outer scroll.", "rectangle.stack")
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
    ScrollDisabledPage().frame(width: 1100, height: 1000)
}
