import SwiftUI
import Combine

// SwiftUI `SubscriptionView` reference page.
// Source: Documentation/SwiftUI/view-fundamentals/subscriptionview.md
// Combine subscriber wrapper. The .onReceive modifier covers most use cases;
// SubscriptionView is the underlying primitive.

struct SubscriptionViewGalleryPage: View {
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
            Text("SubscriptionView")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A view that subscribes to a publisher with an action.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-fundamentals/subscriptionview.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        Block(title: "Wraps a Combine subscription in a View") {
            snippet("""
            SubscriptionView(content: Text(\"Listening\u{2026}\"),
                             publisher: clock.tickPublisher) { tick in
                handle(tick)
            }
            """)
            APICallout("SubscriptionView(content:publisher:action:)")
            Text("Renders content while subscribed to publisher. The action fires for each value the publisher emits.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Idiomatic alternative \u{2014} .onReceive") {
                snippet("""
                Text(\"Listening\u{2026}\")
                    .onReceive(clock.tickPublisher) { tick in
                        handle(tick)
                    }
                """)
                Text("In modern code, prefer .onReceive(_:perform:). It's the same primitive in modifier form and reads more naturally in a chain.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Subscribe to a Subject") {
                snippet("""
                let subject = PassthroughSubject<String, Never>()

                Text(\"Status\")
                    .onReceive(subject) { message in
                        status = message
                    }
                """)
                Text("Any Combine publisher works. PassthroughSubject and CurrentValueSubject are common bridges from non-SwiftUI code.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Lifetime") {
                snippet("""
                // Subscribed when the view is in the hierarchy,
                // unsubscribed automatically when removed.
                if listening {
                    Text(\"Listening\")
                        .onReceive(publisher) { handle($0) }
                }
                """)
                Text("Both SubscriptionView and .onReceive subscribe on insertion and cancel on removal. No manual disposal required.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Block(title: "Failure type must be Never") {
                snippet("""
                // Publisher.Failure must be Never. Use .replaceError or
                // .catch upstream to erase failure when needed.
                """)
                Text("SwiftUI's subscription primitives only accept publishers whose Failure is Never. Handle errors with .replaceError(\u{2026}) or .catch(\u{2026}) before binding.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private struct Note {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [Note] = [
        .init(title: "The underlying primitive for Combine \u{2192} SwiftUI.",
              detail: "SubscriptionView is the View that owns a Combine subscription. .onReceive(_:perform:) is the modifier form most code uses today.",
              symbol: "antenna.radiowaves.left.and.right"),
        .init(title: "Subscription tracks view lifetime.",
              detail: "Subscribed on view insertion, cancelled on view removal. No manual AnyCancellable to manage \u{2014} that's the value over a free-floating Combine sink.",
              symbol: "rectangle.dashed"),
        .init(title: "Failure must be Never.",
              detail: "SwiftUI's Combine bridges only accept non-failing publishers. Use .replaceError(_:) / .catch(_:) / .map(\u{2026}) upstream to discharge failure.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Modern alternative: AsyncSequence + .task.",
              detail: "For async/await code, .task { for await value in stream { \u{2026} } } is often a better fit than Combine. Pick the tool that matches the source.",
              symbol: "clock"),
        .init(title: "@frozen, generic over (PublisherType, Content).",
              detail: "Type: SubscriptionView<PublisherType: Publisher, Content: View> where PublisherType.Failure == Never. Frozen for ABI stability.",
              symbol: "lock")
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

    private func snippet(_ code: String) -> some View {
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
    }
}

private struct Block<Content: View>: View {
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

extension SubscriptionViewGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.viewFundamentals.subscriptionView",
        title: "SubscriptionView",
        folder: "View fundamentals",
        framework: .swiftUI,
        absorbedSymbols: ["SubscriptionView"],
        blurb: "A view that subscribes to a Combine publisher and runs an action whenever a value is emitted. The publisher's Failure type must be Never.",
        signature: "@frozen struct SubscriptionView<PublisherType, Content> where PublisherType : Publisher, Content : View, PublisherType.Failure == Never",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/view-fundamentals/subscriptionview.md",
        page: { AnyView(SubscriptionViewGalleryPage()) }
    )
}

#Preview {
    SubscriptionViewGalleryPage()
        .frame(width: 1100, height: 800)
}
