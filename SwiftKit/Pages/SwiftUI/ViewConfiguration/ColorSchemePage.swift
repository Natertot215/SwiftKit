import SwiftUI

// Dense ColorScheme reference page. Consolidates six previously-separate leaves:
//   • ColorScheme (enum)
//   • ColorSchemeContrast (enum)
//   • EnvironmentValues/colorScheme
//   • EnvironmentValues/colorSchemeContrast
//   • View/preferredColorScheme(_:)
//   • View/toolbarColorScheme(_:for:)
//
// Source docs:
//   Documentation/SwiftUI/view-configuration/colorscheme.md
//   Documentation/SwiftUI/view-configuration/colorschemecontrast.md
//   Documentation/SwiftUI/view-configuration/preferredcolorscheme(_:).md
//   Documentation/SwiftUI/toolbars/toolbarcolorscheme(_:for:).md
//
// Mirrors TypographyPage's dense-page rhythm: one ScrollView, one VStack, one
// PageSection per topic. No wrapper view structs — every demo is composed
// inline from Apple primitives.

struct ColorSchemePage: View {
    // Interactive demo state for preferredColorScheme(_:) and toolbarColorScheme.
    @State private var preferredOverride: PreferredOverride = .system
    @State private var toolbarScheme: ColorScheme = .dark

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                header
                colorSchemeTypeSection
                colorSchemeContrastTypeSection
                environmentColorSchemeSection
                environmentContrastSection
                preferredColorSchemeSection
                toolbarColorSchemeSection
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
            Text("ColorScheme")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("The color scheme and contrast environment values, plus the modifiers that override them.")
                .font(.callout)
                .foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/view-configuration/colorscheme.md \u{00b7} macOS 10.15+")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.tertiary)
                .textSelection(.enabled)
            Text("enum ColorScheme { case light, dark }  \u{00b7}  enum ColorSchemeContrast { case standard, increased }")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }

    // MARK: ColorScheme type

    private var colorSchemeTypeSection: some View {
        PageSection("ColorScheme type", subtitle: "enum ColorScheme { case light, dark } \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                // Cases listing.
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".light")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 80, alignment: .leading)
                        Text("Light appearance \u{2014} bright background, dark foreground.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".dark")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 80, alignment: .leading)
                        Text("Dark appearance \u{2014} dark background, bright foreground.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    APICallout("enum ColorScheme { case light, dark }")
                }

                // Variant: pick a scheme programmatically.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Pick a scheme programmatically")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("let preferred: ColorScheme = isNight ? .dark : .light")
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

                // Variant: all cases via CaseIterable, with swatches.
                VStack(alignment: .leading, spacing: 8) {
                    Text("All cases via CaseIterable")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 12) {
                        ForEach(ColorScheme.allCases, id: \.self) { scheme in
                            VStack(alignment: .leading, spacing: 6) {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(scheme == .dark ? Color.black : Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .strokeBorder(.separator, lineWidth: 1)
                                    )
                                    .frame(width: 120, height: 80)
                                    .overlay(
                                        Text("Aa")
                                            .font(.title)
                                            .foregroundStyle(scheme == .dark ? Color.white : Color.black)
                                    )
                                Text(scheme == .dark ? ".dark" : ".light")
                                    .font(.caption)
                                    .fontDesign(.monospaced)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }

                // States: conformances + used by.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("CaseIterable, Copyable, Equatable, Escapable, Hashable, Sendable, SendableMetatype")
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

                VStack(alignment: .leading, spacing: 8) {
                    Text("Used by")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\\.colorScheme  \u{2014}  EnvironmentValues")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        Text(".preferredColorScheme(_:)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                        Text(".environment(\\.colorScheme, _)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(.separator, lineWidth: 1)
                    )
                }

                // Notes specific to ColorScheme type.
                colorSchemeTypeNotes
            }
        }
    }

    private var colorSchemeTypeNotes: some View {
        VStack(alignment: .leading, spacing: 14) {
            noteRow(
                title: "Two cases only \u{2014} no \"automatic\" value.",
                detail: "If you need \"defer to the system\" semantics, model it as Optional<ColorScheme>; nil means \"no preference\".",
                symbol: "moon.stars"
            )
            noteRow(
                title: "CaseIterable \u{2014} iterate via ColorScheme.allCases.",
                detail: "Useful for previews or test fixtures that exercise both modes.",
                symbol: "list.bullet"
            )
            noteRow(
                title: "Hashable \u{2014} works as a Picker tag.",
                detail: "Bind a Picker to a ColorScheme @State directly; both cases tag cleanly.",
                symbol: "checklist"
            )
            noteRow(
                title: "Use init(_ uiUserInterfaceStyle:) on iOS for UIKit bridging.",
                detail: "Cross-platform code that converts between SwiftUI ColorScheme and UIKit UIUserInterfaceStyle uses the documented inits to round-trip.",
                symbol: "arrow.left.arrow.right"
            )
            noteRow(
                title: "ColorScheme is observable, not stylable.",
                detail: "It tells you what's currently rendering. To actually change the appearance, set .preferredColorScheme(_:) or .environment(\\.colorScheme, _) on a parent.",
                symbol: "info.circle"
            )
        }
    }

    // MARK: ColorSchemeContrast type

    private var colorSchemeContrastTypeSection: some View {
        PageSection("ColorSchemeContrast type", subtitle: "enum ColorSchemeContrast { case standard, increased } \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".standard")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 110, alignment: .leading)
                        Text("System default contrast.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    HStack(alignment: .firstTextBaseline, spacing: 16) {
                        Text(".increased")
                            .font(.body)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.primary)
                            .frame(width: 110, alignment: .leading)
                        Text("User has Increase Contrast enabled.")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    APICallout("enum ColorSchemeContrast { case standard, increased }")
                }

                // Side-by-side preview.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Side-by-side preview")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        contrastSwatch(contrast: .standard)
                        contrastSwatch(contrast: .increased)
                    }
                }

                // States: read via env.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Read via the environment value")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("""
                    @Environment(\\.colorSchemeContrast) private var contrast
                    var body: some View {
                        Text(contrast == .standard ? "Standard" : "Increased")
                    }
                    """)
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

                VStack(alignment: .leading, spacing: 8) {
                    Text("Conformances")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("CaseIterable, Copyable, Equatable, Escapable, Hashable, Sendable, SendableMetatype")
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

                colorSchemeContrastTypeNotes
            }
        }
    }

    private func contrastSwatch(contrast: ColorSchemeContrast) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Aa Bb Cc")
                    .font(.title)
                    .foregroundStyle(.primary)
                Text("Sample row")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .padding(12)
            .frame(width: 200, height: 90, alignment: .leading)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(.separator, lineWidth: contrast == .increased ? 2 : 1)
            )
            Text(contrast == .increased ? ".increased" : ".standard")
                .font(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(.secondary)
        }
    }

    private var colorSchemeContrastTypeNotes: some View {
        VStack(alignment: .leading, spacing: 14) {
            noteRow(
                title: "Two cases \u{2014} .standard and .increased.",
                detail: "There is no third value. Treat this as a Boolean accessibility flag with idiomatic naming.",
                symbol: "circle.lefthalf.filled"
            )
            noteRow(
                title: "Set by the user, not the app.",
                detail: "Increase Contrast lives in System Settings > Accessibility > Display. Apps must adapt; they can't override it.",
                symbol: "accessibility"
            )
            noteRow(
                title: "CaseIterable \u{2014} iterate via .allCases.",
                detail: "Convenient for previewing both states or building snapshot tests.",
                symbol: "list.bullet"
            )
            noteRow(
                title: "Hashable \u{2014} ready for tags / dictionary keys.",
                detail: "You can bind a Picker to a ColorSchemeContrast @State directly when building developer tools.",
                symbol: "checklist"
            )
            noteRow(
                title: "Combine with .colorScheme for full theme decisions.",
                detail: "ColorScheme tells you light/dark; ColorSchemeContrast tells you whether the user wants more punch. Together they describe four meaningful render contexts.",
                symbol: "paintbrush"
            )
        }
    }

    // MARK: Environment-driven color scheme

    private var environmentColorSchemeSection: some View {
        PageSection("Environment-driven color scheme", subtitle: "@Environment(\\.colorScheme) \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default reporter.
                VStack(alignment: .leading, spacing: 8) {
                    colorSchemeReporter
                    APICallout("@Environment(\\.colorScheme) private var colorScheme")
                }

                // Variant: force the env value with .environment(_:_:)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Force the env value with .environment(_:_:)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(".environment(\\.colorScheme, .light)")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            colorSchemeReporter.environment(\.colorScheme, .light)
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text(".environment(\\.colorScheme, .dark)")
                                .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            colorSchemeReporter.environment(\.colorScheme, .dark)
                        }
                    }
                }

                // Variant: used to swap assets / colors.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Used to swap assets / colors")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("""
                    @Environment(\\.colorScheme) private var colorScheme
                    var body: some View {
                        Image(colorScheme == .dark ? "logo-dark" : "logo-light")
                    }
                    """)
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

                // States: ColorScheme.allCases capsules.
                VStack(alignment: .leading, spacing: 8) {
                    Text("ColorScheme.allCases")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(spacing: 12) {
                        ForEach(ColorScheme.allCases, id: \.self) { scheme in
                            Text(scheme == .dark ? ".dark" : ".light")
                                .font(.callout)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(Capsule().fill(.tint))
                                .foregroundStyle(.white)
                        }
                    }
                }

                environmentColorSchemeNotes
            }
        }
    }

    // Inline reporter view that reads the env value live.
    private var colorSchemeReporter: some View {
        ColorSchemeReporterRow()
    }

    private var environmentColorSchemeNotes: some View {
        VStack(alignment: .leading, spacing: 14) {
            noteRow(
                title: "Reflects what's currently rendered, not the user setting.",
                detail: "If a parent applies .preferredColorScheme(.dark) or .environment(\\.colorScheme, .dark), the child reads .dark even on a light system.",
                symbol: "circle.lefthalf.filled"
            )
            noteRow(
                title: "Prefer semantic colors over branching on colorScheme.",
                detail: ".primary, .secondary, system materials, and asset catalog colors automatically adapt. Reach for colorScheme branching only for true asset/value swaps.",
                symbol: "paintbrush"
            )
            noteRow(
                title: "SwiftUI redraws automatically when the value changes.",
                detail: "Switch to dark mode in System Settings and views reading colorScheme update on the next render. No notification plumbing required.",
                symbol: "arrow.triangle.2.circlepath"
            )
            noteRow(
                title: "Two cases: .light and .dark.",
                detail: "There is no third value for \"system\" \u{2014} the env value is always one or the other, even if the source is the system setting.",
                symbol: "moon.stars"
            )
            noteRow(
                title: "Override with .preferredColorScheme(_:) at presentation boundaries.",
                detail: ".preferredColorScheme writes the value upward to the presentation; .environment(\\.colorScheme, _) writes it downward to descendants. Pick the one that matches your scope.",
                symbol: "arrow.up.arrow.down"
            )
        }
    }

    // MARK: Environment-driven contrast

    private var environmentContrastSection: some View {
        PageSection("Environment-driven contrast", subtitle: "@Environment(\\.colorSchemeContrast) \u{00b7} macOS 10.15+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default reporter.
                VStack(alignment: .leading, spacing: 8) {
                    contrastReporter
                    APICallout("@Environment(\\.colorSchemeContrast) private var colorSchemeContrast")
                }

                // Variant: read live value.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Read live value")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(".colorSchemeContrast is read-only \u{2014} toggle System Settings \u{2192} Accessibility \u{2192} Display \u{2192} Increase Contrast to flip it.")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    contrastReporter
                }

                // Variant: branching to bump line weight.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Branching to bump line weight / contrast")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("""
                    @Environment(\\.colorSchemeContrast) private var contrast
                    var body: some View {
                        border
                            .strokeBorder(.separator, lineWidth: contrast == .increased ? 2 : 1)
                    }
                    """)
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

                // States: set by System Settings.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Set by System Settings, not by the app")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text("Users enable Increase Contrast under Accessibility > Display in System Settings (macOS) or Accessibility > Display & Text Size (iOS). Apps cannot override the user's choice via this environment value.")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(.separator, lineWidth: 1)
                        )
                }

                environmentContrastNotes
            }
        }
    }

    private var contrastReporter: some View {
        ContrastReporterRow()
    }

    private var environmentContrastNotes: some View {
        VStack(alignment: .leading, spacing: 14) {
            noteRow(
                title: "Read-only \u{2014} you cannot push it down.",
                detail: "Production code reads \\.colorSchemeContrast to react to the system setting. Use .environment(_:_:) only for previews / tests.",
                symbol: "lock"
            )
            noteRow(
                title: "Two cases: .standard and .increased.",
                detail: "When .increased, prefer thicker lines, stronger separators, and full-opacity ShapeStyles to meet the user's intent.",
                symbol: "circle.righthalf.filled"
            )
            noteRow(
                title: "Most semantic styles already adapt.",
                detail: ".primary, .secondary, system materials, and named asset colors increase their contrast automatically. Custom drawing is what usually needs manual handling.",
                symbol: "paintbrush"
            )
            noteRow(
                title: "SwiftUI redraws on change.",
                detail: "Toggle Increase Contrast in System Settings and views reading the value re-render. No observers needed.",
                symbol: "arrow.triangle.2.circlepath"
            )
            noteRow(
                title: "Honor the user's request.",
                detail: "Per HIG, Increase Contrast is an accessibility setting. Don't override it for branding reasons \u{2014} adapt your visuals.",
                symbol: "accessibility"
            )
        }
    }

    // MARK: preferredColorScheme(_:)

    private var preferredColorSchemeSection: some View {
        PageSection("preferredColorScheme(_:)", subtitle: "View/preferredColorScheme(_:) \u{00b7} macOS 11.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: forced .dark card.
                VStack(alignment: .leading, spacing: 8) {
                    schemeCard("Forced .dark")
                        .preferredColorScheme(.dark)
                        .frame(width: 300)
                    APICallout(".preferredColorScheme(.dark)")
                }

                // Variant: side-by-side .light / .dark / nil.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Side-by-side \u{2014} .light, .dark, nil")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(".light").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            schemeCard(".light")
                                .preferredColorScheme(.light)
                                .frame(width: 200)
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text(".dark").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            schemeCard(".dark")
                                .preferredColorScheme(.dark)
                                .frame(width: 200)
                        }
                        VStack(alignment: .leading, spacing: 6) {
                            Text("nil (defer to system)").font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                            schemeCard("nil")
                                .preferredColorScheme(nil)
                                .frame(width: 200)
                        }
                    }
                }

                // Variant: conditional override (code).
                VStack(alignment: .leading, spacing: 8) {
                    Text("Conditional \u{2014} only override sometimes")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(".preferredColorScheme(isDarkMode ? .dark : nil)")
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

                // States: interactive override.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Interactive override")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Picker("Scheme", selection: $preferredOverride) {
                        Text("nil (system)").tag(PreferredOverride.system)
                        Text(".light").tag(PreferredOverride.light)
                        Text(".dark").tag(PreferredOverride.dark)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 320)
                    schemeCard(preferredOverride.label)
                        .preferredColorScheme(preferredOverride.scheme)
                        .frame(width: 320)
                    Text("scheme = \(preferredOverride.label)")
                        .font(.caption)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }

                preferredColorSchemeNotes
            }
        }
    }

    @ViewBuilder
    private func schemeCard(_ title: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Sample text on a card")
                .font(.callout)
                .foregroundStyle(.secondary)
            HStack {
                Button("Action") {}
                    .buttonStyle(.borderedProminent)
                Spacer()
                Image(systemName: "moon.stars")
                    .foregroundStyle(.tint)
            }
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }

    private var preferredColorSchemeNotes: some View {
        VStack(alignment: .leading, spacing: 14) {
            noteRow(
                title: "Affects the nearest enclosing presentation.",
                detail: "Sheets, popovers, windows. The system uses the value at the presentation boundary; values applied deeper inside still propagate up to that boundary.",
                symbol: "rectangle.stack"
            )
            noteRow(
                title: "Pass nil to defer to the system / parent.",
                detail: "Useful when the override only applies conditionally. Without nil you can't \"unset\" a previously chosen value mid-conditional.",
                symbol: "circle.dashed"
            )
            noteRow(
                title: "First non-nil sibling wins.",
                detail: "When parallel branches set different values, SwiftUI resolves to the first non-nil preference based on view order.",
                symbol: "arrow.left.and.right"
            )
            noteRow(
                title: "Don't use to theme inline content.",
                detail: "preferredColorScheme is for whole presentations \u{2014} scoping a sheet to dark mode, for instance. To swap appearance for a single subview, use .environment(\\.colorScheme, .dark) or roll your own ShapeStyle.",
                symbol: "exclamationmark.triangle"
            )
            noteRow(
                title: "Setting overrides any descendant's preferredColorScheme.",
                detail: "Applying the modifier replaces nested preferences. Combine with thoughtful structure so consumers know which level wins.",
                symbol: "lock"
            )
        }
    }

    // MARK: toolbarColorScheme(_:for:)

    private var toolbarColorSchemeSection: some View {
        PageSection("toolbarColorScheme(_:for:)", subtitle: "View/toolbarColorScheme(_:for:) \u{00b7} macOS 13.0+") {
            VStack(alignment: .leading, spacing: 20) {
                // Default: tinted bg + .dark scheme.
                toolbarDemoFrame(api: ".toolbarBackground(.tint, for: .windowToolbar).toolbarColorScheme(.dark, for: .windowToolbar)") {
                    NavigationStack {
                        Text(".dark color scheme on top of a tinted background")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackground(.tint, for: .windowToolbar)
                            .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                            .toolbarColorScheme(.dark, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                    }
                }

                // Variant: .light.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".light \u{2014} force light scheme")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    toolbarDemoFrame(api: ".toolbarColorScheme(.light, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Light items, regardless of system appearance")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarBackground(.tint, for: .windowToolbar)
                                .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                                .toolbarColorScheme(.light, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                // Variant: .dark.
                VStack(alignment: .leading, spacing: 8) {
                    Text(".dark \u{2014} force dark scheme")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    toolbarDemoFrame(api: ".toolbarColorScheme(.dark, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Dark items, regardless of system appearance")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarBackground(.tint, for: .windowToolbar)
                                .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                                .toolbarColorScheme(.dark, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                // Variant: nil.
                VStack(alignment: .leading, spacing: 8) {
                    Text("nil \u{2014} match system")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    toolbarDemoFrame(api: ".toolbarColorScheme(nil, for: .windowToolbar)") {
                        NavigationStack {
                            Text("Defers to the current system color scheme")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .toolbarColorScheme(nil, for: .windowToolbar)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button { } label: { Label("Add", systemImage: "plus") }
                                    }
                                }
                        }
                    }
                }

                // States: bound to @State.
                VStack(alignment: .leading, spacing: 8) {
                    Text("Bound to @State")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    toolbarDemoFrame(api: ".toolbarColorScheme(scheme, for: .windowToolbar)") {
                        NavigationStack {
                            VStack(spacing: 8) {
                                Picker("Scheme", selection: $toolbarScheme) {
                                    Text(".light").tag(ColorScheme.light)
                                    Text(".dark").tag(ColorScheme.dark)
                                }
                                .pickerStyle(.segmented)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .toolbarBackground(.tint, for: .windowToolbar)
                            .toolbarBackgroundVisibility(.visible, for: .windowToolbar)
                            .toolbarColorScheme(toolbarScheme, for: .windowToolbar)
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button { } label: { Label("Add", systemImage: "plus") }
                                }
                            }
                        }
                    }
                }

                toolbarColorSchemeNotes
            }
        }
    }

    @ViewBuilder
    private func toolbarDemoFrame<Content: View>(api: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .frame(width: 480, height: 220)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.separator, lineWidth: 1)
                )
            APICallout(api)
        }
    }

    private var toolbarColorSchemeNotes: some View {
        VStack(alignment: .leading, spacing: 14) {
            noteRow(
                title: "Pass nil to defer to the system.",
                detail: "ColorScheme? \u{2014} nil means \"use whatever the system color scheme is.\" Useful when an enclosing modifier already set a scheme but a child wants to opt back out.",
                symbol: "circle.lefthalf.filled"
            )
            noteRow(
                title: "Only respected while a background is visible.",
                detail: "From the docs: \"the provided color scheme is only respected while a background is visible in the requested bar.\" Combine with .toolbarBackground(\u{2026}) + .toolbarBackgroundVisibility(.visible) for guaranteed effect.",
                symbol: "exclamationmark.triangle"
            )
            noteRow(
                title: "Variadic placements.",
                detail: ".toolbarColorScheme(.dark, for: .navigationBar, .tabBar). Empty placement defaults to .automatic.",
                symbol: "rectangle.stack"
            )
            noteRow(
                title: "Compose with .toolbarBackground for branded toolbars.",
                detail: "Common pattern: tinted background + dark color scheme so toolbar items render light on a saturated color. Apple's docs show this exact recipe.",
                symbol: "paintpalette"
            )
        }
    }

    // MARK: HIG notes

    private var higNotesSection: some View {
        PageSection("Notes from the HIG", subtitle: "Apple's voice on color scheme and contrast, abridged.") {
            VStack(alignment: .leading, spacing: 16) {
                noteRow(
                    title: "Prefer semantic colors over branching on colorScheme.",
                    detail: ".primary, .secondary, system materials, and asset-catalog colors automatically adapt to light/dark and increased contrast. Reach for explicit branching only when a true asset swap is required.",
                    symbol: "paintbrush"
                )
                noteRow(
                    title: "Honor the Increase Contrast setting.",
                    detail: "Apps cannot override colorSchemeContrast. When .increased, thicken separators, prefer full-opacity styles, and reach for stronger semantic shape styles.",
                    symbol: "accessibility"
                )
                noteRow(
                    title: "Use preferredColorScheme(_:) at presentation boundaries.",
                    detail: "Sheets, popovers, and windows are the right scope. For inline subview theming, write .environment(\\.colorScheme, .dark) instead.",
                    symbol: "rectangle.stack"
                )
                noteRow(
                    title: "Pair toolbarColorScheme with toolbarBackground.",
                    detail: "The color scheme override only takes effect while a toolbar background is visible. Set both, or expect the modifier to be silently ignored.",
                    symbol: "paintpalette"
                )
                noteRow(
                    title: "Pass nil to defer.",
                    detail: "Both preferredColorScheme(_:) and toolbarColorScheme(_:for:) accept nil to mean \"no opinion \u{2014} match the parent / system.\" This is the only way to undo an override conditionally.",
                    symbol: "circle.dashed"
                )
                noteRow(
                    title: "Combine ColorScheme and ColorSchemeContrast for full theme decisions.",
                    detail: "Together they describe four meaningful render contexts (light/standard, light/increased, dark/standard, dark/increased). When custom drawing depends on appearance, branch on both.",
                    symbol: "circle.lefthalf.filled"
                )
            }
        }
    }

    // MARK: Note row helper

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

// MARK: - Reporter rows
//
// These read environment values so they update live when the parent applies
// .environment(\.colorScheme, …) or the system Appearance changes. They are
// pure compositions of Apple primitives — Image, Text, RoundedRectangle.

private struct ColorSchemeReporterRow: View {
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: colorScheme == .dark ? "moon.stars.fill" : "sun.max.fill")
                .foregroundStyle(.tint)
            Text("colorScheme = \(colorScheme == .dark ? ".dark" : ".light")")
                .font(.callout)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: 1)
        )
    }
}

private struct ContrastReporterRow: View {
    @Environment(\.colorSchemeContrast) private var contrast

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: contrast == .increased ? "circle.righthalf.filled" : "circle.lefthalf.filled")
                .foregroundStyle(.tint)
            Text("contrast = \(contrast == .increased ? ".increased" : ".standard")")
                .font(.callout)
                .fontDesign(.monospaced)
                .foregroundStyle(.primary)
        }
        .padding(12)
        .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator, lineWidth: contrast == .increased ? 2 : 1)
        )
    }
}

// MARK: - Local enum for the interactive preferredColorScheme picker

private enum PreferredOverride: Hashable {
    case system, light, dark

    var scheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light:  return .light
        case .dark:   return .dark
        }
    }

    var label: String {
        switch self {
        case .system: return "nil"
        case .light:  return ".light"
        case .dark:   return ".dark"
        }
    }
}

#Preview {
    ColorSchemePage()
        .frame(width: 1100, height: 1100)
}
