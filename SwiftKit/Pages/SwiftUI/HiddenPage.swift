import SwiftUI

// SwiftUI `View/hidden()` reference page.
// Source: Documentation/SwiftUI/view-configuration/hidden().md
// macOS 10.15+. Hides a view unconditionally; the view still occupies layout space.

struct HiddenPage: View {
    @State private var hideThird: Bool = true

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
            Text("View/hidden()")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Hides this view unconditionally. The view still occupies layout space.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/hidden().md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 12) {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                Image(systemName: "c.circle.fill")
                    .hidden()
                Image(systemName: "d.circle.fill")
            }
            .font(.largeTitle)
            .foregroundStyle(.tint)
            APICallout("Image(systemName: \"c.circle.fill\").hidden()")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            HiddenVariantRow(title: "Side-by-side \u{2014} visible vs hidden vs removed") {
                HStack(alignment: .top, spacing: 32) {
                    VStack(spacing: 6) {
                        labeledRow(label: "visible") { Image(systemName: "c.circle.fill") }
                        Text("All four icons").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        labeledRow(label: "hidden") { Image(systemName: "c.circle.fill").hidden() }
                        Text("\"c\" still occupies space").font(.caption).foregroundStyle(.secondary)
                    }
                    VStack(spacing: 6) {
                        labeledRow(label: "if removed") { EmptyView() }
                        Text("Layout collapses").font(.caption).foregroundStyle(.secondary)
                    }
                }
            }

            HiddenVariantRow(title: "Use an `if` to remove from layout") {
                VStack(alignment: .leading, spacing: 6) {
                    Text("if !isHidden { Image(\u{2026}) }")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                    Text("Use a conditional view to take the row out of the layout entirely \u{2014} .hidden() keeps the slot.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                Image(systemName: "c.circle.fill")
                    .opacity(hideThird ? 0 : 1) // visualize via opacity for state demo
                    .overlay(
                        Group {
                            if hideThird {
                                Image(systemName: "c.circle.fill")
                                    .hidden()
                            }
                        }
                    )
                Image(systemName: "d.circle.fill")
            }
            .font(.largeTitle)
            .foregroundStyle(.tint)

            Toggle("Hide third icon", isOn: $hideThird)
                .toggleStyle(.switch)
                .frame(maxWidth: 240)

            APICallout(".hidden() applied conditionally via Group + if")
        }
    }

    private struct HiddenNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [HiddenNote] = [
        .init(title: ".hidden() preserves layout, removes display + interaction.",
              detail: "The view stays in the hierarchy, contributes to sizing and alignment, but isn't drawn and can't receive hits. Use it to reserve space the user shouldn't see yet.",
              symbol: "eye.slash"),
        .init(title: "To remove from layout, use `if` instead.",
              detail: "Conditional inclusion via `if` (or omitting the view entirely) makes the parent collapse around the missing element. .hidden() does not.",
              symbol: "rectangle.dashed"),
        .init(title: "Don't use .hidden() for accessibility hiding.",
              detail: "Hidden views are still part of the accessibility tree by default. Combine with .accessibilityHidden(true) to also remove from VoiceOver.",
              symbol: "accessibility"),
        .init(title: "Different from .opacity(0).",
              detail: ".opacity(0) keeps the view interactive (hit-testing fires); .hidden() disables interaction. Pick based on whether you want a phantom hit zone.",
              symbol: "circle.lefthalf.filled"),
        .init(title: "Pairs well with placeholder columns.",
              detail: "Common pattern: an icon column always reserves width but only some rows display the icon \u{2014} use .hidden() on the empty rows so column width stays stable.",
              symbol: "tablecells")
    ]

    @ViewBuilder
    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(notes, id: \.title) { note in
                VStack(alignment: .leading, spacing: 4) {
                    Label(note.title, systemImage: note.symbol)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(note.detail)
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(.leading, 24)
                }
            }
        }
    }

    private func labeledRow<Marker: View>(label: String, @ViewBuilder marker: () -> Marker) -> some View {
        VStack(spacing: 6) {
            HStack(spacing: 12) {
                Image(systemName: "a.circle.fill")
                Image(systemName: "b.circle.fill")
                marker()
                Image(systemName: "d.circle.fill")
            }
            .font(.title)
            .foregroundStyle(.tint)
            Text(label)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }
}

private struct HiddenVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    HiddenPage()
        .frame(width: 1100, height: 800)
}
