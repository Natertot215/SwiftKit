import SwiftUI

// SwiftUI accessibility appearance reference page.
// Covers: accessibilityIgnoresInvertColors, accessibilityShowsLargeContentViewer,
//         LegibilityWeight, accessibilityCustomContent, AccessibilityCustomContentKey,
//         accessibilityChartDescriptor, AXChartDescriptorRepresentable

struct AccessibilityAppearancePage: View {
    @Environment(\.legibilityWeight) private var legibilityWeight
    @State private var showsViewer = true
    @State private var invertDemo = false

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
            Text("Accessibility Appearance")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("Invert colors protection, Large Content Viewer, legibility weight, and custom content.")
                .font(.callout).foregroundStyle(.secondary)
            Text("macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "accessibilityIgnoresInvertColors(_:) — protect images from color inversion") {
            HStack(spacing: 20) {
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.tint)
                        .padding(16)
                        .background(Color.accentColor.opacity(0.15), in: RoundedRectangle(cornerRadius: 10))
                        .accessibilityIgnoresInvertColors(true)
                    Text("Protected")
                        .font(.caption).foregroundStyle(.secondary)
                }
                VStack(spacing: 6) {
                    Image(systemName: "photo.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.tint)
                        .padding(16)
                        .background(Color.accentColor.opacity(0.15), in: RoundedRectangle(cornerRadius: 10))
                    Text("Not protected")
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
            APICallout(".accessibilityIgnoresInvertColors(true)")
            Text("When Accessibility › Invert Colors is enabled, protected views keep their original colors. Use for photos, maps, and color-critical artwork.")
                .font(.footnote).foregroundStyle(.secondary)
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "accessibilityShowsLargeContentViewer() — fixed-size items") {
                HStack(spacing: 12) {
                    ForEach(["house", "magnifyingglass", "bell", "person"], id: \.self) { icon in
                        Image(systemName: icon)
                            .font(.title2)
                            .padding(10)
                            .background(.background.secondary, in: Circle())
                            .accessibilityShowsLargeContentViewer()
                            .accessibilityLabel(icon)
                    }
                }
                APICallout(".accessibilityShowsLargeContentViewer()")
                Text("Long-press on macOS (hold on iOS) to show the Large Content Viewer overlay. Required for toolbar items and tab bar icons that can't scale with Dynamic Type.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityShowsLargeContentViewer(_:) — custom content") {
                snippet("""
                toolbarButton.accessibilityShowsLargeContentViewer {
                    Label("New Document", systemImage: "doc.badge.plus")
                        .font(.largeTitle)
                }
                """)
                Text("Provide a custom view for the Large Content Viewer when you want a different label or icon than the view itself.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "LegibilityWeight — reading environment weight") {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Current legibilityWeight: \(legibilityWeight == .bold ? "bold" : "regular")")
                        .font(.callout).foregroundStyle(.secondary)
                    Text("Sample text adapts")
                        .fontWeight(legibilityWeight == .bold ? .bold : .regular)
                        .font(.title3)
                }
                snippet("""
                @Environment(\\.legibilityWeight) var weight
                Text("Title")
                    .fontWeight(weight == .bold ? .bold : .regular)

                // LegibilityWeight values:
                LegibilityWeight.regular  // default
                LegibilityWeight.bold     // when Accessibility › Bold Text is on
                """)
                Text("LegibilityWeight reflects the system Bold Text accessibility setting. Adjust font weight accordingly in custom views.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityCustomContent — rich AT content") {
                snippet("""
                // Define a key:
                extension AccessibilityCustomContentKey {
                    static let nutritionInfo = AccessibilityCustomContentKey("Nutrition Info")
                }
                // Apply to a view:
                foodCard.accessibilityCustomContent(.nutritionInfo,
                                                    "420 cal · 12g fat · 30g protein",
                                                    importance: .high)
                // importance: .high — read automatically
                // importance: .default — available via rotor
                """)
                Text("Custom content provides additional structured information to AT users without cluttering the visual layout.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "accessibilityChartDescriptor + AXChartDescriptorRepresentable") {
                snippet("""
                // 1. Conform your view to AXChartDescriptorRepresentable:
                struct MyChart: View, AXChartDescriptorRepresentable {
                    func makeChartDescriptor() -> AXChartDescriptor {
                        AXChartDescriptor(
                            title: "Monthly Revenue",
                            summary: "Revenue rose 12% in Q3",
                            xAxis: AXNumericDataAxisDescriptor(
                                title: "Month", range: 1...12,
                                gridlinePositions: []) { "Month \\(Int($0))" },
                            yAxis: AXNumericDataAxisDescriptor(
                                title: "USD", range: 0...50000,
                                gridlinePositions: []) { "$\\(Int($0))" },
                            series: [
                                AXDataSeriesDescriptor(name: "Revenue",
                                    isContinuous: true,
                                    dataPoints: revenuePoints.map {
                                        AXDataPoint(x: $0.month, y: $0.value)
                                    })
                            ]
                        )
                    }
                }
                // 2. Or use the modifier to pass a descriptor:
                chart.accessibilityChartDescriptor(myChartDescriptor)
                """)
                Text("AXChartDescriptorRepresentable makes custom charts fully navigable in VoiceOver — users can explore axes and data points.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "AccessibilityCustomContentKey — multiple keys") {
                snippet("""
                extension AccessibilityCustomContentKey {
                    static let artist = AccessibilityCustomContentKey(
                        "Artist", id: "artist-key")
                    static let album = AccessibilityCustomContentKey(
                        "Album", id: "album-key")
                    static let year = AccessibilityCustomContentKey(
                        "Year", id: "year-key")
                }
                albumCard
                    .accessibilityCustomContent(.artist, "Sufjan Stevens")
                    .accessibilityCustomContent(.album, "Carrie & Lowell")
                    .accessibilityCustomContent(.year, "2015", importance: .default)
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("paintbrush", "accessibilityIgnoresInvertColors is critical for photos, maps, and color wheels — inverting a photo produces unreadable results.")
            noteRow("textformat.size", "The Large Content Viewer is macOS 11+/iOS 13+. Apply it to any fixed-size control (toolbar buttons, tab icons) that can't grow with Dynamic Type.")
            noteRow("bold", "LegibilityWeight.bold is the environment value when \"Bold Text\" accessibility option is on. Mirror it in custom font weight choices.")
            noteRow("waveform.path.ecg.rectangle", "AXChartDescriptorRepresentable is the gold standard for chart accessibility — it enables the Audio Graph feature in VoiceOver.")
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
    AccessibilityAppearancePage().frame(width: 1100, height: 900)
}
