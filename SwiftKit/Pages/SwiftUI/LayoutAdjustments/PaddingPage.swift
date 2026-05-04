import SwiftUI

// SwiftUI padding modifiers reference page.
// Source: Documentation/SwiftUI/layout-adjustments/padding.md
// macOS 10.15+

struct PaddingPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("padding / safeAreaPadding / scenePadding")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Add insets around a view's content. padding() adds layout margins; safeAreaPadding() adds space inside the safe area; scenePadding() uses scene-appropriate margins.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/layout-adjustments/ · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("padding(_:) — uniform padding").font(.headline).foregroundStyle(.primary)
                    APICallout(".padding(16)")
                    paddingDemo("Content") { $0.padding(16) }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("padding(_:_:) — edges and amount").font(.headline).foregroundStyle(.primary)
                    APICallout(".padding(.horizontal, 24)")
                    paddingDemo("Content") { $0.padding(.horizontal, 24) }
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Edge set variants").font(.headline).foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach([
                            (".padding(.top, 20)", Edge.Set.top, CGFloat(20)),
                            (".padding(.bottom, 20)", .bottom, 20),
                            (".padding(.leading, 32)", .leading, 32),
                            (".padding(.trailing, 32)", .trailing, 32)
                        ], id: \.0) { label, edges, amount in
                            VStack(alignment: .leading, spacing: 4) {
                                APICallout(label)
                                Text("Content")
                                    .foregroundStyle(.primary)
                                    .padding(edges, amount)
                                    .background(.tint.opacity(0.15))
                                    .overlay(RoundedRectangle(cornerRadius: 4).strokeBorder(.separator, lineWidth: 1))
                            }
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("safeAreaPadding(_:)").font(.headline).foregroundStyle(.primary)
                    APICallout(".safeAreaPadding(.bottom, 40)")
                    Text("Adds inset within the safe area. Useful when placing fixed elements at the window edge and needing content to not slide under them.")
                        .font(.callout).foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("scenePadding").font(.headline).foregroundStyle(.primary)
                    APICallout(".scenePadding(.minimum)")
                    Text("Applies the platform's recommended minimum scene margin — adapts to window chrome width. ScenePadding enum: .minimum, .navigationTitle.")
                        .font(.callout).foregroundStyle(.secondary)
                    APICallout("ScenePadding.minimum  //  .navigationTitle")
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 12) {
                Text("Default system padding").font(.headline).foregroundStyle(.primary)
                APICallout(".padding()  // system default — 16pt on most macOS contexts")
                paddingDemo("System default padding") { $0.padding() }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label(".padding() with no arguments uses the system default (16pt on macOS).", systemImage: "ruler")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Edge.Set supports set algebra: .horizontal = [.leading, .trailing]; .vertical = [.top, .bottom].", systemImage: "square.split.2x1")
                    .font(.callout).foregroundStyle(.secondary)
                Label("safeAreaPadding does not move the safe area boundary — it just pads inside it.", systemImage: "arrow.down.forward.and.arrow.up.backward")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }

    private func paddingDemo<V: View>(_ label: String, modify: (Text) -> V) -> some View {
        modify(
            Text(label)
                .foregroundStyle(.primary)
        )
        .background(.tint.opacity(0.15))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .strokeBorder(.tint.opacity(0.4), lineWidth: 1)
        )
    }
}

#Preview {
    PaddingPage().frame(width: 900, height: 800)
}
