import SwiftUI

// SwiftUI LabeledContent reference page.
// Source: Documentation/SwiftUI/view-groupings/labeledcontent.md
// macOS 13.0+

struct LabeledContentPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("LabeledContent")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("A view that pairs a label with related content, following platform conventions for label alignment and styling.")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/view-groupings/labeledcontent.md · macOS 13.0+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 8) {
                APICallout("LabeledContent(\"Version\", value: \"1.0.0\")")
                Form {
                    LabeledContent("Version", value: "1.0.0")
                    LabeledContent("Build", value: "2026.1")
                    LabeledContent("Platform", value: "macOS 26")
                    LabeledContent("Language", value: "Swift 6")
                }
                .formStyle(.grouped)
                .frame(height: 180)
            }
        } variants: {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("With custom content view").font(.headline).foregroundStyle(.primary)
                    APICallout("LabeledContent(\"Status\") { StatusBadge() }")
                    Form {
                        LabeledContent("Status") {
                            Text("Online")
                                .font(.callout).fontWeight(.medium)
                                .padding(.horizontal, 8).padding(.vertical, 3)
                                .background(.green.opacity(0.2), in: Capsule())
                                .foregroundStyle(.green)
                        }
                        LabeledContent("Sync") {
                            HStack(spacing: 4) {
                                Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                                Text("Up to date")
                                    .foregroundStyle(.secondary)
                            }
                            .font(.callout)
                        }
                    }
                    .formStyle(.grouped)
                    .frame(height: 130)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("With Label for the label parameter").font(.headline).foregroundStyle(.primary)
                    APICallout("LabeledContent { value } label: { Label(\"Name\", systemImage: \"person\") }")
                    Form {
                        LabeledContent {
                            Text("Nathan Taichman").foregroundStyle(.primary)
                        } label: {
                            Label("Author", systemImage: "person.fill")
                        }
                        LabeledContent {
                            Text("SwiftKit").foregroundStyle(.primary)
                        } label: {
                            Label("Project", systemImage: "hammer.fill")
                        }
                    }
                    .formStyle(.grouped)
                    .frame(height: 130)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Standalone (outside Form)").font(.headline).foregroundStyle(.primary)
                    APICallout("LabeledContent(\"Disk\", value: \"89.4 GB free\")")
                    VStack(alignment: .leading, spacing: 6) {
                        LabeledContent("Memory", value: "16 GB")
                        LabeledContent("Disk", value: "89.4 GB free")
                        LabeledContent("CPU", value: "Apple M4 Pro")
                    }
                    .font(.callout)
                    .padding()
                    .background(.fill.tertiary, in: RoundedRectangle(cornerRadius: 8))
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("labelsVisibility(_:) affect on LabeledContent").font(.headline).foregroundStyle(.primary)
                APICallout(".labelsHidden()  or  .labelsVisibility(.hidden)")
                Text("Applying .labelsHidden() to a Form or container hides all LabeledContent labels. The content view remains visible.")
                    .font(.callout).foregroundStyle(.secondary)
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("LabeledContent adapts its layout to the container — Form aligns labels on a trailing/leading grid; standalone stacks them differently.", systemImage: "square.grid.2x2")
                    .font(.callout).foregroundStyle(.secondary)
                Label("The value: String initializer formats using Text with .foregroundStyle(.secondary) by default.", systemImage: "textformat")
                    .font(.callout).foregroundStyle(.secondary)
                Label("LabeledContentStyle can be applied with .labeledContentStyle(_:) to override the default layout.", systemImage: "paintbrush")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    LabeledContentPage().frame(width: 900, height: 900)
}
