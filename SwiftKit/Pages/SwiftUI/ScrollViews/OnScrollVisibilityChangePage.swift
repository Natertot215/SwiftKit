import SwiftUI

// SwiftUI `View/onScrollVisibilityChange(threshold:_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/onscrollvisibilitychange(threshold:_:).md
// macOS 15.0+. Per-view visibility crossing callback for views inside a scrollable container.

struct OnScrollVisibilityChangePage: View {
    @State private var watcherVisible: Bool = false
    @State private var visibleCount: Int = 0

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
            Text("View/onScrollVisibilityChange(threshold:_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Reports when this individual view crosses a visibility threshold inside its enclosing scroll view. The callback receives a Bool indicating the view's current on/off-screen state.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/onscrollvisibilitychange(threshold:_:).md \u{00b7} macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".onScrollVisibilityChange(threshold: 0.5) { isVisible in self.watcherVisible = isVisible }")
            HStack(spacing: 8) {
                Image(systemName: watcherVisible ? "eye.fill" : "eye.slash")
                    .foregroundStyle(watcherVisible ? AnyShapeStyle(.tint) : AnyShapeStyle(.secondary))
                Text(watcherVisible ? "watcher row is at least 50% visible" : "watcher row is off-screen")
                    .font(.callout).foregroundStyle(.secondary)
                Text("flips: \(visibleCount)")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
                Spacer()
            }

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<30) { i in
                        if i == 12 {
                            HStack {
                                Image(systemName: "scope").foregroundStyle(.tint)
                                Text("Watcher row \(i)").font(.callout).fontWeight(.semibold).foregroundStyle(.primary)
                                Spacer()
                            }
                            .padding(.horizontal, 12).padding(.vertical, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                            .padding(.horizontal, 4).padding(.vertical, 2)
                            .onScrollVisibilityChange(threshold: 0.5) { isVisible in
                                watcherVisible = isVisible
                                visibleCount += 1
                            }
                        } else {
                            Text("Row \(i)").font(.callout).foregroundStyle(.primary)
                                .padding(.horizontal, 12).padding(.vertical, 6)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Divider().padding(.leading, 12)
                        }
                    }
                }
            }
            .frame(height: 220)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Threshold").font(.headline).foregroundStyle(.primary)
                APICallout(".onScrollVisibilityChange(threshold: 0.2) { … }  // 20% visible")
                APICallout(".onScrollVisibilityChange(threshold: 0.5) { … }  // default — half visible")
                APICallout(".onScrollVisibilityChange(threshold: 1.0) { … }  // fully visible")
                Text("Default threshold is 0.5 \u{2014} the action fires when at least half of the view's bounds are inside the scroll viewport.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Pause-when-off-screen pattern").font(.headline).foregroundStyle(.primary)
                APICallout("""
VideoPlayer(player: player)
    .onScrollVisibilityChange(threshold: 0.2) { isVisible in
        isVisible ? player.play() : player.pause()
    }
""")
                Text("The canonical use \u{2014} pause expensive work when the view scrolls out, resume when it returns.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Initial appearance").font(.headline).foregroundStyle(.primary)
            APICallout("// onScrollVisibilityChange fires on appear if threshold already met")
            Text("If the threshold is already satisfied when the view first appears, the action fires once with isVisible = true.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("One view, one Bool.", "This modifier reports the modified view's own visibility \u{2014} not the sibling rows around it. For multiple targets at once, use onScrollTargetVisibilityChange(idType:threshold:_:).", "eye"),
        ("Threshold is fraction.", "0.0 fires for any visible pixel; 1.0 only when the view is fully inside the viewport. Default is 0.5.", "percent"),
        ("Two-state, not multi.", "The Bool only flips at the threshold crossing. Use onScrollGeometryChange to read continuous offset/visibility values.", "switch.2"),
        ("Plays nicely with LazyVStack.", "The view must actually be realized for the action to fire \u{2014} a LazyVStack only realizes views close to the viewport, which is exactly when you'd want the callback.", "tray.full")
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
    OnScrollVisibilityChangePage().frame(width: 1100, height: 1100)
}
