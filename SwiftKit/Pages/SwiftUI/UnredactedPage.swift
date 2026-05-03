import SwiftUI

// SwiftUI `View/unredacted()` reference page.
// Source: Documentation/SwiftUI/view-configuration/unredacted().md
// macOS 11.0+. Removes any reason to apply redaction to this view hierarchy.

struct UnredactedPage: View {
    @State private var redactAll = true

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
            Text("View/unredacted()")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Removes any reason to apply a redaction to this view hierarchy.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/unredacted().md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Receipt").font(.headline)
                Text("Item 1: $9.99")
                Text("Item 2: $19.99")
                Text("TOTAL")
                    .font(.headline)
                    .unredacted()  // total stays readable
                Text("$29.98")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .unredacted()  // total value stays readable
            }
            .padding(16)
            .frame(width: 240, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .redacted(reason: .placeholder)
            APICallout("Apply .redacted(reason: .placeholder) on the parent + .unredacted() on the totals.")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            URPVariantRow(title: "Side-by-side \u{2014} default vs unredacted child") {
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("redacted, no escape").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        receiptCard(unredactedTotal: false)
                            .redacted(reason: .placeholder)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text("redacted + .unredacted() on total").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        receiptCard(unredactedTotal: true)
                            .redacted(reason: .placeholder)
                    }
                }
            }

            URPVariantRow(title: "Stacked redactions \u{2014} the closest unredacted wins") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Important")
                        .font(.title2)
                        .unredacted()
                        .padding(8)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                    APICallout("Wrap a critical leaf in .unredacted() to escape any ancestor redaction.")
                }
                .redacted(reason: [.placeholder, .privacy])
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            URPVariantRow(title: "Interactive \u{2014} toggle redaction on the parent") {
                VStack(alignment: .leading, spacing: 12) {
                    Toggle(".redacted(reason: .placeholder) on parent", isOn: $redactAll)
                        .toggleStyle(.switch)
                        .frame(maxWidth: 380, alignment: .leading)
                    receiptCard(unredactedTotal: true)
                        .redacted(reason: redactAll ? .placeholder : [])
                }
            }
        }
    }

    private struct URPNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [URPNote] = [
        .init(title: "Always wins over ancestor redaction.",
              detail: "Wrap a critical subview in .unredacted() to opt back in to its real content even when an ancestor has redacted everything.",
              symbol: "shield"),
        .init(title: "Doesn't undo .privacySensitive.",
              detail: ".privacySensitive() reacts to RedactionReasons.privacy. unredacted() clears the reasons set, so it does in fact remove that response \u{2014} but only for the receiver subtree.",
              symbol: "lock.shield"),
        .init(title: "Use sparingly inside skeleton states.",
              detail: "Skeleton loading typically wants the whole card hidden. Reach for .unredacted() only when a single value (price, total, status) must remain readable.",
              symbol: "rectangle.dashed"),
        .init(title: "No parameter \u{2014} this is a hard reset.",
              detail: ".unredacted() takes no arguments. To remove specific reasons selectively, manage state and re-apply .redacted with the reduced OptionSet.",
              symbol: "gear"),
        .init(title: "Composes with .invalidatableContent.",
              detail: "Inside an interactive Widget, marking the value as invalidatable + then .unredacted() in a recovery view lets you fall back to the last known value.",
              symbol: "arrow.uturn.backward")
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

    @ViewBuilder
    private func receiptCard(unredactedTotal: Bool) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Receipt").font(.headline)
            Text("Item 1: $9.99")
            Text("Item 2: $19.99")
            Group {
                Text("TOTAL").font(.headline)
                Text("$29.98").font(.title2).fontWeight(.semibold)
            }
            .conditionalUnredacted(unredactedTotal)
        }
        .padding(16)
        .frame(width: 220, alignment: .leading)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private extension View {
    @ViewBuilder
    func conditionalUnredacted(_ apply: Bool) -> some View {
        if apply { self.unredacted() } else { self }
    }
}

private struct URPVariantRow<Content: View>: View {
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
    UnredactedPage()
        .frame(width: 1100, height: 800)
}
