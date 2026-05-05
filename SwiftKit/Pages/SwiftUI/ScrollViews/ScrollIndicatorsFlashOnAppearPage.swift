import SwiftUI

// SwiftUI `View/scrollIndicatorsFlash(onAppear:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollindicatorsflash(onappear:).md
// macOS 14.0+.

struct ScrollIndicatorsFlashOnAppearPage: View {
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
            Text("View/scrollIndicatorsFlash(onAppear:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Briefly flashes the scroll indicators of a scrollable view when it first appears, signalling that the content is scrollable.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollindicatorsflash(onappear:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".scrollIndicatorsFlash(onAppear: true)")
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
            .scrollIndicators(.visible)
            .scrollIndicatorsFlash(onAppear: true)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            Text("On macOS the appearance flash is brief \u{2014} resize the window or revisit the page to see it again.")
                .font(.caption).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("onAppear: false").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollIndicatorsFlash(onAppear: false)")
                Text("Suppresses the appearance flash. Use when the scroll view is paired with other affordances (a header that already cues scrollability) and the flash would be redundant.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Pair with .scrollIndicators").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollIndicators(.visible).scrollIndicatorsFlash(onAppear: true)")
                Text("Only indicators configured to be visible flash. .never or .hidden suppress both the flash and the steady-state indicator.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Trigger-based companion").font(.headline).foregroundStyle(.primary)
            APICallout(".scrollIndicatorsFlash(trigger: someValue)")
            Text("Use the trigger: form to flash indicators in response to a value change \u{2014} new content arriving, a sheet dismissing, etc. See View/scrollIndicatorsFlash(trigger:).")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Discoverability cue.", "The flash signals \u{201C}there's more below\u{201D} on first paint. Apple uses it in Mail and Messages content lists.", "eye"),
        ("Only visible indicators flash.", "If you've set .scrollIndicators(.hidden) or .never the flash is suppressed; configure visibility before adding the flash.", "eye.slash"),
        ("Cheap.", "No layout cost \u{2014} the modifier just nudges the platform's existing indicator animation on first appearance.", "leaf")
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
    ScrollIndicatorsFlashOnAppearPage().frame(width: 1100, height: 1000)
}
