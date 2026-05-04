import SwiftUI

// SwiftUI Transaction bundle.
// Covers:
//   Transaction                           — a value carrying animation context
//   TransactionKey                        — protocol for custom transaction values
//   View/transaction(_:)                  — reads/modifies the transaction for a subtree
//   View/transaction(value:_:)            — applies modifier when value changes
//   View/transaction(_:body:)             — closure form (macOS 14+)
//   withTransaction(_:_:)                 — imperative transaction mutation
//   withTransaction(_:_:_:)              — with key path
// Source: Documentation/SwiftUI/animations/transaction*.md
// macOS 10.15+

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 160

struct TransactionPage: View {
    @State private var expanded = false
    @State private var valueTriggered = false
    @State private var imperative = false

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
            Text("Transaction")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A value that carries animation context through the view tree. Transaction lets you override, inspect, or extend animation behavior for a subtree without changing call sites.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/animations/transaction.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: ".transaction { $0.animation = .spring }") {
            VStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.tint)
                    .frame(width: expanded ? 280 : 80, height: 48)
                    .transaction { $0.animation = .spring(duration: 0.5, bounce: 0.4) }
                Button(expanded ? "Collapse" : "Expand") {
                    expanded.toggle()
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "View/transaction(value:_:) \u{2014} fires modifier when value changes") {
                DemoFrame(api: ".transaction(value: flag) { $0.animation = flag ? .bouncy : nil }") {
                    VStack(spacing: 12) {
                        Circle()
                            .fill(valueTriggered ? Color.green : Color.accentColor)
                            .frame(width: 50, height: 50)
                            .transaction(value: valueTriggered) { t in
                                t.animation = valueTriggered ? .bouncy : .easeOut
                            }
                        Button("Toggle value") { valueTriggered.toggle() }
                            .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "withTransaction(_:_:) \u{2014} imperative transaction mutation") {
                DemoFrame(api: "withTransaction(Transaction(animation: .linear)) { state.toggle() }") {
                    VStack(spacing: 12) {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.tint)
                            .frame(width: imperative ? 240 : 80, height: 40)
                        Button("withTransaction") {
                            var t = Transaction(animation: .linear(duration: 0.6))
                            t.disablesAnimations = false
                            withTransaction(t) { imperative.toggle() }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }

            VariantBlock(title: "TransactionKey \u{2014} custom values on Transaction") {
                DemoFrame(api: "struct MyKey: TransactionKey { static let defaultValue = false }") {
                    VStack(spacing: 8) {
                        Text("TransactionKey lets you attach custom data to a Transaction \u{2014} similar to EnvironmentKey but propagated through animation updates. Read with transaction[MyKey.self].")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            VariantBlock(title: "transaction.disablesAnimations \u{2014} suppress animations in a subtree") {
                DemoFrame(api: ".transaction { $0.disablesAnimations = true }") {
                    VStack(spacing: 8) {
                        Text("Setting disablesAnimations = true on a transaction prevents animations from propagating into that subtree. Useful for suppressing unwanted animations from a parent context in a specific region.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }

    private struct NoteItem {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [NoteItem] = [
        .init(title: "Transaction carries the animation context propagated through the view hierarchy.",
              detail: "When withAnimation is called, SwiftUI creates a Transaction carrying the animation and propagates it through all state changes in that call. .transaction { } lets a view intercept and override this before it reaches its subtree.",
              symbol: "arrow.down.to.line"),
        .init(title: ".transaction(_:) modifies every transaction that passes through.",
              detail: "It acts like a map: every transaction, regardless of its source, passes through the closure and can be modified. This is useful for permanently overriding animation behavior on a subtree.",
              symbol: "slider.horizontal.3"),
        .init(title: "withTransaction replaces withAnimation when you need fine control.",
              detail: "withAnimation is shorthand for creating a Transaction with an animation and calling withTransaction. Use withTransaction directly when you need to set custom TransactionKey values alongside the animation.",
              symbol: "wrench.and.screwdriver"),
        .init(title: "TransactionKey is like EnvironmentKey but for animation propagation.",
              detail: "Custom transaction keys persist through the animation update pass. They let you propagate side-channel signals (e.g., 'this animation was user-initiated') from the trigger site to the responding views.",
              symbol: "key")
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

private struct DemoFrame<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: demoFrameWidth, height: demoFrameHeight)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
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
    TransactionPage()
        .frame(width: 1100, height: 900)
}
