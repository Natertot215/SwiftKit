import SwiftUI

// SwiftUI accessibility descriptions reference page.
// Covers: accessibilityLabel, accessibilityHint, accessibilityValue, accessibilityAddTraits,
//         accessibilityRemoveTraits, AccessibilityTraits, accessibilityHeading, AccessibilityHeadingLevel,
//         accessibilityInputLabels, accessibilityTextContentType, AccessibilityTextContentType,
//         accessibilityLabeledPair, AccessibilityLabeledPairRole, speechAdjustedPitch,
//         speechAlwaysIncludesPunctuation, speechAnnouncementsQueued, speechSpellsOutCharacters

struct AccessibilityDescriptionsPage: View {
    @State private var sliderValue: Double = 0.5
    @State private var toggleOn = false

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
            Text("Accessibility Descriptions")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Label, hint, value, traits, heading, speech — building VoiceOver-compatible views.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "accessibilityLabel + accessibilityHint + accessibilityValue") {
            VStack(alignment: .leading, spacing: 16) {
                // Custom icon button with label and hint
                Button {
                    toggleOn.toggle()
                } label: {
                    Image(systemName: toggleOn ? "bell.fill" : "bell.slash")
                        .font(.title2)
                        .foregroundStyle(toggleOn ? .primary : .secondary)
                }
                .accessibilityLabel(toggleOn ? "Notifications on" : "Notifications off")
                .accessibilityHint("Double-tap to toggle notification alerts")
                .accessibilityValue(toggleOn ? "On" : "Off")
                .buttonStyle(.plain)

                // Slider with custom value announcement
                VStack(alignment: .leading, spacing: 6) {
                    Text("Volume").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $sliderValue)
                        .accessibilityLabel("Volume")
                        .accessibilityValue("\(Int(sliderValue * 100)) percent")
                }
            }
            APICallout(".accessibilityLabel(…)\n.accessibilityHint(…)\n.accessibilityValue(…)")
            Text("VoiceOver reads: label → value → hint. Keep labels short (1–3 words), hints in imperative form.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "accessibilityLabel(_:isEnabled:) — conditional labeling") {
                snippet("""
                image.accessibilityLabel("Profile photo", isEnabled: isLoaded)
                // When isEnabled is false, VoiceOver uses the default label.
                """)
            }

            Block(title: "accessibilityLabel(content:) — view as label") {
                snippet("""
                icon.accessibilityLabel {
                    Text("Star rating")
                    Text("\\(rating) out of 5")
                }
                // Composes multiple Text views into a single spoken label.
                """)
            }

            Block(title: "accessibilityAddTraits + accessibilityRemoveTraits + AccessibilityTraits") {
                snippet("""
                Text("Section Header")
                    .accessibilityAddTraits(.isHeader)

                customButton.accessibilityAddTraits(.isButton)
                customButton.accessibilityRemoveTraits(.isStaticText)

                // AccessibilityTraits values:
                // .isButton, .isHeader, .isLink, .isImage
                // .isSelected, .isEnabled (cannot remove), .isNotEnabled
                // .startsMediaSession, .allowsDirectInteraction
                // .updatesFrequently, .causesPageTurn, .isModal
                // .isToggle, .isSearchField, .isSummaryElement
                // .playsSound, .isKeyboardKey
                """)
                Text("Traits communicate semantic role to AT. Always remove traits that don't apply and add ones that do.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityHeading + AccessibilityHeadingLevel") {
                snippet("""
                Text("Introduction").accessibilityHeading(.h1)
                Text("Background").accessibilityHeading(.h2)
                Text("Details").accessibilityHeading(.h3)
                // Levels: .h1 … .h6, .unspecified
                """)
                Text("Heading levels let VoiceOver's rotor navigate by heading. Use them consistently like HTML heading hierarchy.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityInputLabels — voice control synonyms") {
                snippet("""
                Button("▶") { play() }
                    .accessibilityLabel("Play")
                    .accessibilityInputLabels(["Play", "Start", "Begin"])
                // Voice Control users can say any of the input labels to activate.
                """)
                Text("accessibilityInputLabels provides alternative names Voice Control recognizes. Keep the primary accessibilityLabel concise; put synonyms here.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityTextContentType + AccessibilityTextContentType") {
                snippet("""
                TextField("Email", text: $email)
                    .accessibilityTextContentType(.emailAddress)
                // Types: .word, .sentence, .plain, .fileSystem,
                //        .messaging, .narrative, .sourceCode, .spreadsheet,
                //        .url, .webContent, .emailAddress, .dateTime, .address
                """)
                Text("Tells AT what kind of text the field contains so it can adjust pronunciation and autocorrection hints.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityLabeledPair + AccessibilityLabeledPairRole") {
                snippet("""
                @Namespace var formNamespace
                Text("First Name")
                    .accessibilityLabeledPair(
                        role: .label, id: "firstName", in: formNamespace)
                TextField("", text: $firstName)
                    .accessibilityLabeledPair(
                        role: .content, id: "firstName", in: formNamespace)
                // Roles: .label, .content
                """)
                Text("Pairs a label view with a content view by ID so VoiceOver associates them — useful when you can't use LabeledContent.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityValue(_:isEnabled:)") {
                snippet("""
                progressView
                    .accessibilityValue("\\(Int(progress * 100)) percent complete",
                                        isEnabled: isLoading)
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Speech modifiers — how text is spoken") {
                snippet("""
                Text("She said: \"Hello!\"")
                    .speechAlwaysIncludesPunctuation(true)
                    // VoiceOver reads punctuation aloud

                Text("C-A-T")
                    .speechSpellsOutCharacters(true)
                    // Spells individual characters

                Text("Important!")
                    .speechAdjustedPitch(0.8)
                    // 0.0 = lowest pitch, 2.0 = highest pitch, 1.0 = default

                Text("Breaking news")
                    .speechAnnouncementsQueued(false)
                    // false = interrupt current speech immediately
                """)
                Text("These modifiers affect how VoiceOver synthesizes speech for the decorated text view.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("speaker.wave.2", "accessibilityLabel replaces the automatic label derived from Text/button title. Always provide one for non-text controls.")
            noteRow("questionmark.circle", "accessibilityHint should describe the result of the action, not the action itself. Good: \"Opens contact details\". Bad: \"Double tap to open\".")
            noteRow("dial.medium", "accessibilityValue is for dynamic state (slider %, toggle on/off, progress). Don't duplicate the label text.")
            noteRow("character.cursor.ibeam", "AccessibilityTraits.isHeader is the most commonly missed trait — section titles in custom layouts need it explicitly.")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol)
            .font(.callout).foregroundStyle(.secondary)
    }

    private func snippet(_ code: String) -> some View {
        Text(code)
            .font(.caption).fontDesign(.monospaced)
            .foregroundStyle(.primary)
            .textSelection(.enabled)
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

private struct Block<Content: View>: View {
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
    AccessibilityDescriptionsPage().frame(width: 1100, height: 900)
}
