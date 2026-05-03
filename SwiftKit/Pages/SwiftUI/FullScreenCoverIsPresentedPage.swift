import SwiftUI

// SwiftUI `View/fullScreenCover(isPresented:onDismiss:content:)` reference page.
// Source: Documentation/SwiftUI/modal-presentations/fullscreencover(ispresented:ondismiss:content:).md
// iOS / iPadOS / tvOS / visionOS / watchOS — NOT available on macOS.
// Documented as code-snippet only since the API surface cannot run on macOS.

struct FullScreenCoverIsPresentedPage: View {
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
            Text("View/fullScreenCover(isPresented:onDismiss:content:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a modal view that covers as much of the screen as possible when binding to a Boolean value you provide is true.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/modal-presentations/fullscreencover(ispresented:ondismiss:content:).md \u{00b7} iOS 14+ \u{00b7} unavailable on macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        FCSnippet(
            api: ".fullScreenCover(isPresented: $isPresenting) { … }",
            code: """
            struct FullScreenCoverPresentedOnDismiss: View {
                @State private var isPresenting = false
                var body: some View {
                    Button("Present Full-Screen Cover") {
                        isPresenting.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresenting,
                                     onDismiss: didDismiss) {
                        VStack {
                            Text("A full-screen modal view.")
                                .font(.title)
                            Text("Tap to Dismiss")
                        }
                        .onTapGesture {
                            isPresenting.toggle()
                        }
                    }
                }

                func didDismiss() {
                    // Handle the dismissing action.
                }
            }
            """,
            note: "Reference example from the Apple documentation. Cover content fills the screen; dismissal is explicit (no swipe-to-dismiss)."
        )
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Minimal — no onDismiss") {
                FCSnippet(
                    api: ".fullScreenCover(isPresented: $showCover) { CoverView() }",
                    code: """
                    Button("Show cover") { showCover = true }
                        .fullScreenCover(isPresented: $showCover) {
                            CoverView()
                        }
                    """,
                    note: "onDismiss is optional; omit it when no post-dismiss work is needed."
                )
            }

            VariantBlock(title: "With onDismiss closure") {
                FCSnippet(
                    api: ".fullScreenCover(isPresented:, onDismiss:, content:)",
                    code: """
                    .fullScreenCover(isPresented: $showCover, onDismiss: {
                        analytics.log("cover_dismissed")
                    }) {
                        CoverView()
                    }
                    """,
                    note: "onDismiss runs after the binding flips back to false."
                )
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "Dismissing from inside the cover") {
                FCSnippet(
                    api: "@Environment(\\.dismiss) private var dismiss",
                    code: """
                    struct CoverView: View {
                        @Environment(\\.dismiss) private var dismiss
                        var body: some View {
                            Button("Done") { dismiss() }
                        }
                    }
                    """,
                    note: "The dismiss environment action is the recommended way to close the cover from within."
                )
            }
        }
    }

    // MARK: Notes

    private struct FCNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [FCNote] = [
        .init(title: "Not available on macOS.",
              detail: "Use .sheet(isPresented:) on macOS — sheets there already use a window-attached modal style and are the right primitive for full-window modal content.",
              symbol: "macwindow.badge.plus"),
        .init(title: "No interactive (drag-to-dismiss) gesture.",
              detail: "Unlike .sheet on iOS, full-screen covers don't get a drag-to-dismiss gesture. Provide an explicit dismiss button.",
              symbol: "hand.raised"),
        .init(title: "Cover-vs-sheet adaptation in compact size classes.",
              detail: "On iPhone in landscape, .sheet may auto-adapt to cover. Use .presentationCompactAdaptation(_:) to override both directions.",
              symbol: "iphone.gen3.landscape"),
        .init(title: "Per-window cover, like sheets.",
              detail: "A full-screen cover is scoped to the window/scene that owns the presenting view; it does not cover other windows.",
              symbol: "rectangle.on.rectangle")
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

private struct FCSnippet: View {
    let api: String
    let code: String
    var note: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(code)
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .textSelection(.enabled)
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
            if let note {
                Text(note)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
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

#Preview {
    FullScreenCoverIsPresentedPage()
        .frame(width: 1100, height: 800)
}
