import SwiftUI

// SwiftUI `View/padding(_:)` reference page.
// Source: Documentation/SwiftUI/layout-adjustments/padding(_:).md
// macOS 10.15+. EdgeInsets variant.

struct PaddingInsetsPage: View {
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
            Text("View/padding(_:)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Adds a different padding amount to each edge of a view, supplied as an EdgeInsets value.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/layout-adjustments/padding(_:).md \u{00b7} macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 12) {
            APICallout(".padding(EdgeInsets(top: 10, leading: 20, bottom: 40, trailing: 0))")
            Text("Each edge inset independently.")
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 40, trailing: 0))
                .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
        }
    }

    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Asymmetric horizontal").font(.headline).foregroundStyle(.primary)
                APICallout(".padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 8))")
                Text("Heavier leading inset")
                    .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 8))
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Asymmetric vertical").font(.headline).foregroundStyle(.primary)
                APICallout(".padding(EdgeInsets(top: 24, leading: 0, bottom: 4, trailing: 0))")
                Text("Heavier top inset")
                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 4, trailing: 0))
                    .background(.tint.opacity(0.15), in: RoundedRectangle(cornerRadius: 6))
                    .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.tint.opacity(0.4), lineWidth: 1))
            }
        }
    }

    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Stored EdgeInsets value").font(.headline).foregroundStyle(.primary)
            APICallout("let insets = EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)\n.padding(insets)")
            Text("EdgeInsets is Equatable and Sendable \u{2014} store, mix, and pass around as a value.")
                .font(.callout).foregroundStyle(.secondary)
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Use this overload when each edge needs a distinct amount; reach for padding(_:_:) when one amount across one or more edges suffices.", systemImage: "rectangle.split.3x1")
                .font(.callout).foregroundStyle(.secondary)
            Label("Apply padding before .border or .background to make the chrome encompass the padded region.", systemImage: "square.dashed.inset.filled")
                .font(.callout).foregroundStyle(.secondary)
            Label("EdgeInsets honors layout direction \u{2014} leading/trailing flip in right-to-left locales.", systemImage: "arrow.left.arrow.right")
                .font(.callout).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    PaddingInsetsPage().frame(width: 900, height: 700)
}
