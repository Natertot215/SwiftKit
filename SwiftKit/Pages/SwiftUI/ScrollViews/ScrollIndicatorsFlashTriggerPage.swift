import SwiftUI

// SwiftUI `View/scrollIndicatorsFlash(trigger:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollindicatorsflash(trigger:).md
// macOS 14.0+.

struct ScrollIndicatorsFlashTriggerPage: View {
    @State private var flashCount: Int = 0

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
            Text("View/scrollIndicatorsFlash(trigger:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Flashes the scroll indicators when a passed-in Equatable value changes. Use to draw attention back to the scroll content after a state change \u{2014} new data arriving, a sheet dismissing, a filter applied.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollindicatorsflash(trigger:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".scrollIndicatorsFlash(trigger: flashCount)")
            HStack(spacing: 12) {
                Button {
                    flashCount += 1
                } label: {
                    Label("Flash indicators", systemImage: "wand.and.stars")
                }
                .buttonStyle(.borderedProminent)
                Text("flashCount: \(flashCount)")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Spacer()
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
            .scrollIndicators(.visible)
            .scrollIndicatorsFlash(trigger: flashCount)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Common trigger values").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollIndicatorsFlash(trigger: messages.count)         // new chat message arrived")
                APICallout(".scrollIndicatorsFlash(trigger: filterCriteria)         // user changed a filter")
                APICallout(".scrollIndicatorsFlash(trigger: isSheetPresented)       // sheet dismissed")
                Text("Any Equatable value works \u{2014} Int counters, Bool toggles, or any Hashable model that conforms to Equatable.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Composes with onAppear flash").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView { … }
    .scrollIndicatorsFlash(onAppear: true)
    .scrollIndicatorsFlash(trigger: flashCount)
""")
                Text("The two flash modifiers are independent \u{2014} use both to flash on first appearance and on every subsequent trigger change.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("No flash without visible indicators").font(.headline).foregroundStyle(.primary)
            APICallout(".scrollIndicators(.hidden).scrollIndicatorsFlash(trigger: x)  // does nothing")
            Text("Like onAppear, this only flashes indicators that are configured visible. If you've hidden them, the flash is silently suppressed.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Equatable, not Bool.", "Any Equatable value triggers the flash on change. You don't need a Bool toggle \u{2014} an incrementing counter or model snapshot is fine.", "equal.circle"),
        ("Idempotent on identical values.", "Setting the trigger to the same value it already had does nothing. Use a counter (or `UUID()`) when you need to force a flash.", "arrow.clockwise"),
        ("No animation curve to configure.", "The flash uses the platform's standard indicator animation. There's no duration / easing parameter \u{2014} that's deliberate; it keeps the cue consistent system-wide.", "lock")
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
    ScrollIndicatorsFlashTriggerPage().frame(width: 1100, height: 1000)
}
