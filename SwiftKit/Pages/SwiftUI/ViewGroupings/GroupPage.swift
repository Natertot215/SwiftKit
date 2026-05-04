import SwiftUI

// SwiftUI Group, GroupBox, Section, Form, ControlGroup reference page.
// Source: Documentation/SwiftUI/view-groupings/group.md
// macOS 10.15+

struct GroupPage: View {
    var body: some View {
        GalleryPageScaffold {
            VStack(alignment: .leading, spacing: 6) {
                Text("Group / GroupBox / Section / Form / ControlGroup")
                    .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
                Text("Container types that group views for structural, visual, or semantic purposes without imposing layout of their own (Group) or with system-styled chrome (GroupBox, Section, Form).")
                    .font(.callout).foregroundStyle(.secondary)
                Text("Documentation/SwiftUI/view-groupings/ · macOS 10.15+")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
            }
        } defaultRender: {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Group — transparent container").font(.headline).foregroundStyle(.primary)
                    APICallout("Group { Text(…); Text(…) }.foregroundStyle(.secondary)")
                    Group {
                        Text("First item in the group")
                        Text("Second item in the group")
                        Text("Third item in the group")
                    }
                    .foregroundStyle(.secondary)
                    .font(.callout)
                    Text("Group applies modifiers to all children simultaneously without adding a VStack layout.")
                        .font(.caption).foregroundStyle(.tertiary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("GroupBox").font(.headline).foregroundStyle(.primary)
                    APICallout("GroupBox(label: Label(\"Settings\", systemImage: \"gear\")) { … }")
                    GroupBox(label: Label("Connection", systemImage: "wifi")) {
                        VStack(alignment: .leading, spacing: 6) {
                            LabeledContent("Status", value: "Connected")
                            LabeledContent("Network", value: "SwiftKit-HQ")
                            LabeledContent("IP", value: "192.168.1.42")
                        }
                        .font(.callout)
                    }
                }
            }
        } variants: {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Section").font(.headline).foregroundStyle(.primary)
                    APICallout("Section(\"Header\") { … } footer: { … }")
                    List {
                        Section("Favorites") {
                            Label("Swift", systemImage: "swift")
                            Label("SwiftUI", systemImage: "square.3.layers.3d")
                        }
                        Section("Recents") {
                            Label("Xcode", systemImage: "hammer")
                        }
                    }
                    .listStyle(.inset)
                    .frame(height: 160)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Form").font(.headline).foregroundStyle(.primary)
                    APICallout("Form { Section(\"Account\") { TextField…; Toggle… } }")
                    Form {
                        Section("Account") {
                            LabeledContent("Name") {
                                Text("Nathan Taichman")
                                    .foregroundStyle(.secondary)
                            }
                            LabeledContent("Plan") {
                                Text("Pro")
                                    .foregroundStyle(.secondary)
                            }
                        }
                        Section("Preferences") {
                            Toggle("Enable notifications", isOn: .constant(true))
                            Toggle("Dark mode", isOn: .constant(false))
                        }
                    }
                    .formStyle(.grouped)
                    .frame(height: 220)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("ControlGroup").font(.headline).foregroundStyle(.primary)
                    APICallout("ControlGroup { Button(…); Button(…); Button(…) }")
                    ControlGroup {
                        Button(action: {}) { Label("Cut", systemImage: "scissors") }
                        Button(action: {}) { Label("Copy", systemImage: "doc.on.doc") }
                        Button(action: {}) { Label("Paste", systemImage: "doc.on.clipboard") }
                    }
                    .controlGroupStyle(.compactMenu)
                }
            }
        } states: {
            VStack(alignment: .leading, spacing: 8) {
                Text("GroupBox without label").font(.headline).foregroundStyle(.primary)
                APICallout("GroupBox { … }  // no label — just the rounded bordered container")
                GroupBox {
                    Text("GroupBox provides a rounded, bordered container with system padding. On macOS it uses the grouped appearance.")
                        .font(.callout).foregroundStyle(.secondary)
                }
            }
        } notes: {
            VStack(alignment: .leading, spacing: 12) {
                Label("Group does not affect layout — it's a ViewBuilder workaround for the 10-child limit and modifier application.", systemImage: "square.dashed")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Form automatically picks the appropriate style (.automatic → .grouped on macOS).", systemImage: "list.bullet.rectangle")
                    .font(.callout).foregroundStyle(.secondary)
                Label("Section inside Form adds labeled separators. Section inside List adds section headers/footers.", systemImage: "text.insert")
                    .font(.callout).foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    GroupPage().frame(width: 900, height: 1000)
}
