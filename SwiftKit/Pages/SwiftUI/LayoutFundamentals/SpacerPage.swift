import SwiftUI

// SwiftUI Spacer reference page.
// Source: Documentation/SwiftUI/layout-fundamentals/spacer.md
// macOS 10.15+

struct SpacerPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("Spacer")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("A flexible space that expands along the major axis of its containing stack, pushing sibling views apart.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-fundamentals/spacer.md · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("HStack { Text(\"Leading\"); Spacer(); Text(\"Trailing\") }")
                HStack {
                    Text("Leading")
                        .padding(.horizontal, 10).padding(.vertical, 6)
                        .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 6))
                        .foregroundStyle(.primary)
                    Spacer()
                    Text("Trailing")
                        .padding(.horizontal, 10).padding(.vertical, 6)
                        .background(.tint.opacity(0.2), in: RoundedRectangle(cornerRadius: 6))
                        .foregroundStyle(.tint)
                }
                .padding()
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Minimum length").font(.headline).foregroundStyle(.primary)
                    APICallout("Spacer(minLength: 40)")
                    HStack {
                        Text("Left")
                        Spacer(minLength: 40)
                        Text("Right (min 40pt gap)")
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Multiple Spacers — equal distribution").font(.headline).foregroundStyle(.primary)
                    APICallout("HStack { Text; Spacer(); Text; Spacer(); Text }")
                    HStack {
                        chip("Alpha")
                        Spacer()
                        chip("Beta")
                        Spacer()
                        chip("Gamma")
                    }
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("VStack with Spacer").font(.headline).foregroundStyle(.primary)
                    APICallout("VStack { Text; Spacer(); Text }")
                    VStack {
                        chip("Top")
                        Spacer()
                        chip("Bottom")
                    }
                    .frame(height: 100)
                    .padding()
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("Spacer responds to container width changes").font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Spacer has no visual representation; it's purely layout.", systemImage: "arrow.left.and.right.square")
                    .font(.callout).foregroundStyle(.secondary)
                Label("minLength defaults to 8pt. Set to 0 for no minimum gap.", systemImage: "ruler")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Outside a stack, Spacer fills the available space in both axes.", systemImage: "square.dashed")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func chip(_ label: String) -> some View {
        Text(label)
            .padding(.horizontal, 10).padding(.vertical, 4)
            .background(.tint.opacity(0.15), in: Capsule())
            .foregroundStyle(.tint)
            .font(.callout)
    }
}

#Preview {
    SpacerPage().frame(width: 900, height: 700)
}
