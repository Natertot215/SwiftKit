import SwiftUI

// SwiftUI accessibility navigation reference page.
// Covers: accessibilityRotor (all overloads), AccessibilityRotorContent, AccessibilityRotorContentBuilder,
//         AccessibilityRotorEntry, accessibilityRotorEntry(id:in:), AccessibilitySystemRotor,
//         accessibilityLinkedGroup(id:in:), accessibilitySortPriority(_:)

struct AccessibilityNavigationPage: View {
    private let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
    @Namespace private var rotorNamespace

    var body: some View {
        GalleryPageScaffold {
            header
        } defaultRender: {
            defaultDemo
        } variants: {
            variantsContent
        } states: {
            EmptyView()
        } notes: {
            notesContent
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Accessibility Navigation")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Custom VoiceOver rotors, sort priority, and linked groups.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "accessibilityRotor(_:entries:) — array-based rotor") {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 6))
                        .accessibilityElement()
                        .accessibilityLabel(fruit)
                        .accessibilityRotorEntry(id: fruit, in: rotorNamespace)
                }
            }
            .accessibilityRotor("Fruits", entries: fruits, entryID: \.self, entryLabel: \.self)
            APICallout(".accessibilityRotor(\"Fruits\", entries: fruits, entryLabel: \\.self)")
            Text("A custom VoiceOver rotor named \"Fruits\" lets users swipe through fruit items using VoiceOver's rotor gesture.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "accessibilityRotor(_:entries:) — Identifiable collection") {
                snippet("""
                // Simplest form — Identifiable entries, label from KeyPath:
                list.accessibilityRotor("Tasks", entries: tasks, entryLabel: \\.title)

                // With custom entryID:
                list.accessibilityRotor("Tasks",
                                         entries: tasks,
                                         entryID: \\.id,
                                         entryLabel: \\.title)
                """)
            }

            Block(title: "accessibilityRotor(_:textRanges:) — text highlight rotor") {
                snippet("""
                // For TextEditor / Text views — navigate by highlighted text ranges:
                textEditor.accessibilityRotor("Errors") {
                    AccessibilityRotorEntry("Syntax error", textRange: errorRange)
                    AccessibilityRotorEntry("Warning", textRange: warnRange)
                }
                """)
                Text("Text-range rotors let VoiceOver jump to specific ranges within a text view — used for spell-check, search highlights, etc.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "AccessibilityRotorContent + AccessibilityRotorEntry — builder form") {
                snippet("""
                view.accessibilityRotor("Favorites") {
                    // Each entry points to an element:
                    AccessibilityRotorEntry("Starred items", id: "starred")
                    // or with a text range:
                    AccessibilityRotorEntry("Chapter 1", textRange: ch1Range)
                }
                // Builder uses AccessibilityRotorContentBuilder result builder.
                """)
            }

            Block(title: "AccessibilitySystemRotor — built-in rotor types") {
                snippet("""
                view.accessibilityRotor(.headings)            // jump by headings
                view.accessibilityRotor(.links)               // jump by links
                view.accessibilityRotor(.images)              // jump by images
                view.accessibilityRotor(.boldText)            // bold runs
                view.accessibilityRotor(.italicText)          // italic runs
                view.accessibilityRotor(.tabBar)              // tab items
                view.accessibilityRotor(.textFields)          // text inputs
                view.accessibilityRotor(.tables)              // table containers
                view.accessibilityRotor(.lists)               // list containers
                view.accessibilityRotor(.landmarks)           // landmark regions
                view.accessibilityRotor(.windows)             // window items
                """)
                Text("Use AccessibilitySystemRotor values with accessibilityRotor(_:) to redirect existing built-in rotors to a custom entry list.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityRotorEntry(id:in:) — tag an element for a rotor") {
                snippet("""
                @Namespace var ns

                ForEach(articles) { article in
                    ArticleRow(article)
                        .accessibilityRotorEntry(id: article.id, in: ns)
                }
                .accessibilityRotor("Articles", entries: articles,
                                     entryID: \\.id) { article in
                    Text(article.title)
                }
                """)
                Text("accessibilityRotorEntry(id:in:) tags a view so the rotor can jump directly to it by matching ID.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityLinkedGroup(id:in:) — cross-view VoiceOver linking") {
                snippet("""
                @Namespace var formNS

                Text("Password requirements").accessibilityLinkedGroup(id: "pwd", in: formNS)
                SecureField("Password", text: $pwd).accessibilityLinkedGroup(id: "pwd", in: formNS)
                """)
                Text("Linked elements are presented together in VoiceOver navigation — useful for connecting hint text with its field without merging elements.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilitySortPriority — override reading order") {
                snippet("""
                HStack {
                    Text("Summary").accessibilitySortPriority(1) // read second
                    Text("Title").accessibilitySortPriority(2)   // read first (higher = earlier)
                }
                // Default sort priority is 0. Higher values come first.
                """)
                Text("Override the default left-to-right/top-to-bottom VoiceOver reading order when your layout doesn't match the logical reading sequence.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("arrow.triangle.2.circlepath", "VoiceOver rotors are accessed by rotating two fingers on the trackpad. Custom rotors appear alongside system rotors (Headings, Links, etc.).")
            noteRow("arrow.up.and.down", "accessibilitySortPriority only reorders within a parent container — elements in different containers aren't reordered relative to each other.")
            noteRow("link", "accessibilityLinkedGroup is subtly different from grouping: elements remain distinct in the element tree but VoiceOver presents them together.")
            noteRow("text.cursor", "Text-range rotors (accessibilityRotor(_:textRanges:)) only work with views that support text ranges — TextEditor and attributed Text.")
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
    AccessibilityNavigationPage().frame(width: 1100, height: 900)
}
