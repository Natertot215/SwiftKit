import SwiftUI

// SwiftUI `View/scrollBounceBehavior(_:axes:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollbouncebehavior(_:axes:).md
// macOS 13.3+.

struct ScrollBounceBehaviorPage: View {
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
            Text("View/scrollBounceBehavior(_:axes:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Configures whether a scrollable view bounces past the end of its content. Three behaviors \u{2014} .automatic, .always, .basedOnSize \u{2014} apply per-axis.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollbouncebehavior(_:axes:).md \u{00b7} macOS 13.3+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 16) {
            bounceVariant(label: "automatic", api: ".scrollBounceBehavior(.automatic)", behavior: .automatic)
            bounceVariant(label: "always", api: ".scrollBounceBehavior(.always)", behavior: .always)
            bounceVariant(label: "basedOnSize", api: ".scrollBounceBehavior(.basedOnSize)", behavior: .basedOnSize)
        }
    }

    private func bounceVariant(label: String, api: String, behavior: ScrollBounceBehavior) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Text(label).font(.caption).fontDesign(.monospaced).fontWeight(.semibold).foregroundStyle(.tint)
                APICallout(api)
            }
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(0..<3) { i in
                        Text("Short row \(i)").font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.vertical, 4)
            }
            .frame(height: 130)
            .scrollBounceBehavior(behavior)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Per-axis").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollBounceBehavior(.basedOnSize, axes: .vertical)")
                APICallout(".scrollBounceBehavior(.always, axes: .horizontal)")
                APICallout(".scrollBounceBehavior(.basedOnSize, axes: [.vertical, .horizontal])")
                Text("axes defaults to .vertical. For both-axes ScrollView, pass [.vertical, .horizontal].")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Horizontal example").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollBounceBehavior(.basedOnSize, axes: .horizontal)")
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(0..<3) { i in
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.tint.opacity(0.4))
                                .frame(width: 80, height: 60)
                                .overlay(Text("\(i)").foregroundStyle(.white))
                        }
                    }
                    .padding(8)
                }
                .frame(height: 90)
                .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Bounce values").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollBounceBehavior.automatic")
                APICallout("ScrollBounceBehavior.always")
                APICallout("ScrollBounceBehavior.basedOnSize")
                Text("automatic — platform default. always — always rubber-bands. basedOnSize — only bounces when content actually exceeds the container.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Container support").font(.headline).foregroundStyle(.primary)
            APICallout(".scrollBounceBehavior on List, Table, TextEditor — all work")
            Text("The modifier passes through the environment so all scrollable kinds in scope respect it. List with .basedOnSize is the canonical fix for an empty-list bouncing on macOS.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        (".basedOnSize is the recommended default.", "Stops empty or short content from bouncing as if it were full \u{2014} the most common visual bug it solves.", "rectangle.compress.vertical"),
        (".always is rare on macOS.", "Bounce is iOS-flavored. .always is most useful when porting iOS-style \u{201C}elastic\u{201D} feels to macOS.", "iphone"),
        ("Vertical default.", "axes defaults to .vertical \u{2014} horizontal scroll views need to opt in explicitly with axes: .horizontal.", "arrow.left.and.right"),
        ("Pairs with horizontalScrollBounceBehavior.", "When you only want axis-specific control, the dedicated horizontalScrollBounceBehavior / verticalScrollBounceBehavior environment values can be set directly.", "key")
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
    ScrollBounceBehaviorPage().frame(width: 1100, height: 1100)
}
