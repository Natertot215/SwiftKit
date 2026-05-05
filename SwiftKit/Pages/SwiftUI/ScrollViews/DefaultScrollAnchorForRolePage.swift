import SwiftUI

// SwiftUI `View/defaultScrollAnchor(_:for:)` reference page.
// Source: Documentation/SwiftUI/scroll-views/defaultscrollanchor(_:for:).md
// macOS 15.0+. Same as defaultScrollAnchor(_:) but scopes the anchor to a specific ScrollAnchorRole.

struct DefaultScrollAnchorForRolePage: View {
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
            Text("View/defaultScrollAnchor(_:for:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Like defaultScrollAnchor(_:), but binds the anchor to one ScrollAnchorRole \u{2014} .initialOffset, .sizeChanges, or .alignment \u{2014} so each role can use a different anchor.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/scroll-views/defaultscrollanchor(_:for:).md \u{00b7} macOS 15.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            APICallout(
"""
ScrollView { \u{2026} }
    .defaultScrollAnchor(.bottom)
    .defaultScrollAnchor(.topLeading, for: .alignment)
"""
            )
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(0..<6) { i in
                        Text("Short row \(i)")
                            .font(.callout).foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 12).padding(.vertical, 4)
                    }
                }
                .padding(.vertical, 6)
            }
            .frame(height: 200)
            .defaultScrollAnchor(.bottom)
            .defaultScrollAnchor(.topLeading, for: .alignment)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

            Text("Content here is shorter than the container. .defaultScrollAnchor(.bottom) governs initial offset + size changes; the .topLeading override pins shorter-than-container content to the top-leading.")
                .font(.caption).foregroundStyle(.tertiary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantRow(title: "for: .initialOffset \u{2014} where the scroll view starts") {
                APICallout(".defaultScrollAnchor(.center, for: .initialOffset)")
                Text("Controls only the initial position. The scroll view starts centered, but doesn't realign on content-size changes (those use whichever anchor is bound to .sizeChanges, defaulting to the unscoped value).")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VariantRow(title: "for: .sizeChanges \u{2014} how content-grow repositions") {
                APICallout(".defaultScrollAnchor(.bottom, for: .sizeChanges)")
                Text("Used when the scroll view's content size changes. .bottom keeps a chat log pinned to the latest message; .top keeps the top of the visible region stable as content grows below.")
                    .font(.callout).foregroundStyle(.secondary)
            }

            VariantRow(title: "for: .alignment \u{2014} content smaller than container") {
                APICallout(".defaultScrollAnchor(.topLeading, for: .alignment)")
                Text("Controls where content shorter than the container parks itself. Default behavior centers undersized content; .topLeading pins it to the top-leading corner instead.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VariantRow(title: "Stacking \u{2014} unscoped + role-scoped") {
            APICallout(
"""
.defaultScrollAnchor(.bottom)                        // covers all three roles by default
.defaultScrollAnchor(.topLeading, for: .alignment)    // overrides only .alignment
"""
            )
            Text("Apply the unscoped form first to set every role at once, then layer role-scoped overrides for the cases you want to special-case.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Three roles.", "ScrollAnchorRole.initialOffset = where the scroll starts; .sizeChanges = how content-grow repositions; .alignment = where content smaller than the container parks.", "rectangle.3.group"),
        ("Order matters.", "Apply the unscoped .defaultScrollAnchor(_:) before role-scoped overrides so the broad value covers the roles you don't customize.", "list.number"),
        ("nil resets.", "Pass nil to clear an anchor binding for a role. Useful when conditionally enabling chat-style behavior.", "x.circle"),
        ("New in macOS 15.", "defaultScrollAnchor(_:for:) and ScrollAnchorRole are macOS 15. Pre-15, only the unscoped defaultScrollAnchor(_:) (macOS 14) is available.", "calendar")
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

    private struct VariantRow<Content: View>: View {
        let title: String
        @ViewBuilder var content: () -> Content
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.headline).foregroundStyle(.primary)
                content()
            }
        }
    }
}

#Preview {
    DefaultScrollAnchorForRolePage().frame(width: 1100, height: 1100)
}
