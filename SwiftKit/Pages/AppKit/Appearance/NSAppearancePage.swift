import SwiftUI
import AppKit

// AppKit Appearance Customization — NSAppearance and NSAppearanceCustomization.
//
// Absorbed leaves:
//   Appearance System: NSAppearance, NSAppearanceCustomization
//   Essentials (4 leaves): Adopting Liquid Glass (article), Updates to AppKit (article),
//                          Protecting user's privacy (article),
//                          Porting macOS apps to Apple Silicon (article)

// MARK: - Bridges

private struct AppearanceDemoView: NSViewRepresentable {
    var useAqua: Bool

    func makeNSView(context: Context) -> NSView {
        let container = NSView()
        container.wantsLayer = true
        container.layer?.cornerRadius = 8
        container.layer?.borderWidth = 1
        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {
        let appearance = useAqua
            ? NSAppearance(named: .aqua)
            : NSAppearance(named: .darkAqua)
        nsView.appearance = appearance
        nsView.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        nsView.layer?.borderColor = NSColor.separatorColor.cgColor
    }
}

// MARK: - Page

struct NSAppearancePage: View {
    @State private var useAqua = true

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                essentialsSection
                appearanceSection
                customizationSection
                demoSection
                notesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Appearance Customization")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSAppearance, NSAppearanceCustomization, and AppKit essentials — including Liquid Glass adoption, Apple Silicon porting, and privacy guidelines.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} NSAppearance macOS 10.9+ \u{00b7} macOS 26 Liquid Glass")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Essentials

    private var essentialsSection: some View {
        PageSection("AppKit Essentials") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "Adopting Liquid Glass",
                    kind: "article",
                    availability: "macOS 26.0+",
                    blurb: "macOS 26 introduces the Liquid Glass design language. In AppKit, NSGlassEffectView provides the translucent glass surface. NSButton gains .glass bezel style. Most standard controls update their appearance automatically on macOS 26 — custom views that want Liquid Glass wrap their content in NSGlassEffectView."
                ) {
                    snippet("""
                    // NSGlassEffectView (macOS 26+) — wraps content with glass material:
                    let glass = NSGlassEffectView()
                    glass.style = .regular  // .regular / .compact
                    glass.addSubview(contentView)

                    // NSButton glass bezel (macOS 26+):
                    button.bezelStyle = .glass

                    // NSGlassEffectContainerView for groups of glass elements:
                    let container = NSGlassEffectContainerView()
                    container.addArrangedSubview(glass1)
                    container.addArrangedSubview(glass2)
                    """)
                }

                refBlock(
                    name: "Updates to AppKit",
                    kind: "article",
                    availability: "macOS releases",
                    blurb: "The AppKit release notes page documents API additions and deprecations per macOS version. Check it before adopting any AppKit API to verify availability and migration paths from deprecated predecessors."
                ) {
                    snippet("""
                    // Check current macOS version:
                    if #available(macOS 26, *) {
                        // Use macOS 26 APIs
                    } else {
                        // Fallback for earlier macOS
                    }

                    // Availability annotation pattern:
                    @available(macOS 26, *)
                    func configureLiquidGlass() {
                        view.bezelStyle = .glass
                    }
                    """)
                }

                refBlock(
                    name: "Protecting User Privacy",
                    kind: "article",
                    availability: "macOS 10.0+",
                    blurb: "AppKit apps must request permission for access to sensitive data. The app's Info.plist must contain NSUsageDescription keys for each capability. Without them, the system denies access silently."
                ) {
                    snippet("""
                    // Common Info.plist usage description keys:
                    NSCameraUsageDescription           = "We need camera access to..."
                    NSMicrophoneUsageDescription       = "We need microphone access to..."
                    NSContactsUsageDescription         = "We need contacts access to..."
                    NSCalendarsUsageDescription        = "We need calendar access to..."
                    NSPhotoLibraryUsageDescription     = "We need photo library access to..."
                    NSLocationWhenInUseUsageDescription = "We need location to..."
                    NSBluetoothAlwaysUsageDescription  = "We need Bluetooth to..."
                    NSScreenCaptureUsageDescription    = "We need screen recording to..."  // macOS 14.4+

                    // Request authorization at runtime:
                    import Photos
                    PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                        // handle status
                    }
                    """)
                }

                refBlock(
                    name: "Porting to Apple Silicon",
                    kind: "article",
                    availability: "macOS 11.0+",
                    blurb: "Universal binaries support both Apple Silicon (arm64) and Intel (x86_64). Rosetta 2 translates x86_64 code on Apple Silicon. Key considerations: architecture-specific frameworks, JIT compilation restrictions, and performance profiles differ between architectures."
                ) {
                    snippet("""
                    // Check architecture at runtime:
                    #if arch(arm64)
                        print("Running natively on Apple Silicon")
                    #elseif arch(x86_64)
                        print("Running on Intel (possibly via Rosetta)")
                    #endif

                    // Detect Rosetta translation:
                    var ret: Int32 = 0
                    var size = MemoryLayout.size(ofValue: ret)
                    sysctlbyname("sysctl.proc_translated", &ret, &size, nil, 0)
                    let isTranslated = ret == 1   // true = Rosetta; false = native

                    // Build a Universal binary in Xcode:
                    // Set Architectures = Standard Architectures (arm64, x86_64)
                    // Or use: xcodebuild -arch arm64 -arch x86_64 ...
                    """)
                }
            }
        }
    }

    // MARK: Appearance

    private var appearanceSection: some View {
        PageSection("Reference \u{2014} NSAppearance") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSAppearance",
                    kind: "class : NSObject",
                    availability: "macOS 10.9+",
                    blurb: "Encapsulates the visual theme applied to a view or window — Aqua (light) or Dark Aqua (dark). Set on any NSView or NSWindow to force a specific appearance regardless of the system setting."
                ) {
                    snippet("""
                    class NSAppearance: NSObject, NSSecureCoding

                    // Named appearances:
                    NSAppearance.Name.aqua              // light mode
                    NSAppearance.Name.darkAqua           // dark mode (macOS 10.14+)
                    NSAppearance.Name.vibrantLight       // vibrant light (for visual effect views)
                    NSAppearance.Name.vibrantDark        // vibrant dark
                    NSAppearance.Name.accessibilityHighContrastAqua          // high contrast light
                    NSAppearance.Name.accessibilityHighContrastDarkAqua      // high contrast dark
                    NSAppearance.Name.accessibilityHighContrastVibrantLight
                    NSAppearance.Name.accessibilityHighContrastVibrantDark

                    // Init:
                    let light = NSAppearance(named: .aqua)
                    let dark  = NSAppearance(named: .darkAqua)

                    // Current effective appearance:
                    NSApp.effectiveAppearance          // whole-app effective appearance
                    view.effectiveAppearance           // view's effective appearance

                    // Set on a view (overrides window/app appearance for that subtree):
                    myView.appearance = NSAppearance(named: .darkAqua)

                    // Set app-wide:
                    NSApp.appearance = NSAppearance(named: .aqua)   // force light everywhere

                    // Determine dark/light inside draw(_:):
                    let isDark = effectiveAppearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua

                    // Pick the best matching named appearance:
                    let best = NSApp.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua])
                    """)
                }
            }
        }
    }

    // MARK: Customization

    private var customizationSection: some View {
        PageSection("Reference \u{2014} NSAppearanceCustomization") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSAppearanceCustomization",
                    kind: "protocol",
                    availability: "macOS 10.9+",
                    blurb: "Adopted by NSView, NSWindow, NSApplication, and NSPopover. Provides the appearance and effectiveAppearance properties that control which visual theme is applied."
                ) {
                    snippet("""
                    protocol NSAppearanceCustomization: NSObjectProtocol {
                        var appearance: NSAppearance? { get set }
                        var effectiveAppearance: NSAppearance { get }
                    }

                    // Adopted by:
                    // NSView, NSWindow, NSApplication, NSPopover

                    // Key property semantics:
                    // appearance         — explicitly set theme; nil = inherit from parent/app
                    // effectiveAppearance — the resolved theme after inheritance chain

                    // Check dark mode in any context:
                    extension NSAppearance {
                        var isDark: Bool {
                            bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
                        }
                    }

                    // Usage in draw(_:):
                    override func draw(_ dirtyRect: NSRect) {
                        if effectiveAppearance.isDark {
                            NSColor.black.withAlphaComponent(0.3).setFill()
                        } else {
                            NSColor.white.withAlphaComponent(0.5).setFill()
                        }
                        dirtyRect.fill()
                    }
                    """)
                }
            }
        }
    }

    // MARK: Demo

    private var demoSection: some View {
        PageSection("NSAppearance Override Demo") {
            VStack(alignment: .leading, spacing: 12) {
                Text("Force light or dark NSAppearance on a view, independent of the system setting.")
                    .font(.callout).foregroundStyle(.secondary)

                AppearanceDemoView(useAqua: useAqua)
                    .frame(height: 60)
                    .frame(maxWidth: 300)

                HStack(spacing: 12) {
                    Text("Appearance").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $useAqua) {
                        Text("aqua (light)").tag(true)
                        Text("darkAqua (dark)").tag(false)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 260)
                }

                APICallout("view.appearance = NSAppearance(named: .aqua)    // force light")
                APICallout("view.appearance = NSAppearance(named: .darkAqua) // force dark")
                APICallout("view.appearance = nil                            // inherit from parent")
            }
        }
    }

    // MARK: Notes

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("sun.max", "NSApp.appearance = nil (default) follows the system setting. Setting it to a specific NSAppearance forces all windows and views to that theme, overriding the user's system preference.")
                noteRow("eye", "effectiveAppearance reflects the actual rendered theme after walking the parent chain. Use it in draw(_:) and layout code — appearance may be nil (inherit) while effectiveAppearance is always resolved.")
                noteRow("sparkles", "macOS 26 Liquid Glass: NSButton.bezelStyle = .glass, NSGlassEffectView, and NSGlassEffectContainerView are the three entry points. Standard controls update automatically — NSGlassEffectView is only needed for custom surfaces.")
                noteRow("lock.shield", "Privacy usage description strings must be added to Info.plist BEFORE calling the API — macOS checks them at authorization-request time and will deny if they're missing, even in development.")
                noteRow("cpu", "Apple Silicon: Use #if arch(arm64) for compile-time architecture checks. Use the sysctlbyname(\"sysctl.proc_translated\") technique for runtime Rosetta detection.")
            }
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

    private func refBlock<Content: View>(
        name: String,
        kind: String,
        availability: String,
        blurb: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(name).font(.headline).foregroundStyle(.primary)
                Text(kind).font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                Spacer()
                Text(availability).font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
            }
            Text(blurb).font(.callout).foregroundStyle(.secondary)
            content()
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
    }
}

#Preview {
    NSAppearancePage().frame(width: 1100, height: 900)
}
