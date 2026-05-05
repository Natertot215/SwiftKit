import SwiftUI
import AppKit

// AppKit Views and Controls / Controls reference page.
// Covers: NSMatrix (class, inherits NSControl) — the legacy AppKit
// container for grouping radio buttons or other NSCells in a row /
// column / grid. Apple discourages NSMatrix in 10.8+; the modern
// equivalent for radio groups is multiple NSButton(radioButtonWithTitle:)
// instances sharing a target/action.
// Source: Documentation/AppKit/views-and-controls/nsmatrix.md
//
// Renderable demo: an NSViewRepresentable hosts an NSMatrix in
// .radioModeMatrix mode wrapping NSButtonCells. Each cell title is a
// fixed icon-set option. Selection is reflected back into a SwiftUI
// label.

// MARK: - Bridge

private struct NSMatrixDemo: NSViewRepresentable {
    var titles: [String]
    @Binding var selectedRow: Int

    func makeNSView(context: Context) -> NSMatrix {
        let prototype = NSButtonCell()
        prototype.setButtonType(.radio)
        prototype.title = ""

        let matrix = NSMatrix(
            frame: .zero,
            mode: .radioModeMatrix,
            prototype: prototype,
            numberOfRows: titles.count,
            numberOfColumns: 1
        )
        matrix.translatesAutoresizingMaskIntoConstraints = false
        matrix.cellSize = NSSize(width: 200, height: 22)
        matrix.intercellSpacing = NSSize(width: 0, height: 4)
        matrix.allowsEmptySelection = false
        matrix.target = context.coordinator
        matrix.action = #selector(Coordinator.changed(_:))
        for (i, title) in titles.enumerated() {
            if let cell = matrix.cell(atRow: i, column: 0) as? NSButtonCell {
                cell.title = title
            }
        }
        matrix.selectCell(atRow: selectedRow, column: 0)
        return matrix
    }

    func updateNSView(_ nsView: NSMatrix, context: Context) {
        context.coordinator.parent = self
        if nsView.selectedRow != selectedRow {
            nsView.selectCell(atRow: selectedRow, column: 0)
        }
    }

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    final class Coordinator: NSObject {
        var parent: NSMatrixDemo
        init(_ parent: NSMatrixDemo) { self.parent = parent }
        @objc func changed(_ sender: NSMatrix) {
            parent.selectedRow = sender.selectedRow
        }
    }
}

// MARK: - Page

struct NSMatrixPage: View {
    @State private var selectedRow: Int = 0
    private let options = ["List", "Icons", "Columns", "Gallery"]

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
            Text("NSMatrix")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A legacy interface for grouping radio buttons or other types of cells together.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSControl \u{00b7} discouraged in macOS 10.8+ \u{00b7} Documentation/AppKit/views-and-controls/nsmatrix.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    private var defaultDemo: some View {
        Block(title: "NSMatrix in .radioModeMatrix wrapping NSButtonCells") {
            VStack(alignment: .leading, spacing: 12) {
                NSMatrixDemo(titles: options, selectedRow: $selectedRow)
                    .frame(width: 240, height: CGFloat(options.count) * 26)
                    .padding(12)
                    .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                    .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                Text("selectedRow = \(selectedRow) — \(options[selectedRow])")
                    .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)

                APICallout("let matrix = NSMatrix(frame: rect, mode: .radioModeMatrix, prototype: NSButtonCell.radio, numberOfRows: 4, numberOfColumns: 1)")
                APICallout("matrix.selectCell(atRow: 0, column: 0)")
            }
        }
    }

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Modes") {
                snippet("""
                NSMatrix.Mode.radioModeMatrix       // exactly one cell selected
                NSMatrix.Mode.highlightModeMatrix   // cells highlight while pressed
                NSMatrix.Mode.listModeMatrix        // multi-select with shift / command
                NSMatrix.Mode.trackModeMatrix       // each cell tracks the mouse independently
                """)
            }

            Block(title: "Construction with a prototype cell") {
                snippet("""
                let prototype = NSButtonCell()
                prototype.setButtonType(.radio)

                let matrix = NSMatrix(
                    frame: rect,
                    mode: .radioModeMatrix,
                    prototype: prototype,
                    numberOfRows: 4,
                    numberOfColumns: 1
                )
                """)
            }

            Block(title: "Construction with a cell class") {
                snippet("""
                let matrix = NSMatrix(
                    frame: rect,
                    mode: .radioModeMatrix,
                    cellClass: NSButtonCell.self,
                    numberOfRows: 4,
                    numberOfColumns: 1
                )
                """)
            }

            Block(title: "Layout") {
                snippet("""
                matrix.cellSize = NSSize(width: 200, height: 22)
                matrix.intercellSpacing = NSSize(width: 0, height: 4)
                matrix.autosizesCells = true
                matrix.sizeToCells()
                """)
            }
        }
    }

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Selection") {
                snippet("""
                matrix.selectCell(atRow: 0, column: 0)
                matrix.selectCell(withTag: 42)
                let row = matrix.selectedRow
                let col = matrix.selectedColumn
                let cells = matrix.selectedCells
                matrix.deselectAllCells()
                """)
            }

            Block(title: "Reading + updating cells") {
                snippet("""
                if let cell = matrix.cell(atRow: 0, column: 0) as? NSButtonCell {
                    cell.title = "Custom"
                    cell.state = .on
                }
                matrix.setState(.on, atRow: 1, column: 0)
                """)
            }
        }
    }

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("exclamationmark.triangle", "Apple discourages NSMatrix in macOS 10.8+. For a radio-button group, prefer multiple NSButton(radioButtonWithTitle:) sharing a target/action.")
            noteRow("doc.text", "Inherits NSControl. NSForm inherits NSMatrix.")
            noteRow("info.circle", "NSMatrix uses flipped coordinates by default — the (0,0) cell is top-left and rows count downward.")
            noteRow("hand.point.up", "For SwiftUI parity see Picker(selection:label:content:).pickerStyle(.radioGroup).")
        }
    }

    private func noteRow(_ symbol: String, _ text: String) -> some View {
        Label(text, systemImage: symbol).font(.callout).foregroundStyle(.secondary)
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
    NSMatrixPage().frame(width: 1100, height: 900)
}
