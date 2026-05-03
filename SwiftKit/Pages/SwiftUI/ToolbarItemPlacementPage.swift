import SwiftUI

// SwiftUI `ToolbarItemPlacement` reference page.
// Source: Documentation/SwiftUI/toolbars/toolbaritemplacement.md
// macOS 11.0+. Semantic placements available on macOS:
// .automatic, .principal, .navigation, .primaryAction, .secondaryAction,
// .confirmationAction, .cancellationAction, .destructiveAction, .status.
// Positional iOS-only cases (.topBarLeading, .topBarTrailing, .bottomBar,
// .bottomOrnament, .keyboard, .accessoryBar) are noted but not demoed.

private let demoFrameWidth: CGFloat = 480
private let demoFrameHeight: CGFloat = 200

struct ToolbarItemPlacementPage: View {
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
            Text("ToolbarItemPlacement")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Defines where in the toolbar an item appears. Semantic placements (intent) flex per platform; positional placements pin to a specific edge.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/toolbars/toolbaritemplacement.md \u{00b7} macOS 11.0+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        DemoFrame(api: "ToolbarItem(placement: .automatic) { Button \u{2026} }") {
            NavigationStack {
                Text(".automatic \u{2014} system picks the slot")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar {
                        ToolbarItem(placement: .automatic) {
                            Button { } label: { Label("Add", systemImage: "plus") }
                        }
                    }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            placementBlock(title: ".primaryAction \u{2014} the headline action",
                           api: ".primaryAction",
                           note: "Trailing on macOS; the action that drives the screen.") {
                NavigationStack {
                    Text("Primary action")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                Button { } label: { Label("Add", systemImage: "plus") }
                            }
                        }
                }
            }

            placementBlock(title: ".secondaryAction \u{2014} supporting actions",
                           api: ".secondaryAction",
                           note: "Lower-priority actions; on macOS often clustered near the primary action.") {
                NavigationStack {
                    Text("Secondary action")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .secondaryAction) {
                                Button { } label: { Label("Tag", systemImage: "tag") }
                            }
                        }
                }
            }

            placementBlock(title: ".navigation \u{2014} navigation chrome",
                           api: ".navigation",
                           note: "Back/forward, sidebar toggle \u{2014} controls that operate on the current navigation stack.") {
                NavigationStack {
                    Text("Navigation slot")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .navigation) {
                                Button { } label: { Image(systemName: "sidebar.left") }
                            }
                        }
                }
            }

            placementBlock(title: ".principal \u{2014} the centered, identity slot",
                           api: ".principal",
                           note: "Custom centered title content. macOS centers it in the toolbar; iOS centers it in the navigation bar.") {
                NavigationStack {
                    Text("Principal slot")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("Custom Principal").font(.headline)
                            }
                        }
                }
            }

            placementBlock(title: ".confirmationAction \u{2014} commits work",
                           api: ".confirmationAction",
                           note: "Standard \"Done\" / \"Save\". On macOS, the system styles this as the default button.") {
                NavigationStack {
                    Text("Confirm slot")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") { }
                            }
                        }
                }
            }

            placementBlock(title: ".cancellationAction \u{2014} dismisses without committing",
                           api: ".cancellationAction",
                           note: "Standard \"Cancel\". Paired with .confirmationAction in dialogs/sheets.") {
                NavigationStack {
                    Text("Cancel slot")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") { }
                            }
                        }
                }
            }

            placementBlock(title: ".destructiveAction \u{2014} dangerous action",
                           api: ".destructiveAction",
                           note: "Delete / discard. Pair with role: .destructive on the Button.") {
                NavigationStack {
                    Text("Destructive slot")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .destructiveAction) {
                                Button(role: .destructive) { } label: { Label("Delete", systemImage: "trash") }
                            }
                        }
                }
            }

            placementBlock(title: ".status \u{2014} ambient status info",
                           api: ".status",
                           note: "Non-actionable status (sync indicator, count, etc.). Centered on macOS.") {
                NavigationStack {
                    Text("Status slot")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .status) {
                                Text("Synced")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                }
            }

            placementBlock(title: ".automatic \u{2014} let the system pick",
                           api: ".automatic",
                           note: "Default if you don't supply a placement. Treated as .secondaryAction-ish on macOS.") {
                NavigationStack {
                    Text("Automatic slot")
                        .font(.caption).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .automatic) {
                                Button { } label: { Label("Action", systemImage: "ellipsis.circle") }
                            }
                        }
                }
            }
        }
    }

    private func placementBlock<Content: View>(title: String, api: String, note: String, @ViewBuilder content: @escaping () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(note)
                .font(.footnote)
                .foregroundStyle(.secondary)
            DemoFrame(api: api) { content() }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            VariantBlock(title: "Multiple placements together \u{2014} navigation + principal + primary") {
                DemoFrame(api: ".navigation \u{00b7} .principal \u{00b7} .primaryAction") {
                    NavigationStack {
                        Text("Three regions populated")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbar {
                                ToolbarItem(placement: .navigation) {
                                    Button { } label: { Image(systemName: "sidebar.left") }
                                }
                                ToolbarItem(placement: .principal) {
                                    Text("Centered title").font(.headline)
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }
            }
        }
    }

    private struct PNote {
        let title: String
        let detail: String
        let symbol: String
    }

    private let notes: [PNote] = [
        .init(title: "Two families: semantic vs positional.",
              detail: "Semantic (.primaryAction, .principal, .navigation, .status, .confirmationAction, etc.) describes intent; SwiftUI maps to the right slot per platform. Positional (.topBarLeading, .topBarTrailing, .bottomBar, .bottomOrnament, .keyboard, .accessoryBar) pins to a specific UI region \u{2014} mostly iOS/iPadOS.",
              symbol: "rectangle.split.3x1"),
        .init(title: "macOS-relevant placements rendered above.",
              detail: ".automatic, .primaryAction, .secondaryAction, .navigation, .principal, .confirmationAction, .cancellationAction, .destructiveAction, .status. The positional cases compile on macOS but typically fall back to a default slot.",
              symbol: "macwindow"),
        .init(title: "Type properties for titles \u{2014} .title, .subtitle, .largeTitle, .largeSubtitle.",
              detail: "These are also part of ToolbarItemPlacement and are used by NavigationStack to position the title/subtitle. On macOS the title rendering is owned by the window chrome; setting these has limited effect.",
              symbol: "textformat"),
        .init(title: "Deprecated init(id:) and .navigationBarLeading/Trailing.",
              detail: "Old positional init taking just an id and the .navigationBarLeading / .navigationBarTrailing accessors are deprecated. Use semantic placements or the modern .topBarLeading / .topBarTrailing.",
              symbol: "exclamationmark.triangle"),
        .init(title: "Overflow follows priority.",
              detail: "When space runs out, items fall into a system overflow menu. Semantic placements give the system better hints for what to keep visible vs what to spill.",
              symbol: "ellipsis.circle")
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
    ToolbarItemPlacementPage()
        .frame(width: 1100, height: 1400)
    }
