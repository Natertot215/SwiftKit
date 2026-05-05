import SwiftUI

// SwiftUI `View/backgroundStyle(_:)` reference page.
// Source: Documentation/SwiftUI/drawing-and-graphics/backgroundstyle(_:).md
// macOS 13.0+. Sets the EnvironmentValues.backgroundStyle for the subtree;
// inherited by .background(in: shape) and other system backgrounds.

struct BackgroundStylePage: View {
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
            Text("View/backgroundStyle(_:)")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Sets the backgroundStyle environment value used by .background(in:) and similar system backgrounds.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/drawing-and-graphics/backgroundstyle(_:).md · macOS 13.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "swift")
                .font(.largeTitle)
                .imageScale(.large)
                .padding(20)
                .background(in: Circle())
                .backgroundStyle(.blue.gradient)
            APICallout(".background(in: Circle()).backgroundStyle(.blue.gradient)")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            BSVariantRow(title: "Gradient backgrounds") {
                HStack(spacing: 16) {
                    sample.background(in: Circle()).backgroundStyle(.blue.gradient)
                    sample.background(in: Circle()).backgroundStyle(.purple.gradient)
                    sample.background(in: Circle()).backgroundStyle(.orange.gradient)
                }
            }

            BSVariantRow(title: "Material as background style") {
                HStack(spacing: 16) {
                    Image(systemName: "swift").font(.largeTitle).imageScale(.large).padding(20)
                        .background(in: RoundedRectangle(cornerRadius: 12))
                        .backgroundStyle(.regularMaterial)
                    Image(systemName: "swift").font(.largeTitle).imageScale(.large).padding(20)
                        .background(in: RoundedRectangle(cornerRadius: 12))
                        .backgroundStyle(.thinMaterial)
                    Image(systemName: "swift").font(.largeTitle).imageScale(.large).padding(20)
                        .background(in: RoundedRectangle(cornerRadius: 12))
                        .backgroundStyle(.ultraThickMaterial)
                }
                .padding(8)
                .background(LinearGradient(colors: [.indigo, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            BSVariantRow(title: "Plain Color") {
                HStack(spacing: 16) {
                    sample.background(in: Capsule()).backgroundStyle(Color.accentColor)
                    sample.background(in: Capsule()).backgroundStyle(.secondary)
                    sample.background(in: Capsule()).backgroundStyle(.tertiary)
                }
            }
        }
    }

    private var sample: some View {
        Image(systemName: "swift")
            .font(.title)
            .imageScale(.large)
            .padding(16)
    }

    @ViewBuilder
    private var statesContent: some View {
        BSVariantRow(title: "Restoring default — environment .backgroundStyle to nil") {
            HStack(spacing: 16) {
                sample.background(in: Circle()).backgroundStyle(.blue.gradient)
                sample.background(in: Circle()).backgroundStyle(.blue.gradient).environment(\.backgroundStyle, nil)
            }
            APICallout(".environment(\\.backgroundStyle, nil)")
        }
    }

    private let notes: [(title: String, detail: String, symbol: String)] = [
        ("Sets the backgroundStyle environment value.", "backgroundStyle(_:) writes EnvironmentValues.backgroundStyle. APIs like .background(in: shape) and grouped Form backgrounds read this value when filling.", "tray.full"),
        ("Pair with .background(in:) shape backgrounds.", "Apply .background(in: Circle()) (or any shape) to wrap content with a background; then use .backgroundStyle to specify what fills it.", "circle.dashed"),
        ("Restore default by setting environment to nil.", "Use .environment(\\.backgroundStyle, nil) to revert to the framework default for descendants.", "arrow.uturn.backward"),
        ("Generic over ShapeStyle.", "Accepts any ShapeStyle: Color, gradients (.blue.gradient, LinearGradient), materials (.regularMaterial), .tint, etc.", "function")
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

private struct BSVariantRow<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

#Preview {
    BackgroundStylePage()
        .frame(width: 1100, height: 1100)
}
