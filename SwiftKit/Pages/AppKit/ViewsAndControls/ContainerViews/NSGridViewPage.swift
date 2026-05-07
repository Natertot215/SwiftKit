import SwiftUI
import AppKit

// AppKit Views and Controls / Container views reference page.
// Covers: NSGridView (class, inherits NSView) — a container that aligns views
// in a flexible grid of rows and columns. Each row-column intersection is an
// NSGridCell that hosts a contentView; the grid resolves cell intrinsic sizes
// into aligned rows and columns via Auto Layout.
// Source: Documentation/AppKit/views-and-controls/nsgridview.md
//
// Renderable demo: an NSViewRepresentable hosts an NSGridView with three rows
// and three columns of NSTextField labels; SwiftUI controls drive columnSpacing,
// rowSpacing, and cell xPlacement so the layout responses are visibly exercised.

// MARK: - Bridge

private struct NSGridViewDemo: NSViewRepresentable {
    var columnSpacing: CGFloat
    var rowSpacing: CGFloat
    var xPlacement: NSGridCell.Placement

    func makeNSView(context: Context) -> NSGridView {
        let r0 = [labelCell("Label"), labelCell("Detail"), labelCell("Action")]
        let r1 = [labelCell("Name"), labelCell("Pommora"), labelCell("Edit")]
        let r2 = [labelCell("Created"), labelCell("Today"), labelCell("Reset")]
        let grid = NSGridView(views: [r0, r1, r2])
        grid.translatesAutoresizingMaskIntoConstraints = false
        return grid
    }

    func updateNSView(_ nsView: NSGridView, context: Context) {
        nsView.columnSpacing = columnSpacing
        nsView.rowSpacing = rowSpacing
        nsView.xPlacement = xPlacement
    }

    private func labelCell(_ text: String) -> NSView {
        let field = NSTextField(labelWithString: text)
        field.font = NSFont.preferredFont(forTextStyle: .body)
        return field
    }
}

// MARK: - Page

struct NSGridViewPage: View {
    @State private var columnSpacing: CGFloat = 12
    @State private var rowSpacing: CGFloat = 6
    @State private var xPlacement: NSGridCell.Placement = .leading

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
            Text("NSGridView")
                .font(.largeTitle).fontWeight(.semibold).foregroundStyle(.primary)
            Text("A container that aligns views in a flexible grid of rows and columns.")
                .font(.callout).foregroundStyle(.secondary)
            Text("AppKit \u{00b7} class : NSView \u{00b7} macOS 10.12+ \u{00b7} Documentation/AppKit/views-and-controls/nsgridview.md")
                .font(.caption).fontDesign(.monospaced).foregroundStyle(.tertiary)
        }
    }

    // MARK: Default

    private var defaultDemo: some View {
        Block(title: "init(views:) — three rows, three columns of NSTextField labels") {
            VStack(alignment: .leading, spacing: 12) {
                NSGridViewDemo(
                    columnSpacing: columnSpacing,
                    rowSpacing: rowSpacing,
                    xPlacement: xPlacement
                )
                .frame(height: 120)
                .frame(maxWidth: 480)
                .padding(12)
                .background(.background.secondary, in: RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8).strokeBorder(.separator, lineWidth: 1))

                HStack(spacing: 12) {
                    Text("columnSpacing").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $columnSpacing, in: 0...40)
                        .frame(width: 160)
                    Text(String(format: "%.0fpt", columnSpacing))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                HStack(spacing: 12) {
                    Text("rowSpacing").font(.caption).foregroundStyle(.secondary)
                    Slider(value: $rowSpacing, in: 0...20)
                        .frame(width: 160)
                    Text(String(format: "%.0fpt", rowSpacing))
                        .font(.caption).fontDesign(.monospaced).foregroundStyle(.secondary)
                }

                HStack(spacing: 12) {
                    Text("xPlacement").font(.caption).foregroundStyle(.secondary)
                    Picker("", selection: $xPlacement) {
                        Text("leading").tag(NSGridCell.Placement.leading)
                        Text("center").tag(NSGridCell.Placement.center)
                        Text("trailing").tag(NSGridCell.Placement.trailing)
                        Text("fill").tag(NSGridCell.Placement.fill)
                    }
                    .labelsHidden()
                    .pickerStyle(.segmented)
                    .frame(width: 280)
                }

                APICallout("let grid = NSGridView(views: [[a, b, c], [d, e, f], [g, h, i]])")
                APICallout("grid.columnSpacing = 12; grid.rowSpacing = 6; grid.xPlacement = .leading")
            }
        }
    }

    // MARK: Variants

    @ViewBuilder
    private var variantsContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Construction — three initializers") {
                snippet("""
                NSGridView(numberOfColumns: 3, rows: 4)              // empty grid of given dimensions
                NSGridView(views: [[a, b, c], [d, e, f]])            // fill a grid from a 2D array
                NSGridView(frame: NSRect(x: 0, y: 0, width: 320, height: 200))
                """)
                Text("init(views:) is the most common entry point — pass a 2D array of NSView (one inner array per row) and the grid sizes itself to fit.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Adding and removing rows / columns") {
                snippet("""
                grid.addRow(with: [labelA, fieldA, buttonA])
                grid.insertRow(at: 0, with: [labelB, fieldB, buttonB])
                grid.removeRow(at: 1)
                grid.moveRow(at: 0, to: 2)

                grid.addColumn(with: [headerA, valueA, footerA])
                grid.insertColumn(at: 1, with: [...])
                grid.removeColumn(at: 0)
                grid.moveColumn(at: 1, to: 0)
                """)
            }

            Block(title: "Spacing and alignment") {
                snippet("""
                grid.columnSpacing = 12
                grid.rowSpacing = 6
                grid.rowAlignment = .firstBaseline
                grid.xPlacement = .leading       // .none, .leading, .trailing, .center, .fill
                grid.yPlacement = .center        // .none, .top, .bottom, .center, .fill
                """)
                Text("rowAlignment uses NSGridRow.Alignment — typical values are .firstBaseline (align text baselines across the row) or .none (each cell aligns independently).")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Cell access and merging") {
                snippet("""
                let cell = grid.cell(atColumnIndex: 1, rowIndex: 2)
                let owner = grid.cell(for: existingView)              // -> NSGridCell?
                grid.mergeCells(inHorizontalRange: NSRange(location: 0, length: 3),
                                verticalRange: NSRange(location: 1, length: 1))
                """)
                Text("mergeCells expands a single cell to span the supplied horizontal and vertical ranges — the equivalent of Excel's Merge Cells. Useful for headers that span the full width.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: States

    @ViewBuilder
    private var statesContent: some View {
        VStack(alignment: .leading, spacing: 24) {
            Block(title: "Hidden rows and columns") {
                snippet("""
                grid.row(at: 1).isHidden = true       // hides the row but keeps it in the grid
                grid.column(at: 0).isHidden = false
                """)
                Text("Hidden rows / columns are skipped during layout; the grid recomputes positions for everything that remains visible.")
                    .font(.footnote).foregroundStyle(.secondary)
            }

            Block(title: "Per-cell placement override") {
                snippet("""
                let cell = grid.cell(atColumnIndex: 0, rowIndex: 0)
                cell.xPlacement = .trailing           // overrides the grid-wide default
                cell.yPlacement = .center
                """)
            }

            Block(title: "sizedForContent — sentinel value") {
                snippet("""
                grid.column(at: 0).width = NSGridView.sizedForContent
                grid.row(at: 0).height = NSGridView.sizedForContent
                """)
                Text("Assigning sizedForContent restores the auto-sized behavior for that column or row.")
                    .font(.footnote).foregroundStyle(.secondary)
            }
        }
    }

    // MARK: Notes

    private var notesContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            noteRow("doc.text", "Inherits from NSView — bridges into SwiftUI via NSViewRepresentable.")
            noteRow("rectangle.split.3x3", "Each cell is an NSGridCell. The grid owns the cells; you don't instantiate them directly.")
            noteRow("text.alignleft", "Apple recommends NSGridView for spreadsheet-style row/column alignment, NSStackView for linear stacks, NSCollectionView for uniform scrollable item grids.")
            noteRow("ruler", "rowAlignment defaults to .none; switch to .firstBaseline when columns mix labels and controls so text baselines line up across the row.")
            noteRow("link", "See Also: NSGridCell, NSGridColumn, NSGridRow — model-style helpers vended by the grid view.")
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

extension NSGridViewPage {
    @MainActor static let item = GalleryItem(
        id: "appkit.viewsAndControls.nsGridView",
        title: "NSGridView",
        folder: "Views and controls",
        framework: .appKit,
        absorbedSymbols: [
            "NSGridView",
            "NSGridCell",
            "NSGridColumn",
            "NSGridRow"
        ],
        blurb: "A container that aligns views in a flexible grid of rows and columns. Each row-column intersection is an NSGridCell that hosts a content view; the grid resolves cell intrinsic sizes into aligned rows and columns via Auto Layout.",
        signature: "class NSGridView : NSView",
        availability: "macOS 10.12+",
        docPath: "Documentation/AppKit/views-and-controls/nsgridview.md",
        page: { AnyView(NSGridViewPage()) }
    )
}

#Preview {
    NSGridViewPage().frame(width: 1100, height: 900)
}
