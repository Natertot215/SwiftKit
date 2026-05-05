import SwiftUI

// SwiftUI `View/scrollIndicators(_:axes:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollindicators(_:axes:).md
// macOS 13.0+.

struct ScrollIndicatorsModifierPage: View {
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
            Text("View/scrollIndicators(_:axes:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Sets the visibility of scroll indicators along given axes for ScrollView, List, TextEditor, and other scrollable hierarchies.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollindicators(_:axes:).md \u{00b7} macOS 13.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 16) {
            indicatorVariant(label: "automatic", api: ".scrollIndicators(.automatic)", visibility: .automatic)
            indicatorVariant(label: "visible", api: ".scrollIndicators(.visible)", visibility: .visible)
            indicatorVariant(label: "hidden", api: ".scrollIndicators(.hidden)", visibility: .hidden)
            indicatorVariant(label: "never", api: ".scrollIndicators(.never)", visibility: .never)
        }
    }

    private func indicatorVariant(label: String, api: String, visibility: ScrollIndicatorVisibility) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Text(label).font(.caption).fontDesign(.monospaced).fontWeight(.semibold).foregroundStyle(.tint)
                APICallout(api)
            }
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<25) { i in
                        Text("Row \(i)").font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.leading, 12)
                    }
                }
            }
            .frame(height: 130)
            .scrollIndicators(visibility)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Per-axis control").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollIndicators(.hidden, axes: .vertical)")
                APICallout(".scrollIndicators(.visible, axes: .horizontal)")
                APICallout(".scrollIndicators(.hidden, axes: [.vertical, .horizontal])")
                Text("axes defaults to [.vertical, .horizontal]. Pass a single axis to control just one direction in a both-axis ScrollView.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Both-axes example").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollIndicators(.visible)")
                ScrollView([.horizontal, .vertical]) {
                    LazyVStack(alignment: .leading, spacing: 4) {
                        ForEach(0..<10) { row in
                            HStack(spacing: 4) {
                                ForEach(0..<14) { col in
                                    Text("\(row),\(col)")
                                        .font(.caption2).fontDesign(.monospaced).foregroundStyle(.secondary)
                                        .frame(width: 48, height: 28)
                                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 3))
                                }
                            }
                        }
                    }
                    .padding(8)
                }
                .frame(height: 140)
                .scrollIndicators(.visible)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Visibility cases").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollIndicatorVisibility.automatic")
                APICallout("ScrollIndicatorVisibility.visible")
                APICallout("ScrollIndicatorVisibility.hidden")
                APICallout("ScrollIndicatorVisibility.never")
                Text(".never is stronger than .hidden \u{2014} .hidden permits the platform to flash indicators on appear or trigger; .never suppresses them entirely.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Environment propagation").font(.headline).foregroundStyle(.primary)
            APICallout(".scrollIndicators(.hidden)  // applies to all nested ScrollView / List / TextEditor")
            Text("The visibility passes through the environment, so wrapping a screen in .scrollIndicators(.hidden) suppresses indicators across every scrollable inside.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        (".automatic respects platform.", "Lets each scrollable use its platform default \u{2014} typically transient indicators on macOS that fade in only while scrolling.", "wand.and.stars"),
        (".hidden vs .never.", ".hidden hides the steady-state indicator but allows scrollIndicatorsFlash to surface them. .never blocks even the flash.", "eye.slash"),
        ("Pair with scrollIndicatorsFlash(onAppear:).", "Set .visible plus .scrollIndicatorsFlash(onAppear: true) to cue scrollability without leaving indicators on permanently.", "wand.and.stars"),
        ("Affects List and TextEditor too.", "The modifier is environment-based, not specific to ScrollView.", "list.bullet")
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
    ScrollIndicatorsModifierPage().frame(width: 1100, height: 1200)
}
