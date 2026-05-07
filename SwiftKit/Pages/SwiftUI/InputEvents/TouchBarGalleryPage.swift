import SwiftUI

// SwiftUI TouchBar family reference page.
// Covers: TouchBar, touchBar(_:), touchBar(content:), touchBarCustomizationLabel,
//         TouchBarItemPresence, touchBarItemPresence(_:), touchBarItemPrincipal(_:)
// Source: Documentation/SwiftUI/input-events/touchbar.md
// Note: Touch Bar is macOS-only hardware (MacBook Pro 2016–2021).

struct TouchBarGalleryPage: View {
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
            Text("TouchBar · touchBar · TouchBarItemPresence")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Configure the MacBook Pro Touch Bar with SwiftUI views.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 10.15+ · MacBook Pro hardware Touch Bar only")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "touchBar(content:) — inline builder") {
            snippet("""
            Text("Hello, Touch Bar")
                .touchBar {
                    Button("Tap Me") { doSomething() }
                    Slider(value: $brightness, in: 0…1)
                    Button(action: save) { Label("Save", systemImage: "square.and.arrow.down") }
                }
            """)
            Text("touchBar(content:) attaches a Touch Bar to the view using a ViewBuilder closure. Items appear when the view or window is first responder.")
                .font(.footnote).foregroundStyle(.secondary)
            APICallout(".touchBar { Button(…) }")
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "touchBar(_:) — pass a TouchBar value") {
                snippet("""
                let myBar = TouchBar(id: "main-bar") {
                    Button("Action") { performAction() }
                    Text("Status: \\(status)")
                }
                someView.touchBar(myBar)
                """)
                Text("Pass a pre-built TouchBar value to share or reuse the same bar configuration across multiple views.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "touchBarCustomizationLabel(_:)") {
                snippet("""
                Button("Bold") { toggleBold() }
                    .touchBarCustomizationLabel(Text("Bold Text"))
                    .touchBarItemPresence(.default("bold-btn"))
                """)
                Text("touchBarCustomizationLabel provides the label shown in the Touch Bar customization sheet when the user drags items around.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "TouchBarItemPresence — default, required, optional") {
                snippet("""
                // .default — appears by default, user can remove
                view.touchBarItemPresence(.default("item-id"))

                // .required — always present, cannot be removed
                view.touchBarItemPresence(.required)

                // .optional — not shown by default, user can add
                view.touchBarItemPresence(.optional("item-id"))
                """)
                Text("Every item in a customizable Touch Bar should declare its presence behavior. Provide unique string IDs for default and optional items.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "touchBarItemPrincipal(_:)") {
                snippet("""
                // Marks one item as "principal" — centered in the bar
                Button("Play") { togglePlayback() }
                    .touchBarItemPrincipal(true)
                """)
                Text("A principal item is automatically centered in the Touch Bar, similar to how the spacer + principal item pattern works in AppKit NSTouchBar.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Views allowed inside TouchBar") {
                snippet("""
                // These views render correctly on the Touch Bar:
                Button(…)
                Toggle(isOn: $flag) { Label(…) }
                Slider(value: $v, in: 0…1)
                Picker(selection: $sel) { … }
                Stepper(value: $n, in: 0…10) { … }
                Label(…)
                Text(…)
                Color(…)   // solid color swatch
                // Avoid complex layouts — bar is 30 pt tall.
                """)
                Text("The Touch Bar renders a limited subset of SwiftUI views in a 30-point-tall OLED strip. Keep items simple.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("macbook", "Touch Bar hardware exists only on MacBook Pro models (2016 – early 2021). The API is still functional on those machines with macOS 26.")
            noteRow("hand.tap", "The Touch Bar tracks which window is key and which view is first responder to determine which touchBar(…) modifier is active.")
            noteRow("slider.horizontal.3", "Always include system function controls (ESC, volume, brightness) by not replacing the default system bar items unless your use-case requires it.")
            noteRow("pencil", "For user-customizable bars, set unique IDs on .default and .optional items so macOS can persist the layout across sessions.")
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

extension TouchBarGalleryPage {
    @MainActor static let item = GalleryItem(
        id: "swiftui.inputEvents.touchBar",
        title: "TouchBar",
        folder: "Input events",
        framework: .swiftUI,
        absorbedSymbols: [
            "TouchBar",
            "View/touchBar(_:)",
            "View/touchBar(content:)",
            "View/touchBarItemPrincipal(_:)",
            "View/touchBarCustomizationLabel(_:)",
            "View/touchBarItemPresence(_:)",
            "TouchBarItemPresence"
        ],
        blurb: "Container for views shown in the MacBook Pro Touch Bar. The TouchBar value plus its companion modifiers (touchBar, touchBarItemPrincipal, touchBarCustomizationLabel, touchBarItemPresence) declare which controls appear and how customization treats them.",
        signature: "struct TouchBar<Content> where Content : View",
        availability: "macOS 10.15+",
        docPath: "Documentation/SwiftUI/input-events/touchbar.md",
        page: { AnyView(TouchBarGalleryPage()) }
    )
}

#Preview {
    TouchBarGalleryPage().frame(width: 1100, height: 700)
}
