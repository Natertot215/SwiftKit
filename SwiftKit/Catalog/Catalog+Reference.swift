import Foundation

let referenceTree: CatalogNode = .section(SectionNode(
    id: "reference",
    title: "Reference",
    symbolName: "book.closed",
    children: [
        .leaf(Leaf(
            id: "reference.typography",
            displayName: "Typography",
            apiSignature: "Font · TextStyle · Weight",
            framework: .swiftUI,
            docMarkdownPath: "Documentation/HIG/foundations/typography.md",
            availability: "macOS 13.0+",
            pageBuilder: .real(symbol: "Typography")
        ))
    ]
))
