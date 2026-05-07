import SwiftUI

// Dense SwiftUI FullScreenCover gallery — consolidates the entire family:
//   View/fullScreenCover(isPresented:onDismiss:content:)
//   View/fullScreenCover(item:onDismiss:content:)
//
// iOS / iPadOS / tvOS / visionOS / watchOS only — NOT available on macOS.
// Documented as code-snippets only.
//
// Source docs:
//   Documentation/SwiftUI/modal-presentations/fullscreencover(ispresented:ondismiss:content:).md
//   Documentation/SwiftUI/modal-presentations/fullscreencover(item:ondismiss:content:).md

struct FullScreenCoverGalleryPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                headerSection
                isPresentedSection
                itemSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("FullScreenCover")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Presents a modal that covers as much of the screen as possible. iOS-leaning surface; on macOS the system maps to a sheet-style presentation. Two overloads: a Boolean binding for simple show/hide and an item binding for data-driven presentation.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Label("Not available on macOS \u{2014} use .sheet on macOS for the same modal pattern.", systemImage: "macwindow.badge.plus")
                .font(.caption)
                .foregroundStyle(.purple)
            Text("Documentation/SwiftUI/modal-presentations/  \u{00b7}  iOS 14+  \u{00b7}  unavailable on macOS")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text(".fullScreenCover(isPresented:onDismiss:content:)  \u{00b7}  .fullScreenCover(item:onDismiss:content:)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: .fullScreenCover(isPresented:) (absorbed from FullScreenCoverIsPresentedPage)

    private var isPresentedSection: some View {
        PageSection("View/fullScreenCover(isPresented:onDismiss:content:)",
                    subtitle: "Boolean-driven cover \u{00b7} iOS 14+ \u{00b7} unavailable on macOS") {
            VStack(alignment: .leading, spacing: 16) {
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

                FCBlock(title: "Minimal — no onDismiss") {
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

                FCBlock(title: "With onDismiss closure") {
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

                FCBlock(title: "Dismissing from inside the cover") {
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
    }

    // MARK: .fullScreenCover(item:) (absorbed from FullScreenCoverItemPage)

    private var itemSection: some View {
        PageSection("View/fullScreenCover(item:onDismiss:content:)",
                    subtitle: "Item-driven cover \u{00b7} iOS 14+ \u{00b7} unavailable on macOS") {
            VStack(alignment: .leading, spacing: 16) {
                FCSnippet(
                    api: ".fullScreenCover(item: $part) { part in CoverView(part:) }",
                    code: """
                    struct PartCoverExample: View {
                        @State private var part: Part?
                        var body: some View {
                            Button("Inspect part") {
                                part = .init(name: "Z-1234A")
                            }
                            .fullScreenCover(item: $part) { part in
                                VStack {
                                    Text(part.name).font(.title)
                                    Button("Close") { /* set part = nil */ }
                                }
                            }
                        }
                    }

                    struct Part: Identifiable {
                        let id = UUID()
                        let name: String
                    }
                    """,
                    note: "When `part` becomes non-nil, the cover appears with that value. Setting `part = nil` (or calling dismiss()) closes it."
                )

                FCBlock(title: "With onDismiss") {
                    FCSnippet(
                        api: ".fullScreenCover(item:onDismiss:content:)",
                        code: """
                        .fullScreenCover(item: $part, onDismiss: {
                            analytics.log("part_cover_closed")
                        }) { part in
                            PartDetailCover(part: part)
                        }
                        """,
                        note: "onDismiss runs after the binding flips back to nil."
                    )
                }

                FCBlock(title: "Replacing the item swaps the cover content") {
                    FCSnippet(
                        api: "Mutating the bound Optional with a different id triggers a swap.",
                        code: """
                        // Tapping a different row mutates `part`. SwiftUI dismisses
                        // the current cover and immediately re-presents with the
                        // new value, like .sheet(item:).
                        """,
                        note: "Same behavior as .sheet(item:) — Identifiable.id is the key."
                    )
                }
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
              detail: "Use .sheet on macOS — sheets there already use a window-attached modal style and are the right primitive for full-window modal content.",
              symbol: "macwindow.badge.plus"),
        .init(title: "No interactive (drag-to-dismiss) gesture.",
              detail: "Unlike .sheet on iOS, full-screen covers don't get a drag-to-dismiss gesture. Provide an explicit dismiss button.",
              symbol: "hand.raised"),
        .init(title: "Cover-vs-sheet adaptation in compact size classes.",
              detail: "On iPhone in landscape, .sheet may auto-adapt to cover. Use .presentationCompactAdaptation(_:) to override both directions.",
              symbol: "iphone.gen3.landscape"),
        .init(title: "Per-window cover, like sheets.",
              detail: "A full-screen cover is scoped to the window/scene that owns the presenting view; it does not cover other windows.",
              symbol: "rectangle.on.rectangle"),
        .init(title: "Item must conform to Identifiable.",
              detail: "Identity drives presentation: a non-nil item presents the cover; a nil item dismisses it; replacing with a different id swaps the content in place. Inside the closure the item is non-optional.",
              symbol: "barcode")
    ]

    private var notesSection: some View {
        PageSection("Notes", subtitle: "Key behaviors, availability, and constraints.") {
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
}

// MARK: - Page-local helpers

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
                Text(note).font(.footnote).foregroundStyle(.secondary)
            }
        }
    }
}

private struct FCBlock<Content: View>: View {
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

extension FullScreenCoverGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.modalPresentations.fullScreenCover",
        title: "FullScreenCover",
        folder: "Modal presentations",
        framework: .swiftUI,
        absorbedSymbols: [
            "View/fullScreenCover(isPresented:onDismiss:content:)",
            "View/fullScreenCover(item:onDismiss:content:)"
        ],
        blurb: "Presents a modal that covers as much of the screen as possible. iOS-leaning surface; on macOS the system maps it to a sheet-style presentation.",
        signature: "func fullScreenCover<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/modal-presentations/fullscreencover(ispresented:ondismiss:content:).md",
        page: { AnyView(FullScreenCoverGalleryPage()) }
    )
}

#Preview {
    FullScreenCoverGalleryPage()
        .frame(width: 1100, height: 1200)
}
