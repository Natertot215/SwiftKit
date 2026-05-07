import SwiftUI

// SwiftUI `View/scrollClipDisabled(_:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/scrollclipdisabled(_:).md
// macOS 14.0+.

struct ScrollClipDisabledGalleryPage: View {
    @State private var disabled: Bool = true

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
            Text("View/scrollClipDisabled(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Lets a scroll view's content render outside the scroll bounds. Useful when child views have shadows or other off-edge ornaments that would otherwise be clipped.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/scrollclipdisabled(_:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                APICallout(".scrollClipDisabled(\(disabled ? "true" : "false"))")
                Spacer()
                Toggle("Disable clip", isOn: $disabled)
                    .toggleStyle(.switch)
                    .labelsHidden()
                Text(disabled ? "shadows escape" : "shadows clipped")
                    .font(.caption).foregroundStyle(.secondary)
            }

            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(0..<8) { i in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.tint.opacity(0.5))
                            .frame(width: 90, height: 90)
                            .overlay(Text("\(i + 1)").font(.title2).foregroundStyle(.white))
                            .shadow(color: .primary.opacity(0.5), radius: 14, y: 6)
                    }
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 32)
            }
            .frame(height: 170)
            .scrollClipDisabled(disabled)
            .background(.tint.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Default value").font(.headline).foregroundStyle(.primary)
                APICallout(".scrollClipDisabled()             // disabled = true")
                APICallout(".scrollClipDisabled(true)         // explicit")
                APICallout(".scrollClipDisabled(false)        // restore default clip")
                Text("The disabled parameter defaults to true \u{2014} writing .scrollClipDisabled() is the same as .scrollClipDisabled(true).")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Custom clip on top").font(.headline).foregroundStyle(.primary)
                APICallout("""
ScrollView(.horizontal) { … }
    .scrollClipDisabled()
    .padding()
    .clipShape(Rectangle())
""")
                Text("Disable the default clip and add your own (typically a Rectangle padded outwards) to allow shadows to escape but still bound the scroll content somewhere.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Effect on hit testing").font(.headline).foregroundStyle(.primary)
            APICallout("// content outside bounds renders BUT taps still pass through unclipped region")
            Text("Disabling the clip lets visuals escape, but the scroll view's hit-testing region is the original bounds. Tapping content rendered outside that frame still works because SwiftUI hit-tests the underlying view.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Designed for shadow-bearing rows.", "Card-style ScrollViews with .shadow on each item are the canonical use \u{2014} disable the clip so the shadow doesn't get sliced at the scroll bounds.", "rectangle.stack"),
        ("Add a custom clip if needed.", "If you want shadows to escape but still want the content to disappear at, say, an outer container's edge, follow with .clipShape(Rectangle()) over a padded frame.", "scissors"),
        ("Cheap.", "No layout cost \u{2014} this just toggles whether SwiftUI installs the default content-bounds clip.", "leaf"),
        ("Doesn't affect overscroll.", "Bounce and overscroll behaviour are unrelated \u{2014} use scrollBounceBehavior(_:axes:) for those.", "arrow.up.and.down")
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

extension ScrollClipDisabledGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.scrollViews.scrollClipDisabled",
        title: "ScrollClipDisabled",
        folder: "Scroll views",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/scrollClipDisabled(_:)"
        ],
        blurb: "Disables the clipping that a scroll view normally applies to its content. Use to let decorations like shadows or hover effects extend beyond the scrollable region's bounds.",
        signature: "func scrollClipDisabled(_ disabled: Bool = true) -> some View",
        availability: "macOS 14.0+",
        docPath: "Documentation/SwiftUI/scroll-views/scrollclipdisabled(_:).md",
        page: { AnyView(ScrollClipDisabledGalleryPage()) }
    )
}

#Preview {
    ScrollClipDisabledGalleryPage().frame(width: 1100, height: 1000)
}
