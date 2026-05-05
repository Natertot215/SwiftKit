import SwiftUI

// SwiftUI `.sensoryFeedback(_:trigger:)`, `.sensoryFeedback(trigger:_:)`,
// and `.sensoryFeedback(_:trigger:condition:)` reference page.
// Plays haptic / audio feedback when the trigger value changes. macOS 14.0+.
//
// Note: on macOS, haptic output depends on hardware (Force Touch trackpad on
// supported MacBook Pros). The modifier itself is supported on macOS 14+;
// the visible state in this page is the SwiftUI binding change. Any audible
// or tactile output is hardware-dependent and may be silent on iMacs / Mac
// minis without a Magic Trackpad.

struct SensoryFeedbackModifiersPage: View {
    @State private var likeCount = 0
    @State private var pickerSelection = 0
    @State private var tabSelection = 0
    @State private var conditionalToggle = false

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
            Text("View/sensoryFeedback (3 overloads)")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Plays haptic and/or audio feedback when a trigger value changes. The closure form returns a SensoryFeedback to play conditionally; the condition: form gates playback by old/new comparison.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/sensoryfeedback(_:trigger:).md \u{00b7} macOS 14.0+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        SFCard(api: ".sensoryFeedback(.success, trigger: count)") {
            VStack(alignment: .leading, spacing: 8) {
                Button("Like (count: \(likeCount))") { likeCount += 1 }
                    .sensoryFeedback(.success, trigger: likeCount)
                Text("On macOS, haptic plays only on Force Touch trackpads.")
                    .font(.caption).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            SFVariant(title: "sensoryFeedback(_:trigger:) \u{2014} simple form") {
                SFCard(api: ".sensoryFeedback(.selection, trigger: pickerSelection)") {
                    VStack(alignment: .leading, spacing: 8) {
                        Picker("Item", selection: $pickerSelection) {
                            Text("One").tag(0)
                            Text("Two").tag(1)
                            Text("Three").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .sensoryFeedback(.selection, trigger: pickerSelection)
                        Text("Selection: \(pickerSelection)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            SFVariant(title: "sensoryFeedback(trigger:_:) \u{2014} closure form") {
                SFCard(api: ".sensoryFeedback(trigger: tab) { tab == 2 ? .impact : .selection }") {
                    VStack(alignment: .leading, spacing: 8) {
                        Picker("Tab", selection: $tabSelection) {
                            Text("Home").tag(0)
                            Text("Search").tag(1)
                            Text("Profile").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .sensoryFeedback(trigger: tabSelection) { _, newValue in
                            newValue == 2 ? .impact : .selection
                        }
                        Text("Profile tab plays .impact; others play .selection.")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }

            SFVariant(title: "sensoryFeedback(_:trigger:condition:) \u{2014} gated form") {
                SFCard(api: ".sensoryFeedback(.warning, trigger: count) { _, n in n % 5 == 0 }") {
                    VStack(alignment: .leading, spacing: 8) {
                        Button("Increment (\(likeCount))") { likeCount += 1 }
                            .sensoryFeedback(.warning, trigger: likeCount) { _, newValue in
                                newValue % 5 == 0
                            }
                        Text("Plays .warning every 5th tap (when count is a multiple of 5).")
                            .font(.caption).foregroundStyle(.secondary)
                    }
                }
            }

            SFVariant(title: "Common SensoryFeedback values") {
                SFCard(api: ".success / .warning / .error / .selection / .impact / .start / .stop") {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(".success     \u{2014} task completed")
                        Text(".warning     \u{2014} non-fatal alert")
                        Text(".error       \u{2014} action failed")
                        Text(".selection   \u{2014} value changed")
                        Text(".increase / .decrease \u{2014} stepped changes")
                        Text(".start / .stop \u{2014} activity boundaries")
                        Text(".impact      \u{2014} physical metaphor")
                    }
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            SFVariant(title: "Toggle-driven trigger") {
                SFCard(api: "Toggle(...).sensoryFeedback(.success, trigger: isOn)") {
                    Toggle("Enabled", isOn: $conditionalToggle)
                        .sensoryFeedback(.success, trigger: conditionalToggle)
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowSF(symbol: "macbook", title: "macOS haptic output requires Force Touch hardware.",
                      detail: "On a MacBook Pro with Force Touch trackpad (or a Magic Trackpad 2+), SwiftUI dispatches NSHapticFeedbackManager events. On iMacs / Mac minis without supported hardware, the modifier is silent. Audio cues for some feedback types may still play.")
            NoteRowSF(symbol: "function", title: "Three overloads cover progressively more control.",
                      detail: "(_:trigger:) is one feedback per change. (trigger:_:) lets the closure pick (or skip) feedback. (_:trigger:condition:) gates playback by an old/new closure \u{2014} useful when only some transitions should fire.")
            NoteRowSF(symbol: "info.circle", title: "Trigger value must be Equatable.",
                      detail: "SwiftUI watches for !=. The same SensoryFeedback re-fires on each change. Use .onChange(of:) instead if you need to inspect old/new values for non-feedback work.")
        }
    }
}

private struct SFCard<Content: View>: View {
    let api: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .padding(12)
                .frame(minWidth: 320, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct SFVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowSF: View {
    let symbol: String
    let title: String
    let detail: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol).font(.headline).foregroundStyle(.primary)
            Text(detail).font(.callout).foregroundStyle(.secondary).padding(.leading, 24)
        }
    }
}

#Preview {
    SensoryFeedbackModifiersPage().frame(width: 900, height: 1000)
}
