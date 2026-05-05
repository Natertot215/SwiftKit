import SwiftUI

// SwiftUI `ScrollViewReader` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollviewreader.md
// macOS 11.0+. View whose content closure receives a ScrollViewProxy for programmatic scrolling.

struct ScrollViewReaderPage: View {
    @State private var jumpTarget: Int? = nil

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
            Text("ScrollViewReader")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that provides programmatic scrolling. Its content closure receives a ScrollViewProxy used to scroll to identified child views via proxy.scrollTo(_:anchor:).")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollviewreader.md \u{00b7} macOS 11.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout("ScrollViewReader { proxy in ScrollView { \u{2026}.id(i) } }")
            HStack(spacing: 8) {
                Button("Scroll to top") { jumpTarget = 0 }
                Button("Scroll to 25") { jumpTarget = 25 }
                Button("Scroll to bottom") { jumpTarget = 49 }
            }
            .font(.caption)

            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<50) { i in
                            Text("Row \(i)")
                                .font(.callout).foregroundStyle(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 12).padding(.vertical, 5)
                                .id(i)
                            Divider().padding(.leading, 12)
                        }
                    }
                }
                .frame(height: 180)
                .onChange(of: jumpTarget) { _, target in
                    if let t = target {
                        withAnimation { proxy.scrollTo(t, anchor: .center) }
                        jumpTarget = nil
                    }
                }
            }
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "Anchored to .top vs .bottom") {
                APICallout("proxy.scrollTo(targetID, anchor: .top)  //  .center  //  .bottom")
                Text("The anchor parameter controls where in the visible region SwiftUI lands the target view. .top pins the target to the top of the scroll view; .bottom to the bottom; .center centers it.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VariantRow(title: "Inside a ScrollViewReader \u{2014} actions only") {
                APICallout("// proxy can be called from button actions, gesture handlers, .onChange, .task")
                Text("Apple's docs explicitly forbid invoking the proxy during execution of the content view builder \u{2014} doing so is a runtime error. Confine proxy.scrollTo(_:) calls to view actions and lifecycle handlers.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Animated programmatic scroll") {
            APICallout("withAnimation { proxy.scrollTo(targetID, anchor: .center) }")
            Text("Wrap the proxy call in withAnimation { \u{2026} } to animate the scroll \u{2014} the buttons in the default demo above use this pattern.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Targets must have a matching .id().", "proxy.scrollTo(value:) only works when a view inside the ScrollView is tagged with .id(value) of the same Hashable type. No matching id \u{2014} no scroll.", "scope"),
        ("Single-value identity, not range.", "ScrollViewReader's proxy can only navigate to a single id at a time. For continuous position tracking use .scrollPosition(_:anchor:) or .scrollPosition(id:anchor:) instead.", "location"),
        ("macOS 14+ has a richer API surface.", "On macOS 14+ prefer .scrollPosition(id:) for two-way binding (read AND write the visible id), and .defaultScrollAnchor for initial positioning. ScrollViewReader stays useful for one-shot programmatic jumps.", "calendar"),
        ("Don't capture proxy across view rebuilds.", "Apple's runtime check fires if you read the proxy synchronously in the body. Always invoke from a closure (button action, .onChange, .task) so the proxy is current at call time.", "exclamationmark.triangle")
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

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

#Preview {
    ScrollViewReaderPage().frame(width: 1100, height: 1100)
}
