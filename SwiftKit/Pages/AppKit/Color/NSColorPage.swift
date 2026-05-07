import SwiftUI
import AppKit

// AppKit Color — NSColor, NSColorList, NSColorSpace, NSColorSampler.
//
// Absorbed leaves:
//   Colors:       NSColor, NSColorList, NSColorSpace
//   Color Sampler: NSColorSampler

// MARK: - Bridges

private struct NSColorSwatchGrid: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let container = NSView()
        container.translatesAutoresizingMaskIntoConstraints = false

        let colors: [(String, NSColor)] = [
            ("systemRed", .systemRed), ("systemOrange", .systemOrange),
            ("systemYellow", .systemYellow), ("systemGreen", .systemGreen),
            ("systemTeal", .systemTeal), ("systemBlue", .systemBlue),
            ("systemIndigo", .systemIndigo), ("systemPurple", .systemPurple),
            ("systemPink", .systemPink), ("systemBrown", .systemBrown),
            ("systemGray", .systemGray), ("controlAccentColor", .controlAccentColor),
        ]

        let stack = NSStackView()
        stack.orientation = .horizontal
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stack.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])

        for (_, color) in colors {
            let view = NSView()
            view.wantsLayer = true
            view.layer?.backgroundColor = color.cgColor
            view.layer?.cornerRadius = 6
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 24),
                view.heightAnchor.constraint(equalToConstant: 24),
            ])
            stack.addArrangedSubview(view)
        }
        return container
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}

// MARK: - Page

struct NSColorPage: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 36) {
                header
                swatchSection
                nscolorSection
                nscolorSpaceSection
                nscolorListSection
                nscolorSamplerSection
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
            Text("Color")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("NSColor semantic tokens, NSColorSpace, NSColorList, and NSColorSampler.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} macOS 10.0+ \u{00b7} NSColorSampler macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var swatchSection: some View {
        PageSection("System Color Swatches") {
            VStack(alignment: .leading, spacing: 12) {
                Text("NSColor system semantic colors rendered at runtime:")
                    .font(.callout).foregroundStyle(.secondary)

                NSColorSwatchGrid()
                    .frame(height: 44)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            }
        }
    }

    private var nscolorSection: some View {
        PageSection("Reference \u{2014} NSColor") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSColor — Semantic System Colors",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "NSColor provides semantic color constants that adapt to dark mode, accessibility settings, and system accent changes. Always use semantic tokens for UI elements. Hand-mixed RGB values are forbidden."
                ) {
                    snippet("""
                    class NSColor: NSObject, NSCopying, NSSecureCoding

                    // Label colors (text):
                    NSColor.labelColor              // primary text
                    NSColor.secondaryLabelColor     // secondary text
                    NSColor.tertiaryLabelColor      // placeholder text
                    NSColor.quaternaryLabelColor    // disabled text

                    // System accent:
                    NSColor.controlAccentColor      // user-chosen accent (macOS 10.14+)
                    NSColor.selectedContentBackgroundColor
                    NSColor.unemphasizedSelectedContentBackgroundColor

                    // Background:
                    NSColor.windowBackgroundColor
                    NSColor.underPageBackgroundColor
                    NSColor.controlBackgroundColor
                    NSColor.textBackgroundColor

                    // Text:
                    NSColor.textColor
                    NSColor.selectedTextColor
                    NSColor.placeholderTextColor    // macOS 10.10+
                    NSColor.selectedTextBackgroundColor

                    // Control colors:
                    NSColor.controlColor
                    NSColor.controlTextColor
                    NSColor.disabledControlTextColor
                    NSColor.selectedControlColor
                    NSColor.selectedControlTextColor
                    NSColor.alternateSelectedControlTextColor

                    // Separator:
                    NSColor.separatorColor          // macOS 10.14+
                    NSColor.gridColor

                    // System palettes (vibrant):
                    NSColor.systemRed
                    NSColor.systemOrange
                    NSColor.systemYellow
                    NSColor.systemGreen
                    NSColor.systemTeal
                    NSColor.systemBlue
                    NSColor.systemIndigo
                    NSColor.systemPurple
                    NSColor.systemPink
                    NSColor.systemBrown
                    NSColor.systemGray
                    NSColor.systemMint    // macOS 12+
                    NSColor.systemCyan    // macOS 12+
                    """)
                }

                refBlock(
                    name: "NSColor — Construction and Conversion",
                    kind: "class methods",
                    availability: "macOS 10.0+",
                    blurb: "When semantic tokens don't cover a need, construct NSColor from device-independent color spaces. Avoid sRGB literals for system UI elements; use them only for brand/illustration content."
                ) {
                    snippet("""
                    // P3 wide-gamut:
                    NSColor(displayP3Red: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)

                    // sRGB (avoid for system UI):
                    NSColor(srgbRed: 0.0, green: 0.5, blue: 1.0, alpha: 1.0)

                    // HSB:
                    NSColor(hue: 0.6, saturation: 0.8, brightness: 0.9, alpha: 1.0)

                    // Gray scale:
                    NSColor(white: 0.5, alpha: 1.0)

                    // From CGColor:
                    NSColor(cgColor: myCGColor)

                    // Dynamic (light/dark adaptive — macOS 10.15+):
                    NSColor(name: nil) { appearance in
                        appearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
                            ? NSColor.white
                            : NSColor.black
                    }

                    // Components:
                    var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
                    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

                    // Blend:
                    let blended = color1.blended(withFraction: 0.3, of: color2)

                    // Lighten/darken:
                    let lighter = color.highlight(withLevel: 0.2)   // adds white
                    let darker  = color.shadow(withLevel: 0.2)       // adds black
                    """)
                }
            }
        }
    }

    private var nscolorSpaceSection: some View {
        PageSection("Reference \u{2014} NSColorSpace") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSColorSpace",
                    kind: "class : NSObject",
                    availability: "macOS 10.4+",
                    blurb: "Represents a color space (sRGB, Display P3, GenericRGB, etc.). Used to ensure color fidelity when converting between NSColor values or creating custom ICC-profile-based colors."
                ) {
                    snippet("""
                    class NSColorSpace: NSObject, NSSecureCoding

                    // Common system color spaces:
                    NSColorSpace.genericRGBColorSpace          // sRGB-compatible
                    NSColorSpace.deviceRGBColorSpace           // device-specific sRGB
                    NSColorSpace.genericGrayColorSpace
                    NSColorSpace.sRGB                         // macOS 10.7+
                    NSColorSpace.extendedSRGB                 // macOS 10.12+
                    NSColorSpace.displayP3                    // macOS 10.12+
                    NSColorSpace.adobeRGB1998                 // Adobe RGB
                    NSColorSpace.genericGamma22GrayColorSpace
                    NSColorSpace.extendedGenericGamma22Gray   // macOS 10.12+

                    // Properties:
                    var numberOfColorComponents: Int { get }  // e.g., 3 for RGB, 4 for CMYK
                    var colorSpaceModel: NSColorSpace.Model   // .RGB / .CMYK / .Gray / .Lab / ...
                    var colorSyncProfile: CMProfileRef? { get }
                    var localizedName: String? { get }

                    // Convert color to a specific space:
                    let p3Color = myColor.usingColorSpace(.displayP3)
                    """)
                }
            }
        }
    }

    private var nscolorListSection: some View {
        PageSection("Reference \u{2014} NSColorList") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSColorList",
                    kind: "class : NSObject",
                    availability: "macOS 10.0+",
                    blurb: "A named, ordered collection of NSColor objects. System color lists (e.g., Crayons, Web Safe Colors) are accessible via +availableColorLists. Custom lists can be created, saved to disk, and loaded into the Color Panel."
                ) {
                    snippet("""
                    class NSColorList: NSObject, NSSecureCoding

                    init(name: NSColorList.Name)
                    init?(name: NSColorList.Name, fromFile path: String?)

                    static var availableColorLists: [NSColorList] { get }
                    static func colorList(named name: NSColorList.Name) -> NSColorList?

                    // Manage colors:
                    func setColor(_ color: NSColor, forKey key: NSColorList.Key)
                    func insertColor(_ color: NSColor, key: NSColorList.Key, at index: Int)
                    func removeColor(withKey key: NSColorList.Key)
                    func color(withKey key: NSColorList.Key) -> NSColor?
                    var allKeys: [NSColorList.Key] { get }

                    // Persist:
                    func write(toFile path: String?) throws
                    var isEditable: Bool { get }
                    var name: NSColorList.Name? { get }

                    // Integrate with Color Panel:
                    NSColorPanel.shared.attachColorList(myList)
                    NSColorPanel.shared.detachColorList(myList)
                    """)
                }
            }
        }
    }

    private var nscolorSamplerSection: some View {
        PageSection("NSColorSampler") {
            VStack(alignment: .leading, spacing: 16) {
                refBlock(
                    name: "NSColorSampler",
                    kind: "class : NSObject",
                    availability: "macOS 10.15+",
                    blurb: "Activates the system screen magnifier color picker. The user clicks anywhere on screen and the sampled NSColor is returned in the completion handler. Used by apps like Digital Color Meter."
                ) {
                    snippet("""
                    class NSColorSampler: NSObject  // macOS 10.15+

                    func show(selectionHandler: @escaping (NSColor?) -> Void)

                    // Usage — trigger color picker:
                    let sampler = NSColorSampler()
                    sampler.show { sampledColor in
                        guard let color = sampledColor else { return }
                        // color is in the display's current color space
                        colorWell.color = color
                    }
                    // User sees a magnifier; clicking picks the pixel color.
                    """)
                }
            }
        }
    }

    private var notesSection: some View {
        PageSection("Notes") {
            VStack(alignment: .leading, spacing: 12) {
                noteRow("paintpalette", "Always use NSColor semantic tokens for UI elements (labelColor, controlAccentColor, separatorColor, etc.). They adapt to dark mode, high-contrast mode, and system accent changes automatically.")
                noteRow("nosign", "Do not use NSColor(red:green:blue:alpha:) for UI chrome. It's a literal value that diverges from system look under every appearance change. It's valid only for brand/illustration content that must be a specific color.")
                noteRow("circle.lefthalf.filled", "NSColor(name:dynamicProvider:) (macOS 10.15+) creates a color that adapts to light/dark appearance — the closure is called with the current NSAppearance each time the color is needed.")
                noteRow("photo.circle", "NSColorSampler activates the system screen-wide color picker. It requires Screen Recording entitlement on macOS 14.4+ when sampling outside the app's own window.")
                noteRow("square.stack.3d.up", "NSColorSpace.displayP3 is the correct space for wide-gamut content on modern Macs. Use .extendedSRGB for HDR values that exceed the 0–1 range.")
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

extension NSColorPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.color.nsColor",
        title: "NSColor",
        folder: "Color",
        framework: .appKit,
        absorbedSymbols: [
            "NSColor",
            "NSColorList",
            "NSColorSpace",
            "NSColorSampler"
        ],
        blurb: "Semantic color tokens, color spaces, named color lists, and the system screen color sampler. Always use semantic NSColor tokens for UI chrome — they adapt to dark mode, accessibility, and system accent.",
        signature: "class NSColor : NSObject",
        availability: "macOS 10.0+",
        docPath: "Documentation/AppKit/color/nscolor.md",
        page: { AnyView(NSColorPage()) }
    )
}

#Preview {
    NSColorPage().frame(width: 1100, height: 900)
}
