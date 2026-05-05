import SwiftUI

// SwiftUI `View/padding(_:_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/padding(_:_:).md
// macOS 10.15+. Edge.Set + optional CGFloat.

struct PaddingEdgesAmountPage: View {
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
            Text("View/padding(_:_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds an equal padding amount to specific edges of a view. Both parameters are optional \u{2014} omit them for default padding on all edges.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/padding(_:_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".padding([.bottom, .trailing], 20)")
            Text("Padded on the bottom and trailing edges.")
                .padding([.bottom, .trailing], 20)
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Edge.Set values").font(.headline).foregroundStyle(.primary)
                ForEach([
                    (".padding(.top, 20)", Edge.Set.top, CGFloat(20)),
                    (".padding(.bottom, 20)", .bottom, 20),
                    (".padding(.leading, 32)", .leading, 32),
                    (".padding(.trailing, 32)", .trailing, 32),
                    (".padding(.horizontal, 24)", .horizontal, 24),
                    (".padding(.vertical, 16)", .vertical, 16),
                    (".padding(.all, 12)", .all, 12)
                ], id: \.0) { label, edges, amount in
                    VStack(alignment: .leading, spacing: 4) {
                        APICallout(label)
                        Text("Content")
                            .padding(edges, amount)
                            .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 4))
                            .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))
                    }
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Combined edges via OptionSet").font(.headline).foregroundStyle(.primary)
                APICallout(".padding([.top, .leading], 16)")
                Text("Top + leading only")
                    .padding([.top, .leading], 16)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Defaults \u{2014} no length").font(.headline).foregroundStyle(.primary)
                APICallout(".padding(.horizontal)  // platform-default amount")
                Text("Default horizontal padding")
                    .padding(.horizontal)
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Defaults \u{2014} no edges").font(.headline).foregroundStyle(.primary)
                APICallout(".padding()  // .all + system default")
                Text("Default all-edge padding")
                    .padding()
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Edge.Set is an OptionSet \u{2014} combine cases with array literal syntax: [.top, .trailing].", systemImage: "square.grid.2x2")
                .font(.callout).foregroundStyle(.secondary)
            Label(".horizontal = [.leading, .trailing]; .vertical = [.top, .bottom]; .all = [.top, .bottom, .leading, .trailing].", systemImage: "rectangle.split.2x1")
                .font(.callout).foregroundStyle(.secondary)
            Label("Setting length to nil (or omitting it) yields a platform-appropriate default \u{2014} on macOS that's typically the same value padding(_:) uses without arguments.", systemImage: "ruler")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    PaddingEdgesAmountPage().frame(width: 900, height: 700)
}
