import SwiftUI
import AppKit

// AppKit Views and Controls / Visual adornments reference page.
// Covers: NSVisualEffectView (class, inherits NSView) — adds translucency and
// vibrancy effects; pick a material based on the surface role (.windowBackground,
// .sidebar, .menu, .popover, etc.) and a blendingMode (.behindWindow / .withinWindow).
// Source: Documentation/AppKit/views-and-controls/nsvisualeffectview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSVisualEffectView over a
// colored backdrop; SwiftUI controls drive material, blendingMode, isEmphasized,
// and state.

// MARK: - Bridge

private struct NSVisualEffectViewDemo: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    var blendingMode: NSVisualEffectView.BlendingMode
    var state: NSVisualEffectView.State
    var isEmphasized: Bool

    func makeNSView(context: Context) -> NSView {
        let host = NSView()
        host.wantsLayer = true
        host.layer?.backgroundColor = NSColor.systemPurple.withAlphaComponent(0.55).cgColor
        host.translatesAutoresizingMaskIntoConstraints = false

        let effect = NSVisualEffectView()
        effect.translatesAutoresizingMaskIntoConstraints = false
        effect.wantsLayer = true
        effect.layer?.cornerRadius = 10

        let label = NSTextField(labelWithString: "Visual effect")
        label.font = NSFont.preferredFont(forTextStyle: .title3)
        label.textColor = NSColor.labelColor
        label.alignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        effect.addSubview(label)

        host.addSubview(effect)
        NSLayoutConstraint.activate([
            effect.leadingAnchor.constraint(equalTo: host.leadingAnchor, constant: 24),
            effect.trailingAnchor.constraint(equalTo: host.trailingAnchor, constant: -24),
            effect.topAnchor.constraint(equalTo: host.topAnchor, constant: 24),
            effect.bottomAnchor.constraint(equalTo: host.bottomAnchor, constant: -24),
            label.centerXAnchor.constraint(equalTo: effect.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: effect.centerYAnchor)
        ])

        context.coordinator.effect = effect
        return host
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        guard let effect = context.coordinator.effect else { return }
        effect.material = material
        effect.blendingMode = blendingMode
        effect.state = state
        effect.isEmphasized = isEmphasized
    }

    func makeCoordinator() -> Coordinator { Coordinator() }

    final class Coordinator {
        weak var effect: NSVisualEffectView?
    }
}

// MARK: - Page

struct NSVisualEffectViewPage: View {
    @State private var material: NSVisualEffectView.Material = .windowBackground
    @State private var blendingMode: NSVisualEffectView.BlendingMode = .behindWindow
    @State private var state: NSVisualEffectView.State = .followsWindowActiveState
    @State private var isEmphasized: Bool = false

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
            Text("NSVisualEffectView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A view that adds translucency and vibrancy effects to the views in your interface.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} macOS 10.10+ \u{00b7} Documentation/AppKit/views-and-controls/nsvisualeffectview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init() — material + blendingMode over a colored backdrop") {
            VStack(alignment: .leading, spacing: 12) {
                NSVisualEffectViewDemo(
                    material: material,
                    blendingMode: blendingMode,
                    state: state,
                    isEmphasized: isEmphasized
                )
                .frame(height: 180)
                .frame(maxWidth: 480)

                HStack(spacing: 12) {
                    Text("material").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $material) {
                        Text(".windowBackground").tag(NSVisualEffectView.Material.windowBackground)
                        Text(".sidebar").tag(NSVisualEffectView.Material.sidebar)
                        Text(".menu").tag(NSVisualEffectView.Material.menu)
                        Text(".popover").tag(NSVisualEffectView.Material.popover)
                        Text(".hudWindow").tag(NSVisualEffectView.Material.hudWindow)
                        Text(".titlebar").tag(NSVisualEffectView.Material.titlebar)
                        Text(".headerView").tag(NSVisualEffectView.Material.headerView)
                        Text(".selection").tag(NSVisualEffectView.Material.selection)
                    }
                    .labelsHidden()
                    .frame(width: 200)
                }

                HStack(spacing: 12) {
                    Text("blendingMode").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $blendingMode) {
                        Text(".behindWindow").tag(NSVisualEffectView.BlendingMode.behindWindow)
                        Text(".withinWindow").tag(NSVisualEffectView.BlendingMode.withinWindow)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 280)
                }

                HStack(spacing: 12) {
                    Text("state").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $state) {
                        Text(".followsWindowActiveState").tag(NSVisualEffectView.State.followsWindowActiveState)
                        Text(".active").tag(NSVisualEffectView.State.active)
                        Text(".inactive").tag(NSVisualEffectView.State.inactive)
                    }
                    .labelsHidden()
                    .frame(width: 220)
                }

                HStack(spacing: 12) {
                    Text("isEmphasized").font(.caption).foregroundStyle(.secondary)
                    Toggle("", isOn: $isEmphasized)
                        .toggleStyle(.switch)
                        .controlSize(.small)
                        .labelsHidden()
                }

                APICallout("let effect = NSVisualEffectView()")
                APICallout("effect.material = .sidebar; effect.blendingMode = .behindWindow")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Material — pick by role, not by color") {
                snippet("""
                effect.material = .windowBackground   // default window backdrop
                effect.material = .sidebar            // source-list sidebars
                effect.material = .menu               // menus
                effect.material = .popover            // popover bodies
                effect.material = .hudWindow          // floating HUD windows
                effect.material = .titlebar           // titlebar / toolbar area
                effect.material = .headerView         // table / outline headers
                effect.material = .selection          // selected row backgrounds
                """)
                Text("Per Apple: 'always pick a material based on its intended use ... don't select materials based on the apparent colors they impart on your interface.' Materials adapt across appearances and OS versions.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "BlendingMode — behind-window vs within-window") {
                snippet("""
                effect.blendingMode = .behindWindow    // composite with desktop / lower windows
                effect.blendingMode = .withinWindow    // composite with this window's content
                """)
                Text(".behindWindow makes the entire window stand out above other windows (sheets, popovers, the SwiftKit window's titlebar). .withinWindow blends with siblings inside the same window — typical for in-window scrolling translucency.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Masking the effect to a shape") {
                snippet("""
                effect.maskImage = roundedMaskImage    // NSImage? — clips the visual effect to the image's alpha
                """)
                Text("maskImage clips the rendered effect; combine with a 9-slice rounded-rect image for capsule / pill backings.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "state — when the effect is active") {
                snippet("""
                effect.state = .followsWindowActiveState   // default
                effect.state = .active                     // always render the effect
                effect.state = .inactive                   // never render the effect
                """)
                Text("With .followsWindowActiveState the effect dims when the window goes inactive (the typical macOS behavior). Force .active for HUDs that should stay vibrant; force .inactive to disable the effect for accessibility / motion reasons.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "isEmphasized — selection emphasis") {
                snippet("""
                effect.isEmphasized = true     // boost vibrancy for "primary" emphasis
                """)
                Text("Most useful with .selection material, where it switches between the unemphasized grey selection and the emphasized accent-tinted selection.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView. macOS 10.10+. The premier substrate for translucent / vibrant chrome.")
            noteRow("paintbrush", "AppKit creates these automatically for window titlebars, popovers, and source-list table views — don't add your own there.")
            noteRow("eye", "Vibrancy is opt-in for foreground content: override NSView.allowsVibrancy and return true on leaf views inside the effect.")
            noteRow("xmark.octagon", "Don't subclass and override draw(_:) or updateLayer(); always call super in viewDidMoveToWindow / viewWillMove(toWindow:).")
            noteRow("info.circle", "Pair material with the right blendingMode: .sidebar + .behindWindow, .menu + .behindWindow, .titlebar + .withinWindow.")
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
    NSVisualEffectViewPage().frame(width: 1100, height: 900)
}
