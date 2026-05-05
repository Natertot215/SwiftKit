import SwiftUI

// SwiftUI `View/scrollInputBehavior(_:for:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollinputbehavior(_:for:).md
// macOS 15.0+. The two ScrollInputKind values (.handGestureShortcut, .look) are
// non-macOS — watchOS / visionOS — so the Gallery showcases the API surface and
// describes the macOS situation honestly.

struct ScrollInputBehaviorModifierPage: View {
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
            Text("View/scrollInputBehavior(_:for:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Enables or disables scrolling for a particular ScrollInputKind. Unlike scrollDisabled \u{2014} which is all-or-nothing \u{2014} this modifier targets a single input kind, so you can selectively block or permit specific gesture sources.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollinputbehavior(_:for:).md \u{00b7} macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout("// watchOS:    .scrollInputBehavior(.disabled, for: .handGestureShortcut)")
            APICallout("// visionOS:   .scrollInputBehavior(.enabled, for: .look)")
            APICallout("// macOS 26:   no public ScrollInputKind applies — modifier compiles, no effect.")

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<25) { i in
                        Text("Row \(i)").font(.callout).foregroundStyle(.primary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider().padding(.leading, 12)
                    }
                }
            }
            .frame(height: 200)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

            Text("ScrollInputKind exposes .handGestureShortcut (watchOS) and .look / .look(axes:) (visionOS). Both are marked unavailable on macOS \u{2014} the kind enum has no macOS-targeted case as of macOS 26. The modifier compiles in macOS code only when paired with a kind value made available by an OS-availability check. To block scrolling on macOS, reach for .scrollDisabled(_:) instead.")
                .font(.caption).foregroundStyle(.secondary).fixedSize(horizontal: false, vertical: true)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Behavior values").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollInputBehavior.automatic")
                APICallout("ScrollInputBehavior.enabled")
                APICallout("ScrollInputBehavior.disabled")
                Text(".automatic uses the platform default for that input. .enabled / .disabled override it explicitly.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Input kinds").font(.headline).foregroundStyle(.primary)
                APICallout("ScrollInputKind.handGestureShortcut    // watchOS double-tap")
                APICallout("ScrollInputKind.look                    // visionOS, all axes")
                APICallout("ScrollInputKind.look(axes: .vertical)   // visionOS, scoped axis")
                Text("Both public kinds are non-macOS. The modifier compiles on macOS but with no macOS-applicable input kind, it has no observable effect there.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Cross-platform pattern").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView { … }
    .scrollInputBehavior(.disabled, for: .handGestureShortcut) // watchOS only
""")
                Text("The canonical use is the watchOS one Apple documents \u{2014} disabling double-tap-to-scroll on a watch face while keeping crown / touch.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("scrollDisabled wins").font(.headline).foregroundStyle(.primary)
            APICallout(".scrollDisabled(true)                              // global block")
            APICallout(".scrollInputBehavior(.enabled, for: .look)         // ignored when scrollDisabled = true")
            Text("If scrollDisabled(true) is in scope, scrollInputBehavior cannot re-enable scrolling. The two interact deliberately so a screen-wide block can't be subverted.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("macOS-applicable kinds: none yet.", "ScrollInputKind currently exposes only .handGestureShortcut (watchOS) and .look (visionOS). On macOS this API is documented for completeness but doesn't gate trackpad / mouse input.", "exclamationmark.circle"),
        ("Per-input control.", "Use this when you want to disable one input kind while leaving others alone. For an all-or-nothing block, scrollDisabled is simpler.", "switch.2"),
        ("Available macOS 15+.", "The modifier signature exists on macOS 15+ even though no macOS-targeted ScrollInputKind has shipped \u{2014} that may change in a later SDK.", "calendar"),
        ("scrollDisabled wins.", "scrollDisabled(true) overrides this modifier; you can't carve out an exception with .enabled.", "lock")
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
    ScrollInputBehaviorModifierPage().frame(width: 1100, height: 1100)
}
