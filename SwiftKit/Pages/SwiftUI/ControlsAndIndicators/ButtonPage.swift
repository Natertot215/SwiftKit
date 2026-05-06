import SwiftUI

// Dense Button reference page. Consolidates thirteen previously-separate
// leaves into a single screen:
//   • ButtonRole                                                          (enum)
//   • ButtonBorderShape                                                   (enum)
//   • View/buttonBorderShape(_:)
//   • ButtonRepeatBehavior                                                (enum)
//   • View/buttonRepeatBehavior(_:)
//   • ButtonSizing                                                        (typealias of ControlSize)
//   • ButtonStyle                                                         (protocol)
//   • ButtonStyleConfiguration                                            (struct)
//   • View/buttonStyle(_:)
//   • PrimitiveButtonStyle                                                (protocol)
//   • PrimitiveButtonStyleConfiguration                                   (struct)
//   • GlassButtonStyle                                                    (PrimitiveButtonStyle)
//   • GlassProminentButtonStyle                                           (PrimitiveButtonStyle)
//
// Source docs:
//   Documentation/SwiftUI/controls-and-indicators/button.md
//   Documentation/SwiftUI/controls-and-indicators/buttonrole.md
//   Documentation/SwiftUI/controls-and-indicators/buttonbordershape.md
//   Documentation/SwiftUI/controls-and-indicators/buttonbordershape(_:).md
//   Documentation/SwiftUI/controls-and-indicators/buttonrepeatbehavior.md
//   Documentation/SwiftUI/controls-and-indicators/buttonrepeatbehavior(_:).md
//   Documentation/SwiftUI/controls-and-indicators/buttonsizing.md
//   Documentation/SwiftUI/view-styles/buttonstyle.md
//   Documentation/SwiftUI/view-styles/buttonstyleconfiguration.md
//   Documentation/SwiftUI/view-styles/buttonstyle(_:).md
//   Documentation/SwiftUI/view-styles/primitivebuttonstyle.md
//   Documentation/SwiftUI/view-styles/primitivebuttonstyleconfiguration.md
//   Documentation/SwiftUI/view-styles/glassbuttonstyle.md
//   Documentation/SwiftUI/view-styles/glassprominentbuttonstyle.md
//
// Mirrors TypographyPage / KeyboardInputPage / PaddingPage rhythm: one
// ScrollView, one VStack, one PageSection per topic. The six type-describe
// Reference subsections (ButtonRole, ButtonBorderShape, ButtonStyle,
// ButtonStyleConfiguration, PrimitiveButtonStyle, PrimitiveButtonStyleConfiguration)
// are placed ABOVE all demo subsections per the describe-track placement
// rule. All demos compose Apple primitives directly — no custom wrapper views.

struct ButtonPage: View {
    @State private var tappedLabel = "\u{2014}"
    @State private var repeatCount = 0
    @State private var roleTag: String = "nil"

    private var role: ButtonRole? {
        switch roleTag {
        case ".destructive": return .destructive
        case ".cancel":      return .cancel
        default:             return nil
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                buttonRoleReferenceSection
                buttonBorderShapeReferenceSection
                buttonStyleReferenceSection
                buttonStyleConfigurationReferenceSection
                primitiveButtonStyleReferenceSection
                primitiveButtonStyleConfigurationReferenceSection
                defaultButtonSection
                buttonVariantsSection
                buttonStatesSection
                buttonRoleVariantsSection
                buttonBorderShapeVariantsSection
                buttonRepeatBehaviorSection
                buttonSizingSection
                buttonStyleGallerySection
                glassButtonStyleSection
                glassProminentButtonStyleSection
                customButtonStyleSection
                primitiveButtonStyleExampleSection
                higNotesSection
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .frame(maxWidth: galleryReadableContentWidth, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: Header

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Button")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("A control that initiates an action \u{2014} the most fundamental interactive primitive in SwiftUI. This page covers Button itself plus every supporting type and modifier (roles, border shapes, repeat behavior, sizing, style protocols and configurations, and the Liquid Glass styles).")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/button.md \u{00b7} macOS 10.15+ (ButtonRole / ButtonBorderShape: 12.0+; ButtonRepeatBehavior: 14.0+; .glass / .glassProminent / ButtonSizing: 26.0+)")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("Button  \u{00b7}  ButtonRole  \u{00b7}  ButtonBorderShape  \u{00b7}  ButtonRepeatBehavior  \u{00b7}  ButtonSizing  \u{00b7}  ButtonStyle  \u{00b7}  ButtonStyleConfiguration  \u{00b7}  PrimitiveButtonStyle  \u{00b7}  PrimitiveButtonStyleConfiguration  \u{00b7}  GlassButtonStyle  \u{00b7}  GlassProminentButtonStyle  \u{00b7}  .buttonStyle(\u{2026})  \u{00b7}  .buttonBorderShape(\u{2026})  \u{00b7}  .buttonRepeatBehavior(\u{2026})")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: Reference (ButtonRole)
    //
    // Describe-track content placed above demos per the describe-track
    // placement rule. Six Reference subsections lead the page; the demo
    // subsections follow.

    private var buttonRoleReferenceSection: some View {
        PageSection("Reference \u{2014} ButtonRole", subtitle: "enum ButtonRole \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Identifies the semantic role of a Button. Drives system-level treatment: .destructive renders the button red and informs accessibility tooling that the action is irreversible; .cancel marks the cancel slot in a confirmation context.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Cases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".destructive", "Marks the button as performing an irreversible action. The system renders it red and signals the role to assistive technologies.")
                    referenceRow(".cancel", "Marks the button as the cancel action in a confirmation context (alert, sheet, dialog). On macOS this maps to the \u{238b} Escape shortcut by default in those contexts.")
                    referenceRow("nil", "No role \u{2014} a regular action button. The default when you omit the role: parameter.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("enum ButtonRole")
                    APICallout("static let destructive: ButtonRole")
                    APICallout("static let cancel: ButtonRole")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Equatable, Hashable, Sendable")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "ButtonRole affects destructive action confirmation.",
                        detail: ".destructive turns the button red and informs the system that this action is irreversible \u{2014} relevant for alert buttons, confirmation dialogs, and context menus.",
                        symbol: "info.circle"
                    )
                    noteRow(
                        title: "Use roles for semantic meaning, not just color.",
                        detail: ".destructive renders red on macOS and iOS. .cancel on macOS is equivalent to .plain styling. The system renders the appropriate chrome for each context (alert, sheet, toolbar).",
                        symbol: "lightbulb"
                    )
                    noteRow(
                        title: "Role drives semantics across the platform.",
                        detail: "The system uses .destructive to influence accessibility, voice control verbs, and standard menu placement. Wire it through, don't ignore it.",
                        symbol: "tag"
                    )
                }
            }
        }
    }

    // MARK: Reference (ButtonBorderShape)

    private var buttonBorderShapeReferenceSection: some View {
        PageSection("Reference \u{2014} ButtonBorderShape", subtitle: "enum ButtonBorderShape \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Names a shape that the system uses to draw a button's border. Pair with the View/buttonBorderShape(_:) modifier; takes effect on bordered styles (.bordered, .borderedProminent, .glass, .glassProminent).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Cases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "System default \u{2014} the platform-appropriate shape for the active button style.")
                    referenceRow(".roundedRectangle", "Rounded rectangle. The macOS default for bordered buttons.")
                    referenceRow(".capsule", "Pill-shaped border (fully rounded sides).")
                    referenceRow(".circle", "Perfectly circular. Best paired with image-only labels \u{2014} asymmetric labels look odd inside a circle.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("enum ButtonBorderShape")
                    APICallout("static let automatic: ButtonBorderShape")
                    APICallout("static let roundedRectangle: ButtonBorderShape")
                    APICallout("static let capsule: ButtonBorderShape")
                    APICallout("static let circle: ButtonBorderShape")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "ButtonBorderShape.circle requires a square-ish label.",
                        detail: "Best paired with image-only buttons. .circle clips the border to a perfect circle; asymmetric labels look odd.",
                        symbol: "circle.fill"
                    )
                }
            }
        }
    }

    // MARK: Reference (ButtonStyle protocol)

    private var buttonStyleReferenceSection: some View {
        PageSection("Reference \u{2014} ButtonStyle protocol", subtitle: "protocol ButtonStyle \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that applies standard interaction behavior and a custom appearance to all buttons within a view hierarchy. ButtonStyle conformers receive a ButtonStyleConfiguration and return a Body view that decorates the configuration's label.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
@MainActor protocol ButtonStyle {
    associatedtype Body : View
    typealias Configuration = ButtonStyleConfiguration

    @ViewBuilder @MainActor
    func makeBody(configuration: Self.Configuration) -> Self.Body
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Built-in conformers shipped by SwiftUI on macOS")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".automatic", "DefaultButtonStyle \u{2014} the platform default. macOS 10.15+.")
                    referenceRow(".borderless", "BorderlessButtonStyle \u{2014} no border, label color reflects state. macOS 10.15+.")
                    referenceRow(".bordered", "BorderedButtonStyle \u{2014} subtle bordered chrome. macOS 12.0+.")
                    referenceRow(".borderedProminent", "BorderedProminentButtonStyle \u{2014} tinted prominent fill for primary actions. macOS 12.0+.")
                    referenceRow(".plain", "PlainButtonStyle \u{2014} no chrome at all; label only. macOS 10.15+.")
                    referenceRow(".glass", "GlassButtonStyle \u{2014} Liquid Glass border artwork. macOS 26.0+.")
                    referenceRow(".glassProminent", "GlassProminentButtonStyle \u{2014} tinted Liquid Glass fill. macOS 26.0+.")
                    referenceRow(".link", "LinkButtonStyle \u{2014} blue text without a button background. macOS 10.15+.")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "ButtonStyle vs PrimitiveButtonStyle.",
                        detail: "ButtonStyle applies appearance plus standard tap/click behavior. PrimitiveButtonStyle gives you the trigger gesture too \u{2014} pick that when you need to author the entire interaction (long-press, custom rules).",
                        symbol: "rectangle.split.2x1"
                    )
                    noteRow(
                        title: "SwiftKit does NOT author custom conformers.",
                        detail: "Per project hard constraint: SwiftKit documents Apple's API surface. The catalog shows what the built-in styles look like, but never defines a new ButtonStyle struct.",
                        symbol: "lock"
                    )
                    noteRow(
                        title: "isPressed reflects the active touch/click state.",
                        detail: "Custom conformers typically scale, dim, or recolor based on configuration.isPressed. The system's built-in styles already handle this \u{2014} that's why you adopt them when possible.",
                        symbol: "hand.tap"
                    )
                    noteRow(
                        title: "Apply via .buttonStyle(_:); inherits down the view tree.",
                        detail: "Inner .buttonStyle wins for its subtree. The same modifier also affects Toggle and Menu when they've adopted .button via .toggleStyle(.button) / .menuStyle(.button).",
                        symbol: "arrow.down"
                    )
                }
            }
        }
    }

    // MARK: Reference (ButtonStyleConfiguration)

    private var buttonStyleConfigurationReferenceSection: some View {
        PageSection("Reference \u{2014} ButtonStyleConfiguration", subtitle: "struct ButtonStyleConfiguration \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The data passed to ButtonStyle.makeBody(configuration:). Carries the button's role, type-erased label, and live press state. Read these values; compose them into a Body view.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Properties")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("configuration.role", "Optional ButtonRole \u{2014} .destructive, .cancel, or nil. Vary appearance per role.")
                    referenceRow("configuration.label", "ButtonStyleConfiguration.Label \u{2014} a type-erased view that wraps the original button's label closure. Render it inside makeBody.")
                    referenceRow("configuration.isPressed", "Bool \u{2014} live press state. Drive scale, opacity, or background swaps from this value.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct ButtonStyleConfiguration {")
                    APICallout("    let role: ButtonRole?")
                    APICallout("    let label: ButtonStyleConfiguration.Label   // type-erased view")
                    APICallout("    let isPressed: Bool")
                    APICallout("}")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Property: label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
func makeBody(configuration: Configuration) -> some View {
    configuration.label
        .padding()
        .background(.tint, in: Capsule())
}
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Property: role")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
let bg: Color = configuration.role == .destructive
    ? .red.opacity(0.2)
    : .accentColor.opacity(0.2)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Property: isPressed")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
configuration.label
    .scaleEffect(configuration.isPressed ? 0.96 : 1)
    .opacity(configuration.isPressed ? 0.7 : 1)
"""
                    )
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Live demo \u{2014} built-in .borderedProminent reflects each property")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Toggle the picker to flip role; press-and-hold the button to see isPressed propagate visually through the system style.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Picker("Role", selection: $roleTag) {
                        Text("nil").tag("nil")
                        Text(".destructive").tag(".destructive")
                        Text(".cancel").tag(".cancel")
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 360)
                    Button(role: role) {
                        // no-op; this is a demo of role propagation
                    } label: {
                        Text(roleTag == "nil" ? "Run" : "Run with \(roleTag)")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    APICallout("Button(role: role) { \u{2026} } label: { Text(\"\u{2026}\") } .buttonStyle(.borderedProminent)")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "ButtonStyleConfiguration.Label is opaque on purpose.",
                        detail: "It hides the original label's view tree. You compose it back in (apply background, padding, gestures) without rebuilding it.",
                        symbol: "rectangle.dashed"
                    )
                    noteRow(
                        title: "isPressed only animates inside ButtonStyle, not PrimitiveButtonStyle.",
                        detail: "PrimitiveButtonStyle owns the gesture, so isPressed semantics belong to ButtonStyle's standard interaction. If you adopt PrimitiveButtonStyle you implement the press tracking yourself.",
                        symbol: "hand.tap"
                    )
                    noteRow(
                        title: "Role drives semantics, not just color.",
                        detail: "The system uses .destructive to influence accessibility, voice control verbs, and standard menu placement. Wire it through, don't ignore it.",
                        symbol: "tag"
                    )
                    noteRow(
                        title: "Configuration is read-only.",
                        detail: "You don't mutate configuration. You read its properties and compose a Body view from them.",
                        symbol: "lock"
                    )
                }
            }
        }
    }

    // MARK: Reference (PrimitiveButtonStyle protocol)

    private var primitiveButtonStyleReferenceSection: some View {
        PageSection("Reference \u{2014} PrimitiveButtonStyle protocol", subtitle: "protocol PrimitiveButtonStyle \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("A type that applies custom interaction behavior and a custom appearance to all buttons within a view hierarchy. PrimitiveButtonStyle differs from ButtonStyle in one crucial way: you decide WHEN the action fires by calling configuration.trigger() yourself.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protocol declaration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
@MainActor protocol PrimitiveButtonStyle {
    associatedtype Body : View
    typealias Configuration = PrimitiveButtonStyleConfiguration

    @ViewBuilder @MainActor
    func makeBody(configuration: Self.Configuration) -> Self.Body
}

// Apply via:
// .buttonStyle(MyPrimitiveStyle())
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Built-in PrimitiveButtonStyle conformers")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
.borderless    -- BorderlessButtonStyle
.plain         -- PlainButtonStyle
.link          -- LinkButtonStyle
.glass         -- GlassButtonStyle           (macOS 26.0+)
.glassProminent -- GlassProminentButtonStyle (macOS 26.0+)
"""
                    )
                    Text("On modern SDKs .automatic, .bordered, and .borderedProminent are PrimitiveButtonStyle conformers internally as well \u{2014} most built-ins now flow through PrimitiveButtonStyle.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Required member: configuration.trigger()")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
func makeBody(configuration: Configuration) -> some View {
    configuration.label
        .onTapGesture { configuration.trigger() }
        // or .onLongPressGesture, .onHover, etc.
}
"""
                    )
                    Text("PrimitiveButtonStyle is wholly responsible for invoking the action. Forget to call configuration.trigger() and the user's click does nothing.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Use ButtonStyle for appearance only; PrimitiveButtonStyle when you control the gesture.",
                        detail: "If you only need to recolor / scale based on isPressed, ButtonStyle is enough. PrimitiveButtonStyle is for long-press, double-click, custom hit testing.",
                        symbol: "hand.tap"
                    )
                    noteRow(
                        title: "Forget to call trigger() and the button never fires.",
                        detail: "PrimitiveButtonStyle is wholly responsible for invoking the action. If you don't call configuration.trigger() somewhere, the user's click does nothing.",
                        symbol: "exclamationmark.triangle"
                    )
                    noteRow(
                        title: "SwiftKit does NOT author conformers.",
                        detail: "Per project hard constraint: SwiftKit documents the protocol; it does not ship custom PrimitiveButtonStyle types.",
                        symbol: "lock"
                    )
                    noteRow(
                        title: "Most built-in styles bridge through PrimitiveButtonStyle.",
                        detail: "On modern SDKs the system styles like .bordered are PrimitiveButtonStyle conformers \u{2014} the primitive variant is the canonical extension point.",
                        symbol: "shippingbox"
                    )
                }
            }
        }
    }

    // MARK: Reference (PrimitiveButtonStyleConfiguration)

    private var primitiveButtonStyleConfigurationReferenceSection: some View {
        PageSection("Reference \u{2014} PrimitiveButtonStyleConfiguration", subtitle: "struct PrimitiveButtonStyleConfiguration \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("The data passed to PrimitiveButtonStyle.makeBody(configuration:). Differs from ButtonStyleConfiguration by exposing trigger() (the action invocation) and omitting isPressed (the style owns press tracking now).")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Properties and methods")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow("configuration.role", "Optional ButtonRole \u{2014} same shape as ButtonStyleConfiguration.role.")
                    referenceRow("configuration.label", "PrimitiveButtonStyleConfiguration.Label \u{2014} type-erased view; render unchanged with whatever chrome the style provides.")
                    referenceRow("configuration.trigger()", "Method \u{2014} invokes the button's action. The principal difference from ButtonStyleConfiguration; you call it from your gesture handler.")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("struct PrimitiveButtonStyleConfiguration {")
                    APICallout("    let role: ButtonRole?")
                    APICallout("    let label: PrimitiveButtonStyleConfiguration.Label")
                    APICallout("    func trigger()   // invokes the button's action")
                    APICallout("}")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("trigger() \u{2014} invoke the action")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
configuration.label
    .onTapGesture(count: 2) { configuration.trigger() }
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("label \u{2014} type-erased view")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
configuration.label
    .padding(.horizontal, 12).padding(.vertical, 6)
    .background(.tint.opacity(0.18), in: Capsule())
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("role \u{2014} semantic intent")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
let tint: Color = configuration.role == .destructive ? .red : .accentColor
"""
                    )
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Comparison with ButtonStyleConfiguration")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    APICallout(
"""
ButtonStyleConfiguration                PrimitiveButtonStyleConfiguration
----------------------------            ----------------------------
role: ButtonRole?                       role: ButtonRole?
label: <opaque>                         label: <opaque>
isPressed: Bool                         (not exposed)
(action fires automatically)            trigger()  -- you call this
"""
                    )
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "trigger() is required somewhere in the body.",
                        detail: "Without calling trigger(), the button never fires. Wire it to onTapGesture, onLongPressGesture, an NSGestureRecognizer bridge, etc.",
                        symbol: "exclamationmark.triangle"
                    )
                    noteRow(
                        title: "No isPressed \u{2014} track press state yourself.",
                        detail: "PrimitiveButtonStyle owns the gesture entirely, so SwiftUI doesn't expose a ready-made press boolean. Use @GestureState or DragGesture(minimumDistance: 0) to derive one.",
                        symbol: "hand.tap"
                    )
                    noteRow(
                        title: "Configuration is read-only; trigger() is the only mutator.",
                        detail: "You can't mutate role or label. trigger() is the side-effect entry point.",
                        symbol: "lock"
                    )
                    noteRow(
                        title: "SwiftKit does NOT author conformers.",
                        detail: "Per project hard constraint: SwiftKit documents the configuration's surface. Custom PrimitiveButtonStyle conformers are out of scope.",
                        symbol: "lock.shield"
                    )
                }
            }
        }
    }

    // MARK: Default Button

    private var defaultButtonSection: some View {
        PageSection("Default Button", subtitle: "Button(\"Label\") { action() } \u{00b7} default system style") {
            VStack(alignment: .leading, spacing: 12) {
                Button("Tap Me") { tappedLabel = "Tapped!" }
                Text("Last: \(tappedLabel)")
                    .font(.caption)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.secondary)
                APICallout("Button(\"Tap Me\") { tappedLabel = \"Tapped!\" }")
            }
        }
    }

    // MARK: Button variants \u{2014} labels and roles

    private var buttonVariantsSection: some View {
        PageSection("Button variants \u{2014} labels and roles", subtitle: "String label, Label-with-image, image-only, role variants, multi-button layouts") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("String label")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Save") {}
                    APICallout("Button(\"Save\") { }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Label with system image")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button { } label: { Label("Delete", systemImage: "trash") }
                    APICallout("Button { } label: { Label(\"Delete\", systemImage: \"trash\") }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Image-only")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button { } label: { Image(systemName: "plus") }
                    APICallout("Button { } label: { Image(systemName: \"plus\") }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".destructive role")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Delete", role: .destructive) {}
                    APICallout("Button(\"Delete\", role: .destructive) { }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".cancel role")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Cancel", role: .cancel) {}
                    APICallout("Button(\"Cancel\", role: .cancel) { }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Multiple buttons \u{2014} layout")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 12) {
                        Button("OK") {}
                        Button("Cancel", role: .cancel) {}
                    }
                    APICallout("HStack { Button(\"OK\") {}; Button(\"Cancel\", role: .cancel) {} }")
                }
            }
        }
    }

    // MARK: Button states

    private var buttonStatesSection: some View {
        PageSection("Button states", subtitle: "Disabled state and tapped feedback via @State") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        Button("Action") {}.disabled(true)
                        Button("Delete", role: .destructive) {}.disabled(true)
                    }
                    APICallout(".disabled(true)  \u{00b7}  destructive + .disabled(true)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Tapped feedback via @State")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Tap Me") { tappedLabel = "Tapped!" }
                    Text("Last: \(tappedLabel)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                    APICallout("Button(\"Tap\") { tappedLabel = \"Tapped!\" }")
                }
            }
        }
    }

    // MARK: ButtonRole variants

    private var buttonRoleVariantsSection: some View {
        PageSection("ButtonRole variants", subtitle: ".destructive, .cancel, nil \u{00b7} visual and semantic differences") {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("role: .destructive")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Delete", role: .destructive) {}
                    APICallout("Button(\"Delete\", role: .destructive) { }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("role: .cancel")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Cancel", role: .cancel) {}
                    APICallout("Button(\"Cancel\", role: .cancel) { }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("role: nil (default)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("OK") {}
                    APICallout("Button(\"OK\") { }")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("All three side by side")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        Button("Delete", role: .destructive) {}
                        Button("Cancel", role: .cancel) {}
                        Button("OK") {}
                    }
                    APICallout("Button(\u{2026}, role: .destructive)  \u{00b7}  role: .cancel  \u{00b7}  no role")
                }
            }
        }
    }

    // MARK: ButtonBorderShape variants (.buttonBorderShape modifier)

    private var buttonBorderShapeVariantsSection: some View {
        PageSection("ButtonBorderShape variants \u{2014} .buttonBorderShape(_:)", subtitle: "View/buttonBorderShape(_:) \u{00b7} macOS 12.0+") {
            VStack(alignment: .leading, spacing: 24) {
                Text("All four shape values applied to .buttonStyle(.bordered). Affects bordered styles only \u{2014} unstyled and .plain ignore the border shape.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    Text(".automatic")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Automatic") {}
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.automatic)
                    APICallout(".buttonStyle(.bordered).buttonBorderShape(.automatic)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".roundedRectangle")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Rounded") {}
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.roundedRectangle)
                    APICallout(".buttonStyle(.bordered).buttonBorderShape(.roundedRectangle)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".capsule")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("Capsule") {}
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                    APICallout(".buttonStyle(.bordered).buttonBorderShape(.capsule)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".circle")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button { } label: { Image(systemName: "plus") }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.circle)
                    APICallout(".buttonStyle(.bordered).buttonBorderShape(.circle)")
                }
            }
        }
    }

    // MARK: ButtonRepeatBehavior

    private var buttonRepeatBehaviorSection: some View {
        PageSection("ButtonRepeatBehavior \u{2014} .buttonRepeatBehavior(_:)", subtitle: "View/buttonRepeatBehavior(_:) \u{00b7} macOS 14.0+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Cases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    referenceRow(".enabled", "While the user holds the button, the action fires repeatedly at the system key-repeat cadence. Designed for steppers, volume controls, etc.")
                    referenceRow(".disabled", "Default \u{2014} the action fires once per click/release.")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".buttonRepeatBehavior(.enabled) \u{2014} fires repeatedly while held")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 12) {
                        Button("Hold me: \(repeatCount)") { repeatCount += 1 }
                            .buttonRepeatBehavior(.enabled)
                        Button("Reset") { repeatCount = 0 }
                            .foregroundStyle(.secondary)
                    }
                    APICallout("Button(\"\u{2026}\") { count += 1 }.buttonRepeatBehavior(.enabled)")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(".buttonRepeatBehavior(.disabled) (default)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Button("No repeat") {}
                        .buttonRepeatBehavior(.disabled)
                    APICallout("Button(\"No repeat\") { }.buttonRepeatBehavior(.disabled)")
                }

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("enum ButtonRepeatBehavior")
                    APICallout("static let enabled: ButtonRepeatBehavior")
                    APICallout("static let disabled: ButtonRepeatBehavior")
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "ButtonRepeatBehavior fires at system key-repeat rate.",
                        detail: "macOS key-repeat delay/rate settings affect .enabled behavior. Designed for steppers, volume controls, etc.",
                        symbol: "repeat"
                    )
                }
            }
        }
    }

    // MARK: ButtonSizing via ControlSize

    private var buttonSizingSection: some View {
        PageSection("ButtonSizing \u{2014} via .controlSize(_:)", subtitle: "ButtonSizing is a typealias for ControlSize \u{00b7} macOS 26.0+") {
            VStack(alignment: .leading, spacing: 20) {
                Text("Five sizing values \u{2014} .mini, .small, .regular, .large, .extraLarge \u{2014} apply via the standard .controlSize(_:) modifier. Affects button height, padding, and label size.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        Text(".mini")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            .frame(width: 100, alignment: .trailing)
                        Button("Action") {}
                            .controlSize(.mini)
                    }
                    HStack(spacing: 12) {
                        Text(".small")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            .frame(width: 100, alignment: .trailing)
                        Button("Action") {}
                            .controlSize(.small)
                    }
                    HStack(spacing: 12) {
                        Text(".regular")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            .frame(width: 100, alignment: .trailing)
                        Button("Action") {}
                            .controlSize(.regular)
                    }
                    HStack(spacing: 12) {
                        Text(".large")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            .frame(width: 100, alignment: .trailing)
                        Button("Action") {}
                            .controlSize(.large)
                    }
                    HStack(spacing: 12) {
                        Text(".extraLarge")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            .frame(width: 100, alignment: .trailing)
                        Button("Action") {}
                            .controlSize(.extraLarge)
                    }
                }

                APICallout(".controlSize(.mini / .small / .regular / .large / .extraLarge)")

                VStack(alignment: .leading, spacing: 4) {
                    APICallout("typealias ButtonSizing = ControlSize")
                    APICallout("enum ControlSize: CaseIterable, Hashable, Sendable")
                    APICallout("case mini, small, regular, large, extraLarge")
                }
            }
        }
    }

    // MARK: ButtonStyle gallery \u{2014} built-in styles

    private var buttonStyleGallerySection: some View {
        PageSection("ButtonStyle gallery \u{2014} built-in styles", subtitle: "View/buttonStyle(_:) \u{00b7} eight built-in styles applied to identical button trios") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Eight built-in styles available on macOS, applied to identical button trios. The modifier walks down the view tree \u{2014} apply once on a container and every Button in that subtree picks it up.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".automatic", api: ".buttonStyle(.automatic)") {
                    sampleStack.buttonStyle(.automatic)
                }
                styleSpecimen(title: ".borderless", api: ".buttonStyle(.borderless)") {
                    sampleStack.buttonStyle(.borderless)
                }
                styleSpecimen(title: ".bordered", api: ".buttonStyle(.bordered)") {
                    sampleStack.buttonStyle(.bordered)
                }
                styleSpecimen(title: ".borderedProminent", api: ".buttonStyle(.borderedProminent)") {
                    sampleStack.buttonStyle(.borderedProminent)
                }
                styleSpecimen(title: ".plain", api: ".buttonStyle(.plain)") {
                    sampleStack.buttonStyle(.plain)
                }
                styleSpecimen(title: ".glass (macOS 26.0+)", api: ".buttonStyle(.glass)") {
                    sampleStack.buttonStyle(.glass)
                }
                styleSpecimen(title: ".glassProminent (macOS 26.0+)", api: ".buttonStyle(.glassProminent)") {
                    sampleStack.buttonStyle(.glassProminent)
                }
                styleSpecimen(title: ".link", api: ".buttonStyle(.link)") {
                    sampleStack.buttonStyle(.link)
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Roles, tints, and disabled states")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(".bordered with all three roles plus an explicit tint, disabled, and prominent variants with custom tints.")
                        .font(.callout)
                        .foregroundStyle(.secondary)

                    styleSpecimen(title: ".bordered + .tint", api: ".buttonStyle(.bordered).tint(.accentColor)") {
                        sampleStack
                            .buttonStyle(.bordered)
                            .tint(.accentColor)
                    }
                    styleSpecimen(title: ".bordered + disabled", api: ".buttonStyle(.bordered).disabled(true)") {
                        sampleStack
                            .buttonStyle(.bordered)
                            .disabled(true)
                    }
                    styleSpecimen(title: ".borderedProminent + .tint(.green)", api: ".buttonStyle(.borderedProminent).tint(.green)") {
                        sampleStack
                            .buttonStyle(.borderedProminent)
                            .tint(.green)
                    }
                    styleSpecimen(title: ".glassProminent + .tint(.purple)", api: ".buttonStyle(.glassProminent).tint(.purple)") {
                        sampleStack
                            .buttonStyle(.glassProminent)
                            .tint(.purple)
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Modifier walks down the view tree.",
                        detail: "Apply once on a container; every Button in that subtree picks it up. Inner .buttonStyle(\u{2026}) overrides outer for its own subtree.",
                        symbol: "arrow.down"
                    )
                    noteRow(
                        title: "Composes with Toggle/Menu via .toggleStyle(.button) / .menuStyle(.button).",
                        detail: "Once a Toggle or Menu adopts the .button style, the surrounding .buttonStyle modifier renders them with the same style as a real Button.",
                        symbol: "rectangle.connected.to.line.below"
                    )
                    noteRow(
                        title: ".glass and .glassProminent are macOS 26+.",
                        detail: "Liquid Glass button styles arrived with macOS 26. They render the button background with the system's Liquid Glass material and respect .tint.",
                        symbol: "drop.halffull"
                    )
                    noteRow(
                        title: ".link renders blue text without a button background.",
                        detail: "Useful for inline navigation that should read as a hyperlink rather than a control. Pairs well with Link(_:destination:).",
                        symbol: "link"
                    )
                    noteRow(
                        title: "Tint colors propagate to bordered / borderedProminent / glass styles.",
                        detail: "Use .tint(_:) to color the background fill of .borderedProminent / .glassProminent and the border accent of .bordered. .plain and .borderless ignore tint.",
                        symbol: "paintpalette"
                    )
                }
            }
        }
    }

    private var sampleStack: some View {
        HStack(spacing: 8) {
            Button("Save") {}
            Button("Cancel") {}
            Button(role: .destructive) {} label: {
                Text("Delete")
            }
        }
    }

    @ViewBuilder
    private func styleSpecimen<Content: View>(title: String, api: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            content()
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    // MARK: ButtonStyle gallery \u{2014} .glass

    private var glassButtonStyleSection: some View {
        PageSection("ButtonStyle gallery \u{2014} .glass", subtitle: "GlassButtonStyle \u{00b7} macOS 26.0+ \u{00b7} Liquid Glass border artwork") {
            VStack(alignment: .leading, spacing: 24) {
                Text("GlassButtonStyle is a PrimitiveButtonStyle. Use the .glass literal \u{2014} equivalent to GlassButtonStyle(). Renders Liquid Glass border artwork that picks up surrounding context.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".glass \u{2014} default tint", api: ".buttonStyle(.glass)") {
                    HStack(spacing: 8) {
                        Button("OK") { }
                        Button("Skip") { }
                    }
                    .buttonStyle(.glass)
                }

                styleSpecimen(title: ".glass + .tint(.purple)", api: ".buttonStyle(.glass).tint(.purple)") {
                    HStack(spacing: 8) {
                        Button("OK") { }
                        Button("Skip") { }
                    }
                    .buttonStyle(.glass)
                    .tint(.purple)
                }

                styleSpecimen(title: ".glass + role: .destructive", api: "Button(role: .destructive) { \u{2026} }.buttonStyle(.glass)") {
                    HStack(spacing: 8) {
                        Button("Delete", role: .destructive) { }
                        Button("Cancel", role: .cancel) { }
                    }
                    .buttonStyle(.glass)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled state propagates through the Liquid Glass artwork")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    styleSpecimen(title: ".glass + enabled", api: "Button(\"Run\") { }.buttonStyle(.glass)") {
                        Button("Run") { }.buttonStyle(.glass)
                    }
                    styleSpecimen(title: ".glass + .disabled(true)", api: ".buttonStyle(.glass).disabled(true)") {
                        Button("Run") { }.buttonStyle(.glass).disabled(true)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("controlSize variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    styleSpecimen(title: ".controlSize(.small)", api: ".buttonStyle(.glass).controlSize(.small)") {
                        Button("Small") { }.buttonStyle(.glass).controlSize(.small)
                    }
                    styleSpecimen(title: ".controlSize(.regular)", api: ".buttonStyle(.glass).controlSize(.regular)") {
                        Button("Regular") { }.buttonStyle(.glass).controlSize(.regular)
                    }
                    styleSpecimen(title: ".controlSize(.large)", api: ".buttonStyle(.glass).controlSize(.large)") {
                        Button("Large") { }.buttonStyle(.glass).controlSize(.large)
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Use the .glass literal, not GlassButtonStyle() directly.",
                        detail: "PrimitiveButtonStyle.glass returns a GlassButtonStyle. Both spellings work; .glass is shorter and matches the surrounding system style literals.",
                        symbol: "function"
                    )
                    noteRow(
                        title: "Pair with GlassEffectContainer when stacking many.",
                        detail: "Multiple .glass buttons each render their own Liquid Glass pass. Wrapping a row of them in GlassEffectContainer fuses the materials and improves perf.",
                        symbol: "rectangle.stack"
                    )
                    noteRow(
                        title: "Tint colors the glass border accent.",
                        detail: "Apply .tint(_:) anywhere up the tree. The Liquid Glass artwork's edge highlight picks up the tint.",
                        symbol: "paintpalette"
                    )
                    noteRow(
                        title: "Composes with Toggle/Menu via .toggleStyle(.button) / .menuStyle(.button).",
                        detail: "Once a Toggle or Menu adopts the .button style, the surrounding .buttonStyle(.glass) renders them with Liquid Glass too.",
                        symbol: "rectangle.connected.to.line.below"
                    )
                    noteRow(
                        title: "macOS 26.0+ only.",
                        detail: "GlassButtonStyle ships in macOS 26 alongside the rest of the Liquid Glass family.",
                        symbol: "calendar"
                    )
                }
            }
        }
    }

    // MARK: ButtonStyle gallery \u{2014} .glassProminent

    private var glassProminentButtonStyleSection: some View {
        PageSection("ButtonStyle gallery \u{2014} .glassProminent", subtitle: "GlassProminentButtonStyle \u{00b7} macOS 26.0+ \u{00b7} tinted Liquid Glass fill") {
            VStack(alignment: .leading, spacing: 24) {
                Text("Use .glassProminent for the primary action \u{2014} typically one per context. Pair with .glass for secondary actions.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                styleSpecimen(title: ".glassProminent \u{2014} default tint", api: ".buttonStyle(.glassProminent)") {
                    Button("Continue") { }.buttonStyle(.glassProminent)
                }

                styleSpecimen(title: ".glassProminent + .tint(.green)", api: ".buttonStyle(.glassProminent).tint(.green)") {
                    Button("Confirm") { }.buttonStyle(.glassProminent).tint(.green)
                }

                styleSpecimen(title: ".glassProminent + role: .destructive", api: "Button(role: .destructive) { \u{2026} }.buttonStyle(.glassProminent)") {
                    Button("Delete", role: .destructive) { }.buttonStyle(.glassProminent)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Pairing primary + secondary actions in a button row")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    styleSpecimen(title: ".glassProminent + .glass", api: "primary: .glassProminent  \u{00b7}  secondary: .glass") {
                        HStack(spacing: 8) {
                            Button("Cancel") { }.buttonStyle(.glass)
                            Button("Confirm") { }.buttonStyle(.glassProminent)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Disabled state")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    styleSpecimen(title: "enabled", api: "Button(\"Submit\") { }.buttonStyle(.glassProminent)") {
                        Button("Submit") { }.buttonStyle(.glassProminent)
                    }
                    styleSpecimen(title: "disabled", api: ".buttonStyle(.glassProminent).disabled(true)") {
                        Button("Submit") { }.buttonStyle(.glassProminent).disabled(true)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("controlSize variants")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    styleSpecimen(title: ".controlSize(.small)", api: ".buttonStyle(.glassProminent).controlSize(.small)") {
                        Button("Small") { }.buttonStyle(.glassProminent).controlSize(.small)
                    }
                    styleSpecimen(title: ".controlSize(.regular)", api: ".buttonStyle(.glassProminent).controlSize(.regular)") {
                        Button("Regular") { }.buttonStyle(.glassProminent).controlSize(.regular)
                    }
                    styleSpecimen(title: ".controlSize(.large)", api: ".buttonStyle(.glassProminent).controlSize(.large)") {
                        Button("Large") { }.buttonStyle(.glassProminent).controlSize(.large)
                    }
                }

                VStack(alignment: .leading, spacing: 14) {
                    noteRow(
                        title: "Use one .glassProminent per context.",
                        detail: "Like .borderedProminent, .glassProminent telegraphs THE primary action. More than one in a single context dilutes hierarchy.",
                        symbol: "1.circle"
                    )
                    noteRow(
                        title: "Pair with .glass for secondary actions.",
                        detail: "The canonical Liquid Glass button row: secondary actions in .glass, primary in .glassProminent. Both styles harmonize visually.",
                        symbol: "rectangle.connected.to.line.below"
                    )
                    noteRow(
                        title: "Tint colors the prominent background.",
                        detail: "Apply .tint(_:) for non-default colors. Combined with role: .destructive the system prefers a red palette regardless of explicit tint.",
                        symbol: "paintpalette"
                    )
                    noteRow(
                        title: "Same Liquid Glass material as GlassButtonStyle, just tinted.",
                        detail: "Both styles are Liquid Glass conformers; .glassProminent fills the shape with tint while .glass shows only the border artwork over the underlying view.",
                        symbol: "drop.halffull"
                    )
                    noteRow(
                        title: "macOS 26.0+ only.",
                        detail: "Whole Liquid Glass family is macOS 26+. SwiftKit targets macOS 26 exclusively.",
                        symbol: "calendar"
                    )
                }
            }
        }
    }

    // MARK: Custom ButtonStyle protocol example

    private var customButtonStyleSection: some View {
        PageSection("Custom ButtonStyle \u{2014} protocol example", subtitle: "How a ButtonStyle conformer composes a body from configuration") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Reference snippet only \u{2014} per project hard constraint, SwiftKit does not author custom conformers in the catalog. The shape below is what a conformer in a real app would look like.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(
"""
struct ScalingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                configuration.role == .destructive
                    ? Color.red.opacity(0.2)
                    : Color.accentColor.opacity(0.2),
                in: Capsule()
            )
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

// Apply with the standard modifier:
Button(\"Save\") { save() }
    .buttonStyle(ScalingButtonStyle())
"""
                )

                VStack(alignment: .leading, spacing: 8) {
                    Text("Why ButtonStyle (not PrimitiveButtonStyle)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("ButtonStyle suffices when you only need to recolor / scale based on configuration.isPressed and configuration.role. The system handles the click gesture and fires the action automatically.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: PrimitiveButtonStyle protocol example

    private var primitiveButtonStyleExampleSection: some View {
        PageSection("Custom PrimitiveButtonStyle \u{2014} protocol example", subtitle: "How a PrimitiveButtonStyle conformer owns the trigger gesture") {
            VStack(alignment: .leading, spacing: 16) {
                Text("Reference snippet only. PrimitiveButtonStyle is the right tool when you need the entire interaction \u{2014} long-press, double-click, custom hit testing \u{2014} not just appearance.")
                    .font(.callout)
                    .foregroundStyle(.secondary)

                APICallout(
"""
struct DoubleTapButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                configuration.role == .destructive
                    ? Color.red.opacity(0.2)
                    : Color.accentColor.opacity(0.2),
                in: Capsule()
            )
            .onTapGesture(count: 2) {
                configuration.trigger()      // required
            }
    }
}

// Apply with the same .buttonStyle modifier:
Button(\"Confirm\") { commit() }
    .buttonStyle(DoubleTapButtonStyle())
"""
                )

                VStack(alignment: .leading, spacing: 8) {
                    Text("Why PrimitiveButtonStyle (not ButtonStyle)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("PrimitiveButtonStyle is necessary when you decide WHEN the action fires. The configuration exposes trigger() instead of isPressed; you wire it to whichever gesture the interaction calls for.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    // MARK: HIG notes (consolidated)

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on Button, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Use roles for semantic meaning, not just color.",
                    detail: ".destructive renders red on macOS and iOS. .cancel on macOS is equivalent to .plain styling. The system renders the appropriate chrome for each context (alert, sheet, toolbar).",
                    symbol: "lightbulb"
                )
                noteRow(
                    title: "Style via .buttonStyle(_:).",
                    detail: "System styles: .automatic, .bordered, .borderedProminent, .borderless, .plain, .glass, .glassProminent, .link. Apply once on a container; every Button in the subtree inherits.",
                    symbol: "paintbrush"
                )
                noteRow(
                    title: "Keyboard shortcut via .keyboardShortcut(_:).",
                    detail: "Attach .keyboardShortcut(.return) to the primary action button in dialogs (or use KeyboardShortcut.defaultAction). Applies on macOS automatically in certain contexts.",
                    symbol: "keyboard"
                )
                noteRow(
                    title: "Inheritance walks down the view tree.",
                    detail: "Outer .buttonStyle propagates to every Button in the subtree. An inner .buttonStyle wins for its own subtree \u{2014} useful for one-off prominent action inside a row of plain buttons.",
                    symbol: "arrow.down"
                )
                noteRow(
                    title: "Composes with Toggle and Menu.",
                    detail: ".toggleStyle(.button) / .menuStyle(.button) make Toggle and Menu adopt the surrounding .buttonStyle. The same chrome reads consistently across the three control types.",
                    symbol: "rectangle.connected.to.line.below"
                )
                noteRow(
                    title: "Liquid Glass styles are macOS 26+.",
                    detail: ".glass and .glassProminent ship with macOS 26. They render the button background with the Liquid Glass material and respect .tint(_:) at every layer.",
                    symbol: "drop.halffull"
                )
                noteRow(
                    title: "ButtonRepeatBehavior fires at system key-repeat rate.",
                    detail: "macOS key-repeat delay/rate settings affect .enabled behavior. Designed for steppers, volume controls, and other hold-to-repeat scenarios.",
                    symbol: "repeat"
                )
                noteRow(
                    title: "Accessibility: every Button needs a clear label.",
                    detail: "Image-only buttons must carry a meaningful label \u{2014} VoiceOver reads the label closure verbatim. Pair Image with .accessibilityLabel(_:) when the visual label is purely iconographic.",
                    symbol: "accessibility"
                )
            }
        }
    }

    // MARK: Helpers

    private func referenceRow(_ api: String, _ description: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(api)
                .font(.body)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
                .frame(width: 200, alignment: .leading)
            Text(description)
                .font(.callout)
                .foregroundStyle(.secondary)
        }
    }

    private func noteRow(title: String, detail: String, symbol: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Label(title, systemImage: symbol)
                .font(.headline)
                .foregroundStyle(.primary)
            Text(detail)
                .font(.callout)
                .foregroundStyle(.secondary)
                .padding(.leading, 24)
        }
    }
}

#Preview {
    ButtonPage()
        .frame(width: 1100, height: 1100)
}
