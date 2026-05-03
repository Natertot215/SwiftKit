import Foundation

enum Framework: String, Hashable {
    case swiftUI
    case appKit
}

enum PageBuilderID: Hashable {
    case placeholder
    case real(symbol: String)
}

struct SectionNode: Hashable {
    let id: String
    let title: String
    let symbolName: String?
    let children: [CatalogNode]
}

struct Folder: Hashable {
    let id: String
    let title: String
    let symbolName: String
    let children: [CatalogNode]
}

struct Subheading: Hashable {
    let id: String
    let title: String
    let children: [CatalogNode]
}

struct Leaf: Hashable {
    let id: String
    let displayName: String
    let apiSignature: String
    let framework: Framework
    let docMarkdownPath: String
    let availability: String?
    let pageBuilder: PageBuilderID
}

enum CatalogNode: Hashable, Identifiable {
    case section(SectionNode)
    case folder(Folder)
    case subheading(Subheading)
    case leaf(Leaf)

    var id: String {
        switch self {
        case .section(let s):    return "section:\(s.id)"
        case .folder(let f):     return "folder:\(f.id)"
        case .subheading(let h): return "sub:\(h.id)"
        case .leaf(let l):       return "leaf:\(l.id)"
        }
    }

    var children: [CatalogNode]? {
        switch self {
        case .section(let s):    return s.children.isEmpty ? nil : s.children
        case .folder(let f):     return f.children.isEmpty ? nil : f.children
        case .subheading(let h): return h.children.isEmpty ? nil : h.children
        case .leaf:              return nil
        }
    }

    var title: String {
        switch self {
        case .section(let s):    return s.title
        case .folder(let f):     return f.title
        case .subheading(let h): return h.title
        case .leaf(let l):       return l.displayName
        }
    }

    var leaf: Leaf? {
        if case .leaf(let l) = self { return l }
        return nil
    }
}
