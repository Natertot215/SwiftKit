import SwiftUI

// SwiftUI `View/listRowInsets(_:)` reference page.
// Source: Documentation/SwiftUI/lists/listrowinsets(_:).md
// Single API:
//   func listRowInsets(_ insets: EdgeInsets?) -> some View
// Apply per row to override the list style's default row padding.
// macOS 10.15+.

private let demoFrameWidth: CGFloat = 360
private let demoFrameHeight: CGFloat = 200

struct ListRowInsetsPage: View {
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

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("listRowInsets(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Applies an inset to the rows in a list.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/lists/listrowinsets(_:).md · macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        DemoCard(api: ".listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))") {
            List {
                Text("Vanilla")
                    .listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                Text("Chocolate")
                    .listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                Text("Strawberry")
                    .listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Zero insets — flush to row container") {
                DemoCard(api: ".listRowInsets(EdgeInsets())") {
                    List {
                        Text("Edge to edge")
                            .listRowInsets(EdgeInsets())
                        Text("Edge to edge")
                            .listRowInsets(EdgeInsets())
                    }
                }
            }

            VariantBlock(title: "Per-edge insets — uneven padding") {
                DemoCard(api: ".listRowInsets(.init(top: 12, leading: 40, bottom: 12, trailing: 8))") {
                    List {
                        Text("Indented")
                            .listRowInsets(EdgeInsets(top: 12, leading: 40, bottom: 12, trailing: 8))
                        Text("Indented")
                            .listRowInsets(EdgeInsets(top: 12, leading: 40, bottom: 12, trailing: 8))
                    }
                }
            }

            VariantBlock(title: "Pass nil — restore the list style's default") {
                DemoCard(api: ".listRowInsets(nil)") {
                    List {
                        Text("Default insets")
                            .listRowInsets(nil)
                        Text("Default insets")
                            .listRowInsets(nil)
                    }
                }
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Side-by-side — default vs custom insets") {
                HStack(alignment: .top, spacing: 24) {
                    StateColumn(label: "Default", api: "(no modifier)") {
                        List {
                            Text("Pacific")
                            Text("Atlantic")
                            Text("Indian")
                        }
                    }
                    StateColumn(label: "Heavy leading inset", api: ".listRowInsets(.init(…, leading: 60, …))") {
                        List {
                            Text("Pacific")
                                .listRowInsets(EdgeInsets(top: 8, leading: 60, bottom: 8, trailing: 8))
                            Text("Atlantic")
                                .listRowInsets(EdgeInsets(top: 8, leading: 60, bottom: 8, trailing: 8))
                            Text("Indian")
                                .listRowInsets(EdgeInsets(top: 8, leading: 60, bottom: 8, trailing: 8))
                        }
                    }
                }
            }
        }
    }

    // MARK: Notes

    private struct ModifierNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [ModifierNote] = [
        .init(title: "Apply to the row content, not the List.",
              detail: "Attach .listRowInsets(_:) to the view inside the List that becomes a row. Attaching it to the List itself has no effect — the modifier targets the per-cell layout.",
              symbol: "rectangle.inset.filled"),
        .init(title: "Pass nil to restore the style's default.",
              detail: "EdgeInsets? is the parameter type. nil = inherit from the active list style. Any concrete value overrides the style's defaults completely on every edge.",
              symbol: "arrow.uturn.backward"),
        .init(title: "Different rows can use different insets.",
              detail: "Apply the modifier per-row to vary insets across the list — useful for marking grouped content without a Section, or for emphasizing one row.",
              symbol: "list.bullet"),
        .init(title: "Per L-012, prefer this over manual .padding inside the row.",
              detail: ".listRowInsets feeds the list's row layout machinery so selection chrome, separators, and hover effects align correctly. .padding inside the row's content view shifts the content but leaves the row chrome at its original metrics.",
              symbol: "exclamationmark.triangle")
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
}

// MARK: - Reusable demo helpers (page-local)

private struct DemoCard<Content: View>: View {
    let api: String
    var height: CGFloat = demoFrameHeight
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: height)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

private struct VariantBlock<Content: View>: View {
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

private struct StateColumn<Content: View>: View {
    let label: String
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .frame(width: 280, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }
}

#Preview {
    ListRowInsetsPage()
        .frame(width: 1100, height: 800)
}
