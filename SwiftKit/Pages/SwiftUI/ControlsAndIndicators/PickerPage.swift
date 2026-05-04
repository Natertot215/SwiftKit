import SwiftUI

// SwiftUI `Picker` reference page.
// Covers: basic usage, all macOS styles, horizontalRadioGroupLayout(),
// paletteSelectionEffect, and PaletteSelectionEffect.
// macOS 10.15+

private enum Fruit: String, CaseIterable, Identifiable {
    case apple = "Apple", banana = "Banana", cherry = "Cherry", date = "Date"
    var id: Self { self }
}

private enum Shape2D: String, CaseIterable, Identifiable {
    case circle, square, triangle, star
    var id: Self { self }
    var symbol: String {
        switch self {
        case .circle: "circle.fill"
        case .square: "square.fill"
        case .triangle: "triangle.fill"
        case .star: "star.fill"
        }
    }
}

struct PickerPage: View {
    @State private var selectedFruit = Fruit.apple
    @State private var selectedShape = Shape2D.circle
    @State private var selectedFruit2 = Fruit.apple

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
            Text("Picker · horizontalRadioGroupLayout() · PaletteSelectionEffect")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A control for selecting from a set of mutually exclusive values.")
                .font(.callout).foregroundStyle(.secondary)
            Text("Documentation/SwiftUI/controls-and-indicators/picker.md · macOS 10.15+")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary).textSelection(.enabled)
        }
    }

    private var defaultDemo: some View {
        PKCard(api: "Picker(\"Fruit\", selection: $selection) { ForEach(Fruit.allCases) { … } }") {
            Picker("Fruit", selection: $selectedFruit) {
                ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {

            PKVariant(title: ".menu — popup button (macOS default)") {
                PKCard(api: ".pickerStyle(.menu)") {
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }.pickerStyle(.menu)
                }
            }

            PKVariant(title: ".radioGroup — vertical radio buttons (macOS only)") {
                PKCard(api: ".pickerStyle(.radioGroup)") {
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }.pickerStyle(.radioGroup)
                }
            }

            PKVariant(title: ".radioGroup + horizontalRadioGroupLayout()") {
                PKCard(api: ".pickerStyle(.radioGroup).horizontalRadioGroupLayout()") {
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }
                    .pickerStyle(.radioGroup)
                    .horizontalRadioGroupLayout()
                }
            }

            PKVariant(title: ".segmented") {
                PKCard(api: ".pickerStyle(.segmented)") {
                    Picker("Fruit", selection: $selectedFruit) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }.pickerStyle(.segmented)
                }
            }

            PKVariant(title: ".palette — icon swatches + PaletteSelectionEffect") {
                PKCard(api: ".pickerStyle(.palette)\n  .paletteSelectionEffect(.custom { … })") {
                    VStack(alignment: .leading, spacing: 8) {
                        Picker("Shape", selection: $selectedShape) {
                            ForEach(Shape2D.allCases) { s in
                                Image(systemName: s.symbol).tag(s)
                            }
                        }
                        .pickerStyle(.palette)
                        .paletteSelectionEffect(.symbolVariant(.fill))

                        Text("Selected: \(selectedShape.rawValue)")
                            .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                    }
                }
            }

            PKVariant(title: ".inline — shows all options inline") {
                PKCard(api: ".pickerStyle(.inline)", height: 160) {
                    Picker("Fruit", selection: $selectedFruit2) {
                        ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                    }.pickerStyle(.inline)
                }
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            PKVariant(title: "Disabled") {
                HStack(spacing: 16) {
                    PKCard(api: ".menu + .disabled(true)") {
                        Picker("Fruit", selection: $selectedFruit) {
                            ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                        }.pickerStyle(.menu).disabled(true)
                    }
                    PKCard(api: ".segmented + .disabled(true)") {
                        Picker("Fruit", selection: $selectedFruit) {
                            ForEach(Fruit.allCases) { f in Text(f.rawValue).tag(f) }
                        }.pickerStyle(.segmented).disabled(true)
                    }
                }
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            NoteRowPK(symbol: "circle.grid.3x3", title: ".palette renders as icon swatches — ideal for shape/color pickers.",
                      detail: "PaletteSelectionEffect controls how selected items are distinguished: .automatic, .symbolVariant(.fill), .custom(…). Without an effect, selection is highlighted with a border.")
            NoteRowPK(symbol: "arrow.left.and.right", title: "horizontalRadioGroupLayout() lays radio buttons in a row.",
                      detail: "Applies to .radioGroup style only. This modifier is macOS-only; on other platforms it's a no-op.")
        }
    }
}

private struct PKCard<Content: View>: View {
    let api: String
    var height: CGFloat? = nil
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                if let h = height {
                    content().frame(width: 340, height: h)
                } else {
                    content().frame(width: 340, alignment: .leading)
                }
            }
            .padding(12)
            .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
            .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))
            APICallout(api)
        }
    }
}

private struct PKVariant<Content: View>: View {
    let title: String
    @ViewBuilder var content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline).foregroundStyle(.primary)
            content()
        }
    }
}

private struct NoteRowPK: View {
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
    PickerPage().frame(width: 900, height: 1000)
}
